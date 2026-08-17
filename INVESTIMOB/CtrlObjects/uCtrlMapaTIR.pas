// -----------------------------------------------------------------------------
// Pendência : 22126
// Autor     : Daniel Simões
// Data      : 20/04/2006
// Descrição : Passa a exibir a TIR para Imoveis Inativos...
// -----------------------------------------------------------------------------

unit uCtrlMapaTIR;

interface

Uses SysUtils, uCmControlObject, uCmClientDataSet, uCmTypes, vcf1, Math,
     uDiasUteis, JCLSysUtils, classes, uCMFileUtils, uCtrlParcFinancImov;

Type
  TCtrlMapaTIR = class(TCmControlObject)

  protected
    procedure AfterInitialize; override;

  private
    DiasUteis : TDiasUteis;
    CtrlParcFinancImov : TCtrlParcFinancImov;

  public
    constructor Create;  override;
    destructor  Destroy; override;



    function RecuperaPatrosPlanos : OleVariant;

    function DadosRelatorio(const iTipoSegmento, iIdEmpresa, iIdMoedaCAF, iIdPaisCAF : integer;
                            const dDtIni, dDtFim : TDateTime; const sPatroPlano : string; Const bCotas: Boolean = False  ) : OleVariant;

    function DadosAlienacao( dDtIni, dDtFim : TDateTime; sPatroPlano : string ) : OleVariant;

    function DadosAlienacaoCota( dDtIni, dDtFim : TDateTime; sPatroPlano : string ) : OleVariant;

    function DadosFundoImob( dDtIni, dDtFim : TDateTime; sPatroPlano : string ) : OleVariant;

    function RecuperaUltAvaliacaoData( iTipoSegmento : integer; dData : TDateTime; sPatroPlano : string = ''; iIdMestre : Integer = -1; bCotas: Boolean = False ) : OLEVariant;

    function CalculaRentabilidade( fSeqVal : array of extended; const dIni: TDateTime; const iQtdeDias:Integer; const iDiaAprop:Integer = 1; const bTIRDiaria: Boolean = True) : extended;

    function ElevaBase( fBase : extended; iExpoente: integer ): extended;

    function CalculaTIR( fSeqVal : array of extended; const dIni:TDateTime; const iQtdeDias:Integer; const iDiaAprop:integer = 1; const bTIRDiaria: Boolean = True) : extended;

    function CalculaVPL( Taxa : extended; fSeqVal : array of extended ) : extended;

    function ReceitaLiquidaMesAMes( iTipoSegmento : integer; dData : TDateTime; bApenasAdminImob, bDesdeInicioAno : boolean; sPatroPlano : string = ''; sIdSegmento : string = ''; bCotas : Boolean = False ) : OLEVariant;

    function ReceitaAlienacaoMesAMes( dData : TDateTime; sPatroPlano : string; bCotas : Boolean = False ) : OLEVariant;

    function ReceitaAlienacaoDiaADia( dData : TDateTime; sPatroPlano : string ) : OLEVariant;    

    function ReceitaFundoImobMesAMes( dData : TDateTime; sPatroPlano : string; bCotas : Boolean = False ) : OLEVariant;

    function CalcSaldoDevedor( const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1 ) : extended;

    function RateiaSaldoAlienacao( iContrato: Integer; fSaldo : extended ) : OLEVariant;

    function RecuperaUltAvalFundoImob( dData : TDateTime; sPatroPlano : string ) : OLEVariant;

    function ListaTiposImoveis : OleVariant;

    function DadosTIRPorProjeto(const iMes, iAno: Integer; const sCodTipImovel : string = '') : OLEVariant;

  published

  end;


function Inteiro( Value : extended ) : integer;


implementation

{ TCtrlMapaTIR }

constructor TCtrlMapaTIR.Create;
begin
  inherited;
  DiasUteis := TDiasUteis.Create;
  CtrlParcFinancImov := TCtrlParcFinancImov.Create;
end;

procedure TCtrlMapaTIR.AfterInitialize;
begin
  inherited;
  DiasUteis.InitializeAs( Self );
  CtrlParcFinancImov.InitializeAs( Self );
end;

destructor TCtrlMapaTIR.Destroy;
begin
  FreeAndNil( DiasUteis );
  FreeAndNil( CtrlParcFinancImov );
  inherited;
end;



function TCtrlMapaTIR.CalculaRentabilidade(fSeqVal: array of extended;
                                           const dIni: TDateTime; const iQtdeDias, iDiaAprop:Integer;
                                           const bTIRDiaria: Boolean ): extended;
var
  fTIR  : extended;
begin
  Result := 0;
  fTIR   := CalculaTIR( fSeqVal, dIni, iQtdeDias, iDiaAprop, bTIRDiaria );
  if bTIRDiaria then begin
     Result := ( ElevaBase( ( 1 + fTIR ), iQtdeDias ) - 1 ) * 100;
  end else begin
     Result := ( ElevaBase( ( 1 + fTIR ), 12 ) - 1 ) * 100;
  end;
end;

function TCtrlMapaTIR.CalculaTIR(fSeqVal: array of extended; const dIni: TDateTime;
                                 const iQtdeDias, iDiaAprop: integer;
                                 const bTIRDiaria : Boolean ): extended;
var
  i, iSeq, iQtdeMeses : integer;
  Formula1: TF1Book;
  fTIR : extended;
  sFormula : string;
  dDiaLanc : TDateTime;
  iDia, iMes, iAno : Word;
begin
  Formula1 := TF1Book.Create( nil );
  try
    try
      // Vinícius - 23/11/2004
      // Se o fluxo para calculo da TIR for diária deverá conter uma célula para cada dia, mesmo com
      // valor Zero. As receitas devem ser apropriadas no dia definido, e a valor do
      // patrimônio do final do fluxo é atribuído no último dia do período.
      Formula1.ClearRange(-1, -1, -1, -1, F1ClearValues );

      if bTIRDiaria then begin
         // Adiciona o Valor da Ultima Reavaliação
         iSeq := 0;
         Formula1.NumberRC[ 1, 1 ] := fSeqVal[iSeq];

         // Apropria as receitas mês a mês no dia definido, e zero nos demais dias do mês
         dDiaLanc := dIni;
         for i := 1 to (iQtdeDias - 1) do begin
            DecodeDate(dDiaLanc, iAno, iMes, iDia);
            if iDia = iDiaAprop then begin
               Inc(iSeq);
               Formula1.NumberRC[ i + 1, 1 ] := fSeqVal[iSeq];
            end else begin
               Formula1.NumberRC[ i + 1, 1 ] := 0;
            end;
            dDiaLanc := dDiaLanc + 1;
         end;

         // Adiciona a Reavaliação no último dia do último mês
         Inc(iSeq);
         Formula1.NumberRC[ i + 1, 1 ] := fSeqVal[iSeq];
         sFormula := 'IRR(A1:A' + IntToStr( iQtdeDias + 1 ) + ';0,001)';
         Formula1.FormulaRC[ i + 2, 1 ] := sFormula;
         Formula1.Recalc;
         Result := Formula1.NumberRC[ i + 2, 1 ];

      end else begin
         for i := 0 to High( fSeqVal ) do begin
           Formula1.NumberRC[ i + 1, 1 ] := fSeqVal[i];
         end;
         sFormula := 'IRR(A1:A' + IntToStr( length( fSeqVal ) ) + ';0,001)';
         Formula1.FormulaRC[ i + 1, 1 ] := sFormula;
         Formula1.Recalc;
         Result := Formula1.NumberRC[ i + 1, 1 ];
      end;
    except
      Result := 0;
    end;
  finally
    Formula1.Free;
  end;
end;

function TCtrlMapaTIR.DadosRelatorio(const iTipoSegmento, iIdEmpresa, iIdMoedaCAF, iIdPaisCAF : integer;
                                     const dDtIni, dDtFim : TDateTime;
                                     const sPatroPlano : string;
                                     const bCotas: Boolean ) : OleVariant;
var
  sSQL : string;
  sIni, sFim, sIniAno, sAnt, sAno, sAnoMesIni, sAnoMesFim : string;
  iDia, iMes, iAno : word;
