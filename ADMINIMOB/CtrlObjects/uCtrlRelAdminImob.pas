{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 82382
Responsável : Taffarel Sevaybriker
Data        : 25/02/2019
Descrição   : Ajuste no relatório Histórico Contratual para ordernar pela competência.
--------------------------------------------------------------------------------
Pendência   : 27389
Responsável : Daniel Simões
Data        : 21/02/2008
Descrição   : Ajuste na query do relatório Folha de Receitas por Empreendimento
              Analítico. Adicionado campo 'IDIMOVELMESTRE' nas subquerys dos
              campos valores...
--------------------------------------------------------------------------------
Pendência   : 24880
Responsável : Daniel Simões
Data        : 30/07/2007
Descrição   : Implementação do relatório de Folha de Receitas por Empreendimento
              ( Sintética )
--------------------------------------------------------------------------------
Pendência   : 24879
Responsável : Daniel Simões
Data        : 12/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Receita por
              Vencimento.
--------------------------------------------------------------------------------
Pendência   : 25717
Responsável : Daniel Simões
Data        : 06/07/2007
Descrição   : Adicionada na função 'SelecionaHistorico' a condição para não
              exibir valores estornados ( ESTORNO IS NULL ) ...
--------------------------------------------------------------------------------
Pendência   : 24881
Responsável : Daniel Simões
Data        : 06/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Receita por
              Empreendimento ( Imóvel Mestre ) e Segmento ( Tipo de Imóvel ).
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRelAdminImob;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uCtrlParamCAF, uCMFileUtils;

Type
  TCtrlRelAdminImob = class(TCmControlObject)

  private
    function CorrigeSaldo        (const dados: OLEVariant; const dCorrig: TDateTime) : OLEVariant;

  public
    function SelecionaRelExtrato (const iIdModulo,iIdContratoImovel,iIdLocatario,iIdTipoReceita,iIdSitCont,iFlgTipo:integer;
                                  const dDataIni, dDataFim, dCorrig: TDateTime ) : OLEVariant;

    function SelecionaRelSeguros (const iIdImovel, iIdSeguradora, iTipo: Integer): OLEVariant;

    function SelecionaHistorico (const iEmpresa, iIdImovelMestre, iIdContrato, iIdLocatario, iAnoInicial, iAnoFinal: Integer; const bSemContrato:Boolean): OLEVariant;

    function SelecionaRelMovFinan(const sTipoImovel: String; const iEmpresa, iMesIni, iAnoIni, iMesFim, iAnoFim: Integer;
                                  const dSldCtb: TDateTime; const bPrevRec, bPrevDesp: Boolean) : OLEVariant;

    function SelecionaRelLancForaComp(const iIdUsuario, iIdFavorecido, iIdTipoRecDesp: integer;
                                      const dDataIniLib, dDataFimLib, dDataIniLanc, dDataFimLanc: TDateTime): OLEVariant;

    function SelecionaRelEventos( const iIdContratoImovel : integer; const dDataIni, dDataFim : TDateTime; const sFlgTipoEvento : string ) : OLEVariant;

// Daniel - 24881 - Início -----------------------------------------------------
    function SelecionaRelFolhaRec( const iMestre:Integer=-1;    const iContrato:Integer=-1; const iMes:Integer=-1;
                                   const iAno:Integer=-1;       const iModulo:Integer=-1;   const dDataIni:TDateTime=-1;
                                   const dDataFim:TDateTime=-1; const sTipoImovel:String=''): OLEVariant;

    function SelecionaSegmento( const iMestre:Integer=-1;    const iContrato:Integer=-1; const iMes:Integer=-1;
                                const iAno:Integer=-1;       const iModulo:Integer=-1;   const dDataIni:TDateTime=-1;
                                const dDataFim:TDateTime=-1; const sTipoImovel:String=''): OLEVariant;

    function LookupTipoImovel: OLEVariant;
// Daniel - 24881 - Fim --------------------------------------------------------

    // Daniel - 24879
    function SelecionaRelFolhaVencimento( const iMestre:Integer=-1;    const iMes:Integer=-1;
                                          const iAno:Integer=-1;       const iModulo:Integer=-1;
                                          const dDataIni:TDateTime=-1; const dDataFim:TDateTime=-1 ): OLEVariant;

    // Daniel - 24880
    function SelecionaRelFolhaRecSint( const iMestre:Integer=-1;    const iContrato:Integer=-1;
                                       const iMes:Integer=-1;       const iAno:Integer=-1;
                                       const iModulo:Integer=-1;    const dDataIni:TDateTime=-1;
                                       const dDataFim:TDateTime=-1; const sTipoImovel:String=''): OLEVariant;

  published

end;


implementation

{ TCtrlRelAdminImob }

uses uCalcDocumento, uFuncoesImob, uComunsImobiliario;


function TCtrlRelAdminImob.SelecionaRelExtrato(const iIdModulo, iIdContratoImovel, iIdLocatario,iIdTipoReceita,iIdSitCont,iFlgTipo: integer;
                                               const dDataIni, dDataFim, dCorrig:TDateTime): OleVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdModulo > 0         then sParam := sParam + '  AND  (VW.IDMODULO = ' + IntToStr(iIdModulo) + ')';
  if iIdContratoImovel > 0 then sParam := sParam + '  AND  (VW.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) + ')';
  if iIdLocatario > 0      then sParam := sParam + '  AND  (VW.IDLOCATARIO = ' + IntToStr(iIdLocatario) + ')';
  if iIdTipoReceita > 0    then sParam := sParam + '  AND  (VW.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoReceita) + ' )';
  if iIdSitCont > 0        then sParam := sParam + '  AND  (VW.IDSITCONTIMOB = ' + IntToStr(iIdSitCont) + ' )';
  if dDataIni > 0          then sParam := sParam + '  AND  (VW.DATAVENCIMENTO >= TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ') )';
  if dDataFim > 0          then sParam := sParam + '  AND  (VW.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ') )';

  case iFlgTipo of
    1 : sParam := sParam + ' AND (VW.FLGNAOCONCILIADO IS NULL) ';
    2 : sParam := sParam + ' AND (VW.FLGNAOCONCILIADO IS NOT NULL) ';
  end;

  sSql := 'SELECT DISTINCT ' +
          '       VW.CODDOCUMENTO,   VW.CONTRATO_EXTENSO, P.NOME, ' +
          '       VW.DATAVENCIMENTO, VW.DESCCUSTORECIMO,  VW.DATA_BAIXA, ' +
          '       VW.TOT_RECEBER,    VW.TOT_RECEBIDO,     VW.TOT_ALTERADOR, ' +
          '       VW.CONVLRMULTA,    VW.CONPERCENTMULTA,  VW.CONMOEDAMULTA, ' +
          '       VW.CONVLRMORA,     VW.CONPERCENTMORA,   VW.CONMOEDAMORA, ' +
          '       VW.FLGMORAPROPORC, VW.CONPERMORA,       NVL(VW.FLGNAOCONCILIADO,0) AS FLGNAOCONCILIADO, ' +
          '       SC.DESCRICAO AS DSC_SITCONT, ' +
          '       DECODE(VW.IDINDCORRECAO, NULL, VW.CONINDICEREAJUSTE, VW.IDINDCORRECAO) AS INDCORRECAO, ' +
          '       DECODE(VW.DATA_BAIXA,NULL,0, ' +
          '             (VW.TOT_RECEBER+NVL(VW.VLRJUROS,0)+NVL(VW.VLRMULTA,0)+NVL(VW.VLRCORRECAOMON,0))) AS TOT_DEVIDO, ' +
          '       DECODE(VW.DATA_BAIXA,NULL,0, ' +
          '             (NVL(VW.TOT_RECEBIDO,0)-(NVL(VW.TOT_RECEBER,0)+NVL(VW.VLRJUROS,0)+NVL(VW.VLRMULTA,0)+NVL(VW.VLRCORRECAOMON,0))) ) AS DIFERENCA, ' +
          '      (0) AS DIF_CORRIG, ' + QuotedStr('          ') + ' AS DSC_ABONO ' +

          ' FROM ' +
          '       VWLANCAMENTO VW, '+
          '       LOCATARIO L, '+
          '       PESSOA P, ' +
          '       SITCONTIMOB SC ' +
          'WHERE  ( VW.RECPAG = ' + QuotedStr('R') + ' ) ' +
          '  AND  ( VW.IDLOCATARIO = L.IDLOCATARIO(+) ) ' +
          '  AND  ( L.IDLOCATARIO = P.IDPESSOA ) ' +
          '  AND  ( VW.IDSITCONTIMOB = SC.IDSITCONTIMOB(+) ) ' +
          sParam +
          ' ORDER BY VW.CONTRATO_EXTENSO, VW.DATAVENCIMENTO ';

  Result := CorrigeSaldo( GetDataPacket( sSql ), dCorrig );
end;



function TCtrlRelAdminImob.CorrigeSaldo(const dados : OLEVariant; const dCorrig: TDateTime): OLEVariant;
var cds    : TCMClientDataSet;
    fCM, fMulta, fJuros : Extended;
    dAtual : TDateTime;
begin
   cds := TCMClientDataSet.Create(nil);
   cds.Data := dados;
   if dCorrig > 0 then
        dAtual := dCorrig
   else dAtual := Date();
   while not cds.eof do begin
     // Corrige os lancamentos não conciliados
     if not cds.FieldByName('FLGNAOCONCILIADO').IsNull then begin
       // Corrige lançamentos que não foram pagos
       if cds.FieldByName('DATA_BAIXA').IsNull then begin

         fCM := Arredonda(
                CalcDocumento.CalcCM(cds.FieldByName('TOT_RECEBER').AsFloat,
                                     cds.FieldByName('INDCORRECAO').AsInteger,
                                     cds.FieldByName('DATAVENCIMENTO').AsDateTime + 1,
                                     dAtual ), 2);

         fMulta := Arredonda(
                   CalcDocumento.CalcMulta(cds.FieldByName('TOT_RECEBER').AsFloat + fCM,
                                           cds.FieldByName('CONVLRMULTA').AsFloat,
                                           cds.FieldByName('CONPERCENTMULTA').AsFloat,
                                           cds.FieldByName('CONMOEDAMULTA').AsInteger,
                                           dAtual), 2);

         fJuros := Arredonda(
                   CalcDocumento.CalcJuros(cds.FieldByName('TOT_RECEBER').AsFloat + fCM,
                                           cds.FieldByName('CONVLRMORA').AsFloat,
                                           cds.FieldByName('CONPERCENTMORA').AsFloat,
                                           cds.FieldByName('CONMOEDAMORA').AsInteger,
                                           cds.FieldByName('FLGMORAPROPORC').AsInteger,
                                           cds.FieldByName('CONPERMORA').AsString,
                                           cds.FieldByName('DATAVENCIMENTO').AsDateTime+1,
                                           dAtual), 2);

         cds.Edit;
         cds.FieldByName('DIF_CORRIG').AsFloat := cds.FieldByName('TOT_RECEBER').AsFloat +
                                                 fCM + fMulta + fJuros;
         cds.Post;

       end;

       // Corrige os lançamentos pagos com divergencia
       if (cds.FieldByName('DIFERENCA').AsFloat < 0)  and
          (not cds.FieldByName('INDCORRECAO').IsNull) and
          (not cds.FieldByName('DATA_BAIXA').IsNull)  then begin
         fCM := Arredonda(CalcDocumento.CalcCM(ABS(cds.FieldByName('DIFERENCA').AsFloat),
                                               cds.FieldByName('INDCORRECAO').AsInteger,
                                               cds.FieldByName('DATA_BAIXA').AsDateTime + 1,
                                               dAtual ), 2);
         cds.Edit;
         cds.FieldByName('DIF_CORRIG').AsFloat := ABS(cds.FieldByName('DIFERENCA').AsFloat) + fCM;
         cds.Post;
       end;
     end else begin
       if cds.FieldByName('DIFERENCA').AsFloat <> 0 then begin
         cds.Edit;
         cds.FieldByName('DSC_ABONO').AsString := 'Abonado';
         cds.Post;
       end;
     end;

     cds.Next;
   end;
   Result := cds.Data;
   cds.Free;
