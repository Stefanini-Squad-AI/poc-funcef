//***************************************************************************************
//Rotina.............: BuscarResgate
//N. SIG.............: 83325
//Data da Alteração..: 18/03/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na consulta que recupera os dados do resgates ocorridos
//                     no período selecionado.
//***************************************************************************************
//Rotina             : BuscarResgate
//N. SIG..........   : 42475
//Data da Alteração: : 27/03/2018
//Alteração Form:    : uCtrlRelRecContrib
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Alteração na montagem da consulta que retorna os dados de resgate.   
//***************************************************************************************
{-------------------------------------------------------------------------------
Rotina.............: BuscarResgate
N. SIG.............: 42284
Data da Alteração..: 16/03/2017
Responsável........: André Imakawa
Descrição..........: Passando novo parametro da rotina _MontarTABTrabalhoComMovDosBeneficiarios
-------------------------------------------------------------------------------
SOL......: 242573 /16949 - Robson Andrade
PPM......: 979572
Data.....: 04/09/2015
Descrição: Funções para buscar contribuições e Resgate.
-------------------------------------------------------------------------------}
unit uCtrlRelRecContrib;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms, uCMMath,
     dbtables, mconnect, ucmFileUtils,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, dBasedados;

  Type
    TCtrlRelRecContrib = Class(TCmControlObject)
    private
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;
    public
      Constructor Create; Override;

      Destructor Destroy; Override;
      function BuscarContribuicoes(const sAnoMesIni, sAnoMesFim, sDataIni, sDataFim, sIn : String): OleVariant;
      Function BuscarResgate(const sAnoMesIni, sAnoMesFim, sDataIni, sDataFim : String): OleVariant;
    End;


implementation

{ TCtrlConsultaBusca }

procedure TCtrlRelRecContrib.AfterInitialize;
begin
  inherited;
end;

constructor TCtrlRelRecContrib.Create;
begin
  inherited;
end;

destructor TCtrlRelRecContrib.Destroy;
begin
  inherited;
end;

procedure TCtrlRelRecContrib.DoChangeDataBase;
begin
  inherited;
end;


Function TCtrlRelRecContrib.BuscarContribuicoes(const sAnoMesIni, sAnoMesFim, sDataIni, sDataFim, sIn : String): OleVariant;
var
  sSql   : String;
begin
   sSql := 'SELECT CONTR.ANOMES, '                                                                                   +
          'CONTR.DATAPAGAMENTO, '                                                                                    +
          'CONTR.NOME, '                                                                                             +
          'CONTR.CPF,  '                                                                                             +
          'CONTR.UF, '                                                                                               +
          'NVL(SUM(VLR_CONTRIB), 0) AS VLR_CONTRIB '                                                                 +
          'FROM ( '                                                                                                  +
        {-- Contribuições Empregados CAIXA }
          'SELECT TO_CHAR(DATARECEBIMENTO, '+ QuotedStr('YYYY/MM') + ') ANOMES, '                                    +
                'H.DATARECEBIMENTO AS DATAPAGAMENTO, '                                                               +
                'P.NOME, '                                                                                           +
                'TRIM(P.NUMDOCUMENTO) CPF, '                                                                         +
                'UF.UF, '                                                                                            +
                'SUM(DECODE(H.FLGDEVOLUCAO,0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) VLR_CONTRIB '                        +
          'FROM PESSOA P, '                                                                                          +
                'HSTCONTRIBPREV H, '                                                                                 +
                '(SELECT E.IDPESSOA, '                                                                               +
                        'E.IDENDERECO, '                                                                             +
                        'E.LOGRADOURO, '                                                                             +
                        'E.NUMERO, '                                                                                 +
                        'E.COMPLEMENTO, '                                                                            +
                        'E.BAIRRO, '                                                                                 +
                        'E.CEP, '                                                                                    +
                        'C.NOME, '                                                                                   +
                        'TRIM(C.UF) UF '                                                                             +
                   'FROM ENDPESS E, CIDADES C, PESSOA P '                                                            +
                  'WHERE P.IDPESSOA = E.IDPESSOA '                                                                   +
                    'AND E.IDENDERECO = '                                                                            +
                            'NVL(P.IDENDCORRESP, '                                                                   +
                            '(SELECT MAX(EN.IDENDERECO) '                                                            +
                               'FROM ENDPESS EN '                                                                    +
                              'WHERE EN.IDPESSOA(+) = P.IDPESSOA)) '                                                 +
                    'AND E.IDCIDADES = C.IDCIDADES(+)) UF '                                                          +
         'WHERE P.IDPESSOA = H.IDPESSOA '                                                                            +
           ' AND H.MESCOBRANCA BETWEEN '+ QuotedStr(sAnoMesIni) +' AND ' + QuotedStr(sAnoMesFim)                     +
           ' AND H.DATARECEBIMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni)+', ' + QuotedStr('DD/MM/YYYY') + ') AND ' +
               'TO_DATE(' + QuotedStr(sDataFim)+', ' + QuotedStr('DD/MM/YYYY') + ') '                                +
           'AND H.IDCONTRIBUICAO IN ('+ sIn + ') '                                                                   +
           'AND H.SITRECEBIMENTO IN (2, 3) '                                                                         +
           'AND H.IDPESSOA = UF.IDPESSOA(+) '                                                                        +
         'GROUP BY H.DATARECEBIMENTO, P.NOME, P.NUMDOCUMENTO, UF.UF '                                                +
        ') CONTR '                                                                                                   +
 'GROUP BY CONTR.ANOMES, '                                                                                           +
          'CONTR.DATAPAGAMENTO, '                                                                                    +
          'CONTR.NOME, '                                                                                             +
          'CONTR.CPF, '                                                                                              +
          'CONTR.UF '                                                                                                +
 'ORDER BY 1, 4, 2 ';



  Result := GetDataPacket(sSql);
