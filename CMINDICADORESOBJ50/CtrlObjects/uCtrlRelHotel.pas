unit uCtrlRelHotel;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE RELATÓRIOS DE HOTÉIS ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  11/11/2002
//      Data de Término :
//
// -----------------------------------------------------------------------------



interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDiasUteis;

type TCtrlRelHotel = class(TCMControlObject)

     protected

     public

       function BuscaUH_Hotel      (const iIdReport, iIdImovel, iIndUH: Integer; const dIni: TDateTime) : OLEVariant;
       function BuscaRelRDS        (const iIdReport, iIdImovel, iIdGrpApuracao: Integer; const dIni : TDateTime) :OLEVariant;
       function BuscaRelComparativo(const iIdReport, iMes, iAno, iIdImovel1, iIdImovel2, iIdImovel3, iIdImovel4, iIdImovel5, iIdImovel6, iIdImovel7: Integer) : OLEVariant;
       function BuscaRelGrafico    (const iIdIndicador, iMes, iAno, iIdImovel1, iIdImovel2, iIdImovel3, iIdImovel4, iIdImovel5, iIdImovel6, iIdImovel7: Integer) : OLEVariant;

     published

end;

implementation

uses uComunsImobiliario;

{ TCtrlRelHotel }

function TCtrlRelHotel.BuscaRelComparativo(const iIdReport, iMes, iAno,  iIdImovel1,
                                                 iIdImovel2, iIdImovel3, iIdImovel4,
                                                 iIdImovel5, iIdImovel6, iIdImovel7: Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := ' AND MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
            ' AND ANOCOMPETENCIA = ' + IntToStr(iAno);

  sSql := 'SELECT I.IDINDICADOR, '+#13+
          '       GI.ORDEM,      '+#13+
          '       I.DESCRICAO  AS DSC_INDICADOR, '+#13+
          '       DECODE(I.TIPOVALOR,''R'',''RECEITAS'',''D'',''DESPESAS'',''DESEMPENHO'') AS DSC_TIPOVALOR, '+#13+
          '       NVL(AP01.VLRAPURACAONUM,0)  AS VLR01, '+#13+
          '       NVL(AP02.VLRAPURACAONUM,0)  AS VLR02, '+#13+
          '       NVL(AP03.VLRAPURACAONUM,0)  AS VLR03, '+#13+
          '       NVL(AP04.VLRAPURACAONUM,0)  AS VLR04, '+#13+
          '       NVL(AP05.VLRAPURACAONUM,0)  AS VLR05, '+#13+
          '       NVL(AP06.VLRAPURACAONUM,0)  AS VLR06, '+#13+
          '       NVL(AP07.VLRAPURACAONUM,0)  AS VLR07  '+#13+
          ' FROM '+#13+
          '       INDINDICADOR I,         '+#13+
          '       INDGRPINDICADOR GI,     '+#13+
          '       INDSUBTIPOINDICADOR ST, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel1) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP01, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel2) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP02, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel3) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP03, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel4) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP04, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel5) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP05, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel6) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP06, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE IDIMOVEL = ' + IntToStr(iIdImovel7) + sParam +
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
          '        ) AP07 '+#13+
          ' WHERE ST.IDREPORTS   = ' + IntToStr( iIdReport ) +#13+
          '   AND ST.IDSUBTIPO   = GI.IDSUBTIPO          '+#13+
          '   AND GI.IDINDICADOR = I.IDINDICADOR         '+#13+
          '   AND I.IDINDICADOR    = AP01.IDINDICADOR(+) '+#13+
          '   AND I.IDINDICADOR    = AP02.IDINDICADOR(+) '+#13+
          '   AND I.IDINDICADOR    = AP03.IDINDICADOR(+) '+#13+
          '   AND I.IDINDICADOR    = AP04.IDINDICADOR(+) '+#13+
          '   AND I.IDINDICADOR    = AP05.IDINDICADOR(+) '+#13+
          '   AND I.IDINDICADOR    = AP06.IDINDICADOR(+) '+#13+
          '   AND I.IDINDICADOR    = AP07.IDINDICADOR(+) '+#13+
          ' ORDER BY DSC_TIPOVALOR, ORDEM, DSC_INDICADOR ';

  Result := GetDataPacket( sSql );
end;

function TCtrlRelHotel.BuscaRelRDS(const iIdReport, iIdImovel, iIdGrpApuracao: Integer; const dIni: TDateTime): OLEVariant;
var sSql, sParam1 : String;
    sD1,sD2,sD3,sD4,sD5,sD6,sD7 : String;
    iDia,iMes,iAno : Word;
begin
  // Define dias para as colunas
  sD1 := FormatDateTime('DD/MM/YYYY',dIni);
  sD2 := FormatDateTime('DD/MM/YYYY',(dIni + 1));
  sD3 := FormatDateTime('DD/MM/YYYY',(dIni + 2));
  sD4 := FormatDateTime('DD/MM/YYYY',(dIni + 3));
  sD5 := FormatDateTime('DD/MM/YYYY',(dIni + 4));
  sD6 := FormatDateTime('DD/MM/YYYY',(dIni + 5));
  sD7 := FormatDateTime('DD/MM/YYYY',(dIni + 6));

  DecodeDate(dIni,iAno,iMes,iDia);

  // Define Parâmetros
  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport) +#13+
             ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno) +#13;
  if iIdImovel      > 0 then sParam1 := sParam1 + ' AND AP.IDIMOVEL = '      + IntToStr(iIdImovel)      +#13;
  if iIdGrpApuracao > 0 then sParam1 := sParam1 + ' AND AP.IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao) +#13;


  sSql := 'SELECT IM.IDIMOVEL,      '+#13+
          '       IM.IMONOME,       '+#13+
          '       I.IDINDICADOR,    '+#13+
          '       I.TIPOVALOR,      '+#13+
          '       CCI.ORDEM,        '+#13+
          '       GA.IDGRPAPURACAO, '+#13+
          '       GA.DESCRICAO AS DSC_CCUSTO,    '+#13+
          '       I.DESCRICAO  AS DSC_INDICADOR, '+#13+
          '       DECODE(I.TIPOVALOR,''R'',''RECEITAS'',''D'',''DESPESAS'',''DESEMPENHO'') AS DSC_TIPOVALOR, '+#13+
                  QuotedStr(sD1) + ' AS DIA01, '+#13+
                  QuotedStr(sD2) + ' AS DIA02, '+#13+
                  QuotedStr(sD3) + ' AS DIA03, '+#13+
                  QuotedStr(sD4) + ' AS DIA04, '+#13+
                  QuotedStr(sD5) + ' AS DIA05, '+#13+
                  QuotedStr(sD6) + ' AS DIA06, '+#13+
                  QuotedStr(sD7) + ' AS DIA07, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD1) + ',''DD/MM/YYYY''),''DY'') AS SEM01, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD2) + ',''DD/MM/YYYY''),''DY'') AS SEM02, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD3) + ',''DD/MM/YYYY''),''DY'') AS SEM03, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD4) + ',''DD/MM/YYYY''),''DY'') AS SEM04, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD5) + ',''DD/MM/YYYY''),''DY'') AS SEM05, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD6) + ',''DD/MM/YYYY''),''DY'') AS SEM06, '+#13+
          '       TO_CHAR(TO_DATE(' + QuotedStr(sD7) + ',''DD/MM/YYYY''),''DY'') AS SEM07, '+#13+
          '       NVL(AP01.VLRAPURACAONUM,0)  AS VLR01, '+#13+
          '       NVL(AP02.VLRAPURACAONUM,0)  AS VLR02, '+#13+
          '       NVL(AP03.VLRAPURACAONUM,0)  AS VLR03, '+#13+
          '       NVL(AP04.VLRAPURACAONUM,0)  AS VLR04, '+#13+
          '       NVL(AP05.VLRAPURACAONUM,0)  AS VLR05, '+#13+
          '       NVL(AP06.VLRAPURACAONUM,0)  AS VLR06, '+#13+
          '       NVL(AP07.VLRAPURACAONUM,0)  AS VLR07, '+#13+
          '       NVL(APMES.VLRAPURACAONUM,0) AS VLRMES '+#13+
          ' FROM '+#13+
          '       IMOVEL IM,         '+#13+
          '       INDINDICADOR I,    '+#13+
          '       INDGRPAPURACAO GA, '+#13+
          '       ( '+#13+
          '        SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS IDGRPAPURACAO, AP.IDINDICADOR, '+#13+
          '                        GI.TIPOLANCA, AP.ANOCOMPETENCIA, GI.ORDEM '+#13+
          '          FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST,        '+#13+
          '               INDAPURACAO AP,     INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = GI.IDINDICADOR    '+#13+
          '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO      '+#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR     '+#13+ sParam1 +
          '        ) CCI, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD1) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP01, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD2) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP02, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD3) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP03, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD4) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP04, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD5) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP05, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD6) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP06, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE DATAAPURACAO = TO_DATE(' + QuotedStr(sD7) + ',''DD/MM/YYYY'') '+#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '        ) AP07, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
          '           AND ANOCOMPETENCIA = ' + IntToStr(iAno) +#13+
          '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) APMES '+#13+
          ' WHERE CCI.IDINDICADOR    = I.IDINDICADOR '+#13+
          '   AND CCI.IDIMOVEL       = IM.IDIMOVEL '+#13+
          '   AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP01.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP01.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP01.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP01.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP02.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP02.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP02.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP02.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP03.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP03.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP03.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP03.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP04.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP04.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP04.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP04.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP05.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP05.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP05.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP05.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP06.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP06.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP06.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP06.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP07.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP07.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP07.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP07.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = APMES.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = APMES.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = APMES.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = APMES.TIPOLANCA(+) '+#13+
          ' ORDER BY IMONOME, DSC_CCUSTO, DSC_TIPOVALOR, ORDEM, DSC_INDICADOR ';

  Result := GetDataPacket( sSql );