end;



function TCtrlRelAdminImob.SelecionaRelSeguros(const iIdImovel, iIdSeguradora, iTipo: Integer): OLEVariant;
var sParam, sSql : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovel > 0     then sParam := sParam + ' AND S.IDIMOVEL = ' + IntToStr(iIdImovel);
  if iIdSeguradora > 0 then sParam := sParam + ' AND S.IDSEGURADORA = ' + IntToStr(iIdSeguradora);
  if iTipo = 1         then sParam := sParam + ' AND ( TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',Date)) + ',''DD/MM/YYYY'') BETWEEN S.SGIDATAINI AND S.SGIDATAFIM ) '+#13;
  if iTipo = 2         then sParam := sParam + ' AND ( TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',Date)) + ',''DD/MM/YYYY'') > S.SGIDATAFIM ) '+#13;

  // Define Sql
  sSql := 'SELECT S.IDSEGUROIMOVEL, '+#13+
          '       S.IDIMOVEL,       '+#13+
          '       I.IDIMOVELMESTRE,  '+#13+
          '       (DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, (IM.IMONOME||'' - ''||I.IMONOME))) AS IMOVEL_EXTENSO, '+#13+
          '       S.IDSEGURADORA, PS.NOME AS NF_SEGURADORA, PS.RAZAOSOCIAL AS RS_SEGURADORA, '+#13+
          '       S.SGIAPOLICE, S.SGIREGISTRO, '+#13+
          '       S.SGIDATAINI, S.SGIDATAFIM, '+#13+
          '       S.SGIVLRSEGURO, S.SGIVLRPREMIO, '+#13+
          '       S.SGIRESPSEGURO, S.SGIRESPOUTROS,  '+#13+
          '       DECODE(S.FLGSTATUS,''V'', ''Vigente'', ''Encerrado'') AS STATUS,  '+#13+
          '       S.OBSERVACAO, '+#13+
          '       LMI.LMI_TOTAL, LMI.LMI_FUNDACAO, '+#13+
          '       SC.NOMECOBERTURA, SC.VLRCOBERTURA, SC.VLRFUNDACAO '+#13+
          '  FROM PESSOA PS,           '+#13+
          '       IMOVEL I, IMOVEL IM, '+#13+
          '       SEGUROIMOVEL S, SEGUROIMOXCOB SC,          '+#13+
          '       ( SELECT IDSEGUROIMOVEL,                   '+#13+
          '                MAX(VLRCOBERTURA) AS LMI_TOTAL,   '+#13+
          '                MAX(VLRFUNDACAO)  AS LMI_FUNDACAO '+#13+
          '           FROM SEGUROIMOXCOB            '+#13+
          '          GROUP BY IDSEGUROIMOVEL ) LMI  '+#13+
          ' WHERE S.IDIMOVEL = I.IDIMOVEL           '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL(+) '+#13+
          '   AND S.IDSEGUROIMOVEL = SC.IDSEGUROIMOVEL(+)  '+#13+
          '   AND S.IDSEGUROIMOVEL = LMI.IDSEGUROIMOVEL(+) '+#13+
          '   AND S.IDSEGURADORA = PS.IDPESSOA         '+#13+ sParam +#13+
          ' ORDER BY IMOVEL_EXTENSO, S.IDIMOVEL, S.SGIAPOLICE, S.IDSEGUROIMOVEL, SC.NOMECOBERTURA ';

  Result := GetDataPacket( sSql );
end;


function TCtrlRelAdminImob.SelecionaRelMovFinan(const sTipoImovel: String; const iEmpresa, iMesIni, iAnoIni, iMesFim, iAnoFim: Integer;
                                                const dSldCtb: TDateTime; const bPrevRec, bPrevDesp: Boolean): OLEVariant;
var sParam, sSql : String;
    sAnoMesIni, sAnoMesFim : String;
    CtrlParamCAF : TCtrlParamCAF;