begin

   sIni    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni      ) );
   sFim    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim      ) );
   sAnt    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni - 1  ) );
   sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dDtIni ) );
   sAno    := FormatDateTime( 'yyyy', dDtIni );

   DecodeDate( StrToDate('01/01/' + FormatDateTime( 'yyyy', dDtIni )), iAno, iMes, iDia );
   sAnoMesIni := IntToStr(iAno) + FormatFloat('00',iMes);

   DecodeDate(dDtFim, iAno, iMes, iDia );
   sAnoMesFim := IntToStr(iAno) + FormatFloat('00',iMes);

  sSQL :=
   ' SELECT   1 AS ORDEM, ' +#13+
   Iff( iTipoSegmento = 1, 'I.DESCTIPOIMOVEL', 'I.DESCARTEIRASPC' ) + ' AS SEGMENTO,  ' +#13+
   '          IM.IMONOME AS IMOVEL_MESTRE,   ' +#13+
   Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ' AS IDSEGMENTO,   ' +#13+
   '          IM.IDIMOVEL,      ' +#13+
   '          I.FLGTIPOINTERNO, ' +#13+
   '          1 AS ORIGEM,      ' +#13+
   '          NVL( ROUND( SUM( CM.SUMVALCTB * FT.FATOR ) / 1000, 2 ), 0 ) AS VALOR_CONTABIL,  ' +#13+
   '          NVL( ROUND( SUM( DECODE(RR.DATAREAVALIACAO, NULL, I.IMOVLRCOMPRA, RR.VLRREAVALIA) * FT.FATOR ) / 1000, 2 ), 0 ) AS ULTREAVALIA,   ' +#13+
   '          NVL( ROUND( SUM( ( DECODE( RM.TOT_RECEBIDO, NULL, 0, RM.TOT_RECEBIDO ) - DECODE( RM.TOT_PAGO, NULL, 0, RM.TOT_PAGO ) ) * FT.FATOR ) / 1000, 2), 0 ) AS RECEITA_LIQUIDA_MES,  ' +#13+
   '          NVL( ROUND( SUM( ( DECODE( RA.TOT_RECEBIDO, NULL, 0, RA.TOT_RECEBIDO ) - DECODE( RA.TOT_PAGO, NULL, 0, RA.TOT_PAGO ) ) * FT.FATOR ) / 1000, 2), 0 ) AS RECEITA_LIQUIDA_ANO,  ' +#13+
   '          ''Imóvel Mestre'' as TITULO,   ' +#13+
   '          0 AS RENTAB_MES_NOMINAL,       ' +#13+
   '          0 AS RENTAB_MES_REAL,          ' +#13+
   '          0 AS RENTAB_MES_ATUARIAL,      ' +#13+
   '          0 AS RENTAB_ANO_NOMINAL,       ' +#13+
   '          0 AS RENTAB_ANO_REAL,          ' +#13+
   '          0 AS RENTAB_ANO_ATUARIAL,      ' +#13+
   '          0 AS ULTREAVALANOANT,          ' +#13+
   '          0 AS ULTREAVALMESANT,          ' +#13+
   '          0 AS ULTREAVAL_NOMINAL,        ' +#13+
   '          0 AS ULTREAVAL_REAL,           ' +#13+
   '          0 AS ULTREAVAL_ATUARIAL,       ' +#13+
   '          0 AS TOTRENTAB_MES_NOMINAL,    ' +#13+
   '          0 AS TOTRENTAB_MES_REAL,       ' +#13+
   '          0 AS TOTRENTAB_MES_ATUARIAL,   ' +#13+
   '          0 AS TOTRENTAB_ANO_NOMINAL,    ' +#13+
   '          0 AS TOTRENTAB_ANO_REAL,       ' +#13+
   '          0 AS TOTRENTAB_ANO_ATUARIAL,   ' +#13+
   '          0 AS FINRENTAB_MES_NOMINAL,    ' +#13+
   '          0 AS FINRENTAB_MES_REAL,       ' +#13+
   '          0 AS FINRENTAB_MES_ATUARIAL,   ' +#13+
   '          0 AS FINRENTAB_ANO_NOMINAL,    ' +#13+
   '          0 AS FINRENTAB_ANO_REAL,       ' +#13+
   '          0 AS FINRENTAB_ANO_ATUARIAL    ' +#13+
   ' FROM     IMOVEL IM,                     ' +#13+
   '          ( SELECT R.IDIMOVEL, UR.ULTREAVAL AS DATAREAVALIACAO, SUM(R.VLRREAVALIA) AS VLRREAVALIA ' +#13+
   '            FROM REAVALIAXREAVALIA R, ' +#13+
   '                ( SELECT IDIMOVEL, MAX(DATAREAVALIACAO) AS ULTREAVAL ' +#13+
   '              FROM REAVALIAXREAVALIA                ' +#13+
   '                   WHERE DATAREAVALIACAO <= ' + sFim +#13+
   '                   GROUP BY IDIMOVEL ) UR ' +#13+
   '          WHERE R.IDIMOVEL = UR.IDIMOVEL ' +#13+
   '            AND R.DATAREAVALIACAO = UR.ULTREAVAL ' +#13+
   '          GROUP BY R.IDIMOVEL, UR.ULTREAVAL ' +#13+
   '          ) RR,                                     ' +#13+

   '          ( SELECT   I.IDIMOVEL,                    ' +#13+
   '                     I.IDIMOVELMESTRE,              ' +#13+
   '                     TI.CODTIPIMOVEL,               ' +#13+
   '                     TI.DESCTIPOIMOVEL,             ' +#13+
   '                     TI.FLGTIPOINTERNO,             ' +#13+
   '                     I.IMOVLRCOMPRA,                ' +#13+
   '                     DECODE( I.IDCARTEIRASPC, NULL, CS1.DESCARTEIRASPC, CS2.DESCARTEIRASPC ) AS DESCARTEIRASPC,      ' +#13+
   '                     TO_CHAR( DECODE( I.IDCARTEIRASPC, NULL, TI.IDCARTEIRASPC, I.IDCARTEIRASPC ) ) AS IDCARTEIRASPC  ' +#13+
   '            FROM     IMOVEL            I,         ' +#13+
   '                     TIPOIMOVEL        TI,        ' +#13+
   '                     CARTEIRASPC       CS1,       ' +#13+
   '                     CARTEIRASPC       CS2,       ' +#13+
   '                     ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA  '+#13+
   '                         FROM EVENTOIMOVEL                       '+#13+
   '                        WHERE FLGTIPOEVENTO IN(''CA'',''BD'',''BR'') '+#13+
   '                        GROUP BY IDIMOVEL                        '+#13+
   '                     ) AL                                        '+#13+
   '            WHERE    I.CODTIPIMOVEL    = TI.CODTIPIMOVEL         '+#13+
   '              AND    I.IDIMOVEL        = AL.IDIMOVEL(+)          '+#13+
   '              AND    ( (AL.DTVENDA IS NOT NULL AND              ' +#13+
                            sAnoMesFim + ' BETWEEN TO_CHAR(I.IMODATACOMPRA,''YYYYMM'') AND TO_CHAR(AL.DTVENDA,''YYYYMM'')) OR '+#13+
   '                       (AL.DTVENDA IS NULL AND ' + sAnoMesIni + ' >= TO_CHAR(I.IMODATACOMPRA,''YYYYMM'')) ) '+#13+
   '              AND    TI.IDCARTEIRASPC  = CS1.IDCARTEIRASPC(+)       ' +#13+
   '              AND    I.IDCARTEIRASPC   = CS2.IDCARTEIRASPC(+) ) I,  ' +#13+
   '          ( SELECT   I.IDIMOVEL,                                    ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO, ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO      ' +#13+
   '            FROM     DOCUMENTO         D,     ' +#13+
   '                     LANCTODOCUM       LD,    ' +#13+
   '                     LANCAMENTOSIMOVEL LI,    ' +#13+
   '                     IMOVEL            I,     ' +#13+
   '                     TIPOIMOVEL        TI,    ' +#13+
   '                     RECBTOPAGTO       RP,    ' +#13+
   '                     TIPOCUSTORECIMOV  TC,    ' +#13+
   '                     ( SELECT CODDOCUMENTO,   ' +#13+
   '                              VALOR           ' +#13+
   '                         FROM LANCTODOCUM     ' +#13+
   '                        WHERE ESTORNO IS NULL ' +#13+
   '                          AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR1  ' +#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)    )   ' +#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)   )   ' +#13+
   '              AND    ( D.CODDOCUMENTO       = TR1.CODDOCUMENTO(+)  )   ' +#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)   )   ' +#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)      )   ' +#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO )   ' +#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL           )   ' +#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL      )   ' +#13+
   '              AND    ( TC.FLGRENTAB         = 1                    )   ' +#13+
   '              AND    ( LI.IDMODULO          = 64                   )   ' +#13+
   '              AND    ( LD.ESTORNO IS NULL                          )   ' +#13;

   if bCotas then begin
      sSql := sSql +
      ' AND LI.IDIMOVEL NOT IN (  SELECT CI.IDIMOVEL                              ' +#13+
      '                             FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CI     ' +#13+
      '                            WHERE C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ' +#13+
      '                              AND C.FLGTIPOCONTRATO = ''C''                ' +#13+
      '                              AND C.CONDATAASSINATURA <= RP.DATABAIXA )    ' +#13;
   end;

   sSql := sSql +
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIni + ' AND ' + sFim + ')) OR       ' +#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIni + ' AND ' + sFim + ')) )   ' +#13+
   '            GROUP BY I.IDIMOVEL ) RM,   ' +#13+
   '          ( SELECT   I.IDIMOVEL,        ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO,  ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO       ' +#13+
   '            FROM     DOCUMENTO         D,     ' +#13+
   '                     LANCTODOCUM       LD,    ' +#13+
   '                     LANCAMENTOSIMOVEL LI,    ' +#13+
   '                     IMOVEL            I,     ' +#13+
   '                     TIPOIMOVEL        TI,    ' +#13+
   '                     RECBTOPAGTO       RP,    ' +#13+
   '                     TIPOCUSTORECIMOV  TC,    ' +#13+
   '                     ( SELECT CODDOCUMENTO,   ' +#13+
   '                              VALOR           ' +#13+
   '                         FROM LANCTODOCUM     ' +#13+
   '                        WHERE ESTORNO IS NULL ' +#13+
   '                          AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR2  ' +#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)    )  ' +#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)   )  ' +#13+
   '              AND    ( D.CODDOCUMENTO       = TR2.CODDOCUMENTO(+)  )  ' +#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)   )  ' +#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)      )  ' +#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO )  ' +#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL           )  ' +#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL      )  ' +#13+
   '              AND    ( TC.FLGRENTAB         = 1                    )  ' +#13+
   '              AND    ( LI.IDMODULO          = 64                   )  ' +#13+
   '              AND    ( LD.ESTORNO IS NULL                          )  ' +#13;

   if bCotas then begin
      sSql := sSql +
      ' AND LI.IDIMOVEL NOT IN (  SELECT CI.IDIMOVEL                              ' +#13+
      '                             FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CI     ' +#13+
      '                            WHERE C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ' +#13+
      '                              AND C.FLGTIPOCONTRATO = ''C''                ' +#13+
      '                              AND C.CONDATAASSINATURA <= RP.DATABAIXA )    ' +#13;
   end;

   sSql := sSql +
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIniAno + ' AND ' + sFim + ')) OR      ' +#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIniAno + ' AND ' + sFim + ')) )  ' +#13+
   '            GROUP BY I.IDIMOVEL ) RA,                                                      '+#13+
   '          ( SELECT /*+ RULE */                                                             '+#13+
   '                   IXB.IDIMOVEL,                                                           '+#13+
   '                   ( ROUND(SUM(NVL(SB1.VALORG,0)) ,2) + ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -  '+#13+
   '                     ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) - ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) + '+#13+
   '                     ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +     '+#13+
   '                     ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -       '+#13+
   '                     ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -   '+#13+
   '                     ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2)         '+#13+
   '                   ) AS SUMVALCTB                                                          '+#13+
   '              FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,                                  '+#13+
   '                   BEM B1, GRUPO G1, IMOVELXBEM IXB,                                       '+#13+
   '                   (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA                        '+#13+
   '                      FROM SALDOCONTABBEM                       '+#13+
   '                     WHERE DATASLDBEM <= ' + sFim                +#13+
   '                       AND MOECODIGO = ' + IntToStr(iIdMoedaCAF) +#13+
   '                       AND IDPESSOA  = ' + IntToStr(iIdEmpresa)  +#13+
   '                     GROUP BY IDBEM, IDPESSOA) MAX1             '+#13+
   '             WHERE B1.DATAINICIODEP <= ' + sFim                  +#13+
   '               AND G1.FLGIMOVEL = 1                             '+#13+
   '               AND SB1.MOECODIGO = ' + IntToStr(iIdMoedaCAF)     +#13+
   '               AND SB1.IDPESSOA  = ' + IntToStr(iIdEmpresa)      +#13+
   '               AND SD1.IDSLDCTBBEMXDEP = ' + IntToStr(iIdPaisCAF)+#13+
   '               AND B1.IDPESSOA = ' + IntToStr(iIdEmpresa)        +#13+
   '               AND B1.IDBEM = IXB.IDBEM                         '+#13+
   '               AND SB1.IDBEM = MAX1.IDBEM                       '+#13+
   '               AND SB1.IDPESSOA = MAX1.IDPESSOA                 '+#13+
   '               AND SB1.DATASLDBEM = MAX1.DATA                   '+#13+
   '               AND SB1.IDBEM = SD1.IDBEM                        '+#13+
   '               AND SB1.IDPESSOA = SD1.IDPESSOA                  '+#13+
   '               AND SB1.DATASLDBEM = SD1.DATASLDBEM              '+#13+
   '               AND SB1.MOECODIGO = SD1.MOECODIGO                '+#13+
   '               AND SB1.IDBEM = B1.IDBEM                         '+#13+
   '               AND SB1.IDPESSOA = B1.IDPESSOA                   '+#13+
   '               AND SB1.IDGRUPO = G1.IDGRUPO                     '+#13+
   '         GROUP BY IXB.IDIMOVEL  ) CM,                           '+#13+
   '          ( SELECT    PI.IDIMOVEL,     ' +#13+
   '                      PI.IDPATRO,      ' +#13+
   '                      PI.IDPLANOPREV,  ' +#13+
   '                      DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR  ' +#13+
   '            FROM      PLANOPATROXIMOVEL PI,  ' +#13+
   '                      ( SELECT   IDIMOVEL,   ' +#13+
   '                                 SUM( PPIPERCENTRATEIO ) AS TOTAL  ' +#13+
   '                        FROM     PLANOPATROXIMOVEL    ' +#13+
   '                        GROUP BY IDIMOVEL ) TT        ' +#13+
   '            WHERE     PI.IDIMOVEL = TT.IDIMOVEL ) FT  ' +#13+
   ' WHERE    ( I.IDIMOVELMESTRE = IM.IDIMOVEL          ) ' +#13+
   '   AND    ( I.IDIMOVEL       = FT.IDIMOVEL          ) ' +#13+
   '   AND    ( I.IDIMOVEL       = RM.IDIMOVEL    (+)   ) ' +#13+
   '   AND    ( I.IDIMOVEL       = RA.IDIMOVEL    (+)   ) ' +#13+
   '   AND    ( I.IDIMOVEL       = CM.IDIMOVEL    (+)   ) ' +#13+
   '   AND    ( I.IDIMOVEL       = RR.IDIMOVEL    (+)   ) ' +#13+
   '   AND    ( I.FLGTIPOINTERNO <> ''F'' )               ' +#13+
   '   AND    ( TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' ) )  ' +#13+
   ' GROUP BY                                                                 ' +#13+
   Iff( iTipoSegmento = 1, 'I.DESCTIPOIMOVEL', 'I.DESCARTEIRASPC' ) + ',      ' +#13+
   '          IM.IMONOME,                                                     ' +#13+
   Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ',         ' +#13+
   '          IM.IDIMOVEL,      ' +#13+
   '          I.FLGTIPOINTERNO  ' +#13+
   ' ORDER BY 1, 2, 3           ';


   CMDebugToFile(sSql,'MapaCota.txt');

  Result := GetDataPacket( sSQL );