end;

function TCtrlRelHotel.BuscaUH_Hotel(const iIdReport, iIdImovel, iIndUH: Integer; const dIni: TDateTime): OLEVariant;
var sSql, sParam1 : String;
    sD1,sD2,sD3,sD4,sD5,sD6,sD7 : String;
    iDia,iMes,iAno : Word;
begin
  // Define dias para as colunas
  sD1 := FormatDateTime('DD/MM/YYYY',dIni);
  sD2 := FormatDateTime('DD/MM/YYYY',(dIni + 1));
  sD3 := FormatDateTime('DD/MM/YYYY',(dIni + 2));
  sD4 := FormatDateTime('DD/MM/YYYY',(dIni + 3));
  sD5 := FormatDateTime('DD/MM/YYYY',(dIni + 4));
  sD6 := FormatDateTime('DD/MM/YYYY',(dIni + 5));
  sD7 := FormatDateTime('DD/MM/YYYY',(dIni + 6));

  DecodeDate(dIni,iAno,iMes,iDia);

  // Define Parâmetros
  sParam1 := ' AND CCI.IDINDICADOR    = ' + IntToStr(iIndUH)  +#13+
             ' AND CCI.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND CCI.ANOCOMPETENCIA = ' + IntToStr(iAno) +#13;
  if iIdImovel > 0 then sParam1 := sParam1 + ' AND CCI.IDIMOVEL = ' + IntToStr(iIdImovel) +#13;

  sSql := 'SELECT IM.IDIMOVEL,      '+#13+
          '       GA.IDGRPAPURACAO, '+#13+
          '       I.IDINDICADOR,    '+#13+
          '       NVL(AP01.VLRAPURACAONUM,0)  AS VLR01, '+#13+
          '       NVL(AP02.VLRAPURACAONUM,0)  AS VLR02, '+#13+
          '       NVL(AP03.VLRAPURACAONUM,0)  AS VLR03, '+#13+
          '       NVL(AP04.VLRAPURACAONUM,0)  AS VLR04, '+#13+
          '       NVL(AP05.VLRAPURACAONUM,0)  AS VLR05, '+#13+
          '       NVL(AP06.VLRAPURACAONUM,0)  AS VLR06, '+#13+
          '       NVL(AP07.VLRAPURACAONUM,0)  AS VLR07, '+#13+
          '       NVL(APMES.VLRAPURACAONUM,0) AS VLRMES '+#13+
          ' FROM '+#13+
          '       IMOVEL IM,         '+#13+
          '       INDINDICADOR I,    '+#13+
          '       INDGRPAPURACAO GA, '+#13+
          '      ( '+#13+
          '       SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS IDGRPAPURACAO, AP.IDINDICADOR, '+#13+
          '                       GI.TIPOLANCA, AP.ANOCOMPETENCIA, AP.MESCOMPETENCIA  '+#13+
          '         FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST, '+#13+
          '              INDAPURACAO AP,     INDINDICADOR I '+#13+
          '        WHERE AP.IDINDICADOR = GI.IDINDICADOR '+#13+
          '          AND GI.IDSUBTIPO   = ST.IDSUBTIPO   '+#13+
          '          AND AP.IDINDICADOR = I.IDINDICADOR  '+#13+
          '          AND ST.IDREPORTS   = ' + IntToStr(iIdReport) +#13+
          '       ) CCI, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD1) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP01, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD2) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP02, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD3) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP03, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD4) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP04, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD5) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP05, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD6) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP06, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR  = ' + IntToStr(iIndUH) +#13+
          '          AND DATAAPURACAO = TO_DATE(' + QuotedStr(sD7) + ',''DD/MM/YYYY'') '+#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) AP07, '+#13+
          '       ( '+#13+
          '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO '+#13+
          '        WHERE IDINDICADOR = ' + IntToStr(iIndUH)  +#13+
          '          AND MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
          '          AND ANOCOMPETENCIA = ' + IntToStr(iAno) +#13+
          '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
          '       ) APMES '+#13+
          ' WHERE CCI.IDINDICADOR    = I.IDINDICADOR '+#13+
          '   AND CCI.IDIMOVEL       = IM.IDIMOVEL '+#13+
          '   AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP01.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP01.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP01.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP01.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP02.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP02.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP02.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP02.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP03.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP03.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP03.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP03.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP04.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP04.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP04.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP04.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP05.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP05.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP05.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP05.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP06.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP06.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP06.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP06.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = AP07.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = AP07.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = AP07.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = AP07.TIPOLANCA(+) '+#13+
          '   AND CCI.IDIMOVEL       = APMES.IDIMOVEL(+) '+#13+
          '   AND CCI.IDGRPAPURACAO  = APMES.IDGRPAPURACAO(+) '+#13+
          '   AND CCI.IDINDICADOR    = APMES.IDINDICADOR(+) '+#13+
          '   AND CCI.TIPOLANCA      = APMES.TIPOLANCA(+) ' + sParam1;

  Result := GetDataPacket( sSql );