end;

function TCtrlRelRecContrib.BuscarResgate(const sAnoMesIni, sAnoMesFim,sDataIni, sDataFim: String): OleVariant;
var
  sSql : String;
begin
  //Cássio Rovaroto - SIG nº 42475 - Início
  sSql := 'SELECT DISTINCT                                                                                                           '+
          '       A.MESCOBRANCA AS ANOMES,                                                                                           '+
          '       E.MATRICULA,                                                                                                       '+
          '       A.IDPESSOA,                                                                                                        '+
          '       TRIM(P.NUMDOCUMENTO) AS CPF,                                                                                       '+
          '       P.NOME,                                                                                                            '+
          '       TO_CHAR(NVL(DATA.DATAREGISTRO, ''01/01/1900''), ''dd/mm/yyyy'') AS DATAREGISTRO,                                   '+
          '       BRUTO.DATAPAGAMENTO,                                                                                               '+
          '       A.VALORBRUTO AS VLR_BRUTO,                                                                                         '+
          //'       (A.VALORBRUTO - NVL(B.VALORIRRF, 0) + NVL(D.VALORDESC, 0)) AS VLR_LIQUIDO,                                         '+ //Cássio Rovaroto - SIG nº 83325
          '       TRUNC((A.VALORBRUTO - NVL(B.VALORIRRF,0) + NVL(D.VALORDESC,0) ),2) AS VLR_LIQUIDO,                                 '+ //Cássio Rovaroto - SIG nº 83325
          '       NVL(B.VALORIRRF, 0) AS VLR_IRRF                                                                                    '+
          '  FROM (SELECT HRS.IDPESSOA,                                                                                              '+
          '               HRS.MESCOBRANCA,                                                                                           '+
          '               SUM(DECODE(HRS.FLGDESCONTO, 0, HRS.VALORPROVENTO, -HRS.VALORPROVENTO)) AS VALORBRUTO,                      '+
          '               HRS.DATAPAGAMENTO,                                                                                         '+
          '               HRS.IDTITULAR                                                                                              '+
          '          FROM HISTRUBSAL HRS                                                                                             '+
          '         WHERE (HRS.IDRUBRICA IN (SELECT RU.IDPROVENTO                                                                    '+
          '                                    FROM RUBXEVENTO RU, PROVDESC PR, INFORME I                                            '+
          '                                   WHERE RU.IDMOTIVO = 3106                                                               '+
          '                                     AND   I.IDINFORME = PR.IDINFORME                                                     '+
          '                                     AND   PR.IDPROVENTO = RU.IDPROVENTO                                                  '+
          //'                                     AND   I.FLGIRRF = ''N'') OR   HRS.FLGTIPODESC = ''E'')                               '+ //Cássio Rovaroto - SIG nº 83325
          '                                     AND I.FLGIRRF = ''N'') OR HRS.FLGTIPODESC = ''E'' OR (HRS.FLGDESCONTO = 0 AND HRS.FLGTIPODESC <> ''I'')) '+ //Cássio Rovaroto - SIG nº 83325
          '           AND HRS.IDHSTFOLHABENEF IN (SELECT IDHSTFOLHABENEF FROM HSTFOLHABENEF WHERE UPPER(HISTORICO) LIKE ''%RESGATE%' + Copy(sAnoMesFim, 0, 4) + '%'') ' + //Cássio Rovaroto - SIG nº 83325
          '           AND HRS.FLGDESCONTO = 0                                                            '+
          '           AND HRS.VALORPROVENTO > 0                                                                                      '+ //Cássio Rovaroto - SIG nº 83325
          '           AND HRS.DATAPAGAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFim) + ', ''DD/MM/YYYY'')  '+
          '         GROUP BY HRS.IDPESSOA, HRS.MESCOBRANCA, HRS.DATAPAGAMENTO, HRS.IDTITULAR) A                                      '+
          '  LEFT OUTER JOIN (SELECT HRS.IDPESSOA,                                                                                   '+
          '                          HRS.MESCOBRANCA,                                                                                '+
          '                          SUM(DECODE(HRS.FLGDESCONTO, 1, HRS.VALORPROVENTO, -HRS.VALORPROVENTO)) VALORIRRF,               '+
          '                          HRS.DATAPAGAMENTO                                                                               '+
          '                     FROM HISTRUBSAL HRS                                                                                  '+
          '                    WHERE HRS.IDRUBRICA IN (SELECT RU.IDPROVENTO                                                          '+
          '                                              FROM RUBXEVENTO RU, PROVDESC PR, INFORME I                                  '+
          '                                             WHERE RU.IDMOTIVO = 3106                                                     '+
          '                                               AND   I.IDINFORME = PR.IDINFORME                                           '+
          '                                               AND   PR.IDPROVENTO = RU.IDPROVENTO                                        '+
          '                                               AND   I.FLGIRRF = ''S'')                                                   '+
          '                      AND HRS.FLGDESCONTO = 1                                                                             '+ //Cássio Rovaroto - SIG nº 83325
          '                      AND HRS.IDRUBRICA IN (SELECT IDPROVENTO FROM PROVDESC WHERE DESCRICAO LIKE ''%IRRF%'')              '+ //Cássio Rovaroto - SIG nº  83325
          '                      AND HRS.IDHSTFOLHABENEF IN (SELECT IDHSTFOLHABENEF FROM HSTFOLHABENEF WHERE UPPER(HISTORICO) LIKE ''%RESGATE%' + copy(sAnoMesFim, 0, 4) + '%'') '+ //Cássio Rovaroto - SIG nº 83325
          '                      AND HRS.DATAPAGAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFim) + ', ''DD/MM/YYYY'')                  '+
          '                    GROUP BY HRS.IDPESSOA, HRS.MESCOBRANCA, hrs.datapagamento) B ON  B.IDPESSOA = A.IDPESSOA              '+
          '   AND B.MESCOBRANCA = A.MESCOBRANCA                                                                                      '+
          '   AND B.DATAPAGAMENTO = A.DATAPAGAMENTO                                                                                  '+
          '  LEFT OUTER JOIN (SELECT HRS.IDPESSOA,                                                                                   '+
          '                          HRS.MESCOBRANCA,                                                                                '+
          '                          SUM(DECODE(HRS.FLGDESCONTO, 0, HRS.VALORPROVENTO, -HRS.VALORPROVENTO)) AS VALORDESC,            '+
          '                          HRS.DATAPAGAMENTO                                                                               '+
          '                     FROM HISTRUBSAL HRS                                                                                  '+
          '                    WHERE ((HRS.IDRUBRICA IN (SELECT RU.IDPROVENTO                                                        '+
          '                                                FROM RUBXEVENTO RU                                                        '+
          '                                                JOIN PROVDESC PR ON PR.IDPROVENTO = RU.IDPROVENTO                         '+
          '                                               WHERE RU.IDMOTIVO = 3106)) OR HRS.FLGTIPODESC = ''E'')                     '+
          '                      AND HRS.IDRUBRICA NOT IN (SELECT IDPROVENTO FROM PROVDESC WHERE DESCRICAO LIKE ''%IRRF%'') '+ //Cássio Rovaroto - SIG nº 83325
          '                      AND HRS.IDHSTFOLHABENEF IN (SELECT IDHSTFOLHABENEF FROM HSTFOLHABENEF WHERE UPPER(HISTORICO) LIKE ''%RESGATE%' + copy(sAnoMesFim, 0, 4) + '%'') '+ //Cássio Rovaroto - SIG nº 83325
          //'                      AND   HRS.IDRUBRICA <> 38882 /*RUBRICA COM PARAMETRIZAÇÃO ERRADA - Deveria estar com FLGTIPODESC = I (imposto)*/ '+ //Cássio Rovaroto - SIG n 83325
          '                      AND HRS.IDRUBRICA NOT IN (38882,40484)                                                              '+ //Cássio Rovaroto - SIG nº 83325
          '                      AND   HRS.FLGDESCONTO = 1                                                                           '+
          '                      AND   HRS.FLGTIPODESC NOT IN (''I'',''B'',''R'')                                                    '+
          '                      AND   HRS.MESCOBRANCA BETWEEN ' + QuotedStr(sAnoMesIni) + ' AND ' + QuotedStr(sAnoMesFim) + '       '+
          '                      AND   HRS.IDHSTFOLHABENEF IN (SELECT DISTINCT L.IDHSTFOLHABENEF                                     '+
          '                                                     FROM LOTEXHSTFOLHABENEF L                                            '+
          '                                                    INNER JOIN CTRLINTERFACE C ON C.IDLOTE = L.IDLOTE                     '+
          '                                                    INNER JOIN HSTFOLHABENEF H ON H.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF   '+
          '                                                    WHERE H.DATAPREVPAGTO = HRS.DATAPAGAMENTO                             '+
          '                                                      AND   (C.FLGRESGATE = 1 OR C.FLGRESGATEPARCELADO = 1))              '+
          '                    GROUP BY HRS.IDPESSOA, HRS.MESCOBRANCA, hrs.datapagamento) D  ON  D.IDPESSOA = A.IDPESSOA             '+
          '   AND D.MESCOBRANCA = A.MESCOBRANCA                                                                                      '+
          '   AND D.DATAPAGAMENTO = A.DATAPAGAMENTO                                                                                  '+
          '  JOIN PESSOA P ON P.IDPESSOA = A.IDPESSOA                                                                                '+
          '  LEFT OUTER JOIN (SELECT DISTINCT                                                                                        '+
          '                          D.IDTITULAR,                                                                                    '+
          '                          D.IDPESSOA,                                                                                     '+
          '                          D.MATRICULA,                                                                                    '+
          '                          B.IDRESPONSAVEL                                                                                 '+
          '                     FROM DEPENTIT D                                                                                      '+
          '                     JOIN BFCIARIOTITPLAN B ON  D.IDTITULAR = B.IDTITULAR                                                 '+
          '                      AND D.IDPESSOA = B.IDPESSOA) E ON  E.IDPESSOA = A.IDPESSOA AND e.idtitular = a.idtitular            '+
          '  LEFT OUTER JOIN (SELECT DISTINCT                                                                                        '+
          '                           IDPESSOA,                                                                                      '+
          '                           MAX(DATAREGISTRO) DATAREGISTRO                                                                 '+
          '                      FROM EVENTOSPREV                                                                                    '+
          '                     WHERE IDEVENTOGERADOR IN (SELECT EV.IDEVENTOGERADOR                                                  '+
          '                                                 FROM EVENTOGERADOR EV                                                    '+
          '                                                WHERE EV.FLGINTERNO IN (''DC'', ''FL'')                                   '+
          '                                                  AND UPPER(EV.NOME) LIKE ''%RESGATE%'')                                  '+
          '                     GROUP BY IDPESSOA) DATA ON DATA.IDPESSOA = E.IDTITULAR                                               '+
          '  LEFT OUTER JOIN (SELECT DISTINCT                                                                                        '+
          '                          L.IDBENEFIRRF,                                                                                  '+
          '                          L.DATAPAGAMENTO                                                                                 '+
          '                     FROM LANCIRRF L                                                                                      '+
          '                     JOIN LANCXINFORME LL ON  L.IDLANCIRRF = LL.IDLANCIRRF                                                '+
          '                    WHERE L.DATAPAGAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ', ''DD/MM/YYYY'')                     '+
          '                                              AND TO_DATE('+ QuotedStr(sDataFim) + ', ''DD/MM/YYYY'')                     '+