begin
  try
     // Busca o parâmetro de moeda do CAF
     CtrlParamCAF := TCtrlParamCAF.Create;
     CtrlParamCAF.InitializeAs( Self );
     CtrlParamCAF.CarregaProp( iEmpresa );

     // Define Parâmetros
     sParam := '';
     if sTipoImovel <> '' then sParam := sParam + ' AND MEST.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel) +#13;

     // Define AnoMes
     sAnoMesIni := FormatFloat('0000',iAnoIni) + FormatFloat('00',iMesIni);
     sAnoMesFim := FormatFloat('0000',iAnoFim) + FormatFloat('00',iMesFim);

     // Define SQL
     sSql := 'SELECT MEST.CODTIPIMOVEL,   '+#13+
             '       MEST.DESCTIPOIMOVEL, '+#13+
             '       TO_CHAR( TO_DATE(''01/''||TO_CHAR(MEST.MESCOMPETENCIA,''00'')||''/''||TO_CHAR(MEST.ANOCOMPETENCIA,''0000''),''DD/MM/YYYY''), '+#13+
             '                ''MONTH'' ) || '' / '' || TO_CHAR(MEST.ANOCOMPETENCIA,''0000'') AS DESC_COMPETENCIA, '+#13+
             '       TO_CHAR(MEST.ANOCOMPETENCIA,''0000'') || TO_CHAR(MEST.MESCOMPETENCIA,''00'') AS ANOMES, '+#13+
             '       MEST.MESCOMPETENCIA, '+#13+
             '       MEST.ANOCOMPETENCIA, '+#13+
             '       MEST.NOME_MESTRE,    '+#13+
             '       MEST.IDIMOVELMESTRE, '+#13+
             '       MEST.UF,             '+#13+
             '       REAV.VLR_REAVAL,     '+#13+
             '       SLDCTB.VLR_CONTABIL, '+#13+
             '       RECC.TOT_REC_COMP,   '+#13+
             '       RECV.TOT_REC_VENC,   '+#13+
             '       PAGC.TOT_PAG_COMP,   '+#13+
             '       PAGV.TOT_PAG_VENC    '+#13+

             '  FROM ( '+#13+
             '         SELECT L.CODTIPIMOVEL,   '+#13+
             '                L.MESCOMPETENCIA, '+#13+
             '                L.ANOCOMPETENCIA, '+#13+
             '                L.IDIMOVELMESTRE, '+#13+
             '                L.NOME_MESTRE,    '+#13+
             '                T.DESCTIPOIMOVEL, '+#13+
             '                MAX(E.CODESTADO) AS UF '+#13+
             '           FROM VWLANCAMENTO L,   '+#13+
             '                TIPOIMOVEL T,     '+#13+
             '                IMOVEL I,         '+#13+
             '                CIDADES C,        '+#13+
             '                ESTADO E          '+#13+
             '          WHERE ( L.CODTIPIMOVEL = T.CODTIPIMOVEL ) '+#13+
             '            AND ( L.IDIMOVEL  = I.IDIMOVEL )        '+#13+
             '            AND ( I.IDCIDADES = C.IDCIDADES(+) )    '+#13+
             '            AND ( C.IDESTADO  = E.IDESTADO(+) )     '+#13+
             '            AND ( (L.TOT_RECEBER  > 0) OR (L.TOT_PAGAR > 0) ) '+#13+
             '            AND (TO_NUMBER(TO_CHAR(L.ANOCOMPETENCIA,''0000'') || TRIM(TO_CHAR(L.MESCOMPETENCIA,''00''))) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim + ') '+#13+
             '          GROUP BY L.CODTIPIMOVEL, L.MESCOMPETENCIA, L.ANOCOMPETENCIA, L.IDIMOVELMESTRE, L.NOME_MESTRE, T.DESCTIPOIMOVEL '+#13+
             '       ) MEST, '+#13+
             '       (       '+#13+
             '         SELECT CODTIPIMOVEL,   '+#13+
             '                IDIMOVELMESTRE, '+#13+
             '                SUM( IMOVLRREAVAL ) AS VLR_REAVAL '+#13+
             '           FROM IMOVEL          '+#13+
             '          WHERE FLGATIVO = 1    '+#13+
             '            AND IDIMOVELMESTRE IS NOT NULL      '+#13+
             '          GROUP BY CODTIPIMOVEL, IDIMOVELMESTRE '+#13+
             '       ) REAV, '+#13+
             '       (       '+#13+
             '        SELECT /*+ RULE */ I.CODTIPIMOVEL, I.IDIMOVELMESTRE, '+#13+
             '                     ROUND(SUM(NVL(SB1.VALORG,0)) ,2) +      '+#13+
             '                     ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -       '+#13+
             '                     ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) -     '+#13+
             '                     ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) +       '+#13+
             '                     ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +             '+#13+
             '                     ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -               '+#13+
             '                     ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -           '+#13+
             '                     ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2) AS VLR_CONTABIL '+#13+
             '              FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1, IMOVELXBEM IXB, IMOVEL I,                '+#13+
             '                   (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA '+#13+
             '                    FROM SALDOCONTABBEM '+#13+
             '                    WHERE DATASLDBEM <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dSldCtb)) + ',''DD/MM/YYYY'') '+#13+
             '                      AND MOECODIGO =  ' + IntToStr(CtrlParamCAF.MOEDAOFICIAL) +#13+
             '                      AND IDPESSOA  =  ' + IntToStr(iEmpresa) +#13+
             '                    GROUP BY IDBEM, IDPESSOA) MAX1, '+#13+
             '                   BEM B1, GRUPO G1 '+#13+
             '              WHERE B1.DATAINICIODEP <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dSldCtb)) + ',''DD/MM/YYYY'') '+#13+
             '                AND G1.FLGIMOVEL = 1 '+#13+
             '                AND SB1.MOECODIGO =  ' + IntToStr(CtrlParamCAF.MOEDAOFICIAL) +#13+
             '                AND SB1.IDPESSOA  =  ' + IntToStr(iEmpresa) +#13+
             '                AND SD1.IDSLDCTBBEMXDEP = 1 '+#13+
             '                AND B1.IDPESSOA =  ' + IntToStr(iEmpresa) +#13+
             '                AND SB1.IDBEM = MAX1.IDBEM              '+#13+
             '                AND SB1.IDPESSOA = MAX1.IDPESSOA        '+#13+
             '                AND SB1.DATASLDBEM = MAX1.DATA          '+#13+
             '                AND SB1.IDBEM = SD1.IDBEM               '+#13+
             '                AND SB1.IDPESSOA = SD1.IDPESSOA         '+#13+
             '                AND SB1.DATASLDBEM = SD1.DATASLDBEM     '+#13+
             '                AND SB1.MOECODIGO = SD1.MOECODIGO       '+#13+
             '                AND SB1.IDBEM = B1.IDBEM                '+#13+
             '                AND SB1.IDPESSOA = B1.IDPESSOA          '+#13+
             '                AND SB1.IDGRUPO = G1.IDGRUPO            '+#13+
             '                AND B1.IDBEM = IXB.IDBEM                '+#13+
             '                AND IXB.IDIMOVEL = I.IDIMOVEL           '+#13+
             '              GROUP BY I.CODTIPIMOVEL, I.IDIMOVELMESTRE '+#13+
             '       ) SLDCTB, '+#13+
             '       (         '+#13+
             '         SELECT CODTIPIMOVEL,   '+#13+
             '                MESCOMPETENCIA, '+#13+
             '                ANOCOMPETENCIA, '+#13+
             '                IDIMOVELMESTRE, '+#13+
             '                SUM( VLRLANCRECEB + (TOT_ALTERADOR * VLRLANCRECEB / TOT_RECEBER) ) AS TOT_REC_COMP '+#13+
             '           FROM VWLANCAMENTO     '+#13+
             '          WHERE RECPAG = ''R''   '+#13+
             '            AND VLRLANCRECEB > 0 '+#13+
             '            AND TO_NUMBER(TO_CHAR(ANOCOMPETENCIA,''0000'') || TRIM(TO_CHAR(MESCOMPETENCIA,''00''))) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim  +#13+
             '          GROUP BY CODTIPIMOVEL, MESCOMPETENCIA, ANOCOMPETENCIA, IDIMOVELMESTRE '+#13+
             '       ) RECC, '+#13;
     if bPrevRec  then sSql := sSql +
             '       (       '+#13+
             '         SELECT CODTIPIMOVEL,   '+#13+
             '                IDIMOVELMESTRE, '+#13+
             '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''MM''))   AS MESCOMPETENCIA, '+#13+
             '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''YYYY'')) AS ANOCOMPETENCIA, '+#13+
             '                SUM( ((TOT_RECEBER+TOT_ALTERADOR) * VLRLANCRECEB / TOT_RECEBER) ) AS TOT_REC_VENC '+#13+
             '           FROM VWLANCAMENTO     '+#13+
             '          WHERE RECPAG = ''R''   '+#13+
             '            AND TOT_RECEBER  > 0 '+#13+
             '            AND TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''YYYYMM'')) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim +#13+
             '          GROUP BY CODTIPIMOVEL, TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''MM'')),    '+#13+
             '                   TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''YYYY'')), IDIMOVELMESTRE '+#13
     else sSql := sSql +
             '       (       '+#13+
             '         SELECT L.CODTIPIMOVEL,   '+#13+
             '                L.IDIMOVELMESTRE, '+#13+
             '                TO_NUMBER(TO_CHAR(BX.DATABAIXA,''MM''))   AS MESCOMPETENCIA,  '+#13+
             '                TO_NUMBER(TO_CHAR(BX.DATABAIXA,''YYYY'')) AS ANOCOMPETENCIA,  '+#13+
             '                SUM( (BX.TOT_RECEBIDO * L.VLRLANCRECEB / L.TOT_RECEBER) ) AS TOT_REC_VENC '+#13+
             '           FROM VWLANCAMENTO L,  '+#13+
             '                (  '+#13+
             '                SELECT D.CODDOCUMENTO, MAX(LD.DATALANCTO) AS DATABAIXA,  '+#13+
             '                       SUM(LD.VALOR) AS TOT_RECEBIDO '+#13+
             '                  FROM DOCUMENTO D, LANCTODOCUM LD   '+#13+
             '                 WHERE ( D.IDMODULO IN (54,64) )     '+#13+
             '                   AND ( D.RECPAG = ''R'' )          '+#13+
             '                   AND ( RTRIM(LD.OPERACAO) = ''5'' )'+#13+
             '                   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )  '+#13+
             '                 GROUP BY D.CODDOCUMENTO  '+#13+
             '                 ) BX  '+#13+
             '          WHERE L.RECPAG = ''R''    '+#13+
             '            AND BX.TOT_RECEBIDO > 0 '+#13+
             '            AND L.CODDOCUMENTO = BX.CODDOCUMENTO '+#13+
             '            AND TO_NUMBER(TO_CHAR(BX.DATABAIXA,''YYYYMM'')) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim +#13+
             '          GROUP BY L.CODTIPIMOVEL, TO_NUMBER(TO_CHAR(BX.DATABAIXA,''MM'')),    '+#13+
             '                   TO_NUMBER(TO_CHAR(BX.DATABAIXA,''YYYY'')), L.IDIMOVELMESTRE '+#13;
     sSql := sSql +
             '       ) RECV, '+#13+
             '       (       '+#13+
             '         SELECT CODTIPIMOVEL,   '+#13+
             '                MESCOMPETENCIA, '+#13+
             '                ANOCOMPETENCIA, '+#13+
             '                IDIMOVELMESTRE, '+#13+
             '                SUM( VLRLANCPAGAR + (TOT_ALTERADOR * VLRLANCPAGAR / TOT_PAGAR) ) AS TOT_PAG_COMP '+#13+
             '           FROM VWLANCAMENTO     '+#13+
             '          WHERE RECPAG = ''P''   '+#13+
             '            AND VLRLANCPAGAR > 0 '+#13+
             '            AND TO_NUMBER(TO_CHAR(ANOCOMPETENCIA,''0000'') || TRIM(TO_CHAR(MESCOMPETENCIA,''00''))) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim +#13+
             '          GROUP BY CODTIPIMOVEL, MESCOMPETENCIA, ANOCOMPETENCIA, IDIMOVELMESTRE '+#13+
             '       ) PAGC, '+#13+
             '       (       '+#13+
             '         SELECT CODTIPIMOVEL,   '+#13+
             '                IDIMOVELMESTRE, '+#13;
     if bPrevDesp then sSql := sSql +
             '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''MM''))   AS MESCOMPETENCIA, '+#13+
             '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''YYYY'')) AS ANOCOMPETENCIA, '+#13+
             '                SUM( ((TOT_PAGAR+TOT_ALTERADOR) * VLRLANCPAGAR / TOT_PAGAR) ) AS TOT_PAG_VENC '+#13+
             '           FROM VWLANCAMENTO   '+#13+
             '          WHERE RECPAG = ''P'' '+#13+
             '            AND TOT_PAGAR > 0  '+#13+
             '            AND TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''YYYYMM'')) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim +#13+
             '          GROUP BY CODTIPIMOVEL, TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''MM'')),    '+#13+
             '                   TO_NUMBER(TO_CHAR(DATAVENCIMENTO,''YYYY'')), IDIMOVELMESTRE '+#13
     else sSql := sSql +
             '                TO_NUMBER(TO_CHAR(DATA_BAIXA,''MM''))   AS MESCOMPETENCIA, '+#13+
             '                TO_NUMBER(TO_CHAR(DATA_BAIXA,''YYYY'')) AS ANOCOMPETENCIA, '+#13+
             '                SUM( (TOT_PAGO * VLRLANCPAGAR / TOT_PAGAR) ) AS TOT_PAG_VENC '+#13+
             '           FROM VWLANCAMENTO   '+#13+
             '          WHERE RECPAG = ''P'' '+#13+
             '            AND TOT_PAGO > 0   '+#13+
             '            AND TO_NUMBER(TO_CHAR(DATA_BAIXA,''YYYYMM'')) BETWEEN ' + sAnoMesIni + ' AND ' + sAnoMesFim +#13+
             '          GROUP BY CODTIPIMOVEL, TO_NUMBER(TO_CHAR(DATA_BAIXA,''MM'')),    '+#13+
             '                   TO_NUMBER(TO_CHAR(DATA_BAIXA,''YYYY'')), IDIMOVELMESTRE '+#13;
     sSql := sSql +
             '       ) PAGV '+#13+
             ' WHERE MEST.CODTIPIMOVEL   = REAV.CODTIPIMOVEL(+)     '+#13+
             '   AND MEST.IDIMOVELMESTRE = REAV.IDIMOVELMESTRE(+)   '+#13+
             '   AND MEST.CODTIPIMOVEL   = SLDCTB.CODTIPIMOVEL(+)   '+#13+
             '   AND MEST.IDIMOVELMESTRE = SLDCTB.IDIMOVELMESTRE(+) '+#13+
             '   AND MEST.CODTIPIMOVEL   = RECC.CODTIPIMOVEL(+)   '+#13+
             '   AND MEST.IDIMOVELMESTRE = RECC.IDIMOVELMESTRE(+) '+#13+
             '   AND MEST.MESCOMPETENCIA = RECC.MESCOMPETENCIA(+) '+#13+
             '   AND MEST.ANOCOMPETENCIA = RECC.ANOCOMPETENCIA(+) '+#13+
             '   AND MEST.CODTIPIMOVEL   = RECV.CODTIPIMOVEL(+)   '+#13+
             '   AND MEST.IDIMOVELMESTRE = RECV.IDIMOVELMESTRE(+) '+#13+
             '   AND MEST.MESCOMPETENCIA = RECV.MESCOMPETENCIA(+) '+#13+
             '   AND MEST.ANOCOMPETENCIA = RECV.ANOCOMPETENCIA(+) '+#13+
             '   AND MEST.CODTIPIMOVEL   = PAGC.CODTIPIMOVEL(+)   '+#13+
             '   AND MEST.IDIMOVELMESTRE = PAGC.IDIMOVELMESTRE(+) '+#13+
             '   AND MEST.MESCOMPETENCIA = PAGC.MESCOMPETENCIA(+) '+#13+
             '   AND MEST.ANOCOMPETENCIA = PAGC.ANOCOMPETENCIA(+) '+#13+
             '   AND MEST.CODTIPIMOVEL   = PAGV.CODTIPIMOVEL(+)   '+#13+
             '   AND MEST.IDIMOVELMESTRE = PAGV.IDIMOVELMESTRE(+) '+#13+
             '   AND MEST.MESCOMPETENCIA = PAGV.MESCOMPETENCIA(+) '+#13+
             '   AND MEST.ANOCOMPETENCIA = PAGV.ANOCOMPETENCIA(+) '+#13+ sParam +

             ' ORDER BY MEST.DESCTIPOIMOVEL, MEST.CODTIPIMOVEL, MEST.ANOCOMPETENCIA, MEST.MESCOMPETENCIA, '+#13+
             '          MEST.NOME_MESTRE,  MEST.IDIMOVELMESTRE ';

     Result := GetDataPacket( sSql );
  finally
     FreeAndNil( CtrlParamCAF );
  end;
end;


function TCtrlRelAdminImob.SelecionaRelLancForaComp(const iIdUsuario, iIdFavorecido, iIdTipoRecDesp: integer;
                                                    const dDataIniLib, dDataFimLib, dDataIniLanc, dDataFimLanc: TDateTime): OLEVariant;

var sParam, sSql : String;