end;


function TCtrlMapaTIR.RecuperaPatrosPlanos: OleVariant;
begin
  Result := GetDataPacket(
             ' SELECT   DISTINCT                      ' +
             '          I.IDPATRO,                    ' +
             '          P.IDPLANOPREV,                ' +
             '          A.NOME AS NOMEPATRO,          ' +
             '          P.NOME AS NOMEPLANO,          ' +
             '          0 AS FLGUSA,                  ' +
             '          0 AS INDICECORRECAO,          ' +
             '          0 AS INDICEATUARIAL,          ' +
             '          6 AS PERCATUARIAL             ' +
             ' FROM     PLANPREVCONTABIL P,           ' +
             '          PESSOA A,                     ' +
             '          PLANOPATROXIMOVEL I           ' +
             ' WHERE    P.IDPLANOPREV = I.IDPLANOPREV ' +
             '   AND    I.IDPATRO     = A.IDPESSOA    ' +
             ' ORDER BY 3, 4                          ' );
end;

function TCtrlMapaTIR.RecuperaUltAvaliacaoData( iTipoSegmento : integer; dData : TDateTime; sPatroPlano : string = '' ;
                                                iIdMestre : Integer = -1; bCotas: Boolean = False ) : OLEVariant;
var
  cdsLocal : TCmClientDataset;
  sSQL, sAnt, sAno : string;
begin
  sAnt := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData - 1  ) );
  sAno := FormatDateTime( 'yyyy', dData );

  cdsLocal := TCmClientDataset.Create( nil );
  try
    sSQL :=
     ' SELECT   ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ' AS IDSEGMENTO,                                             ' +
     '          I.IDIMOVELMESTRE,                                                                                                                ' +
     Iff( bCotas, '', 'FT.IDPATRO,  FT.IDPLANOPREV, ') +
     '          1 AS ORIGEM,                                                                                                                     ' +
     '          NVL( ROUND( SUM( RR.VLRREAVALIA * FT.FATOR ), 2 ), 0 ) AS ULTREAVALIA                                                            ' +
     ' FROM                                                                                                                ' +

     '          ( SELECT R.IDIMOVEL, UR.ULTREAVAL AS DATAREAVALIACAO, SUM(R.VLRREAVALIA) AS VLRREAVALIA ' +#13+
     '            FROM REAVALIAXREAVALIA R, ' +#13+
     '                ( SELECT IDIMOVEL, MAX(DATAREAVALIACAO) AS ULTREAVAL ' +#13+
     '              FROM REAVALIAXREAVALIA                ' +#13+
     '                   WHERE DATAREAVALIACAO <= ' + sAnt +#13+
     '                   GROUP BY IDIMOVEL ) UR ' +#13+
     '          WHERE R.IDIMOVEL = UR.IDIMOVEL ' +#13+
     '            AND R.DATAREAVALIACAO = UR.ULTREAVAL ' +#13+
     '          GROUP BY R.IDIMOVEL, UR.ULTREAVAL ' +#13+
     '          ) RR,                                     ' +#13+

     '          ( SELECT   I.IDIMOVEL,                                                                                                           ' +
     '                     I.IDIMOVELMESTRE,                                                                                                     ' +
     '                     TI.CODTIPIMOVEL,                                                                                                      ' +
     '                     TI.DESCTIPOIMOVEL,                                                                                                    ' +
     '                     TI.FLGTIPOINTERNO,                                                                                                    ' +
     '                     DECODE( I.IDCARTEIRASPC, NULL, CS1.DESCARTEIRASPC, CS2.DESCARTEIRASPC ) AS DESCARTEIRASPC,                            ' +
     '                     TO_CHAR( DECODE( I.IDCARTEIRASPC, NULL, TI.IDCARTEIRASPC, I.IDCARTEIRASPC ) ) AS IDCARTEIRASPC                        ' +
     '            FROM     IMOVEL            I,                                                                                                  ' +
     '                     TIPOIMOVEL        TI,                                                                                                 ' +
     '                     CARTEIRASPC       CS1,                                                                                                ' +
     '                     CARTEIRASPC       CS2                                                                                                 ' +
     '            WHERE    I.CODTIPIMOVEL    = TI.CODTIPIMOVEL                                                                                   ' +
     '              AND    I.FLGATIVO        = 1                                                                                                 ' +
     '              AND    TI.IDCARTEIRASPC  = CS1.IDCARTEIRASPC(+)                                                                              ' +
     '              AND    I.IDCARTEIRASPC   = CS2.IDCARTEIRASPC(+) ) I,                                                                         ' +
     '          ( SELECT    PI.IDIMOVEL,                                                                                                         ' +
     '                      PI.IDPATRO,                                                                                                          ' +
     '                      PI.IDPLANOPREV,                                                                                                      ' +
     '                      DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR ' +
     '            FROM      PLANOPATROXIMOVEL PI,                                                                                                ' +
     '                      ( SELECT   IDIMOVEL,                                                                                                 ' +
     '                                 SUM( PPIPERCENTRATEIO ) AS TOTAL                                                                          ' +
     '                        FROM     PLANOPATROXIMOVEL                                                                                         ' +
     '                        GROUP BY IDIMOVEL ) TT                                                                                             ' +
     '            WHERE     PI.IDIMOVEL = TT.IDIMOVEL ) FT                                                                                       ' +
     ' WHERE    I.IDIMOVEL         = RR.IDIMOVEL                                                                                                 ' +
     '   AND    I.IDIMOVEL         = FT.IDIMOVEL                                                                                                 ' ;

    if sPatroPlano <> '' then
      sSQL := sSQL +
       '   AND    ( TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' ) )                                     ' ;

    if iIdMestre > 0 then
      sSql := sSql +
       '   AND (I.IDIMOVELMESTRE = ' + IntToStr(iIdMestre) + ' ) ';

    sSQL := sSQL +
     ' GROUP BY ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ',                                                           ' +
     '          I.IDIMOVELMESTRE,                                                                                                                ' +
     Iff( bCotas, '', 'FT.IDPATRO, FT.IDPLANOPREV ') +
     Iff( bCotas, ' ORDER BY 1, 2 ', ' ORDER BY 1, 2, 3, 4 ');

    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.Data;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlMapaTIR.ReceitaLiquidaMesAMes( iTipoSegmento : integer; dData: TDateTime; bApenasAdminImob, bDesdeInicioAno : boolean; sPatroPlano : string = ''; sIdSegmento : string = ''; bCotas : Boolean = False ): OLEVariant;
var
  sSQL : string;
  sIniAno, sFimMes, sAno : string;