//          '                      AND L.IDHSTFOLHABENEF IS NOT NULL                                                                   '+
          '                      AND L.IDHSTFOLHABENEF IN (SELECT IDHSTFOLHABENEF FROM HSTFOLHABENEF WHERE UPPER(HISTORICO) LIKE ''%RESGATE%' + copy(sAnoMesFim, 0, 4) + '%'') '+ //Cássio Rovaroto - SIG nº 83325
          '                      AND L.CODNATUREZA IN (SELECT N.CODNATUREZA                                                          '+
          '                                              FROM NATURENDIMENTO N                                                       '+
          '                                             WHERE UPPER(N.DESCRICAO) LIKE ''%RESGATE%''                                  '+
          '                                               AND   N.FLGUSADONADIRF = ''S'')                                            '+
          //Cássio Rovaroto - SIG nº 83325 - Início
          {'                      AND LL.IDINFORME IN (SELECT I.IDINFORME                                                             '+
          '                                             FROM INFORME I                                                               '+
          '                                            WHERE UPPER(I.NOMEINFORME) LIKE ''%RESGATE%''                                 '+
          '                                              AND   I.CODINFORME IN (''5011'', ''3011'', ''4011'', ''5031''))}
          ' ) BRUTO      '+
          //Cássio Rovaroto - SIG nº 83325 - Fim
          '    ON  BRUTO.IDBENEFIRRF = E.IDRESPONSAVEL                                                                               '+
          '   AND BRUTO.DATAPAGAMENTO = A.DATAPAGAMENTO                                                                              '+
          ' WHERE A.MESCOBRANCA BETWEEN ' + QuotedStr(sAnoMesIni) + ' AND ' + QuotedStr(sAnoMesFim) + '                              '+
          '   AND DATA.DATAREGISTRO IS NOT NULL                                                                                      '+
          '   AND BRUTO.DATAPAGAMENTO IS NOT NULL                                                                                    '+
          ' ORDER BY 1, 3, 5                                                                                                         '; 

 { sSql := 'SELECT DISTINCT A.MESCOBRANCA ANOMES, '                                                                                   +
                'E.MATRICULA, '                                                                                                      +
                'A.IDPESSOA MATRICULA, '                                                                                             +
                'TRIM(P.NUMDOCUMENTO) CPF, '                                                                                         +
                'P.NOME, '                                                                                                           +
                'TO_CHAR(NVL(DATA.DATAREGISTRO,' + QuotedStr('01/01/1900') + '), ' + QuotedStr('dd/mm/yyyy') +' ) DATAREGISTRO, '    +
                'BRUTO.DATAPAGAMENTO, '                                                                                              +
                'A.VALORBRUTO VLR_BRUTO, '                                                                                           +
                '(A.VALORBRUTO - NVL(B.VALORIRRF, 0) + NVL(D.VALORDESC, 0)) VLR_LIQUIDO, '                                           +
                'NVL(B.VALORIRRF, 0) VLR_IRRF '                                                                                      +
  'FROM (SELECT HRS.IDPESSOA, '                                                                                                      +
               'HRS.MESCOBRANCA, '                                                                                                   +
               'SUM(DECODE(HRS.FLGDESCONTO,0,HRS.VALORPROVENTO,-HRS.VALORPROVENTO)) VALORBRUTO '                                     +
          'FROM HISTRUBSAL HRS '                                                                                                     +
         'WHERE HRS.IDRUBRICA IN (SELECT RU.IDPROVENTO '                                                                             +
                                   'FROM RUBXEVENTO RU, PROVDESC PR, INFORME I '                                                     +
                                  'WHERE RU.IDMOTIVO = 3106 '                                                                        +
                                    'AND I.IDINFORME = PR.IDINFORME '                                                                +
                                    'AND PR.IDPROVENTO = RU.IDPROVENTO '                                                             +
                                    'AND I.FLGIRRF = '+ QuotedStr('N') +') '                                                         +
          'AND HRS.FLGTIPODESC <> '+ QuotedStr('E')            +
         'GROUP BY HRS.IDPESSOA, HRS.MESCOBRANCA) A '                                                                                +
  'LEFT OUTER JOIN (SELECT HRS.IDPESSOA, '                                                                                           +
                          'HRS.MESCOBRANCA, '                                                                                        +
                          'SUM(DECODE(HRS.FLGDESCONTO,1,HRS.VALORPROVENTO,-HRS.VALORPROVENTO)) VALORIRRF '                           +
                     'FROM HISTRUBSAL HRS '                                                                                          +
                    'WHERE HRS.IDRUBRICA IN (SELECT RU.IDPROVENTO '                                                                  +
                                              'FROM RUBXEVENTO RU, PROVDESC PR, INFORME I '                                          +
                                             'WHERE RU.IDMOTIVO = 3106 '                                                             +
                                               'AND I.IDINFORME = PR.IDINFORME '                                                     +
                                               'AND PR.IDPROVENTO = RU.IDPROVENTO '                                                  +
                                               'AND I.FLGIRRF = ' + QuotedStr('S') + ') '                                            +
                    'GROUP BY HRS.IDPESSOA, HRS.MESCOBRANCA) B '                                                                     +
    'ON B.IDPESSOA = A.IDPESSOA '                                                                                                    +
   'AND B.MESCOBRANCA = A.MESCOBRANCA '                                                                                              +
  'LEFT OUTER JOIN (SELECT HRS.IDPESSOA, '                                                                                           +
                          'HRS.MESCOBRANCA, '                                                                                        +
                          'SUM(DECODE(HRS.FLGDESCONTO,0,HRS.VALORPROVENTO,-HRS.VALORPROVENTO)) VALORDESC '                           +
                     'FROM HISTRUBSAL HRS '                                                                                          +

                     'WHERE ((HRS.IDRUBRICA IN (SELECT RU.IDPROVENTO '                                                               +
                                            ' FROM RUBXEVENTO RU, PROVDESC PR, INFORME I '                                           +
                                            'WHERE RU.IDMOTIVO    = 3106 '                                                           +
                                               'AND I.IDINFORME   = PR.IDINFORME '                                                   +
                                               'AND PR.IDPROVENTO = RU.IDPROVENTO '                                                  +
                                               'AND I.FLGNATUREZA = ' + QuotedStr('N') + ' '                                         +
                                               'AND I.CODINFORME = 9021)) OR (HRS.FLGTIPODESC = ' + QuotedStr('E')+')) '             +

                      'AND HRS.MESCOBRANCA BETWEEN ' + QuotedStr(sAnoMesIni) +' AND ' + QuotedStr(sAnoMesFim) +' '                   +
                      'AND HRS.IDHSTFOLHABENEF IN '                                                                                  +
                          '(SELECT DISTINCT L.IDHSTFOLHABENEF '                                                                      +
                             'FROM LOTEXHSTFOLHABENEF L '                                                                            +
                            'INNER JOIN CTRLINTERFACE C '                                                                            +
                               'ON (C.IDLOTE = L.IDLOTE) '                                                                           +
                            'INNER JOIN HSTFOLHABENEF H '                                                                            +
                               'ON (H.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF) '                                                         +
                            'WHERE H.DATAEFETIVACAO BETWEEN '                                                                        +
                                  'TO_DATE('+ QuotedStr(sDataIni) + ', ' + QuotedStr('DD/MM/YYYY') + ' ) AND '                       +
                                  'TO_DATE('+ QuotedStr(sDataFim) + ', ' + QuotedStr('DD/MM/YYYY') + ') '                            +
                              'AND (C.FLGRESGATE = 1 OR '                                                                            +
                                  'C.FLGRESGATEPARCELADO = 1)) '                                                                     +
                    'GROUP BY HRS.IDPESSOA, HRS.MESCOBRANCA) D '                                                                     +
    'ON D.IDPESSOA = A.IDPESSOA '                                                                                                    +
   'AND D.MESCOBRANCA = A.MESCOBRANCA '                                                                                              +
  'LEFT OUTER JOIN PESSOA P '                                                                                                        +
    'ON P.IDPESSOA = A.IDPESSOA '                                                                                                    +
  'LEFT OUTER JOIN (SELECT DISTINCT D.IDTITULAR, '                                                                                   +
                                   'D.IDPESSOA, '                                                                                    +
                                   'D.MATRICULA, '                                                                                   +
                                   'B.IDRESPONSAVEL '                                                                                +
                     'FROM DEPENTIT D, BFCIARIOTITPLAN B '                                                                           +
                    'WHERE D.IDTITULAR = B.IDTITULAR '                                                                               +
                      'AND D.IDPESSOA = B.IDPESSOA) E '                                                                              +
    'ON E.IDPESSOA = A.IDPESSOA '                                                                                                    +
  'LEFT OUTER JOIN (SELECT DISTINCT IDPESSOA, MAX(DATAREGISTRO) DATAREGISTRO '                                                       +
                     'FROM EVENTOSPREV '                                                                                             +
                   'WHERE IDEVENTOGERADOR IN '                                                                                       +
                          '( '                                                                                                       +
                             'SELECT EV.IDEVENTOGERADOR '                                                                            +
                             'FROM EVENTOGERADOR EV '                                                                                +
                            'WHERE EV.FLGINTERNO IN ('                                                                               +
                                                      QuotedStr('DC') +', ' + QuotedStr('FL')                                        +
                                                    ') '                                                                             +
                              'AND UPPER(EV.NOME) LIKE ' + QuotedStr('%RESGATE%')                                                    +
                          ')'                                                                                                        +
                    'GROUP BY IDPESSOA) DATA '                                                                                       +
    'ON DATA.IDPESSOA = E.IDTITULAR '                                                                                                +
  'LEFT OUTER JOIN ( '                                                                                                               +
                     'SELECT DISTINCT L.IDBENEFIRRF, L.DATAPAGAMENTO '                                                               +
                     'FROM LANCIRRF L, LANCXINFORME LL '                                                                             +
                    'WHERE L.IDLANCIRRF = LL.IDLANCIRRF '                                                                            +
                      'AND L.DATAPAGAMENTO BETWEEN '                                                                                 +
                          'TO_DATE(' + QuotedStr(sDataIni) + ', ' + QuotedStr('DD/MM/YYYY') + ' ) AND '                              +
                          'TO_DATE(' + QuotedStr(sDataFim) + ', ' + QuotedStr('DD/MM/YYYY') + ' ) '                                  +
                      'AND L.IDHSTFOLHABENEF IS NOT NULL '                                                                           +
                      'AND L.CODNATUREZA IN '                                                                                        +
                          '('                                                                                                        +
                            'SELECT N.CODNATUREZA '                                                                                  +
                             'FROM NATURENDIMENTO N '                                                                                +
                            'WHERE UPPER(N.DESCRICAO) LIKE ' + QuotedStr('%RESGATE%') + ' '                                          +
                              'AND N.FLGUSADONADIRF = '+ QuotedStr('S')                                                              +
                          ')'                                                                                                        +
                      'AND LL.IDINFORME IN '                                                                                         +
                         ' ( '                                                                                                       +
                            'SELECT I.IDINFORME '                                                                                    +
                            'FROM INFORME I '                                                                                        +
                            'WHERE UPPER(I.NOMEINFORME) LIKE '+ QuotedStr('%RESGATE%')+ ' '                                          +
                              'AND I.CODINFORME IN ( '                                                                               +
                                                     QuotedStr('5011') + ', '                                                        +
                                                     QuotedStr('3011') + ', '                                                        +
                                                     QuotedStr('4011') + ', '                                                        + // Andre Imakawa - SIG 42284
                                                     QuotedStr('5031')                                                               + // Andre Imakawa - SIG 42284
                                                  ') '                                                                               +
                              ' AND I.FLGIRRF = ' + QuotedStr('N')                                                                   +
                          ' )'                                                                                                       +
                  ' ) BRUTO '                                                                                                        +
    'ON BRUTO.IDBENEFIRRF = E.IDRESPONSAVEL '                                                                                        +
 'WHERE A.MESCOBRANCA BETWEEN ' + QuotedStr(sAnoMesIni) + ' AND ' + QuotedStr(sAnoMesFim) +' '                                       +
   'AND DATA.DATAREGISTRO IS NOT NULL '                                                                                              +
   'AND BRUTO.DATAPAGAMENTO IS NOT NULL '                                                                                            +
 'ORDER BY 1, 3, 5 '; }
 //Cássio Rovaroto - SIG nº 42475 - Fim
  Result := GetDataPacket(sSql);
end;


end.