begin
  // Define Parâmetros
  sParam := '';

  if iIdUsuario     > 0 then sParam := sParam + ' AND CD.IDUSUARIO = ' + IntToStr(iIdUsuario) + #13;
  if iIdFavorecido  > 0 then sParam := sParam + ' AND L.IDFORCLI = ' + IntToStr(iIdFavorecido) + #13;
  if iIdTipoRecDesp > 0 then sParam := sParam + ' AND L.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoRecDesp) + #13;

  if (dDataIniLib > 0)  and (dDataFimLib > 0)  then sParam := sParam + ' AND CD.DATA BETWEEN TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIniLib)) + ',''DD/MM/YYYY'') AND ' + #13+
                                                                       ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFimLib)) + ',''DD/MM/YYYY'') ' + #13;

  if (dDataIniLanc > 0) and (dDataFimLanc > 0) then sParam := sParam + ' AND L.DATALANCAMENTO BETWEEN TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIniLanc)) + ',''DD/MM/YYYY'') AND ' + #13+
                                                                       ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFimLanc)) + ',''DD/MM/YYYY'') ' +#13;

  // Define Sql
  sSql := 'SELECT L.IDDOCUMENTO,    L.DATALANCAMENTO, '        +#13+
          '       L.MESCOMPETENCIA, L.ANOCOMPETENCIA, '        +#13+
          '       PF.NOME AS CLIENTE,                 '        +#13+
          '       PU.NOME AS USUARIO,                 '        +#13+
          '       CD.MOTIVO,                          '        +#13+
          '       CD.DATA,                            '        +#13+
          '       TC.DESCCUSTORECIMO,                 '        +#13+
          '       SUM(DECODE(L.RECPAG, ''P'', NVL(L.VLRLANCPAGAR,0), NVL(L.VLRLANCRECEB,0))) AS VALOR ' +#13+
          '  FROM LANCAMENTOSIMOVEL L, TIPOCUSTORECIMOV TC,  ' +#13+
          '       CONCILIADOC CD,      PESSOA PF,            ' +#13+
          '       PESSOA PU                                  ' +#13+
          ' WHERE L.IDDOCUMENTO       = CD.IDDOCUMENTO       ' +#13+
          '   AND L.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO ' +#13+
          '   AND L.IDFORCLI          = PF.IDPESSOA          ' +#13+
          '   AND CD.IDUSUARIO        = PU.IDPESSOA          ' +#13+
          '   AND CD.FLGTIPO          = ''L''                ' +#13+
          '   AND ( TO_NUMBER(TO_CHAR(L.DATALANCAMENTO,''YYYY'')) <> L.ANOCOMPETENCIA ' +#13+
          '         OR TO_NUMBER(TO_CHAR(L.DATALANCAMENTO,''MM'')) <> L.MESCOMPETENCIA )' +#13+
          sParam +
          'GROUP BY L.IDDOCUMENTO,    L.DATALANCAMENTO,      ' +#13+
          '         L.MESCOMPETENCIA, L.ANOCOMPETENCIA,      ' +#13+
          '         PF.NOME,                                 ' +#13+
          '         PU.NOME,                                 ' +#13+
          '         CD.MOTIVO,                               ' +#13+
          '         CD.DATA,                                 ' +#13+
          '         TC.DESCCUSTORECIMO                       ' ;

  Result := GetDataPacket( sSql );
end;

function TCtrlRelAdminImob.SelecionaHistorico(const iEmpresa, iIdImovelMestre, iIdContrato, iIdLocatario, iAnoInicial, iAnoFinal: Integer;
                                              const bSemContrato: Boolean): OLEVariant;
var sSql, sParam : string;
begin

  sParam := '';

  if iIdImovelMestre > 0 then
    sParam := sParam + ' AND LI.IDIMOVELMESTRE = ' + IntToStr(iIdImovelMestre) +#13;

  if iIdContrato > 0 then
    sParam := sParam + ' AND LI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +#13;

  if iIdLocatario > 0 then
    sParam := sParam + ' AND LI.IDFORCLI = ' + IntToStr(iIdLocatario) +#13;

  if iAnoInicial > 0 then
    sParam := sParam + ' AND ( ((TI.FLGTIPOINTERNO <> ''P'') AND (TO_NUMBER(TO_CHAR(LD.DATALANCTO,''YYYY'')) >= ' + IntToStr(iAnoInicial) + ')) OR    ' +#13+
                       '       ((TI.FLGTIPOINTERNO =  ''P'') AND (TO_NUMBER(TO_CHAR(LI.DATAVENCIMENTO,''YYYY'')) >= ' + IntToStr(iAnoInicial) + ')) ) ' +#13;

  if iAnoFinal > 0 then
    sParam := sParam + ' AND ( ((TI.FLGTIPOINTERNO <> ''P'') AND (TO_NUMBER(TO_CHAR(LD.DATALANCTO,''YYYY'')) <= ' + IntToStr(iAnoFinal) + ')) OR    ' +#13+
                       '       ((TI.FLGTIPOINTERNO =  ''P'') AND (TO_NUMBER(TO_CHAR(LI.DATAVENCIMENTO,''YYYY'')) <= ' + IntToStr(iAnoFinal) + ')) ) ' +#13;

  if bSemContrato then
    sParam := sParam + ' AND LI.IDCONTRATOIMOVEL IS NULL ' +#13;

  sSql := 'SELECT IM.IMONOME AS NOME_MESTRE,                   '+#13+
          '       LI.IDIMOVELMESTRE,                           '+#13+
          '       CI.CONNOME,                                  '+#13+
          '       CI.CONNUMERO,                                '+#13+
          '       CI.IDCONTRATOIMOVEL,                         '+#13+
          '       T.DESCCUSTORECIMO,                           '+#13+
          '       TO_CHAR(PG.DATALANCTO,''YYYY'') AS ANOPAGTO, '+#13+
          '       PG.DATALANCTO,                               '+#13+
          '       LI.DATAVENCIMENTO,                           '+#13+
          '       TO_CHAR(LI.MESCOMPETENCIA,''00'') || ''/'' || TO_CHAR(LI.ANOCOMPETENCIA) AS COMPETENCIA, '+#13+
          '       D.CODDOCUMENTO,                              '+#13+
          '       NVL(LI.VLRRECEB,0) AS VLRRECEB,              '+#13+
          '       NVL(PG.VLRPAGO,0)  AS VLRPAGO,               '+#13+
          '       SUM( DECODE(RTRIM(LD.OPERACAO),''4'',        '+#13+
          '                   DECODE(LD.CODALTERADOR,TI.CODALTJUROS,LD.VALOR,0),0 ) )   AS JUROS,    '+#13+
          '       SUM( DECODE(RTRIM(LD.OPERACAO),''4'',                                              '+#13+
          '                   DECODE(LD.CODALTERADOR,TI.CODALTMULTA,LD.VALOR,0),0 ) )   AS MULTA,    '+#13+
          '       SUM( DECODE(RTRIM(LD.OPERACAO),''4'',                                              '+#13+
          '                   DECODE(LD.CODALTERADOR,TI.CODALTCORRMON,LD.VALOR,0),0 ) ) AS CORRECAO, '+#13+
          '       SUM( DECODE(RTRIM(LD.OPERACAO),''4'',                                              '+#13+
          '                   DECODE(LD.CODALTERADOR,TI.CODALTJUROS,0,                               '+#13+
          '                   DECODE(LD.CODALTERADOR,TI.CODALTMULTA,0,                               '+#13+
          '                   DECODE(LD.CODALTERADOR,TI.CODALTCORRMON,0,                             '+#13+
          '                     DECODE(LD.DEBCRE, ''C'', LD.VALOR *(-1), LD.VALOR) ))),0 ) ) AS OUTROS '+#13+
          '  FROM TIPOCUSTORECIMOV T, DOCUMENTO D, LANCTODOCUM LD, TIPOIMOVEL TI,      '+#13+
          '       CONTRATOIMOVEL CI, IMOVEL IM,                                        '+#13+
          '       /* TOTALIZA LANCAMENTOSIMOVEL */                                     '+#13+
          '       ( SELECT L.CODDOCUMENTO, L.IDCONTRATOIMOVEL, I.IDIMOVELMESTRE,       '+#13+
          '                L.IDTIPOCUSTORECIMO, L.DATAVENCIMENTO, L.CODTIPIMOVEL,      '+#13+
          '                L.MESCOMPETENCIA, L.ANOCOMPETENCIA,                         '+#13+
          '                L.IDFORCLI, SUM(L.VLRLANCRECEB) AS VLRRECEB                 '+#13+
          '           FROM LANCAMENTOSIMOVEL L, IMOVEL I                               '+#13+
          '          WHERE L.IDIMOVEL = I.IDIMOVEL                                     '+#13+
          '            AND L.RECPAG   = ''R''                                          '+#13+
          '            AND L.IDPESSOA = ' + IntToStr(iEmpresa)                          +#13+
          '          GROUP BY L.CODDOCUMENTO, L.IDCONTRATOIMOVEL, I.IDIMOVELMESTRE,    '+#13+
          '                   L.IDTIPOCUSTORECIMO, L.DATAVENCIMENTO, L.CODTIPIMOVEL,   '+#13+
          '                   L.MESCOMPETENCIA, L.ANOCOMPETENCIA, L.IDFORCLI ) LI,     '+#13+
          '       /* VALOR PAGO */                                                     '+#13+
          '       (SELECT LD2.CODDOCUMENTO, LD2.DATALANCTO, SUM(LD2.VALOR) AS VLRPAGO  '+#13+
          '          FROM LANCTODOCUM LD2, DOCUMENTO D                                 '+#13+
          '         WHERE LD2.CODDOCUMENTO = D.CODDOCUMENTO                            '+#13+

          '           AND ( LD2.ESTORNO IS NULL ) '+#13+ // Daniel - 25717

          '           AND RTRIM(LD2.OPERACAO) = ''5'' /*VLR RECEBIDO*/                 '+#13+
          '           AND D.IDPESSOA = ' + IntToStr(iEmpresa)                           +#13+
          '           AND D.IDMODULO = 64                                              '+#13+
          '        GROUP BY LD2.CODDOCUMENTO, LD2.DATALANCTO                           '+#13+
          '        ORDER BY CODDOCUMENTO) PG                                           '+#13+
          ' WHERE ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )    '+#13+
          '   AND ( LI.IDCONTRATOIMOVEL  = CI.IDCONTRATOIMOVEL(+) ) '+#13+
          '   AND ( LI.IDIMOVELMESTRE    = IM.IDIMOVEL(+) )         '+#13+
          '   AND ( LI.CODTIPIMOVEL      = TI.CODTIPIMOVEL )        '+#13+

          '   AND ( LD.ESTORNO IS NULL ) '+#13+ // Daniel - 25717

          '   AND ( (LD.OPERACAO IS NULL) OR (RTRIM(LD.OPERACAO) IN(''4'',''5'' )) )   '+#13+
          '   AND ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+) )      '+#13+
          '   AND ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+) )     '+#13+
          '   AND ( D.CODDOCUMENTO       = PG.CODDOCUMENTO(+) )     '+#13+ sParam + #13+
          'GROUP BY IM.IMONOME, LI.IDIMOVELMESTRE, CI.CONNOME, CI.CONNUMERO, CI.IDCONTRATOIMOVEL, '+#13+
          '         T.DESCCUSTORECIMO, TO_CHAR(PG.DATALANCTO,''YYYY''), PG.DATALANCTO, LI.DATAVENCIMENTO, '+#13+
          '         TO_CHAR(LI.MESCOMPETENCIA,''00'') || ''/'' || TO_CHAR(LI.ANOCOMPETENCIA), ' +#13+
          '         D.CODDOCUMENTO, NVL(LI.VLRRECEB,0), NVL(PG.VLRPAGO,0)      ' +#13+
          //Taffarel - SIG82302 - início
          //'ORDER BY NOME_MESTRE, CONNOME, IDCONTRATOIMOVEL, ANOPAGTO, DATALANCTO ';
          'ORDER BY NOME_MESTRE, CONNOME, IDCONTRATOIMOVEL, ANOPAGTO, ' +#13+
          '         TO_CHAR(LI.MESCOMPETENCIA,''00'') || ''/'' || TO_CHAR(LI.ANOCOMPETENCIA), ' +#13+
          '         DATALANCTO ';
          //Taffarel - SIG82302 - fim

  Result := GetDataPacket( sSql );
