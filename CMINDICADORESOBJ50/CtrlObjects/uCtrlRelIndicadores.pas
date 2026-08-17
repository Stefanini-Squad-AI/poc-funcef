unit uCtrlRelIndicadores;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE RELATÓRIOS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  05/06/2002
//      Data de Término :
//
// -----------------------------------------------------------------------------


interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDiasUteis, uCmFileUtils;

type TCtrlRelIndicadores = class(TCMControlObject)

     private
       DiasUteis : TDiasUteis;

       function VariacaoVenda (const iIdImovel,iIdAtividade,iIdMarca,iIdContrato,iMesAtual,iAnoAtual:Integer; const iVndUpvM2Atual:Extended;
                               const sTipoContrato,sTipoVariacao:String; const iIndVenda,iIndAbl,iIdUPV: Integer) : Extended;

     protected
       procedure AfterInitialize;  Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       function BuscaABLAno           (const iIdImovel,iAno,iIdABL: Integer): OLEVariant;
       function BuscaRelIndicadores   (const sTipo:  String = '') : OLEVariant;
       function BuscaRelGrpApuracao   (const sGrupo: String = '') : OLEVariant;
       function BuscaRelEstrutura     (const iIdTipo,iIdSubTipo: Integer) : OLEVariant;
       function BuscaRelFuncionario   (const iIdReport,iIdImovel,iAno, iIdIndicador: Integer) : OLEVariant;
       function BuscaRelVeiculoSem    (const iIdReport,iIdImovel: Integer; const dtIni,dtFim: TDateTime) : OLEVariant;
       function BuscaRelVeiculoMen    (const iIdReport,iIdImovel, iAnoIni, iAnoFim: Integer) : OLEVariant;
       function BuscaRelVacancia      (const iMes,iAno: Integer; const iIdEmpresa, iIdMoedaCAF, iIdPaisCAF: Integer; const sCodTipImovel:String = '') : OLEVariant;
       function BuscaRelEvolVacancia  (const iMes,iAno: Integer) : OLEVariant;
       function BuscaRelConsumoNum    (const iIdReport,iIdImovel,iAno: Integer) : OLEVariant;
       function BuscaRelConsumoStr    (const iIdReport,iIdImovel,iAno: Integer) : OLEVariant;
       function BuscaRelOrcamento     (const iIdReport,iIdImovel,iAno,iMesIni,iQtdeMeses,iOrdem: Integer;
                                       const flgReceita,flgDespesa,flgPrevisto,flgRealizado,flgDesemp: Boolean;
                                       const sIndicadores: String = ''): OLEVariant;
       function BuscaRelAnaliseOrca   (const iIdReport,iIdImovel,iAno,iMesIni,iQtdeMeses,iOrdem: Integer): OLEVariant;
       function BuscaRelVendaLoja     (const iIdImovel,iIdIndVenda,iIdIndOverage,iIdIndAluguel,iIdIndAbl,iIdUpv,iMes,iAno: Integer) : OLEVariant;
       function BuscaRelVendaAtividade(const iIdImovel,iIdAtividade,iIdIndVenda,iIdIndOverage,iIdIndAluguel,iIdIndAbl,iIdUpv,iMes,iAno,iOrdem: Integer) : OLEVariant;
       function BuscaRelVendaFranquia (const iIdImovel,iIdMarca,iIdIndVenda,iIdIndOverage,iIdIndAluguel,iIdIndAbl,iIdUpv,iMes,iAno,iOrdem: Integer) : OLEVariant;       
       function BuscaRelRanking       (const iIdImovel,iIdIndVenda,iIdIndAluguel,iIdIndAbl,iIdUpv,iMes,iAno: Integer) : OLEVariant;
       function BuscaRelPerformance   (const iIdImovel,iMesIni,iAnoIni,iMesFim,iAnoFim,iIdIndAbl,iIdIndVenda,iIdIndAluguel,iIdIndOverage,iIdUPV: Integer) : OLEVariant;
       function BuscaLojasVagas       (const iIdImovel,iMes,iAno:Integer) : OLEVariant;
       function BuscaRelLojasLivres   (const iIdRepOrcamto,iIdImovel,iMes,iAno,iIdABL:Integer) : OLEVariant;
       function BuscaRelRemessa       (const iIdReport,iIdImovel,iMes,iAno: Integer) : OLEVariant;
       function BuscaRelInadimplencia (const iIdReport,iIdImovel,iIdGrpApuracao,iMes,iAno,iNDMeses,iNDAlug,
                                             iNDEnca,iNDFund,iNDLuva,iNDTpProv,iNDDtProv: Integer) : OLEVariant;
       function BuscaRelAbono         (const iIdReport,iIdImovel,iIdGrpApuracao,iIndDtVencto,iIndDtPagto,
                                             iIndVlrFat,iIndCM,iIndJur,iIndVlrPag:Integer;
                                       const dtIni,dtFim:TDateTime) : OLEVariant;


     published

end;


implementation

uses uComunsImobiliario;

{ TCtrlRelIndicadores }

constructor TCtrlRelIndicadores.Create;
begin
  inherited;
  DiasUteis := TDiasUteis.Create;
end;

destructor TCtrlRelIndicadores.Destroy;
begin
  inherited;
  FreeAndNil( DiasUteis );
end;

procedure TCtrlRelIndicadores.AfterInitialize;
begin
  inherited;
  DiasUteis.InitializeAs( Self );
end;


// -----------------------------------------------------------------------------
// Relatório de Cadastro de Indicadores ( idReports 3433 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelIndicadores( const sTipo: String) : OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT IDINDICADOR, DESCRICAO, UNIDADE, FLGGRPAPURACAO, FLGSUBGRPAPURACAO, FLGCONTRATO, '+#13+
          '       DECODE(TIPODADO,''N'',''Numérico'','+#13+
          '                       ''C'',''Caracter'', ''Data'') AS DSC_TIPODADO, ' +#13+
          '       DECODE(PERIODICIDADE,''D'',''Dia'','+#13+
          '                            ''M'',''Men'', ''Livre'') AS DSC_PERIODICIDADE, ' +#13+
          '       DECODE(TIPOVALOR,''R'',''RECEITA'','+#13+
          '                        ''D'',''DESPESA'', ''DESEMPENHO'') AS DSC_TIPOVALOR, ' +#13+
          '       DECODE(FLGGRPAPURACAO,''C'',''Centro de Custo'','+#13+
          '                             ''F'',''Função / Cargo'','+#13+
          '                             ''A'',''Grupo de Abono'','+#13+
          '                             ''I'',''Inadimplência'','+#13+
          '                             ''0'',''Outros'', NULL   ) AS DSC_GRPAPURACAO, ' +#13+
          '       DECODE(FLGSUBGRPAPURACAO,''C'',''Centro de Custo'','+#13+
          '                                ''F'',''Função / Cargo'','+#13+
          '                                ''A'',''Grupo de Abono'','+#13+
          '                                ''I'',''Inadimplência'','+#13+
          '                                ''0'',''Outros'', NULL   ) AS DSC_SUBGRPAPURACAO ' +#13+
          '  FROM INDINDICADOR '+#13;

          if sTipo <> '' then sSql := sSql + ' WHERE TIPOVALOR = ' + QuotedStr(sTipo) +#13;

          sSql := sSql + 'ORDER BY DSC_TIPOVALOR, DESCRICAO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Grupo de Apuração ( idReports 3494 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelGrpApuracao(const sGrupo: String): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT DESCRICAO, '+#13+
          '       DECODE(TIPOGRUPO,''C'',''CENTRO DE CUSTO'', '+#13+
          '                        ''F'',''FUNÇÃO / CARGO'',  '+#13+
          '                        ''A'',''GRUPO DE ABONO'',  '+#13+
          '                        ''I'',''INADIMPLÊNCIA'',   '+#13+
          '                        ''0'',''OUTROS'', NULL  ) AS DSC_TIPOGRUPO '+#13+
          '  FROM INDGRPAPURACAO ';

  if sGrupo <> '' then
    sSql := sSql + 'WHERE TIPOGRUPO = ' + QuotedStr(sGrupo);

  sSql := sSql + ' ORDER BY DSC_TIPOGRUPO, DESCRICAO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Estrutura de Indicadores por Tipo de Relatório ( idReports 3437 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelEstrutura(const iIdTipo,iIdSubTipo:Integer): OLEVariant;
var sSql, sParam : String;
begin

  // Define parâmetros
  sParam := '';
  if iIdTipo > 0    then sParam := sParam + ' AND SI.IDTIPO = ' + IntToStr(iIdTipo);
  if iIdSubTipo > 0 then sParam := sParam + ' AND SI.IDSUBTIPO = ' + IntToStr(iIdSubTipo);

  // Monta Sql
  sSql := 'SELECT TI.DESCRICAO AS DSC_TIPO, '+
          '       SI.DESCRICAO AS DSC_SUBTIPO, '+
          '       DECODE(GI.TIPOVALOR, '+QuotedStr('R')+','+QuotedStr('Receita')+','+
                                         QuotedStr('D')+','+QuotedStr('Despesa')+','+
                                         QuotedStr('E')+','+QuotedStr('Desempenho')+',NULL) AS DSC_VALOR, '+
          '       GI.DSC_INDICADOR, '+
          '       NVL(GI.FLG_PREV,0) AS FLG_PREV, '+
          '       NVL(GI.FLG_REAL,0) AS FLG_REAL '+
          'FROM '+
          '       INDTIPOINDICADOR TI, '+
          '       INDSUBTIPOINDICADOR SI, '+
          '       ( '+
          '       SELECT DISTINCT GI.IDSUBTIPO, GI.IDINDICADOR, GIPREV.FLG_PREV, GIREAL.FLG_REAL, '+
          '                       I.DESCRICAO AS DSC_INDICADOR, I.TIPOVALOR '+
          '         FROM INDGRPINDICADOR GI, '+
          '              INDINDICADOR I, '+
          '             ( '+
          '              SELECT DISTINCT IDSUBTIPO, IDINDICADOR, 1 AS FLG_PREV '+
          '                FROM INDGRPINDICADOR '+
          '               WHERE TIPOLANCA = ' + QuotedStr('P')+
          '              ) GIPREV, '+
          '             ( '+
          '              SELECT DISTINCT IDSUBTIPO, IDINDICADOR, 1 AS FLG_REAL '+
          '                FROM INDGRPINDICADOR '+
          '               WHERE TIPOLANCA = ' + QuotedStr('R')+
          '              ) GIREAL '+
          '        WHERE GI.IDINDICADOR = I.IDINDICADOR '+
          '          AND GI.IDSUBTIPO   = GIPREV.IDSUBTIPO(+) '+
          '          AND GI.IDINDICADOR = GIPREV.IDINDICADOR(+) '+
          '          AND GI.IDSUBTIPO   = GIREAL.IDSUBTIPO(+) '+
          '          AND GI.IDINDICADOR = GIREAL.IDINDICADOR(+) '+
          '       ) GI '+
          ' WHERE TI.IDTIPO = SI.IDTIPO '+
          '   AND SI.IDSUBTIPO  = GI.IDSUBTIPO(+) '+ sParam +

          ' ORDER BY DSC_TIPO, DSC_SUBTIPO, DSC_VALOR, DSC_INDICADOR ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Orçamento - Encargos Comuns ( idReports 3435 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelOrcamento(const iIdReport,iIdImovel,iAno,iMesIni,iQtdeMeses,iOrdem:Integer;
                                               const flgReceita,flgDespesa,flgPrevisto,flgRealizado,flgDesemp: Boolean;
                                               const sIndicadores: String): OLEVariant;
var sSql, sParam1, sParam2, sParam3, sMedia, sOrdem : String;
    sMes : array[1..12] of String;
    i, iMesReal, iAnoReal : Integer;
begin
   // Monta string de parametros
   sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport);
   sParam3 := '';
   if iIdImovel > 0 then begin
      sParam1 := sParam1 + ' AND AP.IDIMOVEL = '  + IntToStr(iIdImovel);
      sParam3 := sParam3 + ' AND IDIMOVEL = '     + IntToStr(iIdImovel);
   end;

   // Define os indicadores
   if sIndicadores <> '' then begin
      sParam1 := sParam1 + ' AND I.IDINDICADOR IN( ' + sIndicadores + ' ) ';
   end;


   // Define os meses
   if iAno > 0 then begin
      sParam1 := sParam1 + ' AND AP.ANOCOMPETENCIA IN(' + IntToStr(iAno) + ',';
      sParam3 := sParam3 + ' AND ( ';
   end;
   iMesReal := iMesIni;
   iAnoReal := iAno;
   for i := 1 to 12 do begin
      if iMesReal > 12 then begin
         iMesReal := 1;
         iAnoReal := iAnoReal + 1;
         sParam1  := sParam1 + IntToStr(iAnoReal) + ',';
      end;
      sMes[i] := '';
      sMes[i] := '     MESCOMPETENCIA = ' + IntToStr(iMesReal) +
                 ' AND ANOCOMPETENCIA = ' + IntToStr(iAnoReal);
      if iIdImovel > 0 then
         sMes[i] := sMes[i] + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);

      // Define parâmetros do período anterior
      if i < 12 then begin
         sParam3 := sParam3 + ' ( ANOCOMPETENCIA = ' + IntToStr(iAnoReal-1) + ' AND ' +
                              '   MESCOMPETENCIA = ' + IntToStr(iMesReal) + ' ) OR ' + #13;
      end else begin
         sParam3 := sParam3 + ' ( ANOCOMPETENCIA = ' + IntToStr(iAnoReal-1) + ' AND '+
                              '   MESCOMPETENCIA = ' + IntToStr(iMesReal) + ' ) )' + #13;
      end;
      Inc(iMesReal);
   end;
   sParam1 := Copy(sParam1,1,Length(sParam1)-1) + ')';

   if flgReceita or flgDespesa or flgDesemp then begin
     sParam1 := sParam1 + ' AND I.TIPOVALOR IN(';
     if flgReceita then sParam1 := sParam1 + QuotedStr('R') + ',';
     if flgDespesa then sParam1 := sParam1 + QuotedStr('D') + ',';
     if flgDesemp  then sParam1 := sParam1 + QuotedStr('E') + ',';
     sParam1 := Copy(sParam1,1,Length(sParam1)-1) + ')';
   end;

   if flgPrevisto or flgRealizado then begin
     sParam1 := sParam1 + ' AND GI.TIPOLANCA IN(';
     if flgPrevisto  then sParam1 := sParam1 + QuotedStr('P') + ',';
     if flgRealizado then sParam1 := sParam1 + QuotedStr('R') + ',';
     sParam1 := Copy(sParam1,1,Length(sParam1)-1) + ')';
   end;

   // Define Ordenação
   case iOrdem of
     1 : sOrdem := 'ORDER BY IMONOME, TIPOVALOR, DSC_CCUSTO, DSC_INDICADOR, DSC_TIPOLANCA ';
     2 : sOrdem := 'ORDER BY IMONOME, TIPOVALOR, DSC_INDICADOR, DSC_CCUSTO, DSC_TIPOLANCA ';
   end;

   // Monta o campo de média
   sMedia := ' (';
   for i := 1 to iQtdeMeses do begin
       sMedia := sMedia + '(NVL(AP'+FormatFloat('0#',i)+'.VLRAPURACAONUM,0)) +';
   end;
   sMedia := Copy(sMedia,1,Length(sMedia)-1) + ') / ' + IntToStr(iQtdeMeses) + ' AS VLRMEDIA ' +#13;

   // Monta o Sql
   sSql := 'SELECT IM.IDIMOVEL, '+#13+
           '       IM.IMONOME, '+#13+
           '       CCI.ANOCOMPETENCIA, '+#13+
           '       I.IDINDICADOR, '+#13+
           '       GA.IDGRPAPURACAO, '+#13+
           '       GA.DESCRICAO AS DSC_CCUSTO, '+#13+
           '       I.DESCRICAO  AS DSC_INDICADOR, '+#13+
           '       DECODE(I.TIPOVALOR,'+QuotedStr('R')+','+QuotedStr('RECEITAS')+','+QuotedStr('DESPESAS')+') AS DSC_TIPOVALOR, '+#13+
           '       DECODE(CCI.TIPOLANCA,'+QuotedStr('P')+','+QuotedStr('PREV')+','+QuotedStr('REAL')+') AS DSC_TIPOLANCA, '+#13+
           '       NVL(AP01.VLRAPURACAONUM,0)  AS VLR01,  '+#13+
           '       NVL(AP02.VLRAPURACAONUM,0)  AS VLR02,  '+#13+
           '       NVL(AP03.VLRAPURACAONUM,0)  AS VLR03,  '+#13+
           '       NVL(AP04.VLRAPURACAONUM,0)  AS VLR04,  '+#13+
           '       NVL(AP05.VLRAPURACAONUM,0)  AS VLR05,  '+#13+
           '       NVL(AP06.VLRAPURACAONUM,0)  AS VLR06,  '+#13+
           '       NVL(AP07.VLRAPURACAONUM,0)  AS VLR07,  '+#13+
           '       NVL(AP08.VLRAPURACAONUM,0)  AS VLR08,  '+#13+
           '       NVL(AP09.VLRAPURACAONUM,0)  AS VLR09,  '+#13+
           '       NVL(AP10.VLRAPURACAONUM,0)  AS VLR10,  '+#13+
           '       NVL(AP11.VLRAPURACAONUM,0)  AS VLR11,  '+#13+
           '       NVL(AP12.VLRAPURACAONUM,0)  AS VLR12,  '+#13+
           '       NVL(APANT.VLRAPURACAONUM,0) AS VLRANT, '+#13+ sMedia +#13+
           'FROM '+#13+
           '       IMOVEL IM, '+#13+
           '       INDINDICADOR I, '+#13+
           '       INDGRPAPURACAO GA, '+#13+
           '       ( '+#13+
           '        SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS IDGRPAPURACAO, AP.IDINDICADOR, GI.TIPOLANCA, AP.ANOCOMPETENCIA '+#13+
           '          FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST, '+#13+
           '               INDAPURACAO AP,     INDINDICADOR I '+#13+
           '         WHERE AP.IDINDICADOR = GI.IDINDICADOR '+#13+
           '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
           '           AND AP.IDINDICADOR = I.IDINDICADOR '+ sParam1 +#13+
           '        ) CCI, '+#13+
           '       ( '+#13+
           '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE '+ sMes[1]   +#13+
           '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '        ) AP01, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[2]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP02, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[3]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP03, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[4]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP04, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[5]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP05, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[6]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP06, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[7]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP07, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[8]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP08, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[9]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP09, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[10]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP10, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[11]   +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP11, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE '+ sMes[12]  +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) AP12, '+#13+
           '       ( '+#13+
           '       SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, TIPOLANCA, SUM(NVL(VLRAPURACAONUM,0)) AS VLRAPURACAONUM '+#13+
           '         FROM INDAPURACAO '+#13+
           '        WHERE 1=1 '+ sParam3 +#13+
           '        GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, TIPOLANCA '+#13+
           '       ) APANT '+#13+

           'WHERE CCI.IDINDICADOR    = I.IDINDICADOR '+#13+
           '  AND CCI.IDIMOVEL       = IM.IDIMOVEL '+#13+
           '  AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP01.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP01.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP01.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP01.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP02.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP02.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP02.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP02.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP03.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP03.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP03.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP03.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP04.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP04.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP04.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP04.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP05.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP05.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP05.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP05.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP06.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP06.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP06.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP06.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP07.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP07.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP07.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP07.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP08.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP08.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP08.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP08.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP09.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP09.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP09.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP09.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP10.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP10.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP10.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP10.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP11.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP11.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP11.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP11.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = AP12.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = AP12.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = AP12.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = AP12.TIPOLANCA(+) '+#13+
           '  AND CCI.IDIMOVEL       = APANT.IDIMOVEL(+) '+#13+
           '  AND CCI.IDGRPAPURACAO  = APANT.IDGRPAPURACAO(+) '+#13+
           '  AND CCI.IDINDICADOR    = APANT.IDINDICADOR(+) '+#13+
           '  AND CCI.TIPOLANCA      = APANT.TIPOLANCA(+) '+#13+ sOrdem;

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Analise do Orçamento - Encargos Comuns
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelAnaliseOrca(const iIdReport, iIdImovel, iAno, iMesIni,
                                                       iQtdeMeses, iOrdem: Integer): OLEVariant;