begin
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dData ) );
  sFimMes := QuotedStr( FormatDateTime( 'dd/mm/yyyy',
             DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dData ), DiasUteis.ExtraiMes( dData ) ) ) );
  sAno    := FormatDateTime( 'yyyy', dData );

  sSQL :=
   ' SELECT   ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ' AS IDSEGMENTO, ' +#13+
   '          I.IDIMOVELMESTRE,                                        ' +#13+
   '          DECODE(I.FLGTIPOINTERNO, ''P'',                          ' +#13+
   '                 TO_CHAR( LI.DATAVENCIMENTO, ''YYYYMM'' ),         ' +#13+
   '                 TO_CHAR( RP.DATABAIXA, ''YYYYMM'' ) ) AS ANOMES,  ' +#13+

   Iff( bCotas, ' DECODE(I.FLGTIPOINTERNO, ''P'',                         ' +#13+
   '                     LI.DATAVENCIMENTO, RP.DATABAIXA ) AS DATALANCTO, ' +#13+
   '              0 AS ATIVO,                                             ' +#13+
   '              0 AS COMPRAVENDA,                                       ' +#13+
   '              0 AS ABERTURA,                                          ' +#13+
   '              0 AS FECHAMENTO,                                        ' +#13+
   '              0 AS VLRCOTA,                                           ' +#13+
   '              0 AS VARMESNOM,                                         ' +#13+
   '              0 AS VARANONOM,                                         ' +#13+
   '              0 AS VARMESREAL,                                        ' +#13+
   '              0 AS VARANOREAL,                                        ' +#13+
   '              0 AS VARMESATU,                                         ' +#13+
   '              0 AS VARANOATU,                                         ',

   '              FT.IDPATRO, FT.IDPLANOPREV, ' )                           +#13+

   '          LI.IDMODULO, 1 AS ORIGEM,                         ' +#13+
   '          NVL( ROUND( SUM( DECODE( I.FLGTIPOINTERNO, ''P'',  ' +#13+
   '                                   ( DECODE( LI.RECPAG, ''R'', LI.VLRLANCRECEB, 0) ),  ' +#13+
   '                                   ( DECODE( RTRIM( LD.OPERACAO ), ''5'',              ' +#13+
   '                                     DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0 ), 0 ) )  ' +#13+
   '                                  ) * FT.FATOR ), 2 ), 0 ) AS RECEITAMES,              ' +#13+

   '          NVL( ROUND( SUM( DECODE( I.FLGTIPOINTERNO, ''P'', ' +#13+
   '                                   ( DECODE( LI.CODDOCUMENTO, NULL, ' +#13+
   '                                             DECODE( LI.RECPAG, ''P'', LI.VLRLANCPAGAR, 0), ' +#13+
   '                                             ( DECODE( RTRIM( LD.OPERACAO ), ''5'', ' +#13+
   '                                               DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) )  ) ), ' +#13+
   '                                   ( DECODE( RTRIM( LD.OPERACAO ), ''5'', ' +#13+
   '                                     DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) ) ' +#13+
   '                                  ) * FT.FATOR ), 2 ), 0 ) AS DESPESAMES, ' +#13+
   '         NVL( ROUND( SUM((DECODE( I.FLGTIPOINTERNO, ''P'', ' +#13+
   '                                  ( DECODE(LI.CODDOCUMENTO, NULL, ' +#13+
   '                                           DECODE( LI.RECPAG, ''R'', LI.VLRLANCRECEB, 0), ' +#13+
   '                                           DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0 ), 0 ) ) ), ' +#13+
   '                                           DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0 ), 0 ) ) - ' +#13+
   '                          DECODE( I.FLGTIPOINTERNO, ''P'', ' +#13+
   '                                  ( DECODE(LI.CODDOCUMENTO, NULL, ' +#13+
   '                                           DECODE( LI.RECPAG, ''P'', LI.VLRLANCPAGAR, 0), ' +#13+
   '                                            ( DECODE( RTRIM( LD.OPERACAO ), ''5'', ' +#13+
   '                                              DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) )  ) ), ' +#13+
   '                                  ( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) ) ) ' +#13+
   '                                 ) * FT.FATOR ), 2 ), 0 ) AS RECEITALIQUIDA ' +#13+
   ' FROM     DOCUMENTO         D,   ' +#13+
   '          LANCTODOCUM       LD,  ' +#13+
   '          LANCAMENTOSIMOVEL LI,  ' +#13+
   '          IMOVEL            IM,  ' +#13+
   '          RECBTOPAGTO       RP,  ' +#13+
   '          TIPOCUSTORECIMOV  TC,  ' +#13+
   '          ( SELECT   I.IDIMOVEL,        ' +#13+
   '                     I.IDIMOVELMESTRE,  ' +#13+
   '                     TI.CODTIPIMOVEL,   ' +#13+
   '                     TI.DESCTIPOIMOVEL, ' +#13+
   '                     TI.FLGTIPOINTERNO, ' +#13+
   '                     DECODE( I.IDCARTEIRASPC, NULL, CS1.DESCARTEIRASPC, CS2.DESCARTEIRASPC ) AS DESCARTEIRASPC,      ' +#13+
   '                     TO_CHAR( DECODE( I.IDCARTEIRASPC, NULL, TI.IDCARTEIRASPC, I.IDCARTEIRASPC ) ) AS IDCARTEIRASPC  ' +#13+
   '            FROM     IMOVEL            I,                 ' +#13+
   '                     TIPOIMOVEL        TI,                ' +#13+
   '                     CARTEIRASPC       CS1,               ' +#13+
   '                     CARTEIRASPC       CS2                ' +#13+
   '            WHERE    I.CODTIPIMOVEL    = TI.CODTIPIMOVEL  ' +#13+
   '              AND    TI.IDCARTEIRASPC  = CS1.IDCARTEIRASPC(+)      ' +#13+
   '              AND    I.IDCARTEIRASPC   = CS2.IDCARTEIRASPC(+) ) I, ' +#13+
   '          ( SELECT    PI.IDIMOVEL,                                 ' +#13+
   '                      PI.IDPATRO,                                  ' +#13+
   '                      PI.IDPLANOPREV,                              ' +#13+
   '                      DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR   ' +#13+
   '            FROM      PLANOPATROXIMOVEL PI,   ' +#13+
   '                      ( SELECT    IDIMOVEL,   ' +#13+
   '                                  SUM( PPIPERCENTRATEIO ) AS TOTAL ' +#13+
   '                        FROM      PLANOPATROXIMOVEL      ' +#13+
   '                        GROUP BY  IDIMOVEL ) TT          ' +#13+
   '            WHERE     PI.IDIMOVEL = TT.IDIMOVEL ) FT,    ' +#13+
   '          ( SELECT CODDOCUMENTO,     ' +#13+
   '                   VALOR             ' +#13+
   '              FROM LANCTODOCUM       ' +#13+
   '             WHERE ESTORNO IS NULL   ' +#13+
   '               AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TRD   ' +#13+
   ' WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)                  )  ' +#13+
   '   AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)                 )  ' +#13+
   '   AND    ( D.CODDOCUMENTO       = TRD.CODDOCUMENTO(+)                )  ' +#13+
   '   AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)                 )  ' +#13+
   '   AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)                    )  ' +#13+
   '   AND    ( I.IDIMOVEL           = FT.IDIMOVEL                        )  ' +#13+
   '   AND    ( I.IDIMOVELMESTRE     = IM.IDIMOVEL                        )  ' +#13+
   '   AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO               )  ' +#13+
   '   AND    ( LI.IDIMOVEL          = I.IDIMOVEL                         )  ' +#13+
   '   AND    ( LD.ESTORNO IS NULL                                        )  ' +#13+
   '   AND    ( TC.FLGRENTAB         = 1                                  )  ' +#13;

  if bCotas then begin    // Despesas com imóveis já alienados devem entrar na carteira de Alienação
     sSql := sSql +
     ' AND I.IDIMOVEL NOT IN (  SELECT CI.IDIMOVEL                              ' +#13+
     '                            FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CI     ' +#13+
     '                           WHERE C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ' +#13+
     '                             AND C.FLGTIPOCONTRATO = ''C''                ' +#13+
     '                             AND C.CONDATAASSINATURA <= RP.DATABAIXA )    ' +#13;
  end;

  if bApenasAdminImob then
       sSQL := sSQL + '   AND    ( LI.IDMODULO = 64 )   ' +#13
  else sSQL := sSQL + '   AND    ( ( LI.IDMODULO = 54 ) OR ( LI.IDMODULO = 64 ) ) ' +#13;

  if bDesdeInicioAno then
       sSQL := sSQL + '   AND    ( ((I.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIniAno + ' AND ' + sFimMes + '  )) OR       ' +#13+
                      '            ((I.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIniAno + ' AND ' + sFimMes + '  )) )   ' +#13
  else sSQL := sSQL + '   AND    ( ((I.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA <= ' + sFimMes + ' )) OR      ' +#13+
                      '            ((I.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO <= ' + sFimMes + ' )) )  ' +#13;

  if sPatroPlano <> '' then
    sSQL := sSQL +    '   AND    ( TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' ) )  ' +#13;

  if sIdSegmento <> '' then
    sSQL := sSQL +    '   AND    ( ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ' = ' + QuotedStr( sIdSegmento ) + ' ) ' +#13;

  sSQL := sSQL +
   ' GROUP BY ' + Iff( iTipoSegmento = 1, 'I.CODTIPIMOVEL', 'I.IDCARTEIRASPC' ) + ',  ' +#13+
   '          I.IDIMOVELMESTRE,                                 ' +#13+
   '          DECODE(I.FLGTIPOINTERNO, ''P'',                   ' +#13+
   '                 TO_CHAR( LI.DATAVENCIMENTO, ''YYYYMM'' ),  ' +#13+
   '                 TO_CHAR( RP.DATABAIXA, ''YYYYMM'' ) ),     ' +#13+

   Iff( bCotas, ' DECODE(I.FLGTIPOINTERNO, ''P'',               ' +#13+
   '                     LI.DATAVENCIMENTO, RP.DATABAIXA ),     ' +#13+
   '              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ',
   '              FT.IDPATRO, FT.IDPLANOPREV,               ' )   +#13+

   '          LI.IDMODULO                                       ' +#13+

   Iff( bCotas,  ' ORDER BY 1, 2, 3, 4 ',
                 ' ORDER BY 1, 2, 3, 4, 5    ' );


  CMDebugToFile('Recupera receitas e despesas operacionais...', 'RENTABCOTA.TXT');
  CMDebugToFile(sSql, 'RENTABCOTA.TXT');

  Result := GetDataPacket( sSQL );

end;

function TCtrlMapaTIR.DadosAlienacao(dDtIni, dDtFim: TDateTime; sPatroPlano: string): OleVariant;
var
  sSQL : string;
  sIni, sFim, sIniAno : string;
begin

  sIni    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni      ) );
  sFim    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim      ) );
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dDtIni ) );

  sSQL :=
   ' SELECT   CI.IDCONTRATOIMOVEL,  '+#13+
   '          CI.CONNOME,           '+#13+
   '          NVL( ROUND( SUM( ( ( PFM.RECEITA_LIQUIDA_MES / CI.VLRPROPOSTA ) * CX.VLRVENDA ) * FT.FATOR ) / 1000, 2 ), 0 )  AS RECEITA_LIQUIDA_MES,  '+#13+
   '          NVL( ROUND( SUM( ( ( PFA.RECEITA_LIQUIDA_ANO / CI.VLRPROPOSTA ) * CX.VLRVENDA ) * FT.FATOR ) / 1000, 2 ), 0 )  AS RECEITA_LIQUIDA_ANO   '+#13+
   ' FROM     CONTRATOIMOVEL  CI,    '+#13+
   '          CONTRATOXIMOVEL CX,    '+#13+
   '          ( SELECT   CP.IDCONTRATOIMOVEL,                       '+#13+
   '                     SUM( PF.VLRPAGO ) AS RECEITA_LIQUIDA_MES   '+#13+
   '            FROM     PARCFINANCIMOV PF,                         '+#13+
   '                     CONDPAGIMOVEL  CP                          '+#13+
   '            WHERE    PF.DATAPAGAMENTO BETWEEN ' + sIni + ' AND ' + sFim +#13+
   '              AND    CP.IDCONDINICIAL  = PF.IDCONDPAGIMOVEL     '+#13+
   '              AND    CP.IDREPACTUA     IS NULL                  '+#13+
   '            GROUP BY CP.IDCONTRATOIMOVEL ) PFM,                 '+#13+
   '          ( SELECT   CP.IDCONTRATOIMOVEL,                       '+#13+
   '                     SUM( PF.VLRPAGO ) AS RECEITA_LIQUIDA_ANO   '+#13+
   '            FROM     PARCFINANCIMOV PF,                         '+#13+
   '                     CONDPAGIMOVEL CP                           '+#13+
   '            WHERE    PF.DATAPAGAMENTO BETWEEN ' + sIniAno+' AND ' + sFim  +#13+
   '              AND    CP.IDCONDINICIAL = PF.IDCONDPAGIMOVEL      '+#13+
   '              AND    CP.IDREPACTUA IS NULL                      '+#13+
   '            GROUP BY CP.IDCONTRATOIMOVEL ) PFA,                 '+#13+
   '          ( SELECT   PI.IDIMOVEL,                               '+#13+
   '                     PI.IDPATRO,                                '+#13+
   '                     PI.IDPLANOPREV,                            '+#13+
   '                     DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR   '+#13+
   '            FROM     PLANOPATROXIMOVEL PI,                      '+#13+
   '                     ( SELECT   IDIMOVEL,                       '+#13+
   '                                SUM( PPIPERCENTRATEIO ) AS TOTAL'+#13+
   '                       FROM     PLANOPATROXIMOVEL               '+#13+
   '                       GROUP BY IDIMOVEL ) TT                   '+#13+
   '            WHERE    PI.IDIMOVEL = TT.IDIMOVEL ) FT             '+#13+
   ' WHERE    CI.FLGTIPOCONTRATO  = ''C''                           '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = PFM.IDCONTRATOIMOVEL(+)         '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = PFA.IDCONTRATOIMOVEL            '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL             '+#13+
   '   AND    CX.IDIMOVEL         = FT.IDIMOVEL                     '+#13+
   '   AND    TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  '+#13+
   ' GROUP BY CI.IDCONTRATOIMOVEL, CI.CONNOME                       '+#13+
   ' ORDER BY CI.CONNOME                                            ';

  Result := GetDataPacket( sSQL );
end;

function TCtrlMapaTIR.DadosAlienacaoCota(dDtIni, dDtFim: TDateTime; sPatroPlano: string): OleVariant;
var sSQL : string;
    sIni, sFim, sIniAno : string;