end;

function TCtrlRelAdminImob.SelecionaRelEventos( const iIdContratoImovel: integer; const dDataIni, dDataFim: TDateTime; const sFlgTipoEvento : string ): OLEVariant;
var
  sParam,
  sSQL : String;
begin

  sParam := '';

  if iIdContratoImovel > 0 then
    sParam := sParam + ' AND CI.IDCONTRATOIMOVEL = ' + IntToStr( iIdContratoImovel );

  if ( dDataIni > 0 ) and ( dDataFim > 0 ) then
    sParam := sParam + ' AND EI.EVIDATA BETWEEN TO_DATE(' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDataIni ) ) +
                        ', ''DD/MM/YYYY'' ) AND TO_DATE(' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDataFim ) ) +
                        ', ''DD/MM/YYYY'' ) ';

  if sFlgTipoEvento <> '' then
    sParam := sParam + ' AND EI.FLGTIPOEVENTO = ' + QuotedStr( sFlgTipoEvento );

  sSQL :=
   ' SELECT   CI.CONNUMERO || ''   -   '' || CI.CONNOME AS CONTRATO,                            ' +
   '          PE.NOME AS LOCATARIO,                                                             ' +
   '          EI.FLGTIPOEVENTO,                                                                 ' +
   '          DECODE ( EI.FLGTIPOEVENTO, ''RE'', ''Renegociação Contratual'',                   ' +
   '                                     ''AD'', ''Aditivo Contratual'',                        ' +
   '                                     ''EC'', ''Encerramento Contratual'',                   ' +
   '                                     ''RC'', ''Rescisão Contratual'',                       ' +
   '                                     ''RM'', ''Remembramento de Imóvel'',                   ' +
   '                                     ''CA'', ''Contrato de Alienação'',                     ' +
   '                                     ''RV'', ''Reavaliação Oficial do Imovel'',             ' +
   '                                     ''AQ'', ''Aquisição do Imóvel'',                       ' +
   '                                     ''BD'', ''Baixa por Desmembramento'',                  ' +
   '                                     ''BO'', ''Baixa por Encerramento de Obra'',            ' +
   '                                     ''SU'', ''Suspensão Contratual'',                      ' +
   '                                     ''RJ'', ''Reajuste Contratual'',                       ' +
   '                                     ''RN'', ''Renovação Contratual'',                      ' +
   '                                     ''PC'', ''Prorrogação Contratual'',                    ' +
   '                                     ''DM'', ''Desmembramento de Imóvel'',                  ' +
   '                                     ''TT'', ''Transferência de Tipo de Imóvel'',           ' +
   '                                     ''US'', ''Evento do Usuário ( NULL )'',                ' +
   '                                     ''VM'', ''Reavaliação Valor de Mercado'',              ' +
   '                                     ''AC'', ''Acréscimo de Valores'',                      ' +
   '                                     ''ED'', ''Entrada por Desmembramento'',                ' +
   '                                     ''EO'', ''Entrada por Encerramento de Obra'',          ' +
   '                                     ''CS'', ''Cancelamento da Suspensão'' ) AS TIPOEVENTO, ' +
   '          EI.EVIDATA,                                                                       ' +
   '          EI.EVIDESCRICAO,                                                                  ' +
   '          MO.MOESIGLA,                                                                      ' +
   '          MAX( EI.EVIPERCENT ) AS FATOR,                                                    '  +
   '          SUM( EI.EVIVLRANTERIOR ) AS VALOR_ANTERIOR,                                       '  +
   '          SUM( EI.EVIVLRAJUSTADO ) AS VALOR_ATUAL                                           ' +
   ' FROM     CONTRATOIMOVEL CI,                                                                ' +
   '          PESSOA         PE,                                                                ' +
   '          EVENTOIMOVEL   EI,                                                                ' +
   '          MOEDA          MO                                                                 ' +
   ' WHERE    CI.IDLOCATARIO       = PE.IDPESSOA                                                ' +
   '   AND    CI.IDCONTRATOIMOVEL  = EI.IDCONTRATOIMOVEL                                        ' +
   '   AND    EI.EVIINDICEREAJUSTE = MO.MOECODIGO (+)                                           ' +
   '   AND    CI.FLGTIPOCONTRATO   = ''L''                                                      ' +
   '   AND    EI.IDIMOVEL IS NULL                                                               ' +
   '   AND    EI.IDCONTRATOLOJA IS NULL                                                         ' +
   sParam                                                                                         +
   ' GROUP BY CI.CONNUMERO,                                                                     ' +
   '          CI.CONNOME,                                                                       ' +
   '          PE.NOME,                                                                          ' +
   '          EI.FLGTIPOEVENTO,                                                                 ' +
   '          EI.EVIDATA,                                                                       ' +
   '          EI.EVIDESCRICAO,                                                                  ' +
   '          MO.MOESIGLA                                                                       ' +
   ' ORDER BY CI.CONNUMERO || '' / '' || CI.CONNOME,                                            ' +
   '          EI.EVIDATA                                                                        ' ;

  Result := GetDataPacket( sSQL );
end;

// Daniel - 24881 - Início -----------------------------------------------------
function TCtrlRelAdminImob.SelecionaRelFolhaRec(const iMestre,iContrato,iMes,iAno,iModulo:Integer;
                                                const dDataIni,dDataFim:TDateTime;
                                                const sTipoImovel:String): OLEVariant;
var sSql, sParam, sParam2 : String;
begin
  sSql    := '';
  sParam  := '';
  sParam2 := '';

  if (iMestre>0) then begin
    sParam  := sParam  + '  AND ( I.IDIMOVELMESTRE    = '   + QuotedStr(IntToStr(iMestre)) + ' ) ' +#13;
    sParam2 := sParam2 + '  AND ( CONT.IDIMOVELMESTRE   = ' + QuotedStr(IntToStr(iMestre)) + ' ) ' +#13;
  end;

  if (iContrato>0) then begin
    sParam  := sParam  + '  AND ( C.IDCONTRATOIMOVEL  = '   + QuotedStr(IntToStr(iContrato)) + ' ) ' +#13;
    sParam2 := sParam2 + '  AND ( CONT.IDCONTRATOIMOVEL = ' + QuotedStr(IntToStr(iContrato)) + ' ) ' +#13;
  end;

  if (sTipoImovel<>'') then begin
    sParam  := sParam  + '  AND ( LI.CODTIPIMOVEL     = '   + QuotedStr(sTipoImovel) + ' ) ' +#13;
    sParam2 := sParam2 + '  AND ( CONT.CODTIPIMOVEL     = ' + QuotedStr(sTipoImovel) + ' ) ' +#13;
  end;

  if (iMes>0) and (iAno>0) then begin
    sParam  := sParam  + '  AND ( LI.MESCOMPETENCIA   = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( LI.ANOCOMPETENCIA   = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;

    sParam2 := sParam2 + '  AND ( CONT.MESCOMPETENCIA   = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( CONT.ANOCOMPETENCIA   = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;
  end;

  if (dDataIni>0) and (dDataFim>0) then begin
    sParam  := sParam+'  AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                      ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13;

    sParam2 := sParam2+'  AND ( CONT.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                       ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13;
  end else begin
    if (dDataIni>0) then begin
      sParam  :=
        sParam+'  AND ( LI.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13;

      sParam2 :=
        sParam2+'  AND ( CONT.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13;
    end else begin
      if (dDataFim>0) then begin
        sParam  :=
          sParam+'  AND ( LI.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;

        sParam2 :=
          sParam2+'  AND ( CONT.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;
      end;
    end;
  end;

  sSql := 'SELECT CONT.IDIMOVELMESTRE, CONT.NOME_MESTRE,    CONT.IDCONTRATOIMOVEL, CONT.CONNUMERO, ' +#13+
          '       CONT.CONNOME,        CONT.DATAVENCIMENTO, CONT.IDPESSOA, '                         +#13+
          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL, '                                  +#13+
          '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU, '                                     +#13+
          '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO, '                                   +#13+
          '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO, '                                    +#13+
          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+SUM(NVL(IPTU.VLR_IPTU,0))+'                        +
          'SUM(NVL(SEGURO.VLR_SEGURO,0))+SUM(NVL(OUTRO.VLR_OUTRO,0)) AS VLR_TOTAL '                  +#13+
          'FROM ( SELECT I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, LI.IDCONTRATOIMOVEL, '         +#13+
          '              LI.DATAVENCIMENTO, C.CONNUMERO, C.CONNOME, LI.MESCOMPETENCIA, '             +#13+
          '              LI.ANOCOMPETENCIA, LI.CODTIPIMOVEL, LI.IDPESSOA '                           +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM '    +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+sParam+
          '       GROUP BY I.IDIMOVELMESTRE, IM.IMONOME, LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, '   +#13+
          '                C.CONNUMERO, C.CONNOME, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, '           +#13+
          '                LI.CODTIPIMOVEL, LI.IDPESSOA ) CONT, '                                    +#13+

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, I.IDIMOVELMESTRE, ' +#13+ // Daniel - 27389
          '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_ALUGUEL '       +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '            +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '       +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '      +#13+
          '                                           AND P.IDREPORTS      = 20340 '                 +#13+
          '                                           AND P.TIPOINTERNO    = 1 /* Aluguel */ '       +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)     +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                I.IDIMOVELMESTRE ) ALUGUEL, '                                             +#13+ // Daniel - 27389

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, I.IDIMOVELMESTRE, ' +#13+ // Daniel - 27389
          '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_IPTU '          +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '            +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '       +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '      +#13+
          '                                           AND P.IDREPORTS   = 20340 '                    +#13+
          '                                           AND P.TIPOINTERNO = 2 /* IPTU */ '             +#13+
          '                                           AND P.IDMODULO    = '+IntToStr(iModulo)        +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                I.IDIMOVELMESTRE ) IPTU, '                                                +#13+ // Daniel - 27389

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, I.IDIMOVELMESTRE, ' +#13+ // Daniel - 27389
          '            (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_SEGURO '         +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '            +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '       +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '      +#13+
          '                                           AND P.IDREPORTS   = 20340 '                    +#13+
          '                                           AND P.TIPOINTERNO = 3 /* Seguro */ '           +#13+
          '                                           AND P.IDMODULO    = '+IntToStr(iModulo)        +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                I.IDIMOVELMESTRE ) SEGURO, '                                              +#13+ // Daniel - 27389

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, I.IDIMOVELMESTRE, ' +#13+ // Daniel - 27389
          '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_OUTRO '         +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '        +#13+
          '                                             FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '   +#13+
          '                                             WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '  +#13+
          '                                               AND P.IDREPORTS   = 20340 '                +#13+
          '                                               AND P.TIPOINTERNO IN(1,2,3) /* Outras */ ' +#13+
          '                                               AND P.IDMODULO    = '+IntToStr(iModulo)    +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                I.IDIMOVELMESTRE ) OUTRO '                                                +#13+ // Daniel - 27389

          'WHERE 1=1 '                                                                               +#13+
          '  AND CONT.IDCONTRATOIMOVEL = ALUGUEL.IDCONTRATOIMOVEL(+) '                               +#13+
          '  AND CONT.DATAVENCIMENTO   = ALUGUEL.DATAVENCIMENTO(+) '                                 +#13+
          '  AND CONT.IDIMOVELMESTRE   = ALUGUEL.IDIMOVELMESTRE(+) '                                 +#13+ // Daniel - 27389
          '  AND CONT.IDCONTRATOIMOVEL = IPTU.IDCONTRATOIMOVEL(+) '                                  +#13+
          '  AND CONT.DATAVENCIMENTO   = IPTU.DATAVENCIMENTO(+) '                                    +#13+
          '  AND CONT.IDIMOVELMESTRE   = IPTU.IDIMOVELMESTRE(+) '                                    +#13+ // Daniel - 27389
          '  AND CONT.IDCONTRATOIMOVEL = SEGURO.IDCONTRATOIMOVEL(+) '                                +#13+
          '  AND CONT.DATAVENCIMENTO   = SEGURO.DATAVENCIMENTO(+) '                                  +#13+
          '  AND CONT.IDIMOVELMESTRE   = SEGURO.IDIMOVELMESTRE(+) '                                  +#13+ // Daniel - 27389
          '  AND CONT.IDCONTRATOIMOVEL = OUTRO.IDCONTRATOIMOVEL(+) '                                 +#13+
          '  AND CONT.DATAVENCIMENTO   = OUTRO.DATAVENCIMENTO(+) '                                   +#13+
          '  AND CONT.IDIMOVELMESTRE   = OUTRO.IDIMOVELMESTRE(+) '                                   +#13+ // Daniel - 27389
          'GROUP BY CONT.NOME_MESTRE, CONT.IDIMOVELMESTRE, CONT.IDCONTRATOIMOVEL, CONT.CONNUMERO, '  +#13+
          '         CONT.CONNOME,     CONT.DATAVENCIMENTO, CONT.IDPESSOA '                           +#13+
          'ORDER BY NOME_MESTRE, IDIMOVELMESTRE, CONNUMERO, IDCONTRATOIMOVEL, DATAVENCIMENTO '       +#13;

  Result := GetDataPacket(sSql);