var sSql, sParam1, sParam2, sParam3, sParam4, sOrdem : String;
    sMes : array[1..12] of String;
    i, iMesReal, iAnoReal : Integer;
begin
   // Monta string de parametros
   sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport);
   sParam2 := '';
   sParam3 := '';
   sParam4 := ' AND MESCOMPETENCIA = ' + IntToStr(iMesIni) +#13+
              ' AND ANOCOMPETENCIA = ' + IntToStr(iAno)    +#13;

   if iIdImovel > 0 then begin
      sParam1 := sParam1 + ' AND AP.IDIMOVEL = '  + IntToStr(iIdImovel);
      sParam2 := sParam2 + ' AND IDIMOVEL = '     + IntToStr(iIdImovel);
      sParam3 := sParam3 + ' AND IDIMOVEL = '     + IntToStr(iIdImovel);
      sParam4 := sParam4 + ' AND IDIMOVEL = '     + IntToStr(iIdImovel);
   end;
   if iAno > 0 then begin
      sParam1 := sParam1 + ' AND AP.ANOCOMPETENCIA IN(' + IntToStr(iAno) + ',';
      sParam2 := sParam2 + ' AND ( ';
      sParam3 := sParam3 + ' AND ( ';
   end;

   // Define os meses
   iMesReal := iMesIni;
   iAnoReal := iAno;
   for i := 1 to 12 do begin
      if iMesReal > 12 then begin
         iMesReal := 1;
         iAnoReal := iAnoReal + 1;
         sParam1  := sParam1  + IntToStr(iAnoReal) + ',';
      end;
      sMes[i] := '';
      sMes[i] := '     MESCOMPETENCIA = ' + IntToStr(iMesReal) +
                 ' AND ANOCOMPETENCIA = ' + IntToStr(iAnoReal);
      if iIdImovel > 0 then
         sMes[i] := sMes[i] + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);

      // Define parâmetros do período
      if i < 12 then begin
         // Define parâmetros do período antual
         sParam2 := sParam2 + ' ( ANOCOMPETENCIA = ' + IntToStr(iAnoReal) + ' AND ' +
                              '   MESCOMPETENCIA = ' + IntToStr(iMesReal) + ' ) OR ' + #13;
         // Define parâmetros do período anterior
         sParam3 := sParam3 + ' ( ANOCOMPETENCIA = ' + IntToStr(iAnoReal-1) + ' AND ' +
                              '   MESCOMPETENCIA = ' + IntToStr(iMesReal) + ' ) OR ' + #13;
      end else begin
         // Define parâmetros do período antual
         sParam2 := sParam2 + ' ( ANOCOMPETENCIA = ' + IntToStr(iAnoReal) + ' AND '+
                              '   MESCOMPETENCIA = ' + IntToStr(iMesReal) + ' ) )' + #13;
         // Define parâmetros do período anterior
         sParam3 := sParam3 + ' ( ANOCOMPETENCIA = ' + IntToStr(iAnoReal-1) + ' AND '+
                              '   MESCOMPETENCIA = ' + IntToStr(iMesReal) + ' ) )' + #13;
      end;
      Inc(iMesReal);
   end;
   sParam1 := Copy(sParam1,1,Length(sParam1)-1) + ')';

   // Define Ordenação
   case iOrdem of
     1 : sOrdem := 'ORDER BY IMONOME, TIPOVALOR, DSC_CCUSTO, DSC_INDICADOR ';
     2 : sOrdem := 'ORDER BY IMONOME, TIPOVALOR, DSC_INDICADOR, DSC_CCUSTO ';
   end;

   // Monta o Sql
   sSql := 'SELECT IM.IDIMOVEL,                   '+#13+
           '       IM.IMONOME,                    '+#13+
           '       CCI.ANOCOMPETENCIA,            '+#13+
           '       I.IDINDICADOR,                 '+#13+
           '       GA.IDGRPAPURACAO,              '+#13+
           '       GA.DESCRICAO AS DSC_CCUSTO,    '+#13+
           '       I.DESCRICAO  AS DSC_INDICADOR, '+#13+
           '       DECODE(I.TIPOVALOR,''R'',''RECEITAS'',''DESPESAS'') AS DSC_TIPOVALOR,                           '+#13+
           '       NVL(PREVATU.VLRAPURACAONUM,0)  AS VLR_PREVATU,                                                  '+#13+
           '       NVL(PREVANT.VLRAPURACAONUM,0)  AS VLR_PREVANT,                                                  '+#13+
           '       NVL(REALANT.VLRAPURACAONUM,0)  AS VLR_REALANT,                                                  '+#13+
           '       NVL(PREVATU.VLRAPURACAONUM,0)-NVL(REALANT.VLRAPURACAONUM,0) AS VLR_DIFERENCA,                   '+#13+
           '       ROUND(((NVL(REALANT.VLRAPURACAONUM,0) * 100) / PREVANT.VLRAPURACAONUM)-100,2) AS VAR_PANTXRANT, '+#13+
           '       ROUND(((NVL(PREVATU.VLRAPURACAONUM,0) * 100) / REALANT.VLRAPURACAONUM)-100,2) AS VAR_PATUXRANT, '+#13+
           '       OBS.OBSERVACAO                                                                                  '+#13+
           'FROM   IMOVEL IM,         '+#13+
           '       INDINDICADOR I,    '+#13+
           '       INDGRPAPURACAO GA, '+#13+
           '       (                  '+#13+
           '        SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS IDGRPAPURACAO, AP.IDINDICADOR, AP.ANOCOMPETENCIA '+#13+
           '          FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST, '+#13+
           '               INDAPURACAO AP,     INDINDICADOR I          '+#13+
           '         WHERE AP.IDINDICADOR = GI.IDINDICADOR             '+#13+
           '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO               '+#13+
           '           AND AP.IDINDICADOR = I.IDINDICADOR              '+#13+
           '           AND GI.TIPOLANCA   IN(''P'',''R'')              '+#13+
           '           AND I.TIPOVALOR    IN(''R'',''D'')              '+#13+ sParam1 +#13+
           '        ) CCI,  '+#13+
           '       (        '+#13+
           '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO,                       '+#13+
           '               ROUND((SUM(NVL(VLRAPURACAONUM,0))/ '+ IntToStr(iQtdeMeses) +'),2) AS VLRAPURACAONUM '+#13+
           '          FROM INDAPURACAO                             '+#13+
           '         WHERE TIPOLANCA = ''P'' '+#13+ sParam2         +#13+
           '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
           '        ) PREVATU,                                     '+#13+
           '       (                                               '+#13+
           '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO,                       '+#13+
           '               ROUND((SUM(NVL(VLRAPURACAONUM,0))/ '+ IntToStr(iQtdeMeses) +'),2) AS VLRAPURACAONUM '+#13+
           '          FROM INDAPURACAO                             '+#13+
           '         WHERE TIPOLANCA = ''P'' '+#13+ sParam3         +#13+
           '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
           '       ) PREVANT,                                      '+#13+
           '       (                                               '+#13+
           '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO,                       '+#13+
           '               ROUND((SUM(NVL(VLRAPURACAONUM,0))/ '+ IntToStr(iQtdeMeses) +'),2) AS VLRAPURACAONUM '+#13+
           '          FROM INDAPURACAO                             '+#13+
           '         WHERE TIPOLANCA = ''R'' '+#13+ sParam3         +#13+
           '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO '+#13+
           '       ) REALANT,                                      '+#13+
           '       (                                               '+#13+
           '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS IDGRPAPURACAO, '+#13+
           '               OBSERVACAO                              '+#13+
           '          FROM INDAPURACAO                             '+#13+
           '         WHERE TIPOLANCA = ''P''                       '+#13+ sParam4 +#13+
           '        ) OBS                                          '+#13+
           'WHERE CCI.IDINDICADOR    = I.IDINDICADOR               '+#13+
           '  AND CCI.IDIMOVEL       = IM.IDIMOVEL                 '+#13+
           '  AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+)         '+#13+
           '  AND CCI.IDIMOVEL       = PREVATU.IDIMOVEL(+)         '+#13+
           '  AND CCI.IDGRPAPURACAO  = PREVATU.IDGRPAPURACAO(+)    '+#13+
           '  AND CCI.IDINDICADOR    = PREVATU.IDINDICADOR(+)      '+#13+
           '  AND CCI.IDIMOVEL       = PREVANT.IDIMOVEL(+)         '+#13+
           '  AND CCI.IDGRPAPURACAO  = PREVANT.IDGRPAPURACAO(+)    '+#13+
           '  AND CCI.IDINDICADOR    = PREVANT.IDINDICADOR(+)      '+#13+
           '  AND CCI.IDIMOVEL       = REALANT.IDIMOVEL(+)         '+#13+
           '  AND CCI.IDGRPAPURACAO  = REALANT.IDGRPAPURACAO(+)    '+#13+
           '  AND CCI.IDINDICADOR    = REALANT.IDINDICADOR(+)      '+#13+
           '  AND CCI.IDIMOVEL       = OBS.IDIMOVEL(+)             '+#13+
           '  AND CCI.IDGRPAPURACAO  = OBS.IDGRPAPURACAO(+)        '+#13+
           '  AND CCI.IDINDICADOR    = OBS.IDINDICADOR(+)          '+#13+ sOrdem;

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Dados para Busca de ABL mes a mes em colunas
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaABLAno(const iIdImovel,iAno,iIdABL: Integer): OLEVariant;
var sSql, sParam1,sParam2 : String;
begin
   // Define Parmametros
   sParam1 := '';
   sParam2 := ' AND ANOCOMPETENCIA = ' + IntToStr(iAno)   +#13+
              ' AND IDINDICADOR    = ' + IntToStr(iIdABL) +#13+
              ' AND TIPOINCLUSAO   = ' + QuotedStr('C');

   if iIdImovel > 0 then begin
     sParam1 := sParam1 + ' AND ME.IDIMOVEL = ' + IntToStr(iIdImovel);
     sParam2 := sParam2 + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);
   end;

   // Define Sql
   sSql := 'SELECT  ME.IDIMOVEL, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL01.VLRABL,0))AS ABL01, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL02.VLRABL,0))AS ABL02, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL03.VLRABL,0))AS ABL03, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL04.VLRABL,0))AS ABL04, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL05.VLRABL,0))AS ABL05, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL06.VLRABL,0))AS ABL06, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL07.VLRABL,0))AS ABL07, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL08.VLRABL,0))AS ABL08, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL09.VLRABL,0))AS ABL09, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL10.VLRABL,0))AS ABL10, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL11.VLRABL,0))AS ABL11, '+#13+
           '        DECODE(ME.ORIGEM,''M'',ME.AREAMESTRE,NVL(ABL12.VLRABL,0))AS ABL12  '+#13+
           'FROM ( '+#13+
           '        SELECT DISTINCT IDIMOVEL, '+#13+
           '               1 AS JAN, 2 AS FEV, 3 AS MAR,  4 AS ABR,  5 AS MAI,  6 AS JUN, '+#13+
           '               7 AS JUL, 8 AS AGO, 9 AS SEB, 10 AS OUT, 11 AS NOV, 12 AS DEZ, '+#13+
           '               ''C'' AS ORIGEM, 0 AS AREAMESTRE '+#13+
           '          FROM INDCONTRATOLOJA '+#13+
           '        UNION '+#13+
           '        SELECT IDIMOVEL, '+#13+
           '               1 AS JAN, 2 AS FEV, 3 AS MAR,  4 AS ABR,  5 AS MAI,  6 AS JUN, '+#13+
           '               7 AS JUL, 8 AS AGO, 9 AS SEB, 10 AS OUT, 11 AS NOV, 12 AS DEZ, '+#13+
           '               ''M'' AS ORIGEM, SUM(IMOAREATOTAL) AS AREAMESTRE '+#13+
           '          FROM IMOVEL '+#13+
           '         WHERE IDIMOVELMESTRE IS NULL '+#13+
           '           AND IDIMOVEL NOT IN (SELECT DISTINCT IDIMOVEL FROM INDCONTRATOLOJA ) '+#13+
           '         GROUP BY IDIMOVEL, 1,2,3,4,5,6,7,8,9,10,11,12,''M''                    '+#13+
           '      ) ME, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 1 ' + sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL01, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 2 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL02, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 3 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL03, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 4 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL04, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 5 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL05, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 6 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL06, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 7 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL07, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 8 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL08, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 9 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL09, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 10 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL10, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 11 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL11, '+#13+
           '     ( '+#13+
           '        SELECT IDIMOVEL, MESCOMPETENCIA, SUM(VLRAPURACAONUM) AS VLRABL '+#13+
           '          FROM INDAPURACAO '+#13+
           '         WHERE MESCOMPETENCIA = 12 '+ sParam2 +#13+
           '        GROUP BY IDIMOVEL, MESCOMPETENCIA '+#13+
           '      ) ABL12 '+#13+
           'WHERE   ME.IDIMOVEL = ABL01.IDIMOVEL(+) '+#13+
           '    AND ME.JAN      = ABL01.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL02.IDIMOVEL(+) '+#13+
           '    AND ME.FEV      = ABL02.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL03.IDIMOVEL(+) '+#13+
           '    AND ME.MAR      = ABL03.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL04.IDIMOVEL(+) '+#13+
           '    AND ME.ABR      = ABL04.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL05.IDIMOVEL(+) '+#13+
           '    AND ME.MAI      = ABL05.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL06.IDIMOVEL(+) '+#13+
           '    AND ME.JUN      = ABL06.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL07.IDIMOVEL(+) '+#13+
           '    AND ME.JUL      = ABL07.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL08.IDIMOVEL(+) '+#13+
           '    AND ME.AGO      = ABL08.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL09.IDIMOVEL(+) '+#13+
           '    AND ME.SEB      = ABL09.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL10.IDIMOVEL(+) '+#13+
           '    AND ME.OUT      = ABL10.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL11.IDIMOVEL(+) '+#13+
           '    AND ME.NOV      = ABL11.MESCOMPETENCIA(+) '+#13+
           '    AND ME.IDIMOVEL = ABL12.IDIMOVEL(+) '+#13+
           '    AND ME.DEZ      = ABL12.MESCOMPETENCIA(+) '+#13+ sParam1;

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Distribuição de Funcionários ( idReports 3441 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelFuncionario(const iIdReport,iIdImovel,iAno, iIdIndicador: Integer): OLEVariant;
var sSql, sParam1, sParam2 : String;
begin
  // Define Parametros
  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport) +
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  sParam2 := ' AND ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);
  end;
  if iIdIndicador > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDINDICADOR = ' + IntToStr(iIdIndicador);
    sParam2 := sParam2 + ' AND IDINDICADOR = ' + IntToStr(iIdIndicador);
  end;

  // Define Sql
  sSql := 'SELECT IM.IMONOME, '+#13+
          '       CC.DESCRICAO AS DSC_CCUSTO, '+#13+
          '       FU.DESCRICAO AS DSC_FUNCAO, '+#13+
          '       I.DESCRICAO  AS DSC_INDICADOR, '+#13+
          '       CCI.ANOCOMPETENCIA AS ANOCOMPETENCIA, '+#13+
          '       NVL(AP01.VLRAPURACAONUM,0) AS VLR01, '+#13+
          '       NVL(AP02.VLRAPURACAONUM,0) AS VLR02, '+#13+
          '       NVL(AP03.VLRAPURACAONUM,0) AS VLR03, '+#13+
          '       NVL(AP04.VLRAPURACAONUM,0) AS VLR04, '+#13+
          '       NVL(AP05.VLRAPURACAONUM,0) AS VLR05, '+#13+
          '       NVL(AP06.VLRAPURACAONUM,0) AS VLR06, '+#13+
          '       NVL(AP07.VLRAPURACAONUM,0) AS VLR07, '+#13+
          '       NVL(AP08.VLRAPURACAONUM,0) AS VLR08, '+#13+
          '       NVL(AP09.VLRAPURACAONUM,0) AS VLR09, '+#13+
          '       NVL(AP10.VLRAPURACAONUM,0) AS VLR10, '+#13+
          '       NVL(AP11.VLRAPURACAONUM,0) AS VLR11, '+#13+
          '       NVL(AP12.VLRAPURACAONUM,0) AS VLR12  '+#13+
          'FROM '+#13+
          '       IMOVEL IM, '+#13+
          '       INDINDICADOR I, '+#13+
          '       INDGRPAPURACAO CC, '+#13+
          '       INDGRPAPURACAO FU, '+#13+
          '       ( '+#13+
          '        SELECT DISTINCT AP.IDIMOVEL, AP.IDGRPAPURACAO, AP.IDSUBGRPAPURACAO, AP.IDINDICADOR, AP.ANOCOMPETENCIA '+#13+
          '          FROM INDAPURACAO AP, INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST '+#13+
          '         WHERE AP.IDINDICADOR = GI.IDINDICADOR '+#13+
          '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+  sParam1 +
          '        ) CCI, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 1 '+#13+ sParam2 +
          '        ) AP01, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 2 '+#13+ sParam2 +
          '       ) AP02, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 3 '+#13+ sParam2 +
          '       ) AP03, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 4 '+#13+ sParam2 +
          '       ) AP04, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 5 '+#13+ sParam2 +
          '       ) AP05, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 6 '+#13+ sParam2 +
          '       ) AP06, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 7 '+#13+ sParam2 +
          '       ) AP07, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 8 '+#13+ sParam2 +
          '       ) AP08, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 9 '+#13+ sParam2 +
          '       ) AP09, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 10 '+#13+ sParam2 +
          '       ) AP10, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 11 '+#13+ sParam2 +
          '       ) AP11, '+#13+
          '       ( '+#13+
          '        SELECT IDIMOVEL, IDINDICADOR, IDGRPAPURACAO, IDSUBGRPAPURACAO, VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE MESCOMPETENCIA = 12 '+#13+ sParam2 +
          '       ) AP12 '+#13+
          'WHERE CCI.IDIMOVEL          = IM.IDIMOVEL '+#13+
          '  AND CCI.IDGRPAPURACAO     = CC.IDGRPAPURACAO '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = FU.IDGRPAPURACAO '+#13+
          '  AND CCI.IDINDICADOR       = I.IDINDICADOR '+#13+
          '  AND CCI.IDIMOVEL          = AP01.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP01.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP01.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP01.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP02.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP02.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP02.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP02.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP03.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP03.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP03.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP03.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP04.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP04.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP04.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP04.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP05.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP05.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP05.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP05.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP06.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP06.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP06.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP06.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP07.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP07.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP07.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP07.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP08.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP08.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP08.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP08.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP09.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP09.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP09.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP09.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP10.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP10.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP10.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP10.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP11.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP11.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP11.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP11.IDINDICADOR(+) '+#13+
          '  AND CCI.IDIMOVEL          = AP12.IDIMOVEL(+) '+#13+
          '  AND CCI.IDGRPAPURACAO     = AP12.IDGRPAPURACAO(+) '+#13+
          '  AND CCI.IDSUBGRPAPURACAO  = AP12.IDSUBGRPAPURACAO(+) '+#13+
          '  AND CCI.IDINDICADOR       = AP12.IDINDICADOR(+) '+#13+
          'ORDER BY IMONOME, DSC_INDICADOR, DSC_CCUSTO, DSC_FUNCAO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Fluxo de Veículos Semanal ( idReports 3449 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelVeiculoSem(const iIdReport,iIdImovel: Integer; const dtIni,dtFim: TDateTime): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport);
  if iIdImovel > 0 then sParam := sParam + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  if dtIni > 0     then sParam := sParam + ' AND AP.DATAAPURACAO >= TO_DATE(' + QuotedStr(DateToStr(dtIni)) + ',''DD/MM/YYYY'')';
  if dtFim > 0     then sParam := sParam + ' AND AP.DATAAPURACAO <= TO_DATE(' + QuotedStr(DateToStr(dtFim)) + ',''DD/MM/YYYY'')';

  // Define Sql
  sSql := 'SELECT ME.IMONOME, '+#13+
          '       ME.DSC_MES, '+#13+
          '       ME.ANOCOMPETENCIA, '+#13+
          '       NVL(DOM.VLRAPURACAO,0) AS VLRDOM, '+#13+
          '       NVL(SEG.VLRAPURACAO,0) AS VLRSEG, '+#13+
          '       NVL(TER.VLRAPURACAO,0) AS VLRTER, '+#13+
          '       NVL(QUA.VLRAPURACAO,0) AS VLRQUA, '+#13+
          '       NVL(QUI.VLRAPURACAO,0) AS VLRQUI, '+#13+
          '       NVL(SEX.VLRAPURACAO,0) AS VLRSEX, '+#13+
          '       NVL(SAB.VLRAPURACAO,0) AS VLRSAB  '+#13+
          '  FROM '+#13+
          '       ( '+#13+
          '         SELECT DISTINCT ' +#13+
          '                AP.IDIMOVEL, '+#13+
          '                IM.IMONOME, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA) || TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                AP.ANOCOMPETENCIA, '+#13+
          '                TO_CHAR( TO_DATE(''01/''||TO_CHAR(AP.MESCOMPETENCIA,''00'')||TO_CHAR(AP.ANOCOMPETENCIA,''0000'')), ''MONTH'') AS DSC_MES '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP, '+#13+
          '                IMOVEL IM '+#13+
          '          WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '            AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '            AND AP.IDIMOVEL = IM.IDIMOVEL '+#13+ sParam +#13+
          '       ) ME, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 1 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) DOM, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 2 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) SEG, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 3 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) TER, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 4 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) QUA, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 5 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) QUI, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 6 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) SEX, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, '+#13+
          '                TO_CHAR(AP.ANOCOMPETENCIA)||TO_CHAR(AP.MESCOMPETENCIA) AS ANOMES, '+#13+
          '                SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI, '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP '+#13+
          '           WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '+#13+
          '             AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '             AND TO_CHAR(AP.DATAAPURACAO,''D'') = 7 '+#13+ sParam + #13+
          '         GROUP BY AP.IDIMOVEL, AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '       ) SAB '+#13+
          'WHERE ME.IDIMOVEL = DOM.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = DOM.ANOMES(+) '  +#13+
          '  AND ME.IDIMOVEL = SEG.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = SEG.ANOMES(+) '  +#13+
          '  AND ME.IDIMOVEL = TER.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = TER.ANOMES(+) '  +#13+
          '  AND ME.IDIMOVEL = QUA.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = QUA.ANOMES(+) '  +#13+
          '  AND ME.IDIMOVEL = QUI.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = QUI.ANOMES(+) '  +#13+
          '  AND ME.IDIMOVEL = SEX.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = SEX.ANOMES(+) '  +#13+
          '  AND ME.IDIMOVEL = SAB.IDIMOVEL(+) '+#13+
          '  AND ME.ANOMES   = SAB.ANOMES(+) '+#13+

          'ORDER BY IMONOME, ME.ANOMES ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Fluxo de Veículos Mensal ( idReports 3546 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelVeiculoMen(const iIdReport, iIdImovel, iAnoIni, iAnoFim: Integer): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport) +#13+
            ' AND AP.ANOCOMPETENCIA BETWEEN ' + IntToStr(iAnoIni) + ' AND ' + IntToStr(iAnoFim);
  if iIdImovel > 0 then sParam := sParam + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);

  sSql := 'SELECT ANO.IMONOME, '+#13+
          '       ANO.ANOCOMPETENCIA, '+#13+
          '       NVL(JAN.VLRAPURACAO,0) AS VLRJAN, '+#13+
          '       NVL(FEV.VLRAPURACAO,0) AS VLRFEV, '+#13+
          '       NVL(MAR.VLRAPURACAO,0) AS VLRMAR, '+#13+
          '       NVL(ABR.VLRAPURACAO,0) AS VLRABR, '+#13+
          '       NVL(MAI.VLRAPURACAO,0) AS VLRMAI, '+#13+
          '       NVL(JUN.VLRAPURACAO,0) AS VLRJUN, '+#13+
          '       NVL(JUL.VLRAPURACAO,0) AS VLRJUL, '+#13+
          '       NVL(AGO.VLRAPURACAO,0) AS VLRAGO, '+#13+
          '       NVL(SEB.VLRAPURACAO,0) AS VLRSET, '+#13+
          '       NVL(OUT.VLRAPURACAO,0) AS VLROUT, '+#13+
          '       NVL(NOV.VLRAPURACAO,0) AS VLRNOV, '+#13+
          '       NVL(DEZ.VLRAPURACAO,0) AS VLRDEZ  '+#13+
          '  FROM '+#13+
          '       ( '+#13+
          '         SELECT DISTINCT '+#13+
          '                AP.IDIMOVEL, IM.IMONOME, AP.ANOCOMPETENCIA '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP,         '+#13+
          '                IMOVEL IM               '+#13+
          '          WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO   '+#13+
          '            AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '            AND AP.IDIMOVEL = IM.IDIMOVEL '+#13+ sParam +#13+
          '       ) ANO, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 1 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) JAN, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 2 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) FEV, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 3 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) MAR, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 4 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) ABR, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 5 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) MAI, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 6 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) JUN, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 7 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) JUL, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 8 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) AGO, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO   '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR '+#13+
          '             AND AP.MESCOMPETENCIA = 9 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA    '+#13+
          '       ) SEB, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO    '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR  '+#13+
          '             AND AP.MESCOMPETENCIA = 10 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA     '+#13+
          '       ) OUT, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO    '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR  '+#13+
          '             AND AP.MESCOMPETENCIA = 11 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA     '+#13+
          '       ) NOV, '+#13+
          '       ( '+#13+
          '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '           FROM INDGRPINDICADOR GI,     '+#13+
          '                INDSUBTIPOINDICADOR ST, '+#13+
          '                INDAPURACAO AP          '+#13+
          '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO    '+#13+
          '             AND GI.IDINDICADOR    = AP.IDINDICADOR  '+#13+
          '             AND AP.MESCOMPETENCIA = 12 '+#13+ sParam +#13+
          '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA     '+#13+
          '       ) DEZ '+#13+
          'WHERE ANO.IDIMOVEL       = JAN.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = JAN.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = FEV.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = FEV.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = MAR.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = MAR.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = ABR.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = ABR.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = MAI.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = MAI.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = JUN.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = JUN.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = JUL.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = JUL.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = AGO.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = AGO.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = SEB.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = SEB.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = OUT.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = OUT.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = NOV.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = NOV.ANOCOMPETENCIA(+) '+#13+
          '  AND ANO.IDIMOVEL       = DEZ.IDIMOVEL(+)       '+#13+
          '  AND ANO.ANOCOMPETENCIA = DEZ.ANOCOMPETENCIA(+) '+#13+
          'ORDER BY ANO.IMONOME, ANO.ANOCOMPETENCIA DESC ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;