begin

  sIni    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni      ) );
  sFim    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim      ) );
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dDtIni ) );

  sSQL :=
   ' SELECT   CI.IDCONTRATOIMOVEL,  '+#13+
   '          CI.CONNOME,           '+#13+
   '          NVL( ROUND( SUM( ( ( (NVL(PFM.RECEITA_LIQUIDA_MES,0) / CI.VLRPROPOSTA ) * CX.VLRVENDA ) + NVL(RM.TOT_RECEBIDO,0) - NVL(RM.TOT_PAGO,0)) * FT.FATOR ) / 1000, 2 ), 0 )  AS RECEITA_LIQUIDA_MES,  '+#13+
   '          NVL( ROUND( SUM( ( ( (NVL(PFA.RECEITA_LIQUIDA_ANO,0) / CI.VLRPROPOSTA ) * CX.VLRVENDA ) + NVL(RA.TOT_RECEBIDO,0) - NVL(RA.TOT_PAGO,0)) * FT.FATOR ) / 1000, 2 ), 0 )  AS RECEITA_LIQUIDA_ANO   '+#13+
   ' FROM     CONTRATOIMOVEL  CI,    '+#13+
   '          CONTRATOXIMOVEL CX,    '+#13+
   '          ( SELECT   CP.IDCONTRATOIMOVEL,                       '+#13+
   '                     SUM( PF.VLRPAGO ) AS RECEITA_LIQUIDA_MES   '+#13+
   '            FROM     PARCFINANCIMOV PF,                         '+#13+
   '                     CONDPAGIMOVEL  CP                          '+#13+
   '            WHERE    PF.DATAPAGAMENTO BETWEEN ' + sIni + ' AND ' + sFim +#13+
   '              AND    CP.IDCONDINICIAL  = PF.IDCONDPAGIMOVEL     '+#13+
   '              AND    CP.IDREPACTUA     IS NULL                  '+#13+
   '            GROUP BY CP.IDCONTRATOIMOVEL ) PFM,                 '+#13+
   '          ( SELECT   CP.IDCONTRATOIMOVEL,                       '+#13+
   '                     SUM( PF.VLRPAGO ) AS RECEITA_LIQUIDA_ANO   '+#13+
   '            FROM     PARCFINANCIMOV PF,                         '+#13+
   '                     CONDPAGIMOVEL CP                           '+#13+
   '            WHERE    PF.DATAPAGAMENTO BETWEEN ' + sIniAno+' AND ' + sFim  +#13+
   '              AND    CP.IDCONDINICIAL = PF.IDCONDPAGIMOVEL      '+#13+
   '              AND    CP.IDREPACTUA IS NULL                      '+#13+
   '            GROUP BY CP.IDCONTRATOIMOVEL ) PFA,                 '+#13+

   '          ( SELECT   I.IDIMOVEL,                                    ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR1.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO, ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR1.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR1.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO      ' +#13+
   '            FROM     DOCUMENTO         D,     ' +#13+
   '                     LANCTODOCUM       LD,    ' +#13+
   '                     LANCAMENTOSIMOVEL LI,    ' +#13+
   '                     IMOVEL            I,     ' +#13+
   '                     TIPOIMOVEL        TI,    ' +#13+
   '                     RECBTOPAGTO       RP,    ' +#13+
   '                     TIPOCUSTORECIMOV  TC,    ' +#13+
   '                     ( SELECT CODDOCUMENTO,   ' +#13+
   '                              VALOR           ' +#13+
   '                         FROM LANCTODOCUM     ' +#13+
   '                        WHERE ESTORNO IS NULL ' +#13+
   '                          AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR1  ' +#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)    )   ' +#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)   )   ' +#13+
   '              AND    ( D.CODDOCUMENTO       = TR1.CODDOCUMENTO(+)  )   ' +#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)   )   ' +#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)      )   ' +#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO )   ' +#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL           )   ' +#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL      )   ' +#13+
   '              AND    ( TC.FLGRENTAB         = 1                    )   ' +#13+
   '              AND    ( LI.IDMODULO          = 64                   )   ' +#13+
   '              AND    ( LD.ESTORNO IS NULL                          )   ' +#13+
   '              AND LI.IDIMOVEL IN (  SELECT CI.IDIMOVEL                              ' +#13+
   '                                      FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CI     ' +#13+
   '                                     WHERE C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ' +#13+
   '                                       AND C.FLGTIPOCONTRATO = ''C''                ' +#13+
   '                                       AND C.CONDATAASSINATURA <= RP.DATABAIXA )    ' +#13+
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIni + ' AND ' + sFim + ')) OR       ' +#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIni + ' AND ' + sFim + ')) )   ' +#13+
   '            GROUP BY I.IDIMOVEL ) RM,   ' +#13+

   '          ( SELECT   I.IDIMOVEL,        ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO,  ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO       ' +#13+
   '            FROM     DOCUMENTO         D,     ' +#13+
   '                     LANCTODOCUM       LD,    ' +#13+
   '                     LANCAMENTOSIMOVEL LI,    ' +#13+
   '                     IMOVEL            I,     ' +#13+
   '                     TIPOIMOVEL        TI,    ' +#13+
   '                     RECBTOPAGTO       RP,    ' +#13+
   '                     TIPOCUSTORECIMOV  TC,    ' +#13+
   '                     ( SELECT CODDOCUMENTO,   ' +#13+
   '                              VALOR           ' +#13+
   '                         FROM LANCTODOCUM     ' +#13+
   '                        WHERE ESTORNO IS NULL ' +#13+
   '                          AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR2  ' +#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)    )  ' +#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)   )  ' +#13+
   '              AND    ( D.CODDOCUMENTO       = TR2.CODDOCUMENTO(+)  )  ' +#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)   )  ' +#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)      )  ' +#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO )  ' +#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL           )  ' +#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL      )  ' +#13+
   '              AND    ( TC.FLGRENTAB         = 1                    )  ' +#13+
   '              AND    ( LI.IDMODULO          = 64                   )  ' +#13+
   '              AND    ( LD.ESTORNO IS NULL                          )  ' +#13+
   '              AND LI.IDIMOVEL IN (  SELECT CI.IDIMOVEL                              ' +#13+
   '                                      FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CI     ' +#13+
   '                                     WHERE C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ' +#13+
   '                                       AND C.FLGTIPOCONTRATO = ''C''                ' +#13+
   '                                       AND C.CONDATAASSINATURA <= RP.DATABAIXA )    ' +#13+
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIniAno + ' AND ' + sFim + ')) OR      ' +#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIniAno + ' AND ' + sFim + ')) )  ' +#13+
   '            GROUP BY I.IDIMOVEL ) RA,                                                      ' +#13+

   '          ( SELECT   PI.IDIMOVEL,                               '+#13+
   '                     PI.IDPATRO,                                '+#13+
   '                     PI.IDPLANOPREV,                            '+#13+
   '                     DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR   '+#13+
   '            FROM     PLANOPATROXIMOVEL PI,                      '+#13+
   '                     ( SELECT   IDIMOVEL,                       '+#13+
   '                                SUM( PPIPERCENTRATEIO ) AS TOTAL'+#13+
   '                       FROM     PLANOPATROXIMOVEL               '+#13+
   '                       GROUP BY IDIMOVEL ) TT                   '+#13+
   '            WHERE    PI.IDIMOVEL = TT.IDIMOVEL ) FT             '+#13+
   ' WHERE    CI.FLGTIPOCONTRATO  = ''C''                           '+#13+
   '   AND    CI.CONDATAASSINATURA <= ' + sIniAno                    +#13+
   '   AND   (CI.CONDATAFIM IS NULL OR CI.CONDATAFIM >= ' +sFim+ ') '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = PFM.IDCONTRATOIMOVEL(+)         '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = PFA.IDCONTRATOIMOVEL(+)         '+#13+
   '   AND    CX.IDIMOVEL         = RM.IDIMOVEL(+)                  '+#13+
   '   AND    CX.IDIMOVEL         = RA.IDIMOVEL(+)                  '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL             '+#13+
   '   AND    CX.IDIMOVEL         = FT.IDIMOVEL                     '+#13+
   '   AND    TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  '+#13+
   ' GROUP BY CI.IDCONTRATOIMOVEL, CI.CONNOME                       '+#13+
   ' ORDER BY CI.CONNOME                                            ';


  CMDebugToFile(' ', 'RENTABCOTA.TXT');
  CMDebugToFile('Recupera dados de Alienação - Cotas...', 'RENTABCOTA.TXT');
  CMDebugToFile(sSql, 'RENTABCOTA.TXT');

  Result := GetDataPacket( sSQL );
end;




function TCtrlMapaTIR.CalcSaldoDevedor(const iContrato, iCondPag: Integer; const dData: TDateTime): extended;
begin
  Result := CtrlParcFinancImov.CalcSldNova(iContrato, iCondPag, dData);
end;



function TCtrlMapaTIR.ReceitaAlienacaoMesAMes(dData: TDateTime; sPatroPlano: string; bCotas : Boolean = False ): OLEVariant;
var
  sSQL : string;
  sIniAno, sFimMes : string;
begin
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dData ) );
  sFimMes := QuotedStr( FormatDateTime( 'dd/mm/yyyy',
             DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dData ), DiasUteis.ExtraiMes( dData ) ) ) );

  sSQL :=
   ' SELECT   CI.IDCONTRATOIMOVEL, '+#13+
   '          PF.ANOMES,           '+#13+

   Iff( bCotas, ' PF.DATALANCTO AS DATALANCTO, ',
                ' FT.IDPATRO,           '+#13+
                ' FT.IDPLANOPREV,       ' ) +#13+

   '          NVL( ROUND( SUM( ( ( PF.RECEITA_LIQUIDA / CI.VLRPROPOSTA ) * CX.VLRVENDA ) * FT.FATOR ), 2 ), 0 )  AS RECEITALIQUIDA  '+#13+
   ' FROM     CONTRATOIMOVEL  CI,   '+#13+
   '          CONTRATOXIMOVEL CX,   '+#13+

   '          ( SELECT   CP.IDCONTRATOIMOVEL,   '+#13+
   '                     TO_CHAR( PF.DATAPAGAMENTO, ''YYYYMM'' ) AS ANOMES,           '+#13+
                         Iff( bCotas, ' PF.DATAPAGAMENTO         AS DATALANCTO, ','' ) +#13+
   '                     SUM( PF.VLRPAGO ) AS RECEITA_LIQUIDA          '+#13+
   '            FROM     PARCFINANCIMOV PF,                            '+#13+
   '                     CONDPAGIMOVEL  CP                             '+#13+
   '            WHERE    PF.DATAPAGAMENTO BETWEEN ' + sIniAno + ' AND ' + sFimMes +#13+
   '              AND    CP.IDCONDINICIAL  = PF.IDCONDPAGIMOVEL        '+#13+
   '              AND    CP.IDREPACTUA     IS NULL                     '+#13+
   '            GROUP BY CP.IDCONTRATOIMOVEL,                          '+#13+
                         Iff( bCotas, ' PF.DATAPAGAMENTO, ','' )       +#13+
   '                     TO_CHAR( PF.DATAPAGAMENTO, ''YYYYMM'' ) ) PF, '+#13+

   '          ( SELECT   PI.IDIMOVEL,                                  '+#13+
   '                     PI.IDPATRO,                                   '+#13+
   '                     PI.IDPLANOPREV,                               '+#13+
   '                     DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR '+#13+
   '            FROM     PLANOPATROXIMOVEL PI,                         '+#13+
   '                     ( SELECT   IDIMOVEL,                          '+#13+
   '                                SUM( PPIPERCENTRATEIO ) AS TOTAL   '+#13+
   '                       FROM     PLANOPATROXIMOVEL                  '+#13+
   '                       GROUP BY IDIMOVEL ) TT                      '+#13+
   '            WHERE    PI.IDIMOVEL = TT.IDIMOVEL ) FT                '+#13+
   ' WHERE    CI.FLGTIPOCONTRATO  = ''C''                              '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = PF.IDCONTRATOIMOVEL                '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL                '+#13+
   '   AND    CX.IDIMOVEL         = FT.IDIMOVEL                        '+#13+
   '   AND    TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  '+#13+
   ' GROUP BY CI.IDCONTRATOIMOVEL,                                     '+#13+
   '          PF.ANOMES,                                               '+#13+
              Iff( bCotas, ' PF.DATALANCTO ',
                           ' FT.IDPATRO, FT.IDPLANOPREV ')              +#13+

   Iff( bCotas,  ' ORDER BY 1, 2, 3 ',
                 ' ORDER BY 1, 2, 3, 4  ' );

  Result := GetDataPacket( sSQL );
end;


function TCtrlMapaTIR.ReceitaAlienacaoDiaADia(dData: TDateTime; sPatroPlano: string): OLEVariant;
var sSQL : string;
    sIniAno, sFimMes : string;