end;

function TCtrlRelAdminImob.LookupTipoImovel: OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT TI.CODTIPIMOVEL,      TI.DESCTIPOIMOVEL, TI.IDGRUPOTERRENO, TI.IDGRUPOEDIFICACAO, ' +#13+
          '       TI.IDGRUPOINST,       TI.IDGRUPOELET,    TI.IDGRUPOAR,      TI.IDGRUPOVEICULO, '    +#13+
          '       TI.IDGRUPOUTILITARIO, TI.IDGRUPOMAQUINA, TI.IDGRUPOMOVEL,   TI.CODALTMULTA, '       +#13+
          '       TI.CODALTJUROS,       TI.CODALTCORRMON,  TAM.DESCRICAO AS ALTERADOR_MULTA, '        +#13+
          '       TAJ.DESCRICAO AS ALTERADOR_JUROS,        TAR.DESCRICAO AS ALTERADOR_CORRECAO '      +#13+
          'FROM TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTERADOR TAR '              +#13+
          'WHERE 1=1 '                                                                                +#13+
          '  AND ( TI.CODALTMULTA   = TAM.CODALTERADOR(+) ) '                                         +#13+
          '  AND ( TI.CODALTJUROS   = TAJ.CODALTERADOR(+) ) '                                         +#13+
          '  AND ( TI.CODALTCORRMON = TAR.CODALTERADOR(+) ) '                                         +#13+
          'ORDER BY DESCTIPOIMOVEL '                                                                  +#13;

  Result := GetDataPacket(sSql);
end;

function TCtrlRelAdminImob.SelecionaSegmento(const iMestre,iContrato,iMes,iAno,iModulo:Integer;
                                             const dDataIni,dDataFim:TDateTime;
                                             const sTipoImovel:String): OLEVariant;
var sSql, sParam, sParam2 : String;
begin
  sSql    := '';
  sParam  := '';
  sParam2 := '';

  if (iMestre>0) then begin
    sParam  := sParam  + '  AND ( I.IDIMOVELMESTRE    = '   + QuotedStr(IntToStr(iMestre)) + ' ) ' +#13;
    sParam2 := sParam2 + '  AND ( CONT.IDIMOVELMESTRE   = ' + QuotedStr(IntToStr(iMestre)) + ' ) ' +#13;
  end;

  if (iContrato>0) then begin
    sParam  := sParam  + '  AND ( C.IDCONTRATOIMOVEL  = '   + QuotedStr(IntToStr(iContrato)) + ' ) ' +#13;
    sParam2 := sParam2 + '  AND ( CONT.IDCONTRATOIMOVEL = ' + QuotedStr(IntToStr(iContrato)) + ' ) ' +#13;
  end;

  if (sTipoImovel<>'') then begin
    sParam  := sParam  + '  AND ( LI.CODTIPIMOVEL     = '   + QuotedStr(sTipoImovel) + ' ) ' +#13;
    sParam2 := sParam2 + '  AND ( CONT.CODTIPIMOVEL     = ' + QuotedStr(sTipoImovel) + ' ) ' +#13;
  end;

  if (iMes>0) and (iAno>0) then begin
    sParam  := sParam  + '  AND ( LI.MESCOMPETENCIA   = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( LI.ANOCOMPETENCIA   = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;

    sParam2 := sParam2 + '  AND ( CONT.MESCOMPETENCIA   = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( CONT.ANOCOMPETENCIA   = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;
  end;

  if (dDataIni>0) and (dDataFim>0) then begin
    sParam  := sParam+'  AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                      ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13;

    sParam2 := sParam2+'  AND ( CONT.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                       ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13;
  end else begin
    if (dDataIni>0) then begin
      sParam  :=
        sParam+'  AND ( LI.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13;

      sParam2 :=
        sParam2+'  AND ( CONT.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13;
    end else begin
      if (dDataFim>0) then begin
        sParam  :=
          sParam+'  AND ( LI.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;

        sParam2 :=
          sParam2+'  AND ( CONT.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;
      end;
    end;
  end;

  sSql := 'SELECT CONT.CODTIPIMOVEL, CONT.DESCTIPOIMOVEL, '                                          +#13+
          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL, '                                  +#13+
          '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU, '                                     +#13+
          '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO, '                                   +#13+
          '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO, '                                    +#13+
          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+SUM(NVL(IPTU.VLR_IPTU,0))+'                        +
          'SUM(NVL(SEGURO.VLR_SEGURO,0))+SUM(NVL(OUTRO.VLR_OUTRO,0)) AS VLR_TOTAL '                  +#13+
          'FROM ( SELECT I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, LI.IDCONTRATOIMOVEL, '         +#13+
          '              LI.DATAVENCIMENTO, C.CONNUMERO, C.CONNOME, LI.MESCOMPETENCIA, '             +#13+
          '              LI.ANOCOMPETENCIA, LI.CODTIPIMOVEL, T.DESCTIPOIMOVEL '                      +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '            TIPOIMOVEL T '                                                                +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) ) '                                +#13+
          '       GROUP BY I.IDIMOVELMESTRE, IM.IMONOME, LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, '   +#13+
          '                C.CONNUMERO, C.CONNOME, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, '           +#13+
          '                LI.CODTIPIMOVEL, T.DESCTIPOIMOVEL ) CONT, '                               +#13+

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, T.DESCTIPOIMOVEL, ' +#13+
          '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_ALUGUEL '       +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '            TIPOIMOVEL T, '                                                               +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) ) '                                +#13+
          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '            +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '       +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '      +#13+
          '                                           AND P.IDREPORTS      = 20340 '                 +#13+
          '                                           AND P.TIPOINTERNO    = 1 /* Aluguel */ '       +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)     +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                T.DESCTIPOIMOVEL ) ALUGUEL, '                                             +#13+

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, T.DESCTIPOIMOVEL, ' +#13+
          '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_IPTU '          +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '            TIPOIMOVEL T, '                                                               +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) ) '                                +#13+
          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '            +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '       +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '      +#13+
          '                                           AND P.IDREPORTS   = 20340 '                    +#13+
          '                                           AND P.TIPOINTERNO = 2 /* IPTU */ '             +#13+
          '                                           AND P.IDMODULO    = '+IntToStr(iModulo)        +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,  LI.IDDOCUMENTO, '                +#13+
          '                T.DESCTIPOIMOVEL ) IPTU, '                                                +#13+

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, T.DESCTIPOIMOVEL, ' +#13+
          '            (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_SEGURO '         +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '            TIPOIMOVEL T, '                                                               +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                            +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) ) '                                +#13+
          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '            +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '       +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '      +#13+
          '                                           AND P.IDREPORTS   = 20340 '                    +#13+
          '                                           AND P.TIPOINTERNO = 3 /* Seguro */ '           +#13+
          '                                           AND P.IDMODULO    = '+IntToStr(iModulo)        +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                T.DESCTIPOIMOVEL ) SEGURO, '                                              +#13+

          '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, T.DESCTIPOIMOVEL, ' +#13+
          '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_OUTRO '         +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '   +#13+
          '            TIPOIMOVEL T, '                                                               +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                       +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                    +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                       +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                   +#13+
          '       WHERE ( LI.RECPAG = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                               +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                       +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                      +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                            +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                +#13+sParam+
          '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) ) '                                +#13+
          '         AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '        +#13+
          '                                             FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '   +#13+
          '                                             WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '  +#13+
          '                                               AND P.IDREPORTS   = 20340 '                +#13+
          '                                               AND P.TIPOINTERNO IN(1,2,3) /* Outras */ ' +#13+
          '                                               AND P.IDMODULO    = '+IntToStr(iModulo)    +#13+
          '                                        ) ) '                                             +#13+
          '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '                 +#13+
          '                T.DESCTIPOIMOVEL ) OUTRO '                                                +#13+

          'WHERE 1=1 '                                                                               +#13+sParam2+
          '  AND CONT.IDCONTRATOIMOVEL = ALUGUEL.IDCONTRATOIMOVEL(+) '                               +#13+
          '  AND CONT.DATAVENCIMENTO   = ALUGUEL.DATAVENCIMENTO(+) '                                 +#13+
          '  AND CONT.IDCONTRATOIMOVEL = IPTU.IDCONTRATOIMOVEL(+) '                                  +#13+
          '  AND CONT.DATAVENCIMENTO   = IPTU.DATAVENCIMENTO(+) '                                    +#13+
          '  AND CONT.IDCONTRATOIMOVEL = SEGURO.IDCONTRATOIMOVEL(+) '                                +#13+
          '  AND CONT.DATAVENCIMENTO   = SEGURO.DATAVENCIMENTO(+) '                                  +#13+
          '  AND CONT.IDCONTRATOIMOVEL = OUTRO.IDCONTRATOIMOVEL(+) '                                 +#13+
          '  AND CONT.DATAVENCIMENTO   = OUTRO.DATAVENCIMENTO(+) '                                   +#13+
          'GROUP BY CONT.CODTIPIMOVEL, CONT.DESCTIPOIMOVEL '                                         +#13+
          'ORDER BY DESCTIPOIMOVEL '                                                                 +#13;

  Result := GetDataPacket(sSql);
end;
// Daniel - 24881 - Fim --------------------------------------------------------

// Daniel - 24879 - Início -----------------------------------------------------
function TCtrlRelAdminImob.SelecionaRelFolhaVencimento(const iMestre,iMes,iAno,iModulo:Integer;
                                                       const dDataIni,dDataFim:TDateTime): OLEVariant;