// -----------------------------------------------------------------------------
// Relatório de Vacância ( idReports - 20132 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelVacancia(const iMes, iAno: Integer;
                                              const iIdEmpresa, iIdMoedaCAF, iIdPaisCAF: Integer;
                                              const sCodTipImovel: String): OLEVariant;
var sSql, sParam, sData : String;
    dData : TDateTime;
begin
   dData := DiasUteis.UltDiaMes(iAno, iMes);
   sData := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dData)) + ',''DD/MM/YYYY'')' +#13;

   sParam := '';
   if sCodTipImovel <> '' then sParam := sParam + ' AND I.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) +#13;

   sSql := 'SELECT VM.IDIMOVELMESTRE, VM.IMOCODIGO, VM.IMONOME,             '+#13+
           '       AT.AREATOTAL, NVL(AV.AREAVAGA,0) AS AREAVAGA,            '+#13+
           '       NVL(AT.AREATOTAL,0) - NVL(AV.AREAVAGA,0) AS AREAOCUPADA, '+#13+
           '       VM.VLRCONTABIL AS VLRTOTAL,                              '+#13+
           '       VM.VLRCONTABIL - ROUND( (VM.VLRCONTABIL/AT.AREATOTAL) * NVL(AV.AREAVAGA,0),2) AS VLROCUPADO,                  '+#13+
           '       ROUND( (VM.VLRCONTABIL/AT.AREATOTAL) * NVL(AV.AREAVAGA,0),2) AS VLRVAGO,                                      '+#13+
           '       NVL(ROUND( ((VM.VLRCONTABIL/AT.AREATOTAL) * NVL(AV.AREAVAGA,0) * 100) / VM.VLRCONTABIL, 2),0) AS PERCVACANCIA '+#13+
           '  FROM (                                                                                       '+#13+
           '        SELECT I.IDIMOVELMESTRE, IM.IMOCODIGO, IM.IMONOME,                                     '+#13+
           '               SUM( (SB.VALORG0 + SB.CMBEM0 - SB.DEPLANC0 - SB.CMDEP0 +                        '+#13+
           '                     SB.REAVVALORG0 + SB.REAVCMBEM0 - SB.REAVDEPLANC0 -                        '+#13+
           '                     SB.REAVCMDEP0) ) AS VLRCONTABIL                                           '+#13+
           '          FROM IMOVEL I, IMOVEL IM, IMOVELXBEM IXB, BEM B, GRUPO G, TIPOIMOVEL T,              '+#13+
           '       ( '+#13+
           '        SELECT /*+ RULE */ SB1.IDBEM, SB1.IDPESSOA, COUNT(*) AS QUANT, '+#13+
           '                     ROUND(SUM(NVL(SB1.VALORG,0)) ,2) AS VALORG0, ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) AS CMBEM0,   '+#13+
           '                     ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) AS DEPLANC0, ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) AS CMDEP0, '+#13+
           '                     ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) AS REAVVALORG0,           '+#13+
           '                     ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) AS REAVCMBEM0,              '+#13+
           '                     ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) AS REAVDEPLANC0,        '+#13+
           '                     ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2) AS REAVCMDEP0               '+#13+
           '              FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1, '+#13+
           '                   (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA '+#13+
           '                    FROM SALDOCONTABBEM '+#13+
           '                    WHERE DATASLDBEM <= ' + sData +#13+
           '                      AND MOECODIGO = ' + IntToStr(iIdMoedaCAF) +#13+
           '                      AND IDPESSOA  = ' + IntToStr(iIdEmpresa)  +#13+
           '                    GROUP BY IDBEM, IDPESSOA) MAX1, '+#13+
           '                   BEM B1, GRUPO G1                 '+#13+
           '              WHERE B1.DATAINICIODEP <= ' + sData +#13+
           '                AND G1.FLGIMOVEL  = 1 '+#13+
           '                AND SB1.MOECODIGO = ' + IntToStr(iIdMoedaCAF) +#13+
           '                AND SB1.IDPESSOA  = ' + IntToStr(iIdEmpresa)  +#13+
           '                AND SD1.IDSLDCTBBEMXDEP = ' + IntToStr(iIdPaisCAF)  +#13+
           '                AND B1.IDPESSOA = ' + IntToStr(iIdEmpresa)  +#13+
           '                AND SB1.IDBEM = MAX1.IDBEM          '+#13+
           '                AND SB1.IDPESSOA = MAX1.IDPESSOA    '+#13+
           '                AND SB1.DATASLDBEM = MAX1.DATA      '+#13+
           '                AND SB1.IDBEM = SD1.IDBEM           '+#13+
           '                AND SB1.IDPESSOA = SD1.IDPESSOA     '+#13+
           '                AND SB1.DATASLDBEM = SD1.DATASLDBEM '+#13+
           '                AND SB1.MOECODIGO = SD1.MOECODIGO   '+#13+
           '                AND SB1.IDBEM = B1.IDBEM            '+#13+
           '                AND SB1.IDPESSOA = B1.IDPESSOA      '+#13+
           '                AND SB1.IDGRUPO = G1.IDGRUPO        '+#13+
           '              GROUP BY SB1.IDBEM, SB1.IDPESSOA ) SB '+#13+
           '         WHERE (B.DATAINICIODEP <= ' + sData + ')                                     '+#13+
           '           AND (G.FLGIMOVEL = 1)                                                      '+#13+
           '           AND (ABS(NVL(SB.VALORG0,0) + NVL(SB.CMBEM0,0) - NVL(SB.DEPLANC0,0) -       '+#13+
           '                    NVL(SB.CMDEP0,0) + NVL(SB.REAVVALORG0,0) + NVL(SB.REAVCMBEM0,0) - '+#13+
           '                    NVL(SB.REAVDEPLANC0,0) - NVL(SB.REAVCMDEP0,0))  >= 0.01)          '+#13+
           '           AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)              '+#13+
           '           AND (I.CODTIPIMOVEL = T.CODTIPIMOVEL)             '+#13+
           '           AND (T.FLGTIPOINTERNO <> ''P'')                   '+#13+
           '           AND (I.IDIMOVEL = IXB.IDIMOVEL)                   '+#13+
           '           AND (IXB.IDBEM = B.IDBEM)                         '+#13+
           '           AND (IXB.IDPESSOA = B.IDPESSOA)                   '+#13+
           '           AND (B.IDGRUPO = G.IDGRUPO)                       '+#13+
           '           AND (IXB.IDBEM = SB.IDBEM)                        '+#13+ sParam +
           '         GROUP BY I.IDIMOVELMESTRE, IM.IMOCODIGO, IM.IMONOME '+#13+
           '       ) VM,                                                 '+#13+
           '       (                                                     '+#13+
           '        SELECT I.IDIMOVELMESTRE,                             '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL          '+#13+
           '          FROM IMOVEL I, TIPOIMOVEL T                        '+#13+
           '         WHERE I.CODTIPIMOVEL = T.CODTIPIMOVEL               '+#13+
           '           AND I.FLGATIVO = 1                                '+#13+
           '           AND T.FLGTIPOINTERNO <> ''P''                     '+#13+
           '           AND I.IDIMOVELMESTRE IS NOT NULL                  '+#13+ sParam +
           '         GROUP BY I.IDIMOVELMESTRE                           '+#13+
           '        ) AT,                                                '+#13+
           '       (                                                     '+#13+
           '        SELECT DECODE(I.IDIMOVELMESTRE, NULL, A.IDIMOVEL, I.IDIMOVELMESTRE) AS IDIMOVELMESTRE, '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR ID, IMOVEL I   '+#13+
           '         WHERE A.IDINDICADOR = ID.IDINDICADOR             '+#13+
           '           AND A.IDIMOVEL    = I.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                   '+#13+
           '           AND ID.TIPOINDICADOR = 23                      '+#13+    // 23 - indicador de area vaga
           '           AND A.MESCOMPETENCIA = ' + IntToStr(iMes)       +#13+
           '           AND A.ANOCOMPETENCIA = ' + IntToStr(iAno)       +#13+ 
           '         GROUP BY DECODE(I.IDIMOVELMESTRE, NULL, A.IDIMOVEL, I.IDIMOVELMESTRE) '+#13+
           '        ) AV                                    '+#13+
           ' WHERE VM.IDIMOVELMESTRE = AV.IDIMOVELMESTRE(+) '+#13+
           '   AND VM.IDIMOVELMESTRE = AT.IDIMOVELMESTRE(+) '+#13+
           ' ORDER BY IMONOME';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Evolução de Vacância ( idReports - 20134 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelEvolVacancia(const iMes, iAno: Integer): OLEVariant;
var sSql    : String;
    sParam  : array[1..12] of String;
    sParam2 : array[1..12] of String;
    iMesReal, iAnoReal, i : Integer;
    sAnoMes : String;
begin
   // Define os meses
   iMesReal := iMes;
   iAnoReal := iAno;
   for i := 1 to 12 do begin
      if iMesReal > 12 then begin
         iMesReal := 1;
         iAnoReal := iAnoReal + 1;
      end;
      sAnoMes    := IntToStr(iAnoReal) + FormatFloat('00',iMesReal);
      sParam[i]  := ' AND A.MESCOMPETENCIA = ' + IntToStr(iMesReal) +
                    ' AND A.ANOCOMPETENCIA = ' + IntToStr(iAnoReal);
      sParam2[i] := ' AND ( (AL.DTVENDA IS NOT NULL AND                                                            ' + #13 +
                    sAnoMes + ' BETWEEN TO_CHAR(I.IMODATACOMPRA,''YYYYMM'') AND TO_CHAR(AL.DTVENDA,''YYYYMM'')) OR ' + #13 +
                    '       (AL.DTVENDA IS NULL AND ' + sAnoMes + ' >= TO_CHAR(I.IMODATACOMPRA,''MMYYYY'')) )      ';
      Inc(iMesReal);
   end;

   sSql := 'SELECT AM.IDIMOVEL, AM.IMOCODIGO, AM.IMONOME, AM.AREATOTAL,                 '+#13+
           '       AV01.AREAVAGA AS AREAVAGA01,                                         '+#13+
           '       AV02.AREAVAGA AS AREAVAGA02,                                         '+#13+
           '       AV03.AREAVAGA AS AREAVAGA03,                                         '+#13+
           '       AV04.AREAVAGA AS AREAVAGA04,                                         '+#13+
           '       AV05.AREAVAGA AS AREAVAGA05,                                         '+#13+
           '       AV06.AREAVAGA AS AREAVAGA06,                                         '+#13+
           '       AV07.AREAVAGA AS AREAVAGA07,                                         '+#13+
           '       AV08.AREAVAGA AS AREAVAGA08,                                         '+#13+
           '       AV09.AREAVAGA AS AREAVAGA09,                                         '+#13+
           '       AV10.AREAVAGA AS AREAVAGA10,                                         '+#13+
           '       AV11.AREAVAGA AS AREAVAGA11,                                         '+#13+
           '       AV12.AREAVAGA AS AREAVAGA12,                                         '+#13+
           '       ROUND( (AV01.AREAVAGA * 100) / AM01.AREATOTAL, 2) AS PERCVACANCIA01, '+#13+
           '       ROUND( (AV02.AREAVAGA * 100) / AM02.AREATOTAL, 2) AS PERCVACANCIA02, '+#13+
           '       ROUND( (AV03.AREAVAGA * 100) / AM03.AREATOTAL, 2) AS PERCVACANCIA03, '+#13+
           '       ROUND( (AV04.AREAVAGA * 100) / AM04.AREATOTAL, 2) AS PERCVACANCIA04, '+#13+
           '       ROUND( (AV05.AREAVAGA * 100) / AM05.AREATOTAL, 2) AS PERCVACANCIA05, '+#13+
           '       ROUND( (AV06.AREAVAGA * 100) / AM06.AREATOTAL, 2) AS PERCVACANCIA06, '+#13+
           '       ROUND( (AV07.AREAVAGA * 100) / AM07.AREATOTAL, 2) AS PERCVACANCIA07, '+#13+
           '       ROUND( (AV08.AREAVAGA * 100) / AM08.AREATOTAL, 2) AS PERCVACANCIA08, '+#13+
           '       ROUND( (AV09.AREAVAGA * 100) / AM09.AREATOTAL, 2) AS PERCVACANCIA09, '+#13+
           '       ROUND( (AV10.AREAVAGA * 100) / AM10.AREATOTAL, 2) AS PERCVACANCIA10, '+#13+
           '       ROUND( (AV11.AREAVAGA * 100) / AM11.AREATOTAL, 2) AS PERCVACANCIA11, '+#13+
           '       ROUND( (AV12.AREAVAGA * 100) / AM12.AREATOTAL, 2) AS PERCVACANCIA12  '+#13+
           '  FROM (                                                                    '+#13+
           '        SELECT IM.IDIMOVEL, IM.IMOCODIGO, IM.IMONOME,                       '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM                                          '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL(+))                          '+#13+
           '           AND I.FLGATIVO = 1                                               '+#13+
           '           AND I.IDIMOVELMESTRE IS NOT NULL                                 '+#13+
           '      GROUP BY IM.IDIMOVEL, IM.IMOCODIGO, IM.IMONOME                        '+#13+
           '            ) AM,                                                           '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+))' + sParam2[1]                   +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM01,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[2]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM02,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[3]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM03,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[4]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM04,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[5]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM05,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[6]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM06,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[7]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM07,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[8]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM08,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[9]                  +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM09,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[10]                 +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM10,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[11]                 +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM11,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT I.IDIMOVELMESTRE,                                            '+#13+
           '               ROUND(SUM(I.IMOAREA),0) AS AREATOTAL                         '+#13+
           '          FROM IMOVEL I, IMOVEL IM,                                         '+#13+
           '               ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA                   '+#13+
           '                   FROM EVENTOIMOVEL                                        '+#13+
           '                  WHERE FLGTIPOEVENTO = ''CA''                              '+#13+
           '                  GROUP BY IDIMOVEL                                         '+#13+
           '               ) AL                                                         '+#13+
           '         WHERE (I.IDIMOVELMESTRE = IM.IDIMOVEL)                             '+#13+
           '           AND (I.IDIMOVEL = AL.IDIMOVEL(+)) ' + sParam2[12]                 +#13+
           '         GROUP BY I.IDIMOVELMESTRE                                          '+#13+
           '       ) AM12,                                                              '+#13+
           '       (                                                                    '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[1]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV01,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[2]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV02,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[3]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV03,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[4]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV04,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[5]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV05,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[6]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV06,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[7]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV07,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[8]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV08,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[9]          +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV09,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[10]         +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV10,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[11]         +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV11,  '+#13+
           '       (         '+#13+
           '        SELECT DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE) AS IDIMOVELMESTRE,  '+#13+
           '               ROUND(SUM(A.VLRAPURACAONUM),0) AS AREAVAGA  '+#13+
           '          FROM INDAPURACAO A, INDINDICADOR I, IMOVEL IM    '+#13+
           '         WHERE A.IDINDICADOR = I.IDINDICADOR               '+#13+
           '           AND A.IDIMOVEL    = IM.IDIMOVEL                 '+#13+
           '           AND A.TIPOLANCA      = ''R''                    '+#13+
           '           AND I.TIPOINDICADOR  = 23 ' + sParam[12]         +#13+
           '         GROUP BY DECODE(IM.IDIMOVELMESTRE, NULL, A.IDIMOVEL, IM.IDIMOVELMESTRE)  '+#13+
           '        ) AV12  '+#13+
           ' WHERE AM.IDIMOVEL = AM01.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM02.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM03.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM04.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM05.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM06.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM07.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM08.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM09.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM10.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM11.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AM12.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV01.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV02.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV03.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV04.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV05.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV06.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV07.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV08.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV09.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV10.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV11.IDIMOVELMESTRE(+)                '+#13+
           '   AND AM.IDIMOVEL = AV12.IDIMOVELMESTRE(+)                '+#13+
           '   AND (AV01.IDIMOVELMESTRE IS NOT NULL OR AV02.IDIMOVELMESTRE IS NOT NULL OR  '+#13+
           '        AV03.IDIMOVELMESTRE IS NOT NULL OR AV04.IDIMOVELMESTRE IS NOT NULL OR  '+#13+
           '        AV05.IDIMOVELMESTRE IS NOT NULL OR AV06.IDIMOVELMESTRE IS NOT NULL OR  '+#13+
           '        AV07.IDIMOVELMESTRE IS NOT NULL OR AV08.IDIMOVELMESTRE IS NOT NULL OR  '+#13+
           '        AV09.IDIMOVELMESTRE IS NOT NULL OR AV10.IDIMOVELMESTRE IS NOT NULL OR  '+#13+
           '        AV11.IDIMOVELMESTRE IS NOT NULL OR AV12.IDIMOVELMESTRE IS NOT NULL )   '+#13+
           ' ORDER BY IMONOME '+#13;

   CMDebugToFile(sSql);

   Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Consumo de Agua e Energia ( idReports Agua    - 3481 )