end;


function TCtrlRelHotel.BuscaRelGrafico(const iIdIndicador, iMes, iAno,
                                             iIdImovel1, iIdImovel2, iIdImovel3, iIdImovel4, iIdImovel5, iIdImovel6,
                                             iIdImovel7: Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
            ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno) +#13+
            ' AND AP.IDINDICADOR    = ' + IntToStr(iIdIndicador) +#13;

  sParam := sParam + ' AND AP.IDIMOVEL IN( '; 
  if iIdImovel1 > 0 then sParam := sParam + IntToStr(iIdImovel1) + ',';
  if iIdImovel2 > 0 then sParam := sParam + IntToStr(iIdImovel2) + ',';
  if iIdImovel3 > 0 then sParam := sParam + IntToStr(iIdImovel3) + ',';
  if iIdImovel4 > 0 then sParam := sParam + IntToStr(iIdImovel4) + ',';
  if iIdImovel5 > 0 then sParam := sParam + IntToStr(iIdImovel5) + ',';
  if iIdImovel6 > 0 then sParam := sParam + IntToStr(iIdImovel6) + ',';
  if iIdImovel7 > 0 then sParam := sParam + IntToStr(iIdImovel7) + ',';
  sParam := Copy(sParam,1,Length(sParam)-1) + ')';

  sSql := 'SELECT AP.IDIMOVEL, '+#13+
          '       CL.NOMCONTRATO, '+#13+
          '       I.DESCRICAO AS DSC_INDICADOR, '+#13+
          '       SUM(NVL(AP.VLRAPURACAONUM,0)) AS VLRAPURACAO '+#13+
          '  FROM INDAPURACAO AP, INDCONTRATOLOJA CL, INDINDICADOR I '+#13+
          ' WHERE AP.IDIMOVEL = CL.IDIMOVEL '+#13+
          '   AND AP.IDINDICADOR = I.IDINDICADOR '+#13+ sParam +
          ' GROUP BY AP.IDIMOVEL, CL.NOMCONTRATO, I.DESCRICAO '+#13+
          ' ORDER BY CL.NOMCONTRATO ';

  Result := GetDataPacket( sSql );
end;


end.