var sSql, sParam, sParam2 : String;
begin
  sSql    := '';
  sParam  := '';
  sParam2 := '';

  if (iMestre>0) then sParam  := sParam+'  AND ( I.IDIMOVELMESTRE    = '+QuotedStr(IntToStr(iMestre))+' ) '+#13;

  if (iMes>0) and (iAno>0) then begin
    sParam  := sParam  + '  AND ( LI.MESCOMPETENCIA = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( LI.ANOCOMPETENCIA = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;

    sParam2 := sParam2 + '  AND ( CONT.MESCOMPETENCIA = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( CONT.ANOCOMPETENCIA = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;
  end;

  if (dDataIni>0) and (dDataFim>0) then begin
    sParam  := sParam+'  AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                      ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13;

    sParam2 := sParam2+'  AND ( CONT.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                       ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13;
  end else begin
    if (dDataIni>0) then begin
      sParam  :=
        sParam+'  AND ( LI.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13;

      sParam2 :=
        sParam2+'  AND ( CONT.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13;
    end else begin
      if (dDataFim>0) then begin
        sParam  :=
          sParam+'  AND ( LI.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;

        sParam2 :=
          sParam2+'  AND ( CONT.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;
      end;
    end;
  end;

  sSql := 'SELECT CONT.DATAVENCIMENTO, CONT.QTDE, 1 AS GRUPO, '                                                +#13+
          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL, '                                            +#13+
          '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU, '                                               +#13+
          '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO, '                                             +#13+
          '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO, '                                              +#13+

          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+ '                                                           +#13+
          '       SUM(NVL(IPTU.VLR_IPTU,0))+ '                                                                 +#13+
          '       SUM(NVL(SEGURO.VLR_SEGURO,0))+ '                                                             +#13+
          '       SUM(NVL(OUTRO.VLR_OUTRO,0)) AS VLR_TOTAL, '                                                  +#13+

          '       ROUND((SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+ '                                                    +#13+
          '              SUM(NVL(IPTU.VLR_IPTU,0))+ '                                                          +#13+
          '              SUM(NVL(SEGURO.VLR_SEGURO,0))+ '                                                      +#13+
          '              SUM(NVL(OUTRO.VLR_OUTRO,0)) * 100) / MIN(TOT.VLR_TOTAL) ,4) AS PER_REC, '             +#13+

          '       NVL(PAG.VLR_PAGO,0) AS VLR_PAGO, '                                                           +#13+

          '       ROUND((NVL(PAG.VLR_PAGO,0) * 100) / (NVL(SUM(ALUGUEL.VLR_ALUGUEL),0)+ '                      +#13+
          '                                            NVL(SUM(IPTU.VLR_IPTU),0)+ '                            +#13+
          '                                            NVL(SUM(SEGURO.VLR_SEGURO),0)+ '                        +#13+
          '                                            NVL(SUM(OUTRO.VLR_OUTRO),0)) ,2) AS PER_PAGO, '         +#13+

          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+ '                                                           +#13+
          '       SUM(NVL(IPTU.VLR_IPTU,0))+ '                                                                 +#13+
          '       SUM(NVL(SEGURO.VLR_SEGURO,0))+ '                                                             +#13+
          '       SUM(NVL(OUTRO.VLR_OUTRO,0)) - NVL(PAG.VLR_PAGO,0) AS VLR_ABERTO, '                           +#13+

          '       100 - ROUND((NVL(PAG.VLR_PAGO,0) * 100) / (NVL(SUM(ALUGUEL.VLR_ALUGUEL),0)+ '                +#13+
          '                                                  NVL(SUM(IPTU.VLR_IPTU),0)+ '                      +#13+
          '                                                  NVL(SUM(SEGURO.VLR_SEGURO),0)+ '                  +#13+
          '                                                  NVL(SUM(OUTRO.VLR_OUTRO),0)) ,2) AS PER_ABERTO '  +#13+

          'FROM ( SELECT DOC.DATAVENCIMENTO, DOC.MESCOMPETENCIA, '                                             +#13+
          '              DOC.ANOCOMPETENCIA, COUNT(DOC.IDDOCUMENTO) AS QTDE '                                  +#13+
          '       FROM ( SELECT LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.IDDOCUMENTO '      +#13+
          '              FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I '                               +#13+
          '              WHERE ( LI.RECPAG           = ''R'' ) '                                               +#13+
          '                AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                          +#13+
          '                AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                  +#13+
          '                AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                       +#13+

          sParam+

          '              GROUP BY LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.IDDOCUMENTO '    +#13+
          '     ) DOC /* FIM DOC */ '                                                                          +#13+
          '       GROUP BY DOC.DATAVENCIMENTO, DOC.MESCOMPETENCIA, DOC.ANOCOMPETENCIA ) CONT, /* FIM CONT */ ' +#13+

          '     ( SELECT SUM(DOC.VLR_TOTAL) AS VLR_TOTAL '                                                     +#13+
          '       FROM ( SELECT LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, LI.IDDOCUMENTO, '     +#13+
          '                    (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_TOTAL '            +#13+
          '              FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                              +#13+
          '                 ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                          +#13+
          '                   FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                       +#13+
          '                   WHERE A.CODALTERADOR = T.CODALTERADOR '                                          +#13+
          '                     AND T.ACRESDECRES  = ''C'' '                                                   +#13+
          '                   GROUP BY IDDOCUMENTO ) DE '                                                      +#13+
          '              WHERE ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                   +#13+
          '                AND ( LI.RECPAG           = ''R'' ) '                                               +#13+
          '                AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                          +#13+
          '                AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                  +#13+
          '                AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                       +#13+

          sParam+

          '              GROUP BY LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, '                   +#13+
          '                       LI.IDDOCUMENTO ) DOC /* FIM DOC/TOT */ '                                     +#13+
          '     ) TOT, /* FIM TOT */ '                                                                         +#13+

          '     ( SELECT DOC.DATAVENCIMENTO, SUM(L.VALOR) AS VLR_PAGO '                                        +#13+
          '       FROM LANCTODOCUM L, '                                                                        +#13+
          '          ( SELECT LI.DATAVENCIMENTO, LI.CODDOCUMENTO '                                             +#13+
          '            FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I '                                 +#13+
          '            WHERE ( LI.RECPAG           = ''R'' ) '                                                 +#13+
          '              AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                            +#13+
          '              AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                    +#13+
          '              AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                         +#13+

          sParam+

          '            GROUP BY LI.DATAVENCIMENTO, LI.CODDOCUMENTO ) DOC /* FIM DOC/PAG */ '                   +#13+
          '       WHERE DOC.CODDOCUMENTO = L.CODDOCUMENTO '                                                    +#13+
          '         AND TRIM(L.OPERACAO) = 5 '                                                                 +#13+
          '         AND L.ESTORNO IS NULL '                                                                    +#13+
          '       GROUP BY DOC.DATAVENCIMENTO ) PAG, /* FIM PAG */ '                                           +#13+

          '     ( SELECT LI.DATAVENCIMENTO, '                                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_ALUGUEL '                     +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                        +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                              +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                      +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '                 +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '                +#13+
          '                                           AND P.IDREPORTS      = 20341 '                           +#13+
          '                                           AND P.TIPOINTERNO    = 1 /* Aluguel */ '                 +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)               +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY LI.DATAVENCIMENTO ) ALUGUEL, '                                                      +#13+

          '     ( SELECT LI.DATAVENCIMENTO, '                                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_IPTU '                        +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                        +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                              +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                      +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '                 +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '                +#13+
          '                                           AND P.IDREPORTS      = 20341 '                           +#13+
          '                                           AND P.TIPOINTERNO    = 2 /* IPTU */ '                    +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)               +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY LI.DATAVENCIMENTO ) IPTU, '                                                         +#13+

          '     ( SELECT LI.DATAVENCIMENTO, '                                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_SEGURO '                      +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                        +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                              +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                      +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '                 +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '                +#13+
          '                                           AND P.IDREPORTS      = 20341 '                           +#13+
          '                                           AND P.TIPOINTERNO    = 3 /* Seguro */ '                  +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)               +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY LI.DATAVENCIMENTO ) SEGURO, '                                                       +#13+

          '     ( SELECT LI.DATAVENCIMENTO, '                                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_OUTRO '                       +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                        +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                              +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                  +#13+
          '                                             FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '             +#13+
          '                                             WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '            +#13+
          '                                               AND P.IDREPORTS      = 20341 '                       +#13+
          '                                               AND P.TIPOINTERNO    IN(1,2,3) /* Outras */ '        +#13+
          '                                               AND P.IDMODULO       = '+IntToStr(iModulo)           +#13+
          '                                            ) ) '                                                   +#13+
          '       GROUP BY LI.DATAVENCIMENTO ) OUTRO '                                                         +#13+
          'WHERE 1=1 '                                                                                         +#13+
          '  AND CONT.DATAVENCIMENTO   = ALUGUEL.DATAVENCIMENTO(+) '                                           +#13+
          '  AND CONT.DATAVENCIMENTO   = IPTU.DATAVENCIMENTO(+) '                                              +#13+
          '  AND CONT.DATAVENCIMENTO   = SEGURO.DATAVENCIMENTO(+) '                                            +#13+
          '  AND CONT.DATAVENCIMENTO   = OUTRO.DATAVENCIMENTO(+) '                                             +#13+
          '  AND CONT.DATAVENCIMENTO   = PAG.DATAVENCIMENTO(+) '                                               +#13+
          'GROUP BY CONT.DATAVENCIMENTO, CONT.QTDE, PAG.VLR_PAGO '                                             +#13+
          'ORDER BY DATAVENCIMENTO '                                                                           +#13;

  Result := GetDataPacket(sSql);
end;
// Daniel - 24879 - Fim --------------------------------------------------------

// Daniel - 24880 - Início -----------------------------------------------------
function TCtrlRelAdminImob.SelecionaRelFolhaRecSint(const iMestre,iContrato,iMes,iAno,iModulo:Integer;
                                                    const dDataIni,dDataFim:TDateTime;
                                                    const sTipoImovel:String): OLEVariant;