//           Dados Numéricos              ( idReports Energia - 3454 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelConsumoNum(const iIdReport, iIdImovel, iAno: Integer): OLEVariant;
var sSql, sParam1, sParam2 : String;
begin
  // Define Parametros
  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport);
  sParam2 := '';
  if iIdImovel > 0 then sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  if iAno      > 0 then sParam2 := sParam2 + ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  // Define Sql
  sSql := 'SELECT ' + IntToStr(iAno) + ' AS ANOREF, '+#13+
          '       IM.IDIMOVEL, '+#13+
          '       IM.IMONOME, '+#13+
          '       IND.DSC_INDICADOR, '+#13+
          '       IND.UNIDADE, '+#13+
          '       IND.ORDEM, '+#13+
          '       NVL(AP01.VLRAPURACAONUM,0) AS VLRJAN, '+#13+
          '       NVL(AP02.VLRAPURACAONUM,0) AS VLRFEV, '+#13+
          '       NVL(AP03.VLRAPURACAONUM,0) AS VLRMAR, '+#13+
          '       NVL(AP04.VLRAPURACAONUM,0) AS VLRABR, '+#13+
          '       NVL(AP05.VLRAPURACAONUM,0) AS VLRMAI, '+#13+
          '       NVL(AP06.VLRAPURACAONUM,0) AS VLRJUN, '+#13+
          '       NVL(AP07.VLRAPURACAONUM,0) AS VLRJUL, '+#13+
          '       NVL(AP08.VLRAPURACAONUM,0) AS VLRAGO, '+#13+
          '       NVL(AP09.VLRAPURACAONUM,0) AS VLRSET, '+#13+
          '       NVL(AP10.VLRAPURACAONUM,0) AS VLROUT, '+#13+
          '       NVL(AP11.VLRAPURACAONUM,0) AS VLRNOV, '+#13+
          '       NVL(AP12.VLRAPURACAONUM,0) AS VLRDEZ  '+#13+
          '  FROM '+#13+
          '       IMOVEL IM, '+#13+
          '       ( '+#13+
          '        SELECT I.IDINDICADOR, I.DESCRICAO AS DSC_INDICADOR, I.UNIDADE, GI.ORDEM '+#13+
          '          FROM INDGRPINDICADOR GI, '+#13+
          '               INDSUBTIPOINDICADOR ST, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''N'' '+#13+
          '           AND GI.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND GI.IDSUBTIPO = ST.IDSUBTIPO '+#13+ sParam1 +#13+
          '        ) IND, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 1 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP01, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 2 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP02, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 3 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '       ) AP03, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 4 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP04, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 5 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP05, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 6 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP06, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 7 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP07, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 8 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP08, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 9 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP09, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 10 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP10, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 11 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP11, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND I.TIPODADO = ''N'' '+#13+ sParam2 + #13+
          '           AND AP.MESCOMPETENCIA = 12 '+#13+
          '        GROUP BY AP.IDIMOVEL, AP.IDINDICADOR '+#13+
          '        ) AP12 '+#13+
          ' WHERE IND.IDINDICADOR = AP01.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP02.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP03.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP04.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP05.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP06.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP07.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP08.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP09.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP10.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP11.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP12.IDINDICADOR(+) '+#13+
          '   AND (IM.IDIMOVEL = AP01.IDIMOVEL OR IM.IDIMOVEL = AP02.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP03.IDIMOVEL OR IM.IDIMOVEL = AP04.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP05.IDIMOVEL OR IM.IDIMOVEL = AP06.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP07.IDIMOVEL OR IM.IDIMOVEL = AP08.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP09.IDIMOVEL OR IM.IDIMOVEL = AP10.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP11.IDIMOVEL OR IM.IDIMOVEL = AP12.IDIMOVEL)   '+#13+
          'ORDER BY IMONOME, ORDEM ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Consumo de Agua e Energia ( idReports Agua    - 3481 )