begin
   sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dData ) );
   sFimMes := QuotedStr( FormatDateTime( 'dd/mm/yyyy',
              DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dData ), DiasUteis.ExtraiMes( dData ) ) ) );

   sSQL :=
   ' SELECT   CI.IDCONTRATOIMOVEL, '+#13+
   '          PF.ANOMES,           '+#13+
   '          NVL(PF.DATALANCTO,RA.DATABAIXA) AS DATALANCTO, '+#13+
   '          NVL( ROUND( SUM( ( ( (NVL(PF.RECEITA_LIQUIDA,0) / CI.VLRPROPOSTA ) * CX.VLRVENDA ) + NVL(RA.TOT_RECEBIDO,0)) * FT.FATOR ), 2 ), 0 )  AS RECEITA, '+#13+
   '          NVL( ROUND( SUM( ( DECODE(PF.DATALANCTO,RA.DATABAIXA,NVL(RA.TOT_PAGO,0),0)) * FT.FATOR ), 2 ), 0 )  AS DESPESA '+#13+

   ' FROM     CONTRATOIMOVEL  CI,   '+#13+
   '          CONTRATOXIMOVEL CX,   '+#13+
   '           (' + #13+
   '            SELECT   CP.IDCONTRATOIMOVEL,' + #13+
   '                     TO_CHAR( DECODE(PF.CODDOCUMENTO, NULL, PF.DATAPAGAMENTO, RP.DATABAIXA), ''YYYYMM'' ) AS ANOMES,' + #13+
   '                     DECODE(PF.CODDOCUMENTO, NULL, PF.DATAPAGAMENTO, RP.DATABAIXA) AS DATALANCTO,     '+#13+
   '                     DECODE(PF.CODDOCUMENTO, NULL, SUM(PF.VLRPAGO), ' + #13+
   '                          SUM( DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * PF.VLRPAGO / TR2.VALOR, LD.VALOR * (-1) * PF.VLRPAGO / TR2.VALOR), 0 ), 0 ) )) AS RECEITA_LIQUIDA' + #13 +

   '            FROM     PARCFINANCIMOV PF,' + #13+
   '                     CONDPAGIMOVEL  CP,' + #13+
   '                     DOCUMENTO      D,' + #13+
   '                     LANCTODOCUM    LD,' + #13+
   '                     RECBTOPAGTO    RP,' + #13+
   '                     ( SELECT CODDOCUMENTO,' + #13+
   '                              VALOR' + #13+
   '                         FROM LANCTODOCUM' + #13+
   '                        WHERE ESTORNO IS NULL' + #13+
   '                          AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR2' + #13+

   '            WHERE    PF.DATAPAGAMENTO BETWEEN  ' + sIniAno + ' AND ' + sFimMes +#13+
   '              AND    PF.CODDOCUMENTO       = D.CODDOCUMENTO(+)' + #13+
   '              AND    D.CODDOCUMENTO        = LD.CODDOCUMENTO(+)' + #13+
   '              AND    D.CODDOCUMENTO        = TR2.CODDOCUMENTO(+)' + #13+
   '              AND    LD.CODDOCUMENTO       = RP.CODDOCUMENTO(+)' + #13+
   '              AND    LD.NUMLANCTO          = RP.NUMLANCTO(+)' + #13+
   '              AND    CP.IDCONDINICIAL      = PF.IDCONDPAGIMOVEL' + #13+
   '              AND    CP.IDREPACTUA        IS NULL' + #13+
   '              AND    LD.ESTORNO           IS NULL' + #13+
   '              AND    TO_CHAR( DECODE(PF.CODDOCUMENTO, NULL, PF.DATAPAGAMENTO, RP.DATABAIXA), ''YYYYMM'' ) IS NOT NULL' + #13+
   '              AND    ( (PF.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA BETWEEN '+ sIniAno + ' AND ' + sFimMes + ')) OR' + #13+
   '                       (PF.CODDOCUMENTO IS NOT NULL AND (PF.DATAVENCIMENTO BETWEEN ' + sIniAno + ' AND ' + sFimMes + ')) )' + #13+

   '            GROUP BY CP.IDCONTRATOIMOVEL,' + #13+
   '                     PF.CODDOCUMENTO,' + #13+
   '                     PF.DATAPAGAMENTO, ' + #13+
   '                     TO_CHAR( PF.DATAPAGAMENTO, ''YYYYMM'' ) ,' + #13+
   '                     RP.DATABAIXA' + #13+
   '           ) PF,' + #13+

   '          ( SELECT   I.IDIMOVEL,        ' +#13+
   '                     RP.DATABAIXA,      ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCRECEB,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''R'', DECODE( LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_RECEBIDO,  ' +#13+
   '                     SUM( DECODE(TI.FLGTIPOINTERNO, ''P'', LI.VLRLANCPAGAR,   ' +#13+
   '                          DECODE( RTRIM( LD.OPERACAO ), ''5'', DECODE( D.RECPAG, ''P'', DECODE( LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TR2.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TR2.VALOR), 0 ), 0 ) ) ) AS TOT_PAGO       ' +#13+
   '            FROM     DOCUMENTO         D,     ' +#13+
   '                     LANCTODOCUM       LD,    ' +#13+
   '                     LANCAMENTOSIMOVEL LI,    ' +#13+
   '                     IMOVEL            I,     ' +#13+
   '                     TIPOIMOVEL        TI,    ' +#13+
   '                     RECBTOPAGTO       RP,    ' +#13+
   '                     TIPOCUSTORECIMOV  TC,    ' +#13+
   '                     ( SELECT CODDOCUMENTO,   ' +#13+
   '                              VALOR           ' +#13+
   '                         FROM LANCTODOCUM     ' +#13+
   '                        WHERE ESTORNO IS NULL ' +#13+
   '                          AND RTRIM( OPERACAO ) IN ( ''1'', ''2'', ''3'', ''12'' ) ) TR2  ' +#13+
   '            WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)    )  ' +#13+
   '              AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)   )  ' +#13+
   '              AND    ( D.CODDOCUMENTO       = TR2.CODDOCUMENTO(+)  )  ' +#13+
   '              AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)   )  ' +#13+
   '              AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)      )  ' +#13+
   '              AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO )  ' +#13+
   '              AND    ( LI.IDIMOVEL          = I.IDIMOVEL           )  ' +#13+
   '              AND    ( I.CODTIPIMOVEL       = TI.CODTIPIMOVEL      )  ' +#13+
   '              AND    ( TC.FLGRENTAB         = 1                    )  ' +#13+
   '              AND    ( LI.IDMODULO          = 64                   )  ' +#13+
   '              AND    ( LD.ESTORNO IS NULL                          )  ' +#13+
   '              AND LI.IDIMOVEL IN (  SELECT CI.IDIMOVEL                              ' +#13+
   '                                      FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CI     ' +#13+
   '                                     WHERE C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ' +#13+
   '                                       AND C.FLGTIPOCONTRATO = ''C''                ' +#13+
   '                                       AND C.CONDATAASSINATURA <= RP.DATABAIXA )    ' +#13+
   '              AND    ( ((TI.FLGTIPOINTERNO <> ''P'') AND (RP.DATABAIXA BETWEEN ' + sIniAno + ' AND ' + sFimMes + ')) OR      ' +#13+
   '                       ((TI.FLGTIPOINTERNO =  ''P'') AND (LI.DATAVENCIMENTO BETWEEN ' + sIniAno + ' AND ' + sFimMes + ')) )  ' +#13+
   '            GROUP BY I.IDIMOVEL, RP.DATABAIXA ) RA,  ' +#13+

   '          ( SELECT   PI.IDIMOVEL,                                  '+#13+
   '                     PI.IDPATRO,                                   '+#13+
   '                     PI.IDPLANOPREV,                               '+#13+
   '                     DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR '+#13+
   '            FROM     PLANOPATROXIMOVEL PI,                         '+#13+
   '                     ( SELECT   IDIMOVEL,                          '+#13+
   '                                SUM( PPIPERCENTRATEIO ) AS TOTAL   '+#13+
   '                       FROM     PLANOPATROXIMOVEL                  '+#13+
   '                       GROUP BY IDIMOVEL ) TT                      '+#13+
   '            WHERE    PI.IDIMOVEL = TT.IDIMOVEL ) FT                '+#13+
   ' WHERE    CI.FLGTIPOCONTRATO  = ''C''                              '+#13+
   '   AND    CI.CONDATAASSINATURA <= ' + sIniAno                       +#13+
   '   AND   (CI.CONDATAFIM IS NULL OR CI.CONDATAFIM >= ' +sFimMes+ ') '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = PF.IDCONTRATOIMOVEL(+)             '+#13+
   '   AND    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL                '+#13+
   '   AND    CX.IDIMOVEL         = RA.IDIMOVEL(+)                     '+#13+
   '   AND    CX.IDIMOVEL         = FT.IDIMOVEL                        '+#13+
   '   AND    TO_CHAR( FT.IDPATRO ) || ''/'' || TO_CHAR( FT.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  '+#13+
   ' GROUP BY CI.IDCONTRATOIMOVEL,            '+#13+
   '          PF.ANOMES,                      '+#13+
   '          NVL(PF.DATALANCTO,RA.DATABAIXA) '+#13+
   ' ORDER BY 1, 2, 3 ';

   CMDebugToFile(' ', 'RENTABCOTA.TXT');
   CMDebugToFile('Recupera dados de Alienação dia a dia - Cotas...', 'RENTABCOTA.TXT');
   CMDebugToFile(sSql, 'RENTABCOTA.TXT');

   Result := GetDataPacket( sSQL );
end;





function TCtrlMapaTIR.RateiaSaldoAlienacao( iContrato: Integer; fSaldo: extended ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT   FT.IDPATRO,                                                                                                                     ' +
   '          FT.IDPLANOPREV,                                                                                                                 ' +
   '          NVL( ROUND( SUM( ( ( ' + StringReplace( FormatFloat( '0.00000', fSaldo ), ',', '.', [rfReplaceAll] )                              +
   ' / CI.VLRPROPOSTA ) * CX.VLRVENDA ) * FT.FATOR ), 2 ), 0 ) AS SALDO                                                                       ' +
   ' FROM     CONTRATOIMOVEL CI,                                                                                                              ' +
   '          CONTRATOXIMOVEL CX,                                                                                                             ' +
   '          ( SELECT   PI.IDIMOVEL,                                                                                                         ' +
   '                     PI.IDPATRO,                                                                                                          ' +
   '                     PI.IDPLANOPREV,                                                                                                      ' +
   '                     DECODE( PI.FLGTIPO, ''P'', ( PI.PPIPERCENTRATEIO / 100 ), ''C'', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS FATOR ' +
   '            FROM     PLANOPATROXIMOVEL PI,                                                                                                ' +
   '                     ( SELECT   IDIMOVEL,                                                                                                 ' +
   '                                SUM( PPIPERCENTRATEIO ) AS TOTAL                                                                          ' +
   '                       FROM     PLANOPATROXIMOVEL                                                                                         ' +
   '                       GROUP BY IDIMOVEL ) TT                                                                                             ' +
   '            WHERE    PI.IDIMOVEL = TT.IDIMOVEL ) FT                                                                                       ' +
   ' WHERE    CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL                                                                                       ' +
   '   AND    CX.IDCONTRATOIMOVEL = ' + IntToStr( iContrato )                                                                                   +
   '   AND    CX.IDIMOVEL         = FT.IDIMOVEL                                                                                               ' +
   ' GROUP BY FT.IDPATRO,                                                                                                                     ' +
   '          FT.IDPLANOPREV                                                                                                                  ' );
end;


{ATENÇÃO:
Esta função foi criada para solucionar o problema com a função Power,
cuja chamada estava gerando problema de "Invalid float point operation".}
function TCtrlMapaTIR.ElevaBase( fBase : extended; iExpoente: integer ): extended;
var
  i : integer;
begin
  Result := fBase;
  if Result <> 0 then
  begin
    if iExpoente = 0 then
      Result := 1
    else
      for i := 2 to iExpoente do
        Result := Result * fBase;
  end;
end;

function TCtrlMapaTIR.DadosFundoImob(dDtIni, dDtFim: TDateTime; sPatroPlano: string): OleVariant;
var
  sSQL : string;
  sIni, sFim, sIniAno, sAnt : string;