var sSql, sParam, sParam2 : String;
begin
  sSql    := '';
  sParam  := '';
  sParam2 := '';

  if (iMestre>0) then
    sParam  := sParam  + '  AND ( I.IDIMOVELMESTRE    = '   + QuotedStr(IntToStr(iMestre)) + ' ) ' +#13;

  if (iContrato>0) then
    sParam  := sParam  + '  AND ( C.IDCONTRATOIMOVEL  = '   + QuotedStr(IntToStr(iContrato)) + ' ) ' +#13;

  if (sTipoImovel<>'') then
    sParam  := sParam  + '  AND ( LI.CODTIPIMOVEL     = '   + QuotedStr(sTipoImovel) + ' ) ' +#13;

  if (iMes>0) and (iAno>0) then
    sParam  := sParam  + '  AND ( LI.MESCOMPETENCIA   = ' + QuotedStr(IntToStr(iMes)) + ' ) ' +#13+
                         '  AND ( LI.ANOCOMPETENCIA   = ' + QuotedStr(IntToStr(iAno)) + ' ) ' +#13;

  if (dDataIni>0) and (dDataFim>0) then
    sParam  := sParam+'  AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+
                      ' ) AND TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) )' +#13
  else begin
    if (dDataIni>0) then
      sParam  :=
        sParam+'  AND ( LI.DATAVENCIMENTO >= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataIni))+' ) ) '+#13
    else begin
      if (dDataFim>0) then
        sParam  :=
          sParam+'  AND ( LI.DATAVENCIMENTO <= TO_DATE( '+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataFim))+' ) ) '+#13;
    end;
  end;

  sSql := 'SELECT CONT.CODTIPIMOVEL,   CONT.IDIMOVELMESTRE, CONT.NOME_MESTRE, CONT.QTDE, '                     +#13+
          '       CONT.DESCTIPOIMOVEL, CONT.IDPESSOA,       MIN(TOT.VLR_TOTAL) AS VALORTOTAL, '                +#13+
          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL, '                                            +#13+
          '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU, '                                               +#13+
          '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO, '                                             +#13+
          '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO, '                                              +#13+

          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+'                                                            +
          'SUM(NVL(IPTU.VLR_IPTU,0))+'                                                                         +
          'SUM(NVL(SEGURO.VLR_SEGURO,0))+'                                                                     +
          'SUM(NVL(OUTRO.VLR_OUTRO,0)) AS VLR_TOTAL, '                                                         +#13+

          '       ROUND((SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+'                                                     +
          'SUM(NVL(IPTU.VLR_IPTU,0))+'                                                                         +
          'SUM(NVL(SEGURO.VLR_SEGURO,0))+'                                                                     +
          'SUM(NVL(OUTRO.VLR_OUTRO,0)) * 100) / MIN(TOT.VLR_TOTAL) ,4) AS PER_REC, '                           +#13+

          '       NVL(PAG.VLR_PAGO,0) AS VLR_PAGO, '                                                           +#13+

          '       ROUND((NVL(PAG.VLR_PAGO,0) * 100) / (NVL(SUM(ALUGUEL.VLR_ALUGUEL),0)+ '                      +
          'NVL(SUM(IPTU.VLR_IPTU),0)+'                                                                         +
          'NVL(SUM(SEGURO.VLR_SEGURO),0)+'                                                                     +
          'NVL(SUM(OUTRO.VLR_OUTRO),0)) ,2) AS PER_PAGO, '                                                     +#13+

          '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+'                                                            +
          'SUM(NVL(IPTU.VLR_IPTU,0))+'                                                                         +
          'SUM(NVL(SEGURO.VLR_SEGURO,0))+'                                                                     +
          'SUM(NVL(OUTRO.VLR_OUTRO,0)) - NVL(PAG.VLR_PAGO,0) AS VLR_ABERTO, '                                  +#13+

          '       100 - ROUND((NVL(PAG.VLR_PAGO,0) * 100) / (NVL(SUM(ALUGUEL.VLR_ALUGUEL),0)+'                 +
          'NVL(SUM(IPTU.VLR_IPTU),0)+'                                                                         +
          'NVL(SUM(SEGURO.VLR_SEGURO),0)+'                                                                     +
          'NVL(SUM(OUTRO.VLR_OUTRO),0)) ,2) AS PER_ABERTO '                                                    +#13+

          'FROM ( SELECT DOC.IDIMOVELMESTRE, DOC.NOME_MESTRE, DOC.DESCTIPOIMOVEL, '                            +#13+
          '              DOC.CODTIPIMOVEL, DOC.IDPESSOA, COUNT(DOC.IDDOCUMENTO) AS QTDE '                      +#13+
          '       FROM ( SELECT I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, LI.IDCONTRATOIMOVEL, '            +#13+
          '                     LI.CODTIPIMOVEL, LI.IDPESSOA, LI.IDDOCUMENTO, T.DESCTIPOIMOVEL '               +#13+
          '              FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                 +#13+
          '                   IMOVEL IM, TIPOIMOVEL T '                                                        +#13+
          '              WHERE ( LI.RECPAG           = ''R'' ) '                                               +#13+
          '                AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                  +#13+
          '                AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                   +#13+
          '                AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL ) '                                      +#13+
          '                AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                          +#13+
          '                AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                         +#13+
          '                AND ( C.FLGTIPOCONTRATO   IN (''L'',''D'') ) '                                      +#13+

          sParam+

          '              GROUP BY I.IDIMOVELMESTRE, IM.IMONOME, LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, '        +#13+
          '                       LI.IDPESSOA, LI.IDDOCUMENTO, T.DESCTIPOIMOVEL  ) DOC /* FIM DOC */ '         +#13+
          '       GROUP BY DOC.IDIMOVELMESTRE, DOC.NOME_MESTRE, DOC.DESCTIPOIMOVEL, DOC.CODTIPIMOVEL, '        +#13+
          '                DOC.IDPESSOA ) CONT, /* FIM CONT */ '                                               +#13+

          '     ( SELECT SUM(DOC.VLR_TOTAL) AS VLR_TOTAL '                                                     +#13+
          '       FROM ( SELECT LI.CODTIPIMOVEL, LI.IDDOCUMENTO, '                                             +#13+
          '                    (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)) AS VLR_TOTAL '            +#13+
          '              FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, '                              +#13+
          '                 ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                          +#13+
          '                   FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                       +#13+
          '                   WHERE A.CODALTERADOR = T.CODALTERADOR '                                          +#13+
          '                     AND T.ACRESDECRES  = ''C'' '                                                   +#13+
          '                   GROUP BY IDDOCUMENTO ) DE '                                                      +#13+
          '              WHERE ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                   +#13+
          '                AND ( LI.RECPAG           = ''R'' ) '                                               +#13+
          '                AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                          +#13+
          '                AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                  +#13+
          '                AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                       +#13+

          sParam+

          '              GROUP BY LI.CODTIPIMOVEL, LI.IDDOCUMENTO ) DOC /* FIM DOC/TOT */  ) TOT, /* TOT */ '  +#13+

          '     ( SELECT DOC.IDIMOVELMESTRE, DOC.CODTIPIMOVEL, SUM(L.VALOR) AS VLR_PAGO '                      +#13+
          '       FROM LANCTODOCUM L, '                                                                        +#13+
          '          ( SELECT I.IDIMOVELMESTRE, LI.CODTIPIMOVEL, LI.CODDOCUMENTO '                             +#13+
          '            FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I '                                 +#13+
          '            WHERE ( LI.RECPAG           = ''R'' ) '                                                 +#13+
          '              AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                            +#13+
          '              AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                    +#13+
          '              AND ( C.FLGTIPOCONTRATO   IN(''L'',''D'') ) '                                         +#13+

          sParam+

          '            GROUP BY I.IDIMOVELMESTRE, LI.CODTIPIMOVEL, LI.CODDOCUMENTO ) DOC /* FIM DOC/PAG */ '   +#13+
          '       WHERE DOC.CODDOCUMENTO = L.CODDOCUMENTO '                                                    +#13+
          '         AND TRIM(L.OPERACAO) = 5 '                                                                 +#13+
          '         AND L.ESTORNO IS NULL '                                                                    +#13+
          '       GROUP BY DOC.IDIMOVELMESTRE, DOC.CODTIPIMOVEL ) PAG, /* FIM PAG */ '                         +#13+

          '     ( SELECT I.IDIMOVELMESTRE, LI.CODTIPIMOVEL, '                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_ALUGUEL '                     +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '             +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                                +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                                      +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                      +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '                 +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '                +#13+
          '                                           AND P.IDREPORTS      = 20342 '                           +#13+
          '                                           AND P.TIPOINTERNO    = 1 /* Aluguel */ '                 +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)               +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY I.IDIMOVELMESTRE, LI.CODTIPIMOVEL ) ALUGUEL, '                                      +#13+

          '     ( SELECT I.IDIMOVELMESTRE, LI.CODTIPIMOVEL, '                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_IPTU '                        +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '             +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                                +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                                      +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                      +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '                 +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '                +#13+
          '                                           AND P.IDREPORTS      = 20342 '                           +#13+
          '                                           AND P.TIPOINTERNO    = 2 /* IPTU */ '                    +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)               +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY I.IDIMOVELMESTRE, LI.CODTIPIMOVEL ) IPTU, '                                         +#13+

          '     ( SELECT I.IDIMOVELMESTRE, LI.CODTIPIMOVEL, '                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_SEGURO '                      +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '             +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG           = ''R'' ) '                                                      +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                                +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                                      +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                      +#13+
          '                                         FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '                 +#13+
          '                                         WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '                +#13+
          '                                           AND P.IDREPORTS      = 20342 '                           +#13+
          '                                           AND P.TIPOINTERNO    = 3 /* Seguro */ '                  +#13+
          '                                           AND P.IDMODULO       = '+IntToStr(iModulo)               +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY I.IDIMOVELMESTRE, LI.CODTIPIMOVEL ) SEGURO, '                                       +#13+

          '     ( SELECT I.IDIMOVELMESTRE, LI.CODTIPIMOVEL, '                                                  +#13+
          '              SUM(NVL(LI.VLRLANCRECEB,0) - NVL(DE.TOT_DESC,0)) AS VLR_OUTRO '                       +#13+
          '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, '             +#13+
          '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC '                                 +#13+
          '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '                                              +#13+
          '            WHERE A.CODALTERADOR = T.CODALTERADOR '                                                 +#13+
          '              AND T.ACRESDECRES  = ''C'' '                                                          +#13+
          '            GROUP BY IDDOCUMENTO ) DE '                                                             +#13+
          '       WHERE ( LI.RECPAG = ''R'' ) '                                                                +#13+
          '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '                                         +#13+
          '         AND ( LI.IDIMOVEL         = I.IDIMOVEL ) '                                                 +#13+
          '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL ) '                                                +#13+
          '         AND ( C.FLGTIPOCONTRATO   = ''L'' ) '                                                      +#13+
          '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '                                          +#13+
          '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '                                          +#13+

          sParam+

          '         AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT I.IDTIPOCUSTORECIMO '                  +#13+
          '                                             FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I '             +#13+
          '                                             WHERE P.IDPROCESSOIMOB = I.IDPROCESSOIMOB '            +#13+
          '                                               AND P.IDREPORTS      = 20342 '                       +#13+
          '                                               AND P.TIPOINTERNO    IN(1,2,3) /* Outras */ '        +#13+
          '                                               AND P.IDMODULO       = '+IntToStr(iModulo)           +#13+
          '                                        ) ) '                                                       +#13+
          '       GROUP BY I.IDIMOVELMESTRE, LI.CODTIPIMOVEL ) OUTRO '                                         +#13+
          'WHERE 1=1 '                                                                                         +#13+
          '  AND CONT.IDIMOVELMESTRE = ALUGUEL.IDIMOVELMESTRE(+) '                                             +#13+
          '  AND CONT.IDIMOVELMESTRE = IPTU.IDIMOVELMESTRE(+) '                                                +#13+
          '  AND CONT.IDIMOVELMESTRE = SEGURO.IDIMOVELMESTRE(+) '                                              +#13+
          '  AND CONT.IDIMOVELMESTRE = OUTRO.IDIMOVELMESTRE(+) '                                               +#13+
          '  AND CONT.IDIMOVELMESTRE = PAG.IDIMOVELMESTRE(+) '                                                 +#13+
          'GROUP BY CONT.CODTIPIMOVEL, CONT.DESCTIPOIMOVEL, CONT.IDIMOVELMESTRE, CONT.NOME_MESTRE, '           +#13+
          '         CONT.QTDE, CONT.IDPESSOA, PAG.VLR_PAGO '                                                   +#13+
          'ORDER BY CONT.NOME_MESTRE '                                                                         +#13;

  Result := GetDataPacket(sSql);
end;
// Daniel - 24880 - Fim --------------------------------------------------------

end.