//           Dados String                 ( idReports Energia - 3454 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelConsumoStr(const iIdReport, iIdImovel, iAno: Integer): OLEVariant;
var sSql, sParam1, sParam2 : String;
begin
  // Define Parametros
  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport);
  sParam2 := '';
  if iIdImovel > 0 then sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  if iAno      > 0 then sParam2 := sParam2 + ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  // Define Sql
  sSql := 'SELECT ' + IntToStr(iAno) + ' AS ANOREF, '+#13+
          '       IM.IDIMOVEL, '+#13+
          '       IM.IMONOME, '+#13+
          '       IND.DSC_INDICADOR, '+#13+
          '       IND.UNIDADE, '+#13+
          '       IND.ORDEM, '+#13+
          '       AP01.VLRAPURACAOSTR AS VLRJAN, '+#13+
          '       AP02.VLRAPURACAOSTR AS VLRFEV, '+#13+
          '       AP03.VLRAPURACAOSTR AS VLRMAR, '+#13+
          '       AP04.VLRAPURACAOSTR AS VLRABR, '+#13+
          '       AP05.VLRAPURACAOSTR AS VLRMAI, '+#13+
          '       AP06.VLRAPURACAOSTR AS VLRJUN, '+#13+
          '       AP07.VLRAPURACAOSTR AS VLRJUL, '+#13+
          '       AP08.VLRAPURACAOSTR AS VLRAGO, '+#13+
          '       AP09.VLRAPURACAOSTR AS VLRSET, '+#13+
          '       AP10.VLRAPURACAOSTR AS VLROUT, '+#13+
          '       AP11.VLRAPURACAOSTR AS VLRNOV, '+#13+
          '       AP12.VLRAPURACAOSTR AS VLRDEZ  '+#13+
          '  FROM '+#13+
          '       IMOVEL IM, '+#13+
          '       ( '+#13+
          '        SELECT I.IDINDICADOR, I.DESCRICAO AS DSC_INDICADOR, I.UNIDADE, GI.ORDEM '+#13+
          '          FROM INDGRPINDICADOR GI, '+#13+
          '               INDSUBTIPOINDICADOR ST, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND GI.IDINDICADOR = I.IDINDICADOR '+#13+
          '           AND GI.IDSUBTIPO = ST.IDSUBTIPO '+#13+ sParam1 +#13+
          '        ) IND, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 1 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP01, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 2 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP02, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 3 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '       ) AP03, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 4 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP04, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 5 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP05, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 6 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP06, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 7 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP07, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 8 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP08, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 9 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP09, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 10 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP10, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 11 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP11, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.VLRAPURACAOSTR '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''C'' '+#13+
          '           AND AP.MESCOMPETENCIA = 12 '+#13+ sParam2 +#13+
          '           AND AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '        ) AP12 '+#13+
          ' WHERE IND.IDINDICADOR = AP01.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP02.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP03.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP04.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP05.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP06.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP07.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP08.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP09.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP10.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP11.IDINDICADOR(+) '+#13+
          '   AND IND.IDINDICADOR = AP12.IDINDICADOR(+) '+#13+
          '   AND (IM.IDIMOVEL = AP01.IDIMOVEL OR IM.IDIMOVEL = AP02.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP03.IDIMOVEL OR IM.IDIMOVEL = AP04.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP05.IDIMOVEL OR IM.IDIMOVEL = AP06.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP07.IDIMOVEL OR IM.IDIMOVEL = AP08.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP09.IDIMOVEL OR IM.IDIMOVEL = AP10.IDIMOVEL OR '+#13+
          '        IM.IDIMOVEL = AP11.IDIMOVEL OR IM.IDIMOVEL = AP12.IDIMOVEL)   '+#13+
          'ORDER BY IMONOME, ORDEM ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Vendas por Loja ( idReports - 3463 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelVendaLoja(const iIdImovel, iIdIndVenda, iIdIndOverage, iIdIndAluguel, iIdIndAbl, iIdUpv, iMes, iAno: Integer): OLEVariant;
var sSql, sParam1, sParam2, sDtIni, sDtFim, sMesAno: String;
    cdsTemp : TCMClientDataSet;
    iVarMesAnt,iVarAnoAnt : Extended;
begin
  sDtIni     := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
  sDtFim     := DiasUteis.UltimoDiaMes(sDtIni);
  sMesAno    := FormatFloat('00',iMes)+FormatFloat('0000',iAno);

  // Define Parametros
  sParam1 := '';
  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;

  // Define Sql
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       IM.IMONOME,         '+#13+
          '       CL.IDCONTRATO,      '+#13+
          '       CL.LOJAS,           '+#13+
          '       CL.NOMCONTRATO,     '+#13+
          '       M.MOESIGLA,         '+#13+
          '       CM.COTVALOR,        '+#13+
          '       CL.PERALUGVARIAVEL, '+#13+
          '       AM.VLRAPURACAO  AS VLRALUGMIN, '+#13+
          '       ABL.VLRAPURACAO AS QTDEABL,    '+#13+
          '       VE.VLRAPURACAO  AS VLRVENDA,   '+#13+
          '       OV.VLRAPURACAO  AS OVERAGE,    '+#13+
          '       ROUND( (VE.VLRAPURACAO / ABL.VLRAPURACAO / CM.COTVALOR), 2) AS UPVM2, '+#13+
          '       ROUND( (VE.VLRAPURACAO / (AM.VLRAPURACAO / (CL.PERALUGVARIAVEL / 100)) * 100),0 ) AS PTOEQUILIBRIO, '+#13+
          '       ( 0 ) AS VARMESANT, '+#13+
          '       ( 0 ) AS VARANOANT  '+#13+
          '  FROM '+#13+
          '       IMOVEL IM,       '+#13+
          '       MOEDA M,         '+#13+
          '       COTACAOMOEDA CM, '+#13+
          '       ( '+#13+
          '        SELECT CL.* '+#13+
          '          FROM INDCONTRATOLOJA CL '+#13+
          '         WHERE ( ( CL.DATINICIO  <= TO_DATE(' +QuotedStr(sDtIni)+ ') '+#13+
          '                   AND CL.DATTERMINO >= TO_DATE(' +QuotedStr(sDtFim)+ ') ) '+#13+
          '               OR CL.FLGINDETERMINADO = ''S'' )'+#13+
                          sParam1 +#13+
          '        ) CL, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) VE, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.IDINDICADOR = ' + IntToStr(iIdIndOverage) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) OV, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAluguel) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) AM, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) ABL '+#13+

          'WHERE CL.IDIMOVEL = IM.IDIMOVEL '+#13+
          '  AND M.MOECODIGO     = ' + IntToStr(iIdUpv) +#13+
          '  AND CM.MOECODIGO(+) = M.MOECODIGO '+#13+
          '  AND CM.COTMESREF(+) = ' + QuotedStr(sMesAno) +#13+
          '  AND CL.IDCONTRATO   = VE.IDCONTRATO(+)  '+#13+
          '  AND CL.IDCONTRATO   = OV.IDCONTRATO(+)  '+#13+
          '  AND CL.IDCONTRATO   = AM.IDCONTRATO(+)  '+#13+
          '  AND CL.IDCONTRATO   = ABL.IDCONTRATO(+) '+#13+

          'ORDER BY IMONOME, NOMCONTRATO ';

  // Executa o sql e buscando o pacote de dados
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );

    // Calcula a Variação do mes e ano anterior para cada contrato
    while not cdsTemp.eof do begin
      iVarMesAnt := 0;
      iVarAnoAnt := 0;
      if cdsTemp.FieldByName('UPVM2').AsFloat  > 0 then begin
        iVarMesAnt := VariacaoVenda( -1, -1, -1,
                                     cdsTemp.FieldByName('IDCONTRATO').AsInteger,
                                     iMes, iAno, cdsTemp.FieldByName('UPVM2').AsFloat,'','M',
                                     iIdIndVenda,iIdIndAbl,iIdUPV);
        iVarAnoAnt := VariacaoVenda( -1, -1, -1,
                                     cdsTemp.FieldByName('IDCONTRATO').AsInteger,
                                     iMes, iAno, cdsTemp.FieldByName('UPVM2').AsFloat,'','A',
                                     iIdIndVenda,iIdIndAbl,iIdUPV);

        if (iVarMesAnt <> 0) or (iVarAnoAnt <> 0) then begin
          cdsTemp.Edit;
          cdsTemp.FieldByName('VARMESANT').AsFloat := iVarMesAnt;
          cdsTemp.FieldByName('VARANOANT').AsFloat := iVarAnoAnt;
          cdsTemp.Post;
        end;
      end;
      cdsTemp.Next;
    end;
  finally
    Result := cdsTemp.Data;
    cdsTemp.Free;
  end;
end;


// -----------------------------------------------------------------------------
// Relatório de Vendas por Atividade ( idReports - 3475 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelVendaAtividade(const iIdImovel, iIdAtividade, iIdIndVenda, iIdIndOverage, iIdIndAluguel, iIdIndAbl, iIdUpv, iMes, iAno, iOrdem: Integer): OLEVariant;
var sSql, sParam1, sParam2, sMesAno: String;
    iVarMesAnt, iVarAnoAnt : Extended;
    cdsTemp : TCMClientDataSet;
begin
  // Define Parametros
  sMesAno := FormatFloat('00',iMes)+FormatFloat('0000',iAno);
  sParam1 := '';
  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;
  if iIdAtividade > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDATIVIDADE = ' + IntToStr(iIdAtividade);
    sParam2 := sParam2 + ' AND CL.IDATIVIDADE = ' + IntToStr(iIdAtividade);
  end;

  // Define SQL
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       IM.IMONOME, '+#13+
          '       ATIV.IDATIVIDADE, '+#13+
          '       ATIV.ATVDESCRICAO, '+#13+
          '       MIN(M.MOESIGLA)      AS MOESIGLA,  '+#13+
          '       MIN(CM.COTVALOR)     AS COTVALOR,  '+#13+
          '       MIN(ABL.VLRAPURACAO) AS QTDEABL,   '+#13+
          '       DECODE( SUM(AM.VLRAPURACAO), 0, 0, '+#13+
          '               ROUND( (SUM(AM.VLRAPURACAO) / SUM(ABL.VLRAPURACAO) / MIN(CM.COTVALOR)), 2) ) AS MINUPVM2,  '+#13+
          '       DECODE( SUM(VE.VLRAPURACAO), 0, 0, '+#13+
          '               ROUND( (SUM(VE.VLRAPURACAO) / SUM(ABL.VLRAPURACAO) / MIN(CM.COTVALOR)), 2) ) AS VENUPVM2,  '+#13+
          '       DECODE( SUM(OV.VLRAPURACAO), 0, 0, '+#13+
          '               ROUND( (SUM(OV.VLRAPURACAO) / SUM(ABL.VLRAPURACAO) / MIN(CM.COTVALOR)), 2) ) AS OVERUPVM2, '+#13+
          '       ( 0 ) AS VARMESANT, ' +#13+
          '       ( 0 ) AS VARANOANT  ' +#13+

          '  FROM '+#13+
          '       IMOVEL IM, '+#13+
          '       MOEDA M,   '+#13+
          '       COTACAOMOEDA CM, '+#13+
          '       ( '+#13+
          '        SELECT DISTINCT CL.IDIMOVEL, A.IDATIVIDADE, A.ATVDESCRICAO '+#13+
          '          FROM INDCONTRATOLOJA CL, ATIVIDADE A '+#13+
          '         WHERE CL.IDATIVIDADE = A.IDATIVIDADE(+) '+#13+ sParam1 +#13+
          '        ) ATIV, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDCONTRATO, CL.IDATIVIDADE, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDCONTRATO, CL.IDATIVIDADE, AP.IDINDICADOR '+#13+
          '        ) VE, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDCONTRATO, CL.IDATIVIDADE, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndOverage) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDCONTRATO, CL.IDATIVIDADE, AP.IDINDICADOR '+#13+
          '        ) OV, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDCONTRATO, CL.IDATIVIDADE, CL.PERALUGVARIAVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAluguel) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDCONTRATO, CL.IDATIVIDADE, CL.PERALUGVARIAVEL, AP.IDINDICADOR '+#13+
          '        ) AM, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, CL.IDATIVIDADE, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO  = CL.IDCONTRATO '+#13+
          '           AND AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, CL.IDATIVIDADE, AP.IDINDICADOR '+#13+
          '        ) ABL '+#13+

          'WHERE ATIV.IDIMOVEL    = IM.IDIMOVEL '+#13+
          '  AND M.MOECODIGO      = ' + IntToStr(iIdUpv)   +#13+
          '  AND CM.COTMESREF(+)  = ' + QuotedStr(sMesAno) +#13+
          '  AND CM.MOECODIGO(+)  = M.MOECODIGO        '+#13+
          '  AND ATIV.IDIMOVEL    = VE.IDIMOVEL(+)     '+#13+
          '  AND ATIV.IDATIVIDADE = VE.IDATIVIDADE(+)  '+#13+
          '  AND ATIV.IDIMOVEL    = OV.IDIMOVEL(+)     '+#13+
          '  AND ATIV.IDATIVIDADE = OV.IDATIVIDADE(+)  '+#13+
          '  AND ATIV.IDIMOVEL    = AM.IDIMOVEL(+)     '+#13+
          '  AND ATIV.IDATIVIDADE = AM.IDATIVIDADE(+)  '+#13+
          '  AND ATIV.IDIMOVEL    = ABL.IDIMOVEL(+)    '+#13+
          '  AND ATIV.IDATIVIDADE = ABL.IDATIVIDADE(+) '+#13+

          'GROUP BY IM.IMONOME, ATIV.IDATIVIDADE, ATIV.ATVDESCRICAO '+#13;

  if iOrdem = 1 then
       sSql := sSql + 'ORDER BY IMONOME, ATVDESCRICAO '
  else sSql := sSql + 'ORDER BY ATVDESCRICAO, IMONOME ';

  // Executa o sql e buscando o pacote de dados
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );

    // Calcula a Variação do mes e ano anterior para cada ATIVIDADE
    while not cdsTemp.eof do begin
      iVarMesAnt := 0;
      iVarAnoAnt := 0;
      if cdsTemp.FieldByName('VENUPVM2').AsFloat  > 0 then begin
        iVarMesAnt := VariacaoVenda( -1, cdsTemp.FieldByName('IDATIVIDADE').AsInteger, -1, -1,
                                     iMes, iAno, cdsTemp.FieldByName('VENUPVM2').AsFloat,'','M',
                                     iIdIndVenda,iIdIndAbl,iIdUPV);
        iVarAnoAnt := VariacaoVenda( -1, cdsTemp.FieldByName('IDATIVIDADE').AsInteger, -1, -1,
                                     iMes, iAno, cdsTemp.FieldByName('VENUPVM2').AsFloat,'','A',
                                     iIdIndVenda,iIdIndAbl,iIdUPV);

        if (iVarMesAnt <> 0) or (iVarAnoAnt <> 0) then begin
          cdsTemp.Edit;
          cdsTemp.FieldByName('VARMESANT').AsFloat := iVarMesAnt;
          cdsTemp.FieldByName('VARANOANT').AsFloat := iVarAnoAnt;
          cdsTemp.Post;
        end;
      end;
      cdsTemp.Next;
    end;
  finally
    Result := cdsTemp.Data;
    cdsTemp.Free;
  end;
end;


// -----------------------------------------------------------------------------
// Relatório de Vendas por Franquia ( idReports - 3965 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelVendaFranquia(const iIdImovel, iIdMarca, iIdIndVenda, iIdIndOverage, iIdIndAluguel, iIdIndAbl, iIdUpv,
                                                         iMes, iAno, iOrdem: Integer): OLEVariant;
var sSql, sParam1, sParam2, sMesAno: String;
    iVarMesAnt, iVarAnoAnt : Extended;
    cdsTemp : TCMClientDataSet;