begin

  sIni    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni      ) );
  sFim    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtFim      ) );
  sAnt    := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtIni - 1  ) );
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dDtIni ) );

  sSQL :=
   ' SELECT   VS.IDFUNDOINVEST,   '+#13+
   '          VS.DESCFUNDOINVEST, '+#13+
   '          NVL( ROUND( SUM( VS.VALOR_CONTABIL ) / 1000, 2 ), 0) AS VALOR_CONTABIL,           '+#13+
   '          NVL( ROUND( SUM( VS.ULTREAVALIA ) / 1000, 2 ), 0) AS ULTREAVALIA,                 '+#13+
   '          NVL( ROUND( SUM( RM.RECEITA_LIQUIDA_MES ) / 1000, 2 ), 0) AS RECEITA_LIQUIDA_MES, '+#13+
   '          NVL( ROUND( SUM( RA.RECEITA_LIQUIDA_ANO ) / 1000, 2 ), 0) AS RECEITA_LIQUIDA_ANO  '+#13+
   ' FROM     ( SELECT HF.IDFUNDOINVEST,     '+#13+
   '                   HF.DESCFUNDOINVEST,   '+#13+
   '                   PP.IDPLANPREVCTBPATR, '+#13+
   '                   PP.IDPATRO,           '+#13+
   '                   PP.IDPLANOPREV,       '+#13+
   '                   VL.VALOR_CONTABIL,    '+#13+
   '                   VL.ULTREAVALIA        '+#13+
   '            FROM   ( SELECT HF1.IDFUNDOINVEST,   '+#13+
   '                            HF1.DESCFUNDOINVEST  '+#13+
   '                     FROM   HISTFUNDOINVEST HF1  '+#13+
   '                     WHERE  HF1.DTAVIGENCIA = ( SELECT MAX( HF2.DTAVIGENCIA )   '+#13+
   '                                                FROM   HISTFUNDOINVEST HF2      '+#13+
   '                                                WHERE  HF2.IDFUNDOINVEST = HF1.IDFUNDOINVEST    '+#13+
   '                                                  AND  HF2.DTAVIGENCIA <= ' + sFim + ' ) ) HF,  '+#13+
   '                   ( SELECT PA.IDPLANPREVCTBPATR,   '+#13+
   '                            PA.IDPATRO,             '+#13+
   '                            PA.IDPLANOPREV          '+#13+
   '                     FROM   PESSOA PE,              '+#13+
   '                            PLANPREVCONTABPATRO PA, '+#13+
   '                            PLANPREVCONTABIL PL     '+#13+
   '                     WHERE  ( PA.IDPATRO     = PE.IDPESSOA(+) ) AND   '+#13+
   '                            ( PA.IDPLANOPREV = PL.IDPLANOPREV ) ) PP, '+#13+
   '                   ( SELECT H.IDFUNDOINVEST,        '+#13+
   '                            H.IDPLANPREVCTBPATR,    '+#13+
   '                            ( H.SALDOQTDCOTAS * CFF.VLRCOTA ) AS VALOR_CONTABIL, '+#13+
   '                            ( H.SALDOQTDCOTAS * CII.VLRCOTA ) AS ULTREAVALIA     '+#13+
   '                     FROM   ( SELECT CF.IDFUNDOINVEST, '+#13+
   '                                     CF.VLRCOTA,       '+#13+
   '                                     CF.DATACOTA       '+#13+
   '                              FROM   COTAFUNDO CF      '+#13+
   '                              WHERE  ( CF.DATACOTA || CF.IDFUNDOINVEST IN ( SELECT MAX( CF1.DATACOTA ) || CF1.IDFUNDOINVEST  '+#13+
   '                                                                            FROM   COTAFUNDO CF1   '+#13+
   '                                                                            WHERE  ( CF1.DATACOTA <= TO_DATE( ' + sFim + ', ''DD/MM/YYYY'' ) ) AND  '+#13+
   '                                                                                   ( CF1.IDTIPOCOTA IS NULL )      '+#13+
   '                                                                            GROUP BY CF1.IDFUNDOINVEST ) ) ) CFF,  '+#13+
   '                            ( SELECT CI.IDFUNDOINVEST,   '+#13+
   '                                     CI.VLRCOTA,         '+#13+
   '                                     CI.DATACOTA         '+#13+
   '                              FROM   COTAINTEGRFUNDO CI  '+#13+
   '                              WHERE  ( CI.DATACOTA || CI.IDFUNDOINVEST IN ( SELECT   MAX( CI1.DATACOTA ) || CI1.IDFUNDOINVEST   '+#13+
   '                                                                            FROM     COTAINTEGRFUNDO CI1                        '+#13+
   '                                                                            WHERE    ( CI1.DATACOTA <= TO_DATE( ' + sFim + ', ''DD/MM/YYYY'' ) ) AND  '+#13+
   '                                                                                     ( CI1.IDTIPOCOTA IS NULL )    '+#13+
   '                                                                            GROUP BY CI1.IDFUNDOINVEST ) ) ) CII,  '+#13+
   '                            ( SELECT   SUM(HI.SALDOQTDCOTAS) AS SALDOQTDCOTAS,   '+#13+
   '                                       HI.IDFUNDOINVEST,      '+#13+
   '                                       HI.IDPLANPREVCTBPATR   '+#13+
   '                              FROM     HISTFUNDO HI           '+#13+
   '                              WHERE    ( HI.IDHISTFUNDO IN ( SELECT   MAX( H2.IDHISTFUNDO ) AS IDHISTFUNDO   '+#13+
   '                                                             FROM     HISTFUNDO H2,    '+#13+
   '                                                                      TIPOOPERACAO TP  '+#13+
   '                                                             WHERE    ( H2.DATAMOVFUNDO = ( SELECT   MAX( H3.DATAMOVFUNDO ) AS IDHISTFUNDO  '+#13+
   '                                                                                            FROM     HISTFUNDO H3,    '+#13+
   '                                                                                                     TIPOOPERACAO TP  '+#13+
   '                                                                                            WHERE    ( H3.DATAMOVFUNDO < TO_DATE( ' + sFim + ', ''DD/MM/YYYY'' ) ) AND  '+#13+
   '                                                                                                     ( H3.TIPMOVFUNDO <> ''PIR'' ) AND     '+#13+
   '                                                                                                     ( TP.NATUREZAOPERACAO <> ''R'' ) AND  '+#13+
   '                                                                                                     ( TP.IDTIPOOPERACAO <> -43 ) AND      '+#13+
   '                                                                                                     ( H3.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ) AND   '+#13+
   '                                                                                                     ( H3.IDHISTFUNDO = H2.IDHISTFUNDO )  '+#13+
   '                                                                                            GROUP BY H3.IDFUNDOINVEST,           '+#13+
   '                                                                                                     H3.IDPLANPREVCTBPATR,       '+#13+
   '                                                                                                     H3.DATAAPLICACAO ) ) AND    '+#13+
   '                                                                      ( H2.TIPMOVFUNDO <> ''PIR'' ) AND         '+#13+
   '                                                                      ( TP.NATUREZAOPERACAO <> ''R'' ) AND      '+#13+
   '                                                                      ( TP.IDTIPOOPERACAO <> -43 ) AND          '+#13+
   '                                                                      ( H2.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ) '+#13+
   '                                                             GROUP BY H2.IDFUNDOINVEST,                         '+#13+
   '                                                                      H2.IDPLANPREVCTBPATR,                     '+#13+
   '                                                                      H2.DATAAPLICACAO ) ) AND                  '+#13+
   '                                       ( HI.SALDOQTDCOTAS > 0 )            '+#13+
   '                              GROUP BY HI.IDFUNDOINVEST,                   '+#13+
   '                                       HI.IDPLANPREVCTBPATR ) H            '+#13+
   '                     WHERE ( H.IDFUNDOINVEST = CFF.IDFUNDOINVEST(+) ) AND  '+#13+
   '                           ( H.IDFUNDOINVEST = CII.IDFUNDOINVEST(+) ) ) VL '+#13+
   '            WHERE  HF.IDFUNDOINVEST     = VL.IDFUNDOINVEST                 '+#13+
   '              AND  VL.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR  ) VS,      '+#13+

   // nova posição para rentabilidade por COTAS - vai na OPERACAOFUNDO
   '          ( SELECT   HI.IDFUNDOINVEST,       '+#13+
   '                     HI.IDPLANPREVCTBPATR,   '+#13+
   '                     SUM( HI.VLROPERACAO ) AS RECEITA_LIQUIDA_MES  '+#13+
   '            FROM     OPERACAOFUNDO HI  '+#13+
   '            WHERE    HI.IDTIPOOPERACAO IN ( SELECT IDTIPOOPERACAO     '+#13+
   '                                            FROM   TIPOOPERACAO       '+#13+
   '                                            WHERE  ( IDTIPOOPERACAO   = -43 )   '+#13+
   '                                               OR  ( NATUREZAOPERACAO = ''R'' ) )   '+#13+
   '              AND    HI.DATALIQUIDACAO BETWEEN TO_DATE( ' + sIni + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + sFim + ', ''DD/MM/YYYY'' )  '+#13+
   '            GROUP BY HI.IDFUNDOINVEST,             '+#13+
   '                     HI.IDPLANPREVCTBPATR ) RM,    '+#13+
   '          ( SELECT   HI.IDFUNDOINVEST,             '+#13+
   '                     HI.IDPLANPREVCTBPATR,         '+#13+
   '                     SUM( HI.VLROPERACAO ) AS RECEITA_LIQUIDA_ANO     '+#13+
   '            FROM     OPERACAOFUNDO HI                                 '+#13+
   '            WHERE    HI.IDTIPOOPERACAO IN ( SELECT IDTIPOOPERACAO     '+#13+
   '                                            FROM   TIPOOPERACAO       '+#13+
   '                                            WHERE  ( IDTIPOOPERACAO   = -43 )  '+#13+
   '                                               OR  ( NATUREZAOPERACAO = ''R'' ) )   '+#13+
   '              AND    HI.DATALIQUIDACAO BETWEEN TO_DATE( ' + sIniAno + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + sFim + ', ''DD/MM/YYYY'' )  '+#13+
   '            GROUP BY HI.IDFUNDOINVEST,              '+#13+
   '                     HI.IDPLANPREVCTBPATR ) RA      '+#13+
   ' WHERE    VS.IDFUNDOINVEST     = RM.IDFUNDOINVEST     (+)  '+#13+
   '   AND    VS.IDPLANPREVCTBPATR = RM.IDPLANPREVCTBPATR (+)  '+#13+
   '   AND    VS.IDFUNDOINVEST     = RA.IDFUNDOINVEST     (+)  '+#13+
   '   AND    VS.IDPLANPREVCTBPATR = RA.IDPLANPREVCTBPATR (+)  '+#13+
   '   AND    TO_CHAR( VS.IDPATRO ) || ''/'' || TO_CHAR( VS.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  '+#13+
   ' GROUP BY VS.IDFUNDOINVEST,   '+#13+
   '          VS.DESCFUNDOINVEST  ';

   CMDebugToFile(sSql,'MapaCota.txt');

  Result := GetDataPacket( sSQL );
end;

function TCtrlMapaTIR.ReceitaFundoImobMesAMes(dData: TDateTime; sPatroPlano: string; bCotas : Boolean = False ): OLEVariant;
var
  sSQL : string;
  sIniAno, sFimMes : string;
begin
  sIniAno := QuotedStr( '01/01/' + FormatDateTime( 'yyyy', dData ) );
  sFimMes := QuotedStr( FormatDateTime( 'dd/mm/yyyy',
             DiasUteis.UltDiaMes( DiasUteis.ExtraiAno( dData ), DiasUteis.ExtraiMes( dData ) ) ) );

  sSQL :=
   ' SELECT   HI.IDFUNDOINVEST,  ' +#13+
   '          TO_CHAR( HI.DATALIQUIDACAO, ''YYYYMM'' ) AS ANOMES,  ' +#13+

   Iff( bCotas, ' HI.DATALIQUIDACAO AS DATALANCTO, ',
                ' PP.IDPATRO,           '+#13+
                ' PP.IDPLANOPREV,       ' ) +#13+

   '          SUM( HI.VLROPERACAO ) AS RECEITALIQUIDA ' +#13+
   ' FROM     OPERACAOFUNDO HI,                       ' +#13+
   '          ( SELECT PA.IDPLANPREVCTBPATR,          ' +#13+
   '                   PA.IDPATRO,                    ' +#13+
   '                   PA.IDPLANOPREV                 ' +#13+
   '            FROM   PESSOA PE,                     ' +#13+
   '                   PLANPREVCONTABPATRO PA,        ' +#13+
   '                   PLANPREVCONTABIL PL            ' +#13+
   '            WHERE  ( PA.IDPATRO     = PE.IDPESSOA(+) ) AND  ' +#13+
   '                   ( PA.IDPLANOPREV = PL.IDPLANOPREV ) ) PP ' +#13+
   ' WHERE    HI.IDTIPOOPERACAO IN ( SELECT IDTIPOOPERACAO      ' +#13+
   '                                 FROM   TIPOOPERACAO        ' +#13+
   '                                 WHERE  ( IDTIPOOPERACAO   = -43 )     ' +#13+
   '                                    OR  ( NATUREZAOPERACAO = ''R'' ) ) ' +#13+
   '   AND    HI.DATALIQUIDACAO BETWEEN TO_DATE( ' + sIniAno + ', ''DD/MM/YYYY'' ) AND TO_DATE( '+ sFimMes + ', ''DD/MM/YYYY'' ) ' +#13+
   '   AND    HI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR     ' +#13+
   '   AND    TO_CHAR( PP.IDPATRO ) || ''/'' || TO_CHAR( PP.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )  ' +#13+
   ' GROUP BY HI.IDFUNDOINVEST,                          ' +#13+
   '          TO_CHAR( HI.DATALIQUIDACAO, ''YYYYMM'' ),  ' +#13+
              Iff( bCotas, ' HI.DATALIQUIDACAO ',
                           ' PP.IDPATRO, PP.IDPLANOPREV ')              +#13+
   Iff( bCotas,  ' ORDER BY 1, 2, 3 ',
                 ' ORDER BY 1, 2, 3, 4  ' );

  Result := GetDataPacket( sSQL );