begin
  // Define Parametros
  sMesAno := FormatFloat('00',iMes)+FormatFloat('0000',iAno);
  sParam1 := '';
  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;
  if iIdMarca > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDMARCA = ' + IntToStr(iIdMarca);
    sParam2 := sParam2 + ' AND CL.IDMARCA = ' + IntToStr(iIdMarca);
  end;

  // Define SQL
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       IM.IMONOME,    '+#13+
          '       MARCA.IDMARCA, '+#13+
          '       MARCA.MRCNOME, '+#13+
          '       MIN(M.MOESIGLA)      AS MOESIGLA,  '+#13+
          '       MIN(CM.COTVALOR)     AS COTVALOR,  '+#13+
          '       MIN(ABL.VLRAPURACAO) AS QTDEABL,   '+#13+
          '       DECODE( SUM(AM.VLRAPURACAO), 0, 0, '+#13+
          '               ROUND( (SUM(AM.VLRAPURACAO) / SUM(ABL.VLRAPURACAO) / MIN(CM.COTVALOR)), 2) ) AS MINUPVM2,  '+#13+
          '       DECODE( SUM(VE.VLRAPURACAO), 0, 0, '+#13+
          '               ROUND( (SUM(VE.VLRAPURACAO) / SUM(ABL.VLRAPURACAO) / MIN(CM.COTVALOR)), 2) ) AS VENUPVM2,  '+#13+
          '       DECODE( SUM(OV.VLRAPURACAO), 0, 0, '+#13+
          '               ROUND( (SUM(OV.VLRAPURACAO) / SUM(ABL.VLRAPURACAO) / MIN(CM.COTVALOR)), 2) ) AS OVERUPVM2, '+#13+
          '       ( 0 ) AS VARMESANT, ' +#13+
          '       ( 0 ) AS VARANOANT  ' +#13+

          '  FROM '+#13+
          '       IMOVEL IM, '+#13+
          '       MOEDA M,   '+#13+
          '       COTACAOMOEDA CM, '+#13+
          '       ( '+#13+
          '        SELECT DISTINCT CL.IDIMOVEL, M.IDMARCA, M.MRCNOME '+#13+
          '          FROM INDCONTRATOLOJA CL, MARCAS M '+#13+
          '         WHERE CL.IDMARCA = M.IDMARCA(+)   '+#13+ sParam1 +#13+
          '        ) MARCA, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDCONTRATO, CL.IDMARCA, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDCONTRATO, CL.IDMARCA, AP.IDINDICADOR '+#13+
          '        ) VE, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDCONTRATO, CL.IDMARCA, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndOverage) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDCONTRATO, CL.IDMARCA, AP.IDINDICADOR '+#13+
          '        ) OV, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDCONTRATO, CL.IDMARCA, CL.PERALUGVARIAVEL, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAluguel) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, AP.IDCONTRATO, CL.IDMARCA, CL.PERALUGVARIAVEL, AP.IDINDICADOR '+#13+
          '        ) AM, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, CL.IDMARCA, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO  = CL.IDCONTRATO '+#13+
          '           AND AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDIMOVEL, CL.IDMARCA, AP.IDINDICADOR '+#13+
          '        ) ABL '+#13+

          'WHERE MARCA.IDIMOVEL  = IM.IDIMOVEL '+#13+
          '  AND M.MOECODIGO     = ' + IntToStr(iIdUpv)   +#13+
          '  AND CM.COTMESREF(+) = ' + QuotedStr(sMesAno) +#13+
          '  AND CM.MOECODIGO(+) = M.MOECODIGO     '+#13+
          '  AND MARCA.IDIMOVEL  = VE.IDIMOVEL(+)  '+#13+
          '  AND MARCA.IDMARCA   = VE.IDMARCA(+)   '+#13+
          '  AND MARCA.IDIMOVEL  = OV.IDIMOVEL(+)  '+#13+
          '  AND MARCA.IDMARCA   = OV.IDMARCA(+)   '+#13+
          '  AND MARCA.IDIMOVEL  = AM.IDIMOVEL(+)  '+#13+
          '  AND MARCA.IDMARCA   = AM.IDMARCA(+)   '+#13+
          '  AND MARCA.IDIMOVEL  = ABL.IDIMOVEL(+) '+#13+
          '  AND MARCA.IDMARCA   = ABL.IDMARCA(+)  '+#13+

          'GROUP BY IM.IMONOME, MARCA.IDMARCA, MARCA.MRCNOME '+#13;

  if iOrdem = 1 then
       sSql := sSql + 'ORDER BY IMONOME, MRCNOME '
  else sSql := sSql + 'ORDER BY MRCNOME, IMONOME ';

  // Executa o sql e buscando o pacote de dados
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );

    // Calcula a Variação do mes e ano anterior para cada MARCA
    while not cdsTemp.eof do begin
      iVarMesAnt := 0;
      iVarAnoAnt := 0;
      if cdsTemp.FieldByName('VENUPVM2').AsFloat  > 0 then begin
        iVarMesAnt := VariacaoVenda( -1, -1, cdsTemp.FieldByName('IDMARCA').AsInteger, -1,
                                     iMes, iAno, cdsTemp.FieldByName('VENUPVM2').AsFloat,'','M',
                                     iIdIndVenda,iIdIndAbl,iIdUPV);
        iVarAnoAnt := VariacaoVenda( -1, -1, cdsTemp.FieldByName('IDMARCA').AsInteger, -1,
                                     iMes, iAno, cdsTemp.FieldByName('VENUPVM2').AsFloat,'','A',
                                     iIdIndVenda,iIdIndAbl,iIdUPV);

        if (iVarMesAnt <> 0) or (iVarAnoAnt <> 0) then begin
          cdsTemp.Edit;
          cdsTemp.FieldByName('VARMESANT').AsFloat := iVarMesAnt;
          cdsTemp.FieldByName('VARANOANT').AsFloat := iVarAnoAnt;
          cdsTemp.Post;
        end;
      end;
      cdsTemp.Next;
    end;
  finally
    Result := cdsTemp.Data;
    cdsTemp.Free;
  end;
end;




// -----------------------------------------------------------------------------
// Relatório de Ranking de Vendas ( idReports - 3477 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelRanking(const iIdImovel, iIdIndVenda, iIdIndAluguel, iIdIndAbl, iIdUpv, iMes, iAno: Integer): OLEVariant;
var sSql, sParam1, sParam2, sDtIni, sDtFim, sMesAno: String;
begin

  sDtIni := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
  sDtFim := DiasUteis.UltimoDiaMes(sDtIni);
  sMesAno:= FormatFloat('00',iMes)+FormatFloat('0000',iAno);

  // Define Parametros
  sParam1 := '';
  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13+
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND CL.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;

  // Define Sql
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       IM.IMONOME, '+#13+
          '       CL.LOJAS, '+#13+
          '       CL.NOMCONTRATO, '+#13+
          '       CL.DATULTAUDITORIA, '+#13+
          '       M.MOESIGLA, '+#13+
          '       CM.COTVALOR, '+#13+
          '       AM.VLRAPURACAO AS VLRALUGMIN, '+#13+
          '       CL.PERALUGVARIAVEL, '+#13+
          '       ABL.VLRAPURACAO AS QTDEABL, '+#13+
          '       ROUND( (VE.VLRAPURACAO / ABL.VLRAPURACAO / CM.COTVALOR), 2) AS VENUPVM2, '+#13+
          '       ROUND( (VE.VLRAPURACAO / (AM.VLRAPURACAO / (CL.PERALUGVARIAVEL / 100)) * 100),0 ) AS PTOEQUILIBRIO, '+#13+

          '       ROUND( ((NVL(AM.VLRAPURACAO,0) + '+#13+
          '                DECODE( LEAST(ROUND((VE.VLRAPURACAO - (NVL(AM.VLRAPURACAO,0) / (CL.PERALUGVARIAVEL / 100))) * (CL.PERALUGVARIAVEL / 100),2), 0), 0, '+#13+
          '                        ROUND((VE.VLRAPURACAO - (NVL(AM.VLRAPURACAO,0) / (CL.PERALUGVARIAVEL / 100))) * (CL.PERALUGVARIAVEL / 100),2), 0 ) ) '+#13+
          '                / ABL.VLRAPURACAO / CM.COTVALOR), 2) AS ALUGUPVM2, '+#13+

          '       (0) AS RANKVEND, '+#13+
          '       (0) AS RANKALUG, '+#13+
          '       (0) AS RANKPTO,  '+#13+
          '       (0) AS RANKCO    '+#13+

          '  FROM '+#13+
          '       IMOVEL IM,       '+#13+
          '       MOEDA M,         '+#13+
          '       COTACAOMOEDA CM, '+#13+
          '       ( '+#13+
          '        SELECT CL.* '+#13+
          '          FROM INDCONTRATOLOJA CL '+#13+
          '         WHERE ( ( CL.DATINICIO  <= TO_DATE(' +QuotedStr(sDtIni)+ ') '+#13+
          '                   AND CL.DATTERMINO >= TO_DATE(' +QuotedStr(sDtFim)+ ') ) '+#13+
          '               OR CL.FLGINDETERMINADO = ''S'' )'+#13+
                          sParam1 +#13+
          '        ) CL, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) VE, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAluguel) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) AM, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDCONTRATO, AP.IDINDICADOR, SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP '+#13+
          '         WHERE AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY AP.IDCONTRATO, AP.IDINDICADOR '+#13+
          '        ) ABL '+#13+

          'WHERE CL.IDIMOVEL = IM.IDIMOVEL '+#13+
          '  AND M.MOECODIGO     = ' + IntToStr(iIdUpv) +#13+
          '  AND CM.MOECODIGO(+) = M.MOECODIGO '+#13+
          '  AND CM.COTMESREF(+) = ' + QuotedStr(sMesAno) +#13+
          '  AND CL.IDCONTRATO   = VE.IDCONTRATO(+)  '+#13+
          '  AND CL.IDCONTRATO   = AM.IDCONTRATO(+)  '+#13+
          '  AND CL.IDCONTRATO   = ABL.IDCONTRATO(+) '+#13+

          'ORDER BY IMONOME, NOMCONTRATO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Performance de Vendas ( idReports - 3479 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelPerformance(const iIdImovel, iMesIni, iAnoIni, iMesFim, iAnoFim, iIdIndAbl, iIdIndVenda, iIdIndAluguel, iIdIndOverage, iIdUPV: Integer): OLEVariant;
var sSql, sParam1, sParam2,sAnoMesIni,sAnoMesFim : String;
    cdsTemp : TCMClientDataSet;
    iAncVarMesAnt,iAncVarAnoAnt,iSatVarMesAnt,iSatVarAnoAnt,iQuiVarMesAnt,iQuiVarAnoAnt: Extended;
begin
  sAnoMesIni := IntToStr(iMesIni);
  if iMesIni < 10 then sAnoMesIni := '0' + sAnoMesIni;
  sAnoMesIni := IntToStr(iAnoIni) + sAnoMesIni;
  sAnoMesFim := IntToStr(iMesFim);
  if iMesFim < 10 then sAnoMesFim := '0' + sAnoMesFim;
  sAnoMesFim := IntToStr(iAnoFim) + sAnoMesFim;

  // Define Parametros
  sParam1 := ' AND LTRIM(TO_CHAR(ANOCOMPETENCIA,''0999'')) || LTRIM(TO_CHAR(MESCOMPETENCIA,''09'')) BETWEEN ' + QuotedStr(sAnoMesIni) + ' AND ' + QuotedStr(sAnoMesFim) +#13;
  sParam2 := ' AND LTRIM(TO_CHAR(A.ANOCOMPETENCIA,''0999'')) || LTRIM(TO_CHAR(A.MESCOMPETENCIA,''09'')) BETWEEN ' + QuotedStr(sAnoMesIni) + ' AND ' + QuotedStr(sAnoMesFim) +#13;

  if iIdImovel > 0 then begin
     sParam1 := sParam1 + ' AND IDIMOVEL = '   + IntToStr(iIdImovel);
     sParam2 := sParam2 + ' AND A.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;

  // Define Sql
  sSql := 'SELECT IM.IMONOME,  '+#13+
          '       M.MOESIGLA,  '+#13+
          '       CM.COTVALOR, '+#13+
          '       LTRIM(TO_CHAR(MESES.MESCOMPETENCIA,''09'')) || ''/'' || LTRIM(TO_CHAR(MESES.ANOCOMPETENCIA,''0999'')) AS DSC_MESANO, '+#13+
          '       MESES.MESCOMPETENCIA, '+#13+
          '       MESES.ANOCOMPETENCIA, '+#13+
          '       NVL(ANCABL.VLRAPURACAO,0) AS ANC_ABL, '+#13+
          '       NVL(SATABL.VLRAPURACAO,0) AS SAT_ABL, '+#13+
          '       NVL(QUIABL.VLRAPURACAO,0) AS QUI_ABL, '+#13+
          '       NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0) AS TOT_ABL,   '+#13+

          '       DECODE( NVL(CM.COTVALOR,0), 0 , 0, '+#13+
          '               DECODE( NVL(ANCABL.VLRAPURACAO,0), 0, 0, '+#13+
          '                       ROUND(NVL(ANCVENDA.VLRAPURACAO,0) / ANCABL.VLRAPURACAO / CM.COTVALOR, 2) ) ) AS ANC_VENDAM2, '+#13+
          '       DECODE( NVL(CM.COTVALOR,0), 0 , 0, '+#13+
          '               DECODE( NVL(SATABL.VLRAPURACAO,0), 0, 0, '+#13+
          '                       ROUND(NVL(SATVENDA.VLRAPURACAO,0) / SATABL.VLRAPURACAO / CM.COTVALOR, 2) ) ) AS SAT_VENDAM2, '+#13+
          '       DECODE( NVL(CM.COTVALOR,0), 0 , 0, '+#13+
          '               DECODE( NVL(QUIABL.VLRAPURACAO,0), 0, 0, '+#13+
          '                       ROUND(NVL(QUIVENDA.VLRAPURACAO,0) / QUIABL.VLRAPURACAO / CM.COTVALOR, 2) ) ) AS QUI_VENDAM2, '+#13+
          '       DECODE( NVL(CM.COTVALOR,0), 0 , 0, '+#13+
          '               DECODE( NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0), 0, 0, '+#13+
          '                       ROUND((NVL(ANCVENDA.VLRAPURACAO,0)+NVL(SATVENDA.VLRAPURACAO,0)+NVL(QUIVENDA.VLRAPURACAO,0)) / '+#13+
          '                             (NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0)) / CM.COTVALOR, 2) ) ) AS TOT_VENDAM2, '+#13+
          '       DECODE( NVL(CM.COTVALOR,0), 0 , 0, '+#13+
          '               DECODE( NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0), 0, 0, '+#13+
          '                       ROUND((NVL(AMIN.VLRAPURACAO,0)) / '+#13+
          '                             (NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0)) / CM.COTVALOR, 2) ) ) AS TOT_AMINM2, '+#13+

          '       DECODE( NVL(CM.COTVALOR,0), 0 , 0, '+#13+
          '               DECODE( NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0), 0, 0, '+#13+
          '                       ROUND((NVL(AMIN.VLRAPURACAO,0)+NVL(OVER.VLRAPURACAO,0)) / '+#13+
          '                             (NVL(ANCABL.VLRAPURACAO,0)+NVL(SATABL.VLRAPURACAO,0)+NVL(QUIABL.VLRAPURACAO,0)) / CM.COTVALOR, 2) ) ) AS TOT_ALUGM2, '+#13+

          '       ( 0 ) AS ANC_VARMESANT, '+#13+
          '       ( 0 ) AS ANC_VARANOANT, '+#13+
          '       ( 0 ) AS SAT_VARMESANT, '+#13+
          '       ( 0 ) AS SAT_VARANOANT, '+#13+
          '       ( 0 ) AS QUI_VARMESANT, '+#13+
          '       ( 0 ) AS QUI_VARANOANT  '+#13+

          '  FROM IMOVEL IM, '+#13+
          '       MOEDA M, '+#13+
          '       COTACAOMOEDA CM, '+#13+
          '      ( '+#13+
          '        SELECT DISTINCT IDIMOVEL, MESCOMPETENCIA, ANOCOMPETENCIA '+#13+
          '          FROM INDAPURACAO '+#13+
          '         WHERE 1=1 '+#13+ sParam1 +#13+
          '       ) MESES, '+#13+
          '      ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND CL.TIPOCONTRATO = ''A'' '+#13+
          '           AND A.TIPOINCLUSAO  = ''C'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) ANCABL, '+#13+
          '       ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND CL.TIPOCONTRATO = ''A'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) ANCVENDA, '+#13+
          '      ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND CL.TIPOCONTRATO = ''S'' '+#13+
          '           AND A.TIPOINCLUSAO  = ''C'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) SATABL, '+#13+
          '       ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND CL.TIPOCONTRATO = ''S'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) SATVENDA, '+#13+
          '      ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND CL.TIPOCONTRATO = ''Q'' '+#13+
          '           AND A.TIPOINCLUSAO  = ''C'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndAbl) +#13+ sParam2 +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) QUIABL, '+#13+
          '       ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND CL.TIPOCONTRATO = ''Q'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndVenda) +#13+ sParam2 +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) QUIVENDA, '+#13+
          '       ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND A.TIPOINCLUSAO = ''C'' '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndAluguel) +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) AMIN, '+#13+
          '       ( '+#13+
          '        SELECT A.IDIMOVEL, A.MESCOMPETENCIA, A.ANOCOMPETENCIA, SUM(A.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO A, '+#13+
          '               INDCONTRATOLOJA CL '+#13+
          '         WHERE A.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND A.IDINDICADOR = ' + IntToStr(iIdIndOverage) +#13+
          '         GROUP BY A.IDIMOVEL,A.MESCOMPETENCIA,A.ANOCOMPETENCIA '+#13+
          '       ) OVER '+#13+
          ' WHERE M.MOECODIGO          = ' + IntToStr(iIdUPV) +#13+
          '   AND CM.MOECODIGO(+)      = ' + IntToStr(iIdUPV) +#13+
          '   AND CM.COTMESREF(+)      = (LTRIM(TO_CHAR(MESES.MESCOMPETENCIA,''09'')) || LTRIM(TO_CHAR(MESES.ANOCOMPETENCIA,''0999''))) '+#13+
          '   AND MESES.IDIMOVEL       = IM.IDIMOVEL                '+#13+
          '   AND MESES.IDIMOVEL       = ANCABL.IDIMOVEL(+)         '+#13+
          '   AND MESES.MESCOMPETENCIA = ANCABL.MESCOMPETENCIA(+)   '+#13+
          '   AND MESES.ANOCOMPETENCIA = ANCABL.ANOCOMPETENCIA(+)   '+#13+
          '   AND MESES.IDIMOVEL       = ANCVENDA.IDIMOVEL(+)       '+#13+
          '   AND MESES.MESCOMPETENCIA = ANCVENDA.MESCOMPETENCIA(+) '+#13+
          '   AND MESES.ANOCOMPETENCIA = ANCVENDA.ANOCOMPETENCIA(+) '+#13+
          '   AND MESES.IDIMOVEL       = SATABL.IDIMOVEL(+)         '+#13+
          '   AND MESES.MESCOMPETENCIA = SATABL.MESCOMPETENCIA(+)   '+#13+
          '   AND MESES.ANOCOMPETENCIA = SATABL.ANOCOMPETENCIA(+)   '+#13+
          '   AND MESES.IDIMOVEL       = SATVENDA.IDIMOVEL(+)       '+#13+
          '   AND MESES.MESCOMPETENCIA = SATVENDA.MESCOMPETENCIA(+) '+#13+
          '   AND MESES.ANOCOMPETENCIA = SATVENDA.ANOCOMPETENCIA(+) '+#13+
          '   AND MESES.IDIMOVEL       = QUIABL.IDIMOVEL(+)         '+#13+
          '   AND MESES.MESCOMPETENCIA = QUIABL.MESCOMPETENCIA(+)   '+#13+
          '   AND MESES.ANOCOMPETENCIA = QUIABL.ANOCOMPETENCIA(+)   '+#13+
          '   AND MESES.IDIMOVEL       = QUIVENDA.IDIMOVEL(+)       '+#13+
          '   AND MESES.MESCOMPETENCIA = QUIVENDA.MESCOMPETENCIA(+) '+#13+
          '   AND MESES.ANOCOMPETENCIA = QUIVENDA.ANOCOMPETENCIA(+) '+#13+
          '   AND MESES.IDIMOVEL       = AMIN.IDIMOVEL(+)           '+#13+
          '   AND MESES.MESCOMPETENCIA = AMIN.MESCOMPETENCIA(+)     '+#13+
          '   AND MESES.ANOCOMPETENCIA = AMIN.ANOCOMPETENCIA(+)     '+#13+
          '   AND MESES.IDIMOVEL       = OVER.IDIMOVEL(+)           '+#13+
          '   AND MESES.MESCOMPETENCIA = OVER.MESCOMPETENCIA(+)     '+#13+
          '   AND MESES.ANOCOMPETENCIA = OVER.ANOCOMPETENCIA(+)     '+#13+

          'ORDER BY IM.IMONOME, MESES.ANOCOMPETENCIA DESC, MESES.MESCOMPETENCIA DESC ';

  // Executa o sql e buscando o pacote de dados
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );

    // Calcula a Variação do mes e ano anterior para cada TIPO DE CONTRATO
    while not cdsTemp.eof do begin
      iAncVarMesAnt := 0;
      iAncVarAnoAnt := 0;
      iSatVarMesAnt := 0;
      iSatVarAnoAnt := 0;
      iQuiVarMesAnt := 0;
      iQuiVarAnoAnt := 0;
      // Calcula Ancoras
      if cdsTemp.FieldByName('ANC_VENDAM2').AsFloat  > 0 then begin
        iAncVarMesAnt := VariacaoVenda( -1, -1, -1, -1,
                                       cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANC_VENDAM2').AsFloat,'A','M',
                                       iIdIndVenda,iIdIndAbl,iIdUPV);
        iAncVarAnoAnt := VariacaoVenda( -1, -1, -1, -1,
                                       cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANC_VENDAM2').AsFloat,'A','A',
                                       iIdIndVenda,iIdIndAbl,iIdUPV);
      end;
      // Calcula Satélites
      if cdsTemp.FieldByName('SAT_VENDAM2').AsFloat  > 0 then begin
        iSatVarMesAnt := VariacaoVenda( -1, -1, -1, -1,
                                       cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('SAT_VENDAM2').AsFloat,'S','M',
                                       iIdIndVenda,iIdIndAbl,iIdUPV);
        iSatVarAnoAnt := VariacaoVenda( -1, -1, -1, -1,
                                       cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('SAT_VENDAM2').AsFloat,'S','A',
                                       iIdIndVenda,iIdIndAbl,iIdUPV);
      end;
      // Calcula Quiosques
      if cdsTemp.FieldByName('QUI_VENDAM2').AsFloat  > 0 then begin
        iQuiVarMesAnt := VariacaoVenda( -1, -1, -1, -1,
                                       cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('QUI_VENDAM2').AsFloat,'Q','M',
                                       iIdIndVenda,iIdIndAbl,iIdUPV);
        iQuiVarAnoAnt := VariacaoVenda( -1, -1, -1, -1,
                                       cdsTemp.FieldByName('MESCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('ANOCOMPETENCIA').AsInteger,
                                       cdsTemp.FieldByName('QUI_VENDAM2').AsFloat,'Q','A',
                                       iIdIndVenda,iIdIndAbl,iIdUPV);
      end;

      // Atualiza dados na tabela
      if (iAncVarMesAnt <> 0) or (iAncVarAnoAnt <> 0) or
         (iSatVarMesAnt <> 0) or (iSatVarAnoAnt <> 0) or
         (iQuiVarMesAnt <> 0) or (iQuiVarAnoAnt <> 0) then begin
        cdsTemp.Edit;
        cdsTemp.FieldByName('ANC_VARMESANT').AsFloat := iAncVarMesAnt;
        cdsTemp.FieldByName('ANC_VARANOANT').AsFloat := iAncVarAnoAnt;
        cdsTemp.FieldByName('SAT_VARMESANT').AsFloat := iSatVarMesAnt;
        cdsTemp.FieldByName('SAT_VARANOANT').AsFloat := iSatVarAnoAnt;
        cdsTemp.FieldByName('QUI_VARMESANT').AsFloat := iQuiVarMesAnt;
        cdsTemp.FieldByName('QUI_VARANOANT').AsFloat := iQuiVarAnoAnt;
        cdsTemp.Post;
      end;
      cdsTemp.Next;
    end;
  finally
    Result := cdsTemp.Data;
    cdsTemp.Free;
  end;
end;


// -----------------------------------------------------------------------------
// Retorna o Nr. de Lojas vagas e a ABL total das mesmas
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaLojasVagas(const iIdImovel,iMes,iAno: Integer): OLEVariant;
var sSql, sParam, sDtIni, sDtFim : String;
begin
  // Define Parametros
  sDtIni := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
  sDtFim := DiasUteis.UltimoDiaMes(sDtIni);

  sParam := '';
  if iIdImovel > 0 then sParam := sParam + ' AND L.IDIMOVEL = ' + IntToStr(iIdImovel);

  // Define Sql
  sSql := 'SELECT IM.IMONOME, '+#13+
          '       COUNT(*)     AS QTDELOJASVAGAS, '+#13+
          '       SUM(QTDEABL) AS QTDEABLVAGAS    '+#13+
          '  FROM INDLOJA L, '+#13+
          '       IMOVEL IM  '+#13+
          ' WHERE L.IDIMOVEL = IM.IDIMOVEL '+#13+
          '   AND L.IDLOJA NOT IN ( SELECT CXL.IDLOJA '+#13+
          '                           FROM INDCONTRATOLOJA CL,  '+#13+
          '                                INDCONTRATOXLOJA CXL '+#13+
          '                          WHERE CL.IDCONTRATO = CXL.IDCONTRATO '+#13+
          '                            AND ( (CL.DATINICIO <= TO_DATE('+QuotedStr(sDtIni)+') AND CL.DATTERMINO >= TO_DATE('+QuotedStr(sDtFim)+') ) '+#13+
          '                                   OR CL.FLGINDETERMINADO = ''S'' ) '+#13+
          '                          ) '+#13+ sParam +#13+
          'GROUP BY IM.IMONOME ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Inadimplências ( idReports - 3465 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelInadimplencia(const iIdReport, iIdImovel, iIdGrpApuracao, iMes, iAno,iNDMeses,
                                                         iNDAlug,iNDEnca,iNDFund,iNDLuva,iNDTpProv,
                                                         iNDDtProv: Integer): OLEVariant;
var sSql, sParam1, sParam2 : String;
begin
  // Define parametros
  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport) +
             ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;

  if iIdGrpApuracao > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao);
    sParam2 := sParam2 + ' AND AP.IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao);
  end;


  // Define SQL
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       IM.IMONOME, '+#13+
          '       GA.DESCRICAO  AS DSC_GRUPO, '+#13+
          '       CL.LOJAS, '+#13+
          '       CL.NOMCONTRATO, '+#13+
          '       NVL(APMES.VLRAPURACAONUM,0) AS QTDEMESES,   '+#13+
          '       NVL(APALU.VLRAPURACAONUM,0) AS VLRALUGUEL,  '+#13+
          '       NVL(APENC.VLRAPURACAONUM,0) AS VLRENCARGOS, '+#13+
          '       NVL(APFUN.VLRAPURACAONUM,0) AS VLRFUNDOS,   '+#13+
          '       NVL(APLUV.VLRAPURACAONUM,0) AS VLRLUVAS,    '+#13+
          '       APPRO.VLRAPURACAOSTR AS DSC_PROVIDENCIA,    '+#13+
          '       APDAT.VLRAPURACAODAT AS DAT_PROVIDENCIA     '+#13+
          '  FROM IMOVEL IM, '+#13+
          '       INDCONTRATOLOJA CL, '+#13+
          '       INDGRPAPURACAO GA, '+#13+
          '      ( '+#13+
          '       SELECT DISTINCT AP.IDIMOVEL, AP.IDCONTRATO, AP.IDGRPAPURACAO '+#13+
          '         FROM INDGRPINDICADOR GI, '+#13+
          '              INDSUBTIPOINDICADOR ST, '+#13+
          '              INDAPURACAO AP '+#13+
          '        WHERE GI.IDSUBTIPO = ST.IDSUBTIPO '+#13+
          '          AND GI.IDINDICADOR = AP.IDINDICADOR '+#13+ sParam1 +#13+
          '      ) GI, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iNDMeses) +#13+ sParam2 +#13+
          '       ) APMES, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.TIPOINCLUSAO = ''C'' '+#13+
          '          AND AP.IDINDICADOR = ' + IntToStr(iNDAlug) +#13+ sParam2 +#13+
          '       ) APALU, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iNDEnca) +#13+ sParam2 +#13+
          '       ) APENC, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iNDFund) +#13+ sParam2 +#13+
          '       ) APFUN, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iNDLuva) +#13+ sParam2 +#13+
          '       ) APLUV, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAOSTR '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iNDTpProv) +#13+ sParam2 +#13+
          '       ) APPRO, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDGRPAPURACAO, IDCONTRATO, VLRAPURACAODAT '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iNDDtProv) +#13+ sParam2 +#13+
          '       ) APDAT '+#13+
          ' WHERE GI.IDCONTRATO    = CL.IDCONTRATO    '+#13+
          '   AND GI.IDIMOVEL      = IM.IDIMOVEL      '+#13+
          '   AND GI.IDGRPAPURACAO = GA.IDGRPAPURACAO '+#13+
          '   AND GI.IDIMOVEL      = APMES.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APMES.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APMES.IDGRPAPURACAO(+) '+#13+
          '   AND GI.IDIMOVEL      = APALU.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APALU.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APALU.IDGRPAPURACAO(+) '+#13+
          '   AND GI.IDIMOVEL      = APENC.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APENC.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APENC.IDGRPAPURACAO(+) '+#13+
          '   AND GI.IDIMOVEL      = APFUN.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APFUN.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APFUN.IDGRPAPURACAO(+) '+#13+
          '   AND GI.IDIMOVEL      = APLUV.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APLUV.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APLUV.IDGRPAPURACAO(+) '+#13+
          '   AND GI.IDIMOVEL      = APPRO.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APPRO.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APPRO.IDGRPAPURACAO(+) '+#13+
          '   AND GI.IDIMOVEL      = APDAT.IDIMOVEL(+) '+#13+
          '   AND GI.IDCONTRATO    = APDAT.IDCONTRATO(+) '+#13+
          '   AND GI.IDGRPAPURACAO = APDAT.IDGRPAPURACAO(+) '+#13+
          'ORDER BY IMONOME, DSC_GRUPO, NOMCONTRATO';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Abonos ( idReports - 3469 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelAbono(const iIdReport,iIdImovel,iIdGrpApuracao,
                                                 iIndDtVencto,iIndDtPagto,iIndVlrFat,iIndCM,
                                                 iIndJur,iIndVlrPag: Integer;
                                           const dtIni,dtFim:TDateTime): OLEVariant;
var sSql, sParam1, sParam2 : String;
begin
  // Define parametros
  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport) +
             ' AND AP.DATAAPURACAO >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dtIni)) + ',''DD/MM/YYYY'')' +
             ' AND AP.DATAAPURACAO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dtFim)) + ',''DD/MM/YYYY'')';

  sParam2 := ' AND AP.DATAAPURACAO >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dtIni)) + ',''DD/MM/YYYY'')' +
             ' AND AP.DATAAPURACAO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dtFim)) + ',''DD/MM/YYYY'')';

  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;

  if iIdGrpApuracao > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao);
    sParam2 := sParam2 + ' AND AP.IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao);
  end;

  // Define SQL
  sSql := 'SELECT ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dtIni)) + ' AS DT_INICIO,  '+#13+
          '       ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dtFim)) + ' AS DT_TERMINO, '+#13+
          '       IM.IMONOME, '+#13+
          '       GA.DESCRICAO AS DSC_GRUPO, '+#13+
          '       CL.LOJAS, '+#13+
          '       CL.NOMCONTRATO, '+#13+
          '       GI.MESCOMPETENCIA, '+#13+
          '       GI.ANOCOMPETENCIA, '+#13+
          '       APDTVEN.VLRAPURACAODAT AS DAT_VENCTO, '+#13+
          '       APDTPGT.VLRAPURACAODAT AS DAT_PAGTO, '+#13+
          '       NVL(APFAT.VLRAPURACAONUM,0) AS VLR_FATURADO, '+#13+
          '       NVL(APCM.VLRAPURACAONUM ,0) AS VLR_CM, '+#13+
          '       NVL(APMJ.VLRAPURACAONUM ,0) AS VLR_MULTA, '+#13+
          '       NVL(APPAG.VLRAPURACAONUM,0) AS VLR_PAGTO '+#13+
          '  FROM IMOVEL IM, '+#13+
          '       INDCONTRATOLOJA CL, '+#13+
          '       INDGRPAPURACAO GA, '+#13+
          '      ( '+#13+
          '       SELECT DISTINCT AP.IDIMOVEL, AP.IDGRPAPURACAO, AP.IDCONTRATO, '+#13+
          '                       AP.MESCOMPETENCIA, AP.ANOCOMPETENCIA '+#13+
          '         FROM INDGRPINDICADOR GI, '+#13+
          '              INDSUBTIPOINDICADOR ST, '+#13+
          '              INDAPURACAO AP '+#13+
          '        WHERE GI.IDINDICADOR = AP.IDINDICADOR '+#13+
          '          AND GI.IDSUBTIPO = ST.IDSUBTIPO '+#13+ sParam1 +#13+
          '      ) GI, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENCIA, IDGRPAPURACAO, VLRAPURACAODAT '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iIndDtVencto) +#13+ sParam2 +#13+
          '       ) APDTVEN, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENCIA, IDGRPAPURACAO, VLRAPURACAODAT '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iIndDtPagto) +#13+ sParam2 +#13+
          '       ) APDTPGT, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENCIA, IDGRPAPURACAO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iIndVlrFat) +#13+ sParam2 +#13+
          '       ) APFAT, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENCIA, IDGRPAPURACAO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iIndCM) +#13+ sParam2 +#13+
          '       ) APCM, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENCIA, IDGRPAPURACAO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iIndJur) +#13+ sParam2 +#13+
          '       ) APMJ, '+#13+
          '      ( '+#13+
          '       SELECT IDIMOVEL, IDCONTRATO, MESCOMPETENCIA, ANOCOMPETENCIA, IDGRPAPURACAO, VLRAPURACAONUM '+#13+
          '         FROM INDAPURACAO AP '+#13+
          '        WHERE AP.IDINDICADOR = ' + IntToStr(iIndVlrPag) +#13+ sParam2 +#13+
          '       ) APPAG '+#13+
          ' WHERE GI.IDIMOVEL       = IM.IDIMOVEL               '+#13+
          '   AND GI.IDCONTRATO     = CL.IDCONTRATO             '+#13+
          '   AND GI.IDGRPAPURACAO  = GA.IDGRPAPURACAO          '+#13+
          '   AND GI.IDIMOVEL       = APDTVEN.IDIMOVEL(+)       '+#13+
          '   AND GI.IDGRPAPURACAO  = APDTVEN.IDGRPAPURACAO(+)  '+#13+
          '   AND GI.IDCONTRATO     = APDTVEN.IDCONTRATO(+)     '+#13+
          '   AND GI.MESCOMPETENCIA = APDTVEN.MESCOMPETENCIA(+) '+#13+
          '   AND GI.ANOCOMPETENCIA = APDTVEN.ANOCOMPETENCIA(+) '+#13+
          '   AND GI.IDIMOVEL       = APDTPGT.IDIMOVEL(+)       '+#13+
          '   AND GI.IDGRPAPURACAO  = APDTPGT.IDGRPAPURACAO(+)  '+#13+
          '   AND GI.IDCONTRATO     = APDTPGT.IDCONTRATO(+)     '+#13+
          '   AND GI.MESCOMPETENCIA = APDTPGT.MESCOMPETENCIA(+) '+#13+
          '   AND GI.ANOCOMPETENCIA = APDTPGT.ANOCOMPETENCIA(+) '+#13+
          '   AND GI.IDIMOVEL       = APFAT.IDIMOVEL(+)         '+#13+
          '   AND GI.IDGRPAPURACAO  = APFAT.IDGRPAPURACAO(+)    '+#13+
          '   AND GI.IDCONTRATO     = APFAT.IDCONTRATO(+)       '+#13+
          '   AND GI.MESCOMPETENCIA = APFAT.MESCOMPETENCIA(+)   '+#13+
          '   AND GI.ANOCOMPETENCIA = APFAT.ANOCOMPETENCIA(+)   '+#13+
          '   AND GI.IDIMOVEL       = APCM.IDIMOVEL(+)          '+#13+
          '   AND GI.IDGRPAPURACAO  = APCM.IDGRPAPURACAO(+)     '+#13+
          '   AND GI.IDCONTRATO     = APCM.IDCONTRATO(+)        '+#13+
          '   AND GI.MESCOMPETENCIA = APCM.MESCOMPETENCIA(+)    '+#13+
          '   AND GI.ANOCOMPETENCIA = APCM.ANOCOMPETENCIA(+)    '+#13+
          '   AND GI.IDIMOVEL       = APMJ.IDIMOVEL(+)          '+#13+
          '   AND GI.IDGRPAPURACAO  = APMJ.IDGRPAPURACAO(+)     '+#13+
          '   AND GI.IDCONTRATO     = APMJ.IDCONTRATO(+)        '+#13+
          '   AND GI.MESCOMPETENCIA = APMJ.MESCOMPETENCIA(+)    '+#13+
          '   AND GI.ANOCOMPETENCIA = APMJ.ANOCOMPETENCIA(+)    '+#13+
          '   AND GI.IDIMOVEL       = APPAG.IDIMOVEL(+)         '+#13+
          '   AND GI.IDGRPAPURACAO  = APPAG.IDGRPAPURACAO(+)    '+#13+
          '   AND GI.IDCONTRATO     = APPAG.IDCONTRATO(+)       '+#13+
          '   AND GI.MESCOMPETENCIA = APPAG.MESCOMPETENCIA(+)   '+#13+
          '   AND GI.ANOCOMPETENCIA = APPAG.ANOCOMPETENCIA(+)   '+#13+
          'ORDER BY IMONOME, DSC_GRUPO, NOMCONTRATO, ANOCOMPETENCIA, MESCOMPETENCIA ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Remessa de Alugueis ( idReports - 3471 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelRemessa(const iIdReport, iIdImovel, iMes, iAno: Integer): OLEVariant;