end;

function TCtrlMapaTIR.RecuperaUltAvalFundoImob( dData: TDateTime; sPatroPlano: string ): OLEVariant;
var
  cdsLocal : TCmClientDataset;
  sData : string;
begin
  sData := QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData  ) );

  cdsLocal := TCmClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT H.IDFUNDOINVEST,                                                                                                                            ' +
     '        PP.IDPATRO,                                                                                                                                 ' +
     '        PP.IDPLANOPREV,                                                                                                                             ' +
     '        ( H.SALDOQTDCOTAS * CII.VLRCOTA ) AS ULTREAVALIA                                                                                            ' +
     ' FROM   ( SELECT PA.IDPLANPREVCTBPATR,                                                                                                              ' +
     '                 PA.IDPATRO,                                                                                                                        ' +
     '                 PA.IDPLANOPREV                                                                                                                     ' +
     '          FROM   PESSOA PE,                                                                                                                         ' +
     '                 PLANPREVCONTABPATRO PA,                                                                                                            ' +
     '                 PLANPREVCONTABIL PL                                                                                                                ' +
     '          WHERE  ( PA.IDPATRO     = PE.IDPESSOA(+) ) AND                                                                                            ' +
     '          ( PA.IDPLANOPREV = PL.IDPLANOPREV ) ) PP,                                                                                                 ' +
     '        ( SELECT CI.IDFUNDOINVEST,                                                                                                                  ' +
     '                 CI.VLRCOTA,                                                                                                                        ' +
     '                 CI.DATACOTA                                                                                                                        ' +
     '          FROM   COTAINTEGRFUNDO CI                                                                                                                 ' +
     '          WHERE  ( CI.DATACOTA || CI.IDFUNDOINVEST IN ( SELECT   MAX( CI1.DATACOTA ) || CI1.IDFUNDOINVEST                                           ' +
     '                                                        FROM     COTAINTEGRFUNDO CI1                                                                ' +
     '                                                        WHERE    ( CI1.DATACOTA <= TO_DATE( ' + sData + ', ''DD/MM/YYYY'' ) ) AND                   ' +
     '                                                                 ( CI1.IDTIPOCOTA IS NULL )                                                         ' +
     '                                                        GROUP BY CI1.IDFUNDOINVEST ) ) ) CII,                                                       ' +
     '        ( SELECT   SUM(HI.SALDOQTDCOTAS) AS SALDOQTDCOTAS,                                                                                          ' +
     '                   HI.IDFUNDOINVEST,                                                                                                                ' +
     '                   HI.IDPLANPREVCTBPATR                                                                                                             ' +
     '          FROM     HISTFUNDO HI                                                                                                                     ' +
     '          WHERE    ( HI.IDHISTFUNDO IN ( SELECT   MAX( H2.IDHISTFUNDO ) AS IDHISTFUNDO                                                              ' +
     '                                         FROM     HISTFUNDO H2,                                                                                     ' +
     '                                                  TIPOOPERACAO TP                                                                                   ' +
     '                                         WHERE    ( H2.DATAMOVFUNDO = ( SELECT   MAX( H3.DATAMOVFUNDO ) AS IDHISTFUNDO                              ' +
     '                                                                        FROM     HISTFUNDO H3,                                                      ' +
     '                                                                                 TIPOOPERACAO TP                                                    ' +
     '                                                                        WHERE    ( H3.DATAMOVFUNDO < TO_DATE( ' + sData + ', ''DD/MM/YYYY'' ) ) AND ' +
     '                                                                                 ( H3.TIPMOVFUNDO <> ''PIR'' ) AND                                  ' +
     '                                                                                 ( TP.NATUREZAOPERACAO <> ''R'' ) AND                               ' +
     '                                                                                 ( TP.IDTIPOOPERACAO <> -43 ) AND                                   ' +
     '                                                                                 ( H3.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ) AND                      ' +
     '                                                                                 ( H3.IDHISTFUNDO = H2.IDHISTFUNDO )                                ' +
     '                                                                        GROUP BY H3.IDFUNDOINVEST,                                                  ' +
     '                                                                                 H3.IDPLANPREVCTBPATR,                                              ' +
     '                                                                                 H3.DATAAPLICACAO ) ) AND                                           ' +
     '                                                  ( H2.TIPMOVFUNDO <> ''PIR'' ) AND                                                                 ' +
     '                                                  ( TP.NATUREZAOPERACAO <> ''R'' ) AND                                                              ' +
     '                                                  ( TP.IDTIPOOPERACAO <> -43 ) AND                                                                  ' +
     '                                                  ( H2.IDTIPOOPERACAO = TP.IDTIPOOPERACAO )                                                         ' +
     '                                         GROUP BY H2.IDFUNDOINVEST,                                                                                 ' +
     '                                                  H2.IDPLANPREVCTBPATR,                                                                             ' +
     '                                                  H2.DATAAPLICACAO ) ) AND                                                                          ' +
     '                   ( HI.SALDOQTDCOTAS > 0 )                                                                                                         ' +
     '          GROUP BY HI.IDFUNDOINVEST,                                                                                                                ' +
     '        HI.IDPLANPREVCTBPATR ) H                                                                                                                    ' +
     ' WHERE  H.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR                                                                                                  ' +
     '   AND  H.IDFUNDOINVEST     = CII.IDFUNDOINVEST(+)                                                                                                  ' +
     '   AND  TO_CHAR( PP.IDPATRO ) || ''/'' || TO_CHAR( PP.IDPLANOPREV ) IN ( ' + sPatroPlano + ' )                                                      ' );

    Result := cdsLocal.Data;

  finally
    cdsLocal.Free;
  end;
end;

function Inteiro(Value: extended): integer;
var
  s : string;
  i : integer;
begin
  s := FloatToStr( Value );
  i := Pos( '.', s );
  if i > 0 then
    s := Copy( s, 1, i - 1 );
  Result := StrToInt( s )
end;

function TCtrlMapaTIR.ListaTiposImoveis: OleVariant;
begin
  Result := GetDataPacket( ' SELECT CODTIPIMOVEL,  ' +
                           '        DESCTIPOIMOVEL ' +
                           ' FROM   TIPOIMOVEL     ' );
end;

function TCtrlMapaTIR.DadosTIRPorProjeto(const iMes, iAno: Integer; const sCodTipImovel : string = ''): OLEVariant;
var sParam, sAnoMes : String;
begin
  sAnoMes := IntToStr(iAno) + FormatFloat('00',iMes);
  sParam  := '';
  if sCodTipImovel <> '' then sParam := ' AND I.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel);

  Result := GetDataPacket(
   ' SELECT   IM.IDIMOVEL,   '+#13+
   '          IM.IMONOME,    '+#13+
   '          M.MOESIGLA,    '+#13+
   '          IM.TAXACOMPRA, '+#13+
   '          DECODE( IM.IMODATACOMPRA, NULL, MIN( I.IMODATACOMPRA ), IM.IMODATACOMPRA ) AS DATAAQUISICAO,  '+#13+
   '          ''          '' AS INDTIR1,   '+#13+
   '          ''          '' AS INDTIR2,   '+#13+
   '          0 AS TXTIR1,                 '+#13+
   '          0 AS TXTIR2,                 '+#13+
   '          ''          '' AS PERCVPL1,  '+#13+
   '          ''          '' AS PERCVPL2,  '+#13+
   '          ''          '' AS PERCVPL3,  '+#13+
   '          0 AS VPL1,                   '+#13+
   '          0 AS VPL2,                   '+#13+
   '          0 AS VPL3,                   '+#13+
   '          0 AS PAYBACK                 '+#13+
   ' FROM     IMOVEL IM,                   '+#13+
   '          MOEDA   M,                   '+#13+
   '          ( SELECT I.IDIMOVEL,         '+#13+
   '                   I.IDIMOVELMESTRE,   '+#13+
   '                   TI.CODTIPIMOVEL,    '+#13+
   '                   TI.DESCTIPOIMOVEL,  '+#13+
   '                   TI.FLGTIPOINTERNO,  '+#13+
   '                   I.IMODATACOMPRA     '+#13+
   '              FROM IMOVEL       I,     '+#13+
   '                   TIPOIMOVEL   TI,    '+#13+

// Daniel Simões - 20/04/2006 - P: 22126 - Início ------------------------------
   '                   ( SELECT IDIMOVEL, MIN(EVIDATA) AS DTVENDA  '+#13+
   '                       FROM EVENTOIMOVEL                       '+#13+
   '                      WHERE FLGTIPOEVENTO IN(''CA'',''BD'',''BR'') '+#13+
   '                      GROUP BY IDIMOVEL                        '+#13+
   '                   ) AL                                        '+#13+
   '             WHERE I.CODTIPIMOVEL    = TI.CODTIPIMOVEL         '+#13+
   '               AND I.IDIMOVEL = AL.IDIMOVEL(+)                 '+#13+
   '               AND ( AL.DTVENDA IS NULL OR                     '+#13+
   '                     TO_CHAR(AL.DTVENDA,''YYYYMM'') > ' + sAnoMes + ' ) '+#13+ sParam +
   '                                                         ) I   '+#13+
// Daniel Simões - 20/04/2006 - P: 22126 - Fim ---------------------------------

   ' WHERE    IM.IDIMOVEL     = I.IDIMOVELMESTRE   '+#13+
   '   AND    IM.INDICECOMPRA = M.MOECODIGO (+)    '+#13+
   ' GROUP BY IM.IDIMOVEL,                         '+#13+
   '          IM.IMONOME,                          '+#13+
   '          M.MOESIGLA,                          '+#13+
   '          IM.TAXACOMPRA,                       '+#13+
   '          IM.IMODATACOMPRA                     '+#13+
   ' ORDER BY IM.IMONOME                           ' );
end;

function TCtrlMapaTIR.CalculaVPL(Taxa: extended;  fSeqVal: array of extended ): extended;
var
  i : integer;
  Formula1: TF1Book;
  fTaxa : extended;
  sFormula : string;
begin
  try
    Formula1 := TF1Book.Create( nil );
    try
      fTaxa := Power((Taxa/100+1),(1/12)) - 1;
      Formula1.ClearRange(-1, -1, -1, -1, F1ClearValues );
      Formula1.NumberRC[ 1, 1 ] := fTaxa;
      for i := 0 to High( fSeqVal ) do begin
        Formula1.NumberRC[ i + 2, 1 ] := fSeqVal[i];
      end;
      sFormula := 'NPV(A1;A2:A' + IntToStr( length( fSeqVal ) + 1 ) + ')';
      Formula1.FormulaRC[ i + 2, 1 ] := sFormula;
      Formula1.Recalc;
      Result := Formula1.NumberRC[ i + 2, 1 ];
    except
      Result := 0;
    end;
  finally
    Formula1.Free;
  end;
end;





end.