var sSql, sParam : String;
begin
  // Define parametros
  sParam := ' AND ST.IDREPORTS = ' + IntToStr(iIdReport) +
            ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +
            ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  if iIdImovel > 0 then sParam := sParam + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);

  // Define SQL
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '        IM.IMONOME, '+#13+
          '        I.DESCRICAO AS DSC_INDICADOR, '+#13+
          '        DECODE(GI.TIPOVALOR,''R'', ''RECEITAS'', ''DESPESAS'') AS DSC_TIPO, '+#13+
          '        GI.TIPOLANCA, '+#13+
          '        APNUM.DATAAPURACAO, '+#13+
          '        NVL(APNUM.VLRAPURACAONUM,0) AS VALOR '+#13+

          '  FROM  IMOVEL IM, '+#13+
          '        INDINDICADOR I, '+#13+
          '       ( '+#13+
          '        SELECT DISTINCT AP.IDIMOVEL, AP.IDINDICADOR, I.TIPOVALOR, GI.TIPOLANCA, GI.ORDEM '+#13+
          '          FROM INDAPURACAO AP, INDGRPINDICADOR GI, INDINDICADOR I, INDSUBTIPOINDICADOR ST '+#13+
          '         WHERE I.TIPODADO = ''N'' '+#13+
          '           AND AP.IDINDICADOR = GI.IDINDICADOR '+#13+
          '           AND GI.IDINDICADOR = I.IDINDICADOR  '+#13+
          '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO   '+#13+ sParam +#13+
          '        ) GI, '+#13+
          '       ( '+#13+
          '        SELECT AP.IDIMOVEL, AP.IDINDICADOR, AP.TIPOLANCA, AP.DATAAPURACAO, AP.VLRAPURACAONUM '+#13+
          '          FROM INDAPURACAO AP,         '+#13+
          '               INDGRPINDICADOR GI,     '+#13+
          '               INDSUBTIPOINDICADOR ST, '+#13+
          '               INDINDICADOR I '+#13+
          '         WHERE I.TIPODADO = ''N'' '+#13+
          '           AND AP.IDINDICADOR  = I.IDINDICADOR  '+#13+
          '           AND AP.IDINDICADOR  = GI.IDINDICADOR '+#13+
          '           AND AP.TIPOLANCA    = GI.TIPOLANCA   '+#13+
          '           AND ST.IDSUBTIPO    = GI.IDSUBTIPO   '+#13+ sParam +#13+
          '        ) APNUM '+#13+

          ' WHERE GI.IDIMOVEL    = APNUM.IDIMOVEL(+)    '+#13+
          '   AND GI.IDINDICADOR = APNUM.IDINDICADOR(+) '+#13+
          '   AND GI.TIPOLANCA   = APNUM.TIPOLANCA(+)   '+#13+
          '   AND GI.IDIMOVEL    = IM.IDIMOVEL          '+#13+
          '   AND GI.IDINDICADOR = I.IDINDICADOR        '+#13+

          'ORDER BY IM.IMONOME, GI.TIPOVALOR DESC, GI.ORDEM, GI.IDINDICADOR, GI.TIPOLANCA DESC ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


// -----------------------------------------------------------------------------
// Relatório de Encargos de Lojas Livres ( idReports - 3473 )
// -----------------------------------------------------------------------------
function TCtrlRelIndicadores.BuscaRelLojasLivres(const iIdRepOrcamto, iIdImovel, iMes, iAno, iIdABL: Integer): OLEVariant;
var sSql, sParam1, sParam2, sParam3, sDtIni, sDtFim : String;
begin
  // Define parametros
  sDtIni := '01/'+FormatFloat('00',iMes)+'/'+FormatFloat('0000',iAno);
  sDtFim := DiasUteis.UltimoDiaMes(sDtIni);

  sParam1 := ' AND ST.IDREPORTS = ' + IntToStr(iIdRepOrcamto) +
             ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  sParam2 := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +
             ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno);

  sParam3 := '';

  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND AP.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam3 := sParam3 + ' AND L.IDIMOVEL  = ' + IntToStr(iIdImovel);
  end;

  // Define SQL
  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       IM.IMONOME, '+#13+
          '       L.NUMLOJA,  '+#13+
          '       L.PISO,     '+#13+
          '       L.QTDEABL,  '+#13+
          '       VLR_DESPM2, '+#13+
          '       (L.QTDEABL * VLR_DESPM2) AS VLR_ENCARGOS '+#13+
          '  FROM INDLOJA L,  '+#13+
          '       IMOVEL IM,  '+#13+
          '       ( '+#13+
          '        SELECT DES.IDIMOVEL, (DES.TOT_DESPESAS / ABL.VLRABL) AS VLR_DESPM2 '+#13+
          '          FROM ( '+#13+
          '                SELECT AP.IDIMOVEL, SUM(AP.VLRAPURACAONUM) AS VLRABL '+#13+
          '                  FROM INDAPURACAO AP '+#13+
          '                 WHERE AP.TIPOINCLUSAO = ''C'' '+#13+
          '                   AND AP.IDINDICADOR    = ' + IntToStr(iIdABL) +#13+ sParam2 +#13+
          '                 GROUP BY AP.IDIMOVEL '+#13+
          '                ) ABL, '+#13+
          '               ( '+#13+
          '                SELECT IDIMOVEL, SUM(AP.VLRAPURACAONUM) AS TOT_DESPESAS '+#13+
          '                  FROM INDINDICADOR I,         '+#13+
          '                       INDGRPINDICADOR GI,     '+#13+
          '                       INDSUBTIPOINDICADOR ST, '+#13+
          '                       INDAPURACAO AP          '+#13+
          '                 WHERE AP.IDINDICADOR = I.IDINDICADOR '+#13+
          '                   AND GI.IDINDICADOR = I.IDINDICADOR '+#13+
          '                   AND GI.IDSUBTIPO   = ST.IDSUBTIPO  '+#13+
          '                   AND I.TIPOVALOR  = ''D'' '+#13+
          '                   AND AP.TIPOLANCA = ''R'' '+#13+
          '                   AND GI.TIPOLANCA = ''R'' '+#13+ sParam1 +#13+
          '                 GROUP BY IDIMOVEL '+#13+
          '               ) DES '+#13+
          '         WHERE DES.IDIMOVEL = ABL.IDIMOVEL '+#13+
          '       ) DESPM2 '+#13+
          ' '+#13+
          ' WHERE L.IDIMOVEL = IM.IDIMOVEL '+#13+ sParam3 +#13+
          '   AND L.IDIMOVEL = DESPM2.IDIMOVEL '+#13+
          '   AND L.IDLOJA NOT IN ( SELECT CXL.IDLOJA '+#13+
          '                           FROM INDCONTRATOLOJA CL, '+#13+
          '                                INDCONTRATOXLOJA CXL '+#13+
          '                          WHERE CL.IDCONTRATO = CXL.IDCONTRATO '+#13+
          '                            AND (     (CL.DATINICIO  <= TO_DATE(' +QuotedStr(sDtIni)+ ', ''DD/MM/YYYY'') AND '+#13+
          '                                       CL.DATTERMINO >= TO_DATE(' +QuotedStr(sDtFim)+ ', ''DD/MM/YYYY'')) '+#13+
          '                                   OR (CL.DATINICIO  >= TO_DATE(' +QuotedStr(sDtIni)+ ', ''DD/MM/YYYY'') AND CL.FLGINDETERMINADO = ''S'')  ) '+#13+
          '                          ) '+#13+

          'ORDER BY IMONOME, NUMLOJA, PISO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Calcular o percentual de variação das vendas  ( INTERNA )
// Data : 18/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel      : id do Shopping, para variação por shopping       ( -1 )
//       iIdAtividade   : id da Atividade, para variação por atividade     ( -1 )
//       iIdMarca       : id da Marca/Franquia, para variação por Marca    ( -1 )
//       iIdContrato    : id do Contrato, para variação por contrato       ( -1 )
//       iMesAtual      : Mes Atual
//       iAnoAtual      : Ano Atual
//       iVndUpvM2Atual : Valor de Venda em Upv por M2 atual, o qual será comparado
//       sTipoContrato  : Tipo de Contrato ( Quiosque, Satelite, Ancora )  ( NULL )
//       sTipoVariacao  : Tipo de Variação ( M - Mês anterior, A - Ano anterior )
//       iIndVenda      : id do Indicador de Vendas
//       iIndAbl        : id do Indicador de Abl
//       iIndUPV        : id da Moeda de UPV
//
// Retorno : Percentual de Variação
//----------------------------------------------------------------------------------------
function TCtrlRelIndicadores.VariacaoVenda(const iIdImovel, iIdAtividade, iIdMarca, iIdContrato, iMesAtual, iAnoAtual: Integer;
                                           const iVndUpvM2Atual: Extended; const sTipoContrato,sTipoVariacao: String;
                                           const iIndVenda, iIndAbl, iIdUPV: Integer): Extended;
var sSql, sParam, sMesAno : String;
    iMes, iAno : Integer;
    cdsTemp : TCMClientDataSet;
begin
  // Define mes e ano do periodo anterior
  if sTipoVariacao = 'M' then begin
    iMes := iMesAtual - 1;
    iAno := iAnoAtual;
    if iMes = 0 then begin
      iMes := 12;
      iAno := iAno - 1;
    end;
  end else begin
    iMes := iMesAtual;
    iAno := iAnoAtual - 1;
  end;
  if iMes < 10 then
       sMesAno := '0' + IntToStr(iMes) + IntToStr(iAno)
  else sMesAno := IntToStr(iMes) + IntToStr(iAno);

  // Define parâmetros
  sParam := ' AND AP.MESCOMPETENCIA = ' + IntToStr(iMes) +#13;
  sParam := sParam + ' AND AP.ANOCOMPETENCIA = ' + IntToStr(iAno) +#13;
  if iIdImovel > 0       then sParam := sParam + ' AND AP.IDIMOVEL     = ' + IntToStr(iIdImovel) +#13;
  if iIdContrato > 0     then sParam := sParam + ' AND AP.IDCONTRATO   = ' + IntToStr(iIdContrato) +#13;
  if iIdAtividade > 0    then sParam := sParam + ' AND CL.IDATIVIDADE  = ' + IntToStr(iIdAtividade) +#13;
  if iIdMarca > 0        then sParam := sParam + ' AND CL.IDMARCA      = ' + IntToStr(iIdMarca) +#13;
  if sTipoContrato <> '' then sParam := sParam + ' AND CL.TIPOCONTRATO = ' + QuotedStr(sTipoContrato) +#13;

  // busca Venda por Upv por M2 do período anterior
  sSql := 'SELECT M.MOESIGLA, CM.COTVALOR, '+#13+
          '       ROUND( (VE.VLRAPURACAO / ABL.VLRAPURACAO / CM.COTVALOR), 2) AS VNDUPVM2 '+#13+
          '  FROM '+#13+
          '       MOEDA M, '+#13+
          '       COTACAOMOEDA CM, '+#13+
          '       ( '+#13+
          '        SELECT SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIndVenda) +#13+ sParam +
          '        ) VE, '+#13+
          '       ( '+#13+
          '        SELECT SUM(AP.VLRAPURACAONUM) AS VLRAPURACAO '+#13+
          '          FROM INDAPURACAO AP, INDCONTRATOLOJA CL '+#13+
          '         WHERE AP.IDCONTRATO = CL.IDCONTRATO '+#13+
          '           AND AP.TIPOINCLUSAO = ''C'' '+#13+
          '           AND AP.IDINDICADOR = ' + IntToStr(iIndABL) +#13+ sParam +
          '        ) ABL '+#13+
          'WHERE M.MOECODIGO     = ' + IntToStr(iIdUPV) +#13+
          '  AND CM.MOECODIGO(+) = M.MOECODIGO '+#13+
          '  AND CM.COTMESREF(+) = ' + QuotedStr(sMesAno);

  // Calcula a Variação
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );
    if cdsTemp.FieldByName('VNDUPVM2').AsFloat > 0 then begin
      Result := (( iVndUpvM2Atual / cdsTemp.FieldByName('VNDUPVM2').AsFloat ) - 1) * 100;
    end else begin
      Result := 0;
    end;
  finally
    cdsTemp.Free;
  end;
end;



end.
