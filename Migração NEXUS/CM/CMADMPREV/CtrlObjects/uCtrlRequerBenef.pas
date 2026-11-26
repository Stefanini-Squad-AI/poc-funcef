{-----------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------- Histórico de alterações --------------------------------------------------------
Rotina     : MontaSqlReservasNPNova
Nº WO......: 40258
Inicio dev : 18/06/2026
Responsável: Edilaine
Descrição..: Considerar Mes Referencia como Data de Recebimento no Resgate NP
------------------------------------------------------------------------------
Rotina     : MontaSqlReservasREBNova
Nº WO......: 39107
Inicio dev : 25/05/2026
Responsável: Edilaine
Descrição..: Incluir reservas de recomposição no cálculo
------------------------------------------------------------------------------
Rotina     : MontaSqlReservasREBNova
Nº WO......: 31408
Inicio dev : 22/01/2026
Responsável: Edilaine
Descrição..: Algumas reservas ficaram sem marcação de seqresgate no REB
------------------------------------------------------------------------------
Rotina     : MarcaReservasComplementares , MontaSqlReservasREBNova, MontaSqlReservasNPNova
Nº WO......: 25429
Inicio dev : 10/09/2025
Responsável: Edilaine
Descrição..: Marcar reservas de resgates anteriores
------------------------------------------------------------------------------
Rotina     : MontaSqlReservasREBNova
Nº WO......: 24962
Inicio dev : 28/08/2025
Responsável: Edilaine
Descrição..: Calcular tempo de associacao comparando qtde de dias em vez de anos
------------------------------------------------------------------------------
Rotina     : GetTotalResgate
Nº WO......: 20723
Inicio dev : 25/04/2025
Responsável: Edilaine
Descrição..: Resgate de Beneficiários não apresenta Tipo de Resgate para cálculo do IR
------------------------------------------------------------------------------
Rotina.....: GetTotalResgate
Nº SIG.....: WO10872
Data       : 25/08/2023
Responsável: Edilaine
Descrição..: Calculo total de cotas resgatadas Plano REB Regressivo com retençao
-----------------------------------------------------------------------------------------------------------------------------------
Nº SIG.....: 135762
Rotina     : ProcessaPrazoAcumulacao
Nº WO......: 9102
Inicio dev : 27/03/2024
Responsável: Edilaine
Descrição..: Segregar calculo do IR entre reservas Normais / Portadas
-----------------------------------------------------------------------------------------------------------------------------------
Nº SIG.....: 135762
Data       : 12/05/2023
Responsável: Leandro Pocebon
Descrição..: Calculo do IR REB
-----------------------------------------------------------------------------------------------------------------------------------
Rotina.....: MontaSqlReservasNP , MontaSqlReservasREB
Nº SIG.....: 133908
Data       : 05/04/2023
Responsável: Leandro Pocebon
Descrição..: Calculo do IR 
-----------------------------------------------------------------------------------------------------------------------------------
Rotina.....: MontaSqlReservasNP
Nº SIG.....: 132319
Data       : 06/02/2023
Responsável: Luis Ferrari
Descrição..: Calculo do IR 
-----------------------------------------------------------------------------------------------------------------------------------
Rotina.....: AtlzHISTMOVRESERVA, MarcaReservasResgatadas        MontaSqlReservasNP
Nº SIG.....: 130042
Data       : 31/10/2022
Responsável: Edilaine
Descrição..: Calculo do IR considera mais cotas do que resgatado
-----------------------------------------------------------------------------------------------------------------------------------
Rotina.....: Criação desta unit
Nº SIG.....: 20491
Data Merge : 24/06/2022
Data dev   : 27/02/2018
Responsável: Darivaldo Alencar
Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
             de retenção de percentual das contribuições
-----------------------------------------------------------------------------------------------------------------------------------}

unit uCtrlRequerBenef;
interface

Uses classes, SysUtils, uCmControlObject, uCmDbObject,  uSistema, uCMTypes, UFuncoesUteis,
     uCmClientDataSet, uMidasUtil, UCMFileUtils,Wwquery,UDataBase,Dialogs, UAdmPrev, uBeneficio;

Type
    TCtrlRequerBenef = class(TCmControlObject)

    private
      iIdPessoa,
      iIdPlanoPrev,
      iIdPessJur,
      iNumeroProcesso,
      iSeqProposta : Integer;
      iLinhaLimite : integer;


      qryAUX: TwwQuery;
    FListaHistRemover: string;

      Function TratarValor(dValor: double): String;

      Function getCamposHISTMOVRESERVA(sChave: String): String;
      Function GetHISTMOVRESERVA(qry : Twwquery; sDataCota : String; bRetorna: Boolean; dVlrResgate : double): double;
      function GetNumSeqResgate(iIdPlanoPrev, iIdPessJur, iIdPessoa, iSeqProposta : integer;
                                const bIncrementa : boolean = true) : Integer;

      Function MontaSqlReservasREB(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; sDataCota : string; const iSeqResgate : integer = -1) : string;
      Function MontaSqlReservasNP(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; const aSeqResgate : integer = -1) : string;

      //edilaine WO9102 : inicio
      Function MontaSqlReservasNovaREB(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; sDataCota : string; const iSeqResgate : integer = -1) : string;
      Function MontaSqlReservasNovaNP(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; const aSeqResgate : integer = -1) : string;
      //edilaine WO9102 : fim

      Function MontaSqlHISTMOVRESERVA(sDataCota : String; dVlrResgate : double; const iLimite : integer = -1; const iSeqResgate : integer = -1) : string;

      Function AtlzHISTMOVRESERVA(iSEQRESGATE: Integer; sIDHISTRESERVA: String; dVLRREAL, dVLRCOTAS, dSALDOREAL, dSALDOCOTAS: Double): Boolean;  overload;
      Function AtlzHISTMOVRESERVA(iSEQRESGATE: Integer; dVlrResgate : double; sDataCota : string): Boolean; overload;


      Function InserirHISTMOVRESERVA(sIDHISTRESERVA: string; dVLRREAL, dVLRCOTAS, dSALDOREAL, dSALDOCOTAS: Double; iFLGEntrada: Integer): Boolean;

      Function GetLinhaLimite(qry : Twwquery; sDataCota : string; dVlrResgate : double) : integer;

      // SIG 132319 Ferrari
      function TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev: integer): Boolean;


      //edilaine WO10872 : inicio
      Function MontaSqlReservasREBNova(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; sDataCota : string;
                                                  const iSeqResgate : integer = -1) : string;

      function MontaSqlReservasNPNova(aIdPessoa, aIdPessJur, aIdPlanoprev: integer;
                                                  const aSeqResgate : integer = -1): string;
    procedure SetListaHistRemover(const Value: string);
      //edilaine WO10872 : fim

    public
      Constructor Create;
      Destructor  Destroy;

      function GetValorIndice(piIdPlanoPrev, piIdPessJur, piIdPessoa : integer ) : double;

      Function AtlzHISTMOVRESERVA(iSEQRESGATE, iNumProcesso : Integer; slstReservas : string): Boolean;  overload;

      function GetTotalResgate(piIdPlanoPrev, piIdPessJur, piSeqProposta, piIdPessoa, piNumeroProcesso : integer) : double; overload;

      function GetTotalResgate(piIdPlanoPrev, piIdPessJur, piIdPessoa, piSeqProposta, piIdEvento : integer;
                               sDataCota : string;
                               dPercRetencao : double;
                               piNumeroProcesso : integer;
                               piIdBeneficio    : integer;           //edilaine WO10872
                               var lstReservas  : TStringList) : double;   overload;

      function MarcaReservasComplementares( piIdPlanoPrev,
                                            piIdPessJur,
                                            piSeqProposta,
                                            piIdPessoa : integer;
                                            piNumeroProcesso : integer = -1    //edilaine WO25429
                                           ) : boolean;

      function MarcaReservasResgatadas( piIdPlanoPrev,
                                        piIdPessJur,
                                        piSeqProposta,
                                        piIdPessoa,
                                        piNumProcesso,
                                        piSeqResgate : Integer;
                                        sDataCota : string;  //psListaReservas : string;
                                        prSaldoResgate : double
                                       ) : boolean;

      property ListaHistRemover : string read FListaHistRemover write SetListaHistRemover;

    published
    
  end;

implementation


constructor TCtrlRequerBenef.Create;
begin
  inherited Create;
  qryAUX:= TwwQuery.create(nil);
  qryAUX.DatabaseName:= 'BaseDados';
end;

destructor TCtrlRequerBenef.Destroy;
begin
   FreeAndNil(qryAUX);
   inherited Destroy;
end;


Function TCtrlRequerBenef.TratarValor(dValor: double): String;
var
  sValor: String;
begin
  sValor:= FloatToStr(dValor);
  sValor:= StringReplace(sValor, ',' , '.' ,[rfReplaceAll]);
  result:= sValor;
end;


Function TCtrlRequerBenef.AtlzHISTMOVRESERVA(iSEQRESGATE, iNumProcesso : Integer; slstReservas : string): Boolean;
var
  sSQL : string;
begin
  try

    sSQL := 'SELECT H.IDHISTRESERVA   ' +
            '  FROM HISTMOVRESERVA H  ' +
            '  JOIN BENEFBFCIARIO BF ON BF.IDPESSJUR   = H.IDPESSJUR    '+
            '                       AND BF.IDPESSOA    = H.IDPESSOA     '+
            '                       AND BF.IDPLANOPREV = H.IDPLANOPREV  '+
            '                       AND BF.SEQPROPOSTA = H.SEQPROPOSTA  '+
            '                       AND BF.IDBENEFICIO = H.IDBENEFICIO  '+
            ' WHERE BF.NUMEROPROCESSO = ' + IntToStr(iNumProcesso) +
            '   AND H.IDTIPORESERVA IN ('+ slstReservas +') ' +
            '   AND (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE, -1) = -1) '+
            '   AND H.IDBENEFICIO NOT IS NULL '+                   //edilaine SIG130042
            '   AND TRUNC(H.DATAMOV) = TRUNC(SYSDATE) ';


    result:= ExecutarQuery(qryAUX,' UPDATE CM.HISTMOVRESERVA ' +
                                  '  SET SEQRESGATE = '+ IntToStr(iSEQRESGATE) +
                                  ' WHERE IDHISTRESERVA IN (' + sSQL +')' );
  except on e: exception do
    raise Exception.Create('Ocorreu um erro AtlzHISTMOVRESERVA(): ' + #13#10 + e.message);
  end;

end;


Function TCtrlRequerBenef.AtlzHISTMOVRESERVA(iSEQRESGATE: Integer; dVlrResgate : double; sDataCota : string): Boolean;
var
  sSQL : string;
begin
  try
    sSQL := MontaSqlHISTMOVRESERVA(sDataCota, dVlrResgate, iLinhaLimite, iSEQRESGATE);
//    sSQL := 'SELECT U.IDHISTRESERVA FROM ('+ sSQL +') U WHERE U.SELECAO = ''S'' ';
    sSQL := 'SELECT U.IDHISTREAL FROM ('+ sSQL +') U WHERE U.SELECAO = ''S'' ';

    result:= ExecutarQuery(qryAUX,' UPDATE CM.HISTMOVRESERVA ' +
                                  '  SET SEQRESGATE = '+ IntToStr(iSEQRESGATE) +
                                  ' WHERE IDHISTRESERVA IN (' + sSQL +')' );
  except on e: exception do
    raise Exception.Create('Ocorreu um erro AtlzHISTMOVRESERVA(): ' + #13#10 + e.message);
  end;

end;


Function TCtrlRequerBenef.AtlzHISTMOVRESERVA(iSEQRESGATE: Integer; sIDHISTRESERVA: String;
                                            dVLRREAL, dVLRCOTAS, dSALDOREAL, dSALDOCOTAS: Double): Boolean;
var
   sSQL : string;
begin
  try
     sSQL := ' UPDATE CM.HISTMOVRESERVA ' +
             ' SET SEQRESGATE   ='+ IntToStr(iSEQRESGATE)   +    //edilaine SIG130042
             '     , VLRREAL    ='+ TratarValor(dVLRREAL)   +
             '     , VLRCOTAS   ='+ TratarValor(dVLRCOTAS)  +
             '     , SALDOREAL  ='+ TratarValor(dSALDOREAL) +
             '     , SALDOCOTAS ='+ TratarValor(dSALDOCOTAS)+
             ' WHERE IDHISTRESERVA = ' + sIDHISTRESERVA;

     result:= ExecutarQuery(qryAUX, sSQL);
  except on e: exception do
    raise Exception.Create('Ocorreu um erro AtlzHISTMOVRESERVA(): ' + #13#10 + e.message);
  end;
end;

// Inicio SIG 132319
function TCtrlRequerBenef.TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev: integer): Boolean;
begin
  qryAux.close;
  qryAux.SQL.clear;
  qryAux.SQL.Text := 'SELECT b.* FROM BENEFBFCIARIO b  '+
                     'inner join beneficio bf on bf.idbeneficio = b.idbeneficio  ' +
                     'inner join processobenef p on p.numeroprocesso = b.numeroprocesso  ' +
                     ' WHERE b.IDPESSOA       = '+IntToStr(aIdPessoa) +
                     '   AND b.IDPLANOPREV    = '+IntToStr(aIdPlanoPrev) +
                     '   AND b.SEQPROPOSTA    = 1 '+
                     '   AND b.IDPESSJUR      = '+IntToStr(aIdPessJur) +
                     '   AND bf.flgresgate  = 1 ' +
                     '   AND b.idsitbeneficio = 3 ' +
                     '   AND p.seqresgate is null ' ;
  qryAux.Open;
  result := not qryAux.isEmpty  ;

  qryAux.close;
end;
// Fim SIG 132319


function TCtrlRequerBenef.MontaSqlReservasNP(aIdPessoa, aIdPessJur, aIdPlanoprev: integer;
                                             const aSeqResgate : integer): string;
var
  sSQL : string;
  bTemresgate : Boolean;
begin

  //edilaine WO9102 : inicio
  result := MontaSqlReservasNovaNP(aIdPessoa, aIdPessJur, aIdPlanoprev, aSeqResgate);
  exit;
  //edilaine WO9102 : fim

  bTemresgate := TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev);  // SIG 132319 Ferrari

  sSQL := sSQL
        //+ ' SELECT NVL(H.IDHISTRESERVAORI, H.IDHISTRESERVA) IDHISTRESERVA, '
        + ' SELECT H.IDHISTRESERVA, '
        + '        H.IDHISTREAL, '
        + '        H.IDPESSOA, '
        + '        H.DATARECEBIMENTO, '
        + '        H.MESREFERENCIA, '
        + '        H.IDTIPORESERVA, '
        + '        H.VLRREAL, '
        + '        H.VLRCOTAS, '
        + '        H.SALDOREAL, '
        + '        H.SALDOCOTAS, '
        + '        H.VLRCOTAS  AS VLRCOTAS_REAL, '    //edilaine WO10872
        + '        100 AS PERC_REAL,             '    //edilaine WO10872
        + '        H.FLGENTRADA, '
        + '        H.VALORINDICE, '        //edilaine SIG130042

        + '        SUM(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)) '
        //+ '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.DATARECEBIMENTO,   '  //edilaine SIG130042
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.FLGENTRADA,       '     //edilaine SIG130042
        + '                                                   H.DATARECEBIMENTO,  '
        + '                                                   H.MESREFERENCIA,    '
        + '                                                   H.IDHISTRESERVA, H.IDHISTREAL) AS TOT_COTAS, '   //Leandro SIG133908
        + '        SUM(H.VLRREAL) '
        //+ '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.DATARECEBIMENTO,   '
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.FLGENTRADA,      '      //edilaine SIG130042
        + '                                                   H.DATARECEBIMENTO, '      //edilaine SIG130042
        + '                                                   H.MESREFERENCIA, '
        + '                                                   H.IDHISTRESERVA, H.IDHISTREAL) TOT_VALOR ' //Leandro SIG133908


        {
        + '        SUM(DECODE(H.FLGENTRADA,1, ABS(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)), '
        + '                                   ABS(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)*-1)) '
        + '                   ) OVER (PARTITION BY H.IDPESSOA ORDER BY H.DATARECEBIMENTO,  '
        + '                                                            H.MESREFERENCIA,    '
        + '                                                            H.IDHISTRESERVA, H.ROWID) AS TOT_COTAS, '

        + '        SUM(DECODE(H.FLGENTRADA, 1, ABS(H.VLRREAL), ABS(H.VLRREAL)*-1)) '
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.DATARECEBIMENTO,   '
        + '                                                   H.MESREFERENCIA, '
        + '                                                   H.IDHISTRESERVA, H.ROWID) TOT_VALOR '
        }
//        + ' FROM   HISTMOVRESERVA H  '
        + ' FROM (SELECT NVL(HI.IDHISTRESERVAORI, HI.IDHISTRESERVA) IDHISTRESERVA, '
        + '              HI.IDHISTRESERVA AS IDHISTREAL, '
        + '              HI.IDPESSOA,          '
        + '              HI.IDPLANOPREV,       '
        + '              HI.IDPESSJUR,         '
        + '              HI.SEQPROPOSTA,       '
        + '              HI.IDBENEFICIO,       '
        + '              HI.DATAMOV,           '
        + '              HI.DATARECEBIMENTO,   '
        + '              HI.MESREFERENCIA,     '
        + '              HI.IDTIPORESERVA,     '
        + '              DECODE(HI.FLGENTRADA, 1, (HI.VLRREAL),  -HI.VLRREAL)  VLRREAL,  '
        + '              DECODE(HI.FLGENTRADA, 1, (HI.VLRCOTAS), -HI.VLRCOTAS) VLRCOTAS, '
        + '              HI.SALDOREAL,         '
        + '              HI.SALDOCOTAS,        '
        + '              HI.FLGENTRADA,        '
        + '              HI.VALORINDICE,       '      //edilaine SIG130042
        + '              HI.SEQRESGATE         '
        + '        FROM HISTMOVRESERVA HI      '
        + '       WHERE HI.IDPLANOPREV = '+IntToStr(aIdPlanoPrev)
        + '         AND HI.IDPESSJUR   = '+IntToStr(aIdPessJur)
        + '         AND HI.IDPESSOA    = '+IntToStr(aIdPessoa)    
        + '         AND HI.SEQPROPOSTA = 1  '
        + '      ) H                        '

        + ' JOIN   RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA '
        + '                        AND H.IDPLANOPREV = TP.IDPLANOPREV     '

        + ' JOIN   PARTPREVPLAN PP ON H.IDPESSOA = PP.IDPESSOA            '
        + '                       AND H.IDPESSJUR = PP.IDPESSJUR          '
        + '                       AND H.IDPLANOPREV = PP.IDPLANOPREV      '

        + ' WHERE  H.IDPLANOPREV   = '+IntToStr(aIdPlanoPrev)
        + ' AND    H.IDPESSJUR     = '+IntToStr(aIdPessJur)
        + ' AND    H.IDPESSOA      = '+IntToStr(aIdPessoa)
        + ' AND    H.SEQPROPOSTA   = 1'

        + ' AND    TP.ANALITICOSINTETI = ''A'' '
        + ' AND    NVL(TP.FLGCONTROLE, 0) = 0  '
        + ' AND    TP.FLGCOLETIVA = 0 '
        //+ ' AND    H.IDTIPORESERVA IN (100,110,111,101) '           //edilaine WO9102
        + ' AND    H.IDTIPORESERVA IN (100,110,111,101, 217, 208) '   //edilaine WO9102
        + ' AND    (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(aSeqResgate)+') ' ;
// Inicio SIG 132319 Ferrari
    if not bTemresgate then
      sSQL := sSQL
        + ' AND    H.IDBENEFICIO IS NULL ';
// Fim SIG 132319

    if aSeqResgate = -1 then
      sSQL := sSQL
        + ' AND (H.DATAMOV IS NULL OR TRUNC(H.DATAMOV) <> TRUNC(SYSDATE)) ';

    sSQL := sSQL
        + ' ORDER BY H.IDPESSOA, '
        + '          H.FLGENTRADA, '      //edilaine SIG130042
        + '          H.DATARECEBIMENTO, '
        + '          H.MESREFERENCIA, '
        + '          H.IDHISTRESERVA, H.IDHISTREAL ';        //Leandro SIG133908
//        + '          NVL(H.IDHISTRESERVAORI, H.IDHISTRESERVA) ';

 Result := sSQL;
end;


//edilaine WO10872 : inicio
Function TCtrlRequerBenef.MontaSqlReservasREBNova(aIdPessoa, aIdPessJur, aIdPlanoprev : integer;
                                                  sDataCota : string;
                                                  const iSeqResgate : integer = -1) : string;
var
  sSQL : string;
  sPercInscr : string;
  bTemresgate : Boolean ;
begin

  bTemresgate := TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev);  // SIG 132319 Ferrari

  {busca percentual baseado na inscricao}
  qryAUX.close;
  qryAUX.SQL.Clear;
  qryAUX.SQL.Add('SELECT   ');
  qryAUX.SQL.Add('    CASE ');
  qryAUX.SQL.Add('       WHEN    ');
  //edilaine WO24962 : inicio (comparar qtde de dias em vez de anos)
  //qryAUX.SQL.Add('         TRUNC(PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY''))/365.25, 2) <= 10 THEN ');   //edilaine WO24962
  qryAUX.SQL.Add('         PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')) <= 4017 THEN ');                    //edilaine WO24962
  qryAUX.SQL.Add('           5   ');
  qryAUX.SQL.Add('       WHEN    ');
  qryAUX.SQL.Add('         PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')) >  4017 AND  ');
  qryAUX.SQL.Add('         PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')) <= 5843 THEN ');
  qryAUX.SQL.Add('           10  ');
  qryAUX.SQL.Add('       WHEN    ');
  qryAUX.SQL.Add('         PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')) >  5843 AND  ');
  qryAUX.SQL.Add('         PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')) <= 7670 THEN ');
  qryAUX.SQL.Add('           15  ');
  qryAUX.SQL.Add('       WHEN    ');
  qryAUX.SQL.Add('         PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PP.DTINICIOINSC, TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')) >  7670 THEN ');
  qryAUX.SQL.Add('           20  ');
  //edilaine WO24962 : fim (comparar qtde de dias em vez de anos)
  qryAUX.SQL.Add('       END     ');
  qryAUX.SQL.Add('  FROM PARTPREVPLAN PP ');
  qryAUX.SQL.Add(' WHERE PP.IDPESSOA    = '+ IntToStr(aIdPessoa)     );
  qryAUX.SQL.Add('   AND PP.IDPLANOPREV = '+ IntToStr(aIdPlanoPrev)  );
  qryAUX.SQL.Add('    AND PP.IDPESSJUR  = '+ IntToStr(aIdPessJur)    );
  qryAUX.Open;
  sPercInscr := qryAux.Fields[0].AsString;

  //sSQL := sSQL + ' SELECT --HS.DATARECEBIMENTO, '           //edilaine WO39107
  sSQL := sSQL + ' SELECT to_date(''01/'' || replace(substr(hs.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hs.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO, '  //edilaine WO39107
               + '        100 AS PERCENTUAL,    '
               + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
               + '        HS.IDHISTRESERVA AS IDHISTREAL, '
               + '        HS.IDPESSOA,                    '
               + '        HS.MESREFERENCIA,               '
               + '        HS.VALORINDICE,                 '
               + '        HS.IDTIPORESERVA,               '
               + '        HS.SALDOREAL,                   '
               + '        HS.SALDOCOTAS,                  '
               + '        HS.VLRREAL,                     '
               + '        HS.VLRCOTAS,                    '
               + '        0 AS TIPOCALCULO,               '
               + '        HS.SEQRESGATE,                  '
               + '        HS.FLGENTRADA,                  '
               + '        '+sPercInscr+' AS PERC_ASSOCIA  '
               + '        , HS.ROWID AS NUMLINHA          '        //edilaine SIG130042
               + '   FROM HISTMOVRESERVA HS               '
               + '   JOIN RESERVAXPLANO R ON R.IDPLANOPREV = HS.IDPLANOPREV '
               + '    AND R.IDTIPORESERVA = HS.IDTIPORESERVA                '
               + '  WHERE NVL(R.FLGPORTABILIDADE, 0) = 0                    '
               + '    AND (R.CODHIERARQUIA like ''11%''                     '
               + '     OR HS.IDTIPORESERVA = 167 OR HS.IDTIPORESERVA = 218  '
               + '     OR HS.IDTIPORESERVA = 228 )                          '    //edilaine WO39107
               + '    AND HS.IDTIPORESERVA <> 79                            '
               + '    AND R.ANALITICOSINTETI = ''A''                        '
               + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
               + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
               + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
               + '    AND (HS.IDHISTRESERVA NOT IN ('+ListaHistRemover+')) '    //edilaine WO39107
               + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ';
               //+ '    AND HS.PLNCODIGO IS NULL ';   //edilaine WO25429       //edilaine WO31408

  if not bTemresgate then        // SIG 132319
     sSQL := sSQL
               + '    AND HS.IDBENEFICIO IS NULL ' ;

  sSQL := sSQL + ' UNION ALL '
               //+ ' SELECT HS.DATARECEBIMENTO,   '  //edilaine WO39107
               + ' SELECT to_date(''01/'' || replace(substr(hs.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hs.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO, '  //edilaine WO39107
               + '        0 AS PERCENTUAL,        '
               + '        NVL(HS.IDHISTRESERVAORI,HS.IDHISTRESERVA) IDHISTRESERVA, '
               + '        HS.IDHISTRESERVA AS IDHISTREAL, '
               + '        HS.IDPESSOA,          '
               + '        HS.MESREFERENCIA,     '
               + '        HS.VALORINDICE,       '
               + '        HS.IDTIPORESERVA,     '
               + '        HS.SALDOREAL,         '
               + '        HS.SALDOCOTAS,        '
               + '        HS.VLRREAL,           '
               + '        HS.VLRCOTAS,          '
               + '        0 AS TIPOCALCULO,     '
               + '        HS.SEQRESGATE,        '
               + '        HS.FLGENTRADA,        '
               + '        '+sPercInscr+' AS PERC_ASSOCIA '
               + '        , HS.ROWID AS NUMLINHA '        //edilaine SIG130042
               + '   FROM HISTMOVRESERVA HS      '
               + '   JOIN RESERVAXPLANO R ON R.IDPLANOPREV = HS.IDPLANOPREV '
               + '    AND R.IDTIPORESERVA = HS.IDTIPORESERVA '
               + '  WHERE (R.CODHIERARQUIA like ''12%''  '
               + '     OR HS.IDTIPORESERVA = 229 )       '     //edilaine WO39107
               + '    AND HS.IDTIPORESERVA <> 167        '
               + '    AND R.ANALITICOSINTETI = ''A''     '
               + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
               + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
               + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
               + '    AND (HS.IDHISTRESERVA NOT IN ('+ListaHistRemover+')) '    //edilaine WO39107
               + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ';
               //+ '    AND HS.PLNCODIGO IS NULL ';   //edilaine WO25429      //edilaine WO31408

  if not bTemresgate then        // SIG 132319
     sSQL := sSQL
               + '    AND HS.IDBENEFICIO IS NULL ' ;

  sSQL := sSQL + ' UNION ALL '
               + ' SELECT to_date(''01/'' || replace(substr(h.mesreferencia,6,2),''13'',''11'') ||''/'' || substr(h.mesreferencia,1,4), ''DD/MM/YYYY'') AS DataRecebimento, '
               + '        100 PERCENTUAL,      '
               + '        NVL(H.IDHISTRESERVAORI,H.IDHISTRESERVA) IDHISTRESERVA, '
               + '        H.IDHISTRESERVA AS IDHISTREAL,  '
               + '        H.IDPESSOA,           '
               + '        H.MESREFERENCIA,      '
               + '        H.VALORINDICE,        '
               + '        H.IDTIPORESERVA,      '
               + '        H.SALDOREAL,          '
               + '        H.SALDOCOTAS,         '
               + '        H.VLRREAL,            '
               + '        H.VLRCOTAS,           '
               + '        (SELECT NVL(FLGREGRESSIVA,0) FROM RESERVAXPLANO R '
               + '          WHERE R.IDTIPORESERVA = H.IDTIPORESERVA        '
               + '            AND R.IDPLANOPREV   = H.IDPLANOPREV) AS TIPOCALCULO, '
               + '        H.SEQRESGATE,         '
               + '        H.FLGENTRADA,         '
               + '        '+sPercInscr+' AS PERC_ASSOCIA '
               + '        , H.ROWID AS NUMLINHA '        //edilaine SIG130042
               + '   FROM HSTCONTRIBPREV HST,    '
               + '        PORTABILIDADEPREV POR, '
               + '        HISTMOVRESERVA H,      '
               + '        CONTRIBUICAO C         '
               + '  WHERE POR.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
               + '    AND POR.IDPESSOA      = '+ IntToStr(aIdPessoa)
               + '    AND POR.IDPESSJUR     = '+ IntToStr(aIdPessJur)
               + '    AND (POR.TIPO         = ''A'' '
               + '     OR (POR.TIPO IS NULL AND C.TIPOPORTABILIDADE = ''A''))  '
               + '    AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE '
               + '    AND POR.IDPESSOA = HST.IDPESSOA               '
               + '    AND POR.IDPESSOA = H.IDPESSOA                 '
               + '    AND HST.IDPESSOA = H.IDPESSOA                 '
               + '    AND HST.IDPLANOPREV = H.IDPLANOPREV           '
               + '    AND POR.IDPLANOPREV = HST.IDPLANOPREV         '
               + '    AND POR.IDPLANOPREV = H.IDPLANOPREV           '
               + '    AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO     '
               + '    AND POR.IDPESSJUR = H.IDPESSJUR               '
               + '    AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO     '
               + '    AND EXISTS (SELECT 1 FROM RESERVAXPLANO RP    '
               + '                 WHERE RP.IDPLANOPREV   = H.IDPLANOPREV   '
               + '                   AND RP.IDTIPORESERVA = H.IDTIPORESERVA '
               + '                   AND RP.FLGPORTABILIDADE = 1)           '
               + '    AND (H.IDHISTRESERVA NOT IN ('+ListaHistRemover+')) '    //edilaine WO39107
               + '    AND (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ';
               //+ '    AND HST.PLNCODIGO IS NULL ';   //edilaine WO25429      //edilaine WO31408

  if not bTemresgate then        // SIG 132319
     sSQL := sSQL
               + '    AND H.IDBENEFICIO IS NULL ' ;

  Result := sSQL;
end;


function TCtrlRequerBenef.MontaSqlReservasNPNova(aIdPessoa, aIdPessJur, aIdPlanoprev: integer;
                                                 const aSeqResgate : integer): string;
var
  sSQL : string;
  bTemresgate : Boolean;
begin

  bTemresgate := TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev);  // SIG 132319 Ferrari

  sSQL := sSQL
        + ' SELECT H.IDHISTRESERVA, '
        + '        H.IDHISTREAL, '
        + '        H.IDPESSOA, '
        + '        H.DATARECEBIMENTO, '
        + '        H.MESREFERENCIA, '
        + '        H.IDTIPORESERVA, '
        + '        H.VLRREAL, '
        + '        H.VLRCOTAS, '
        + '        H.SALDOREAL, '
        + '        H.SALDOCOTAS, '
        + '        H.FLGENTRADA, '
        + '        H.VALORINDICE, '        //edilaine SIG130042

        + '        SUM(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)) '
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.FLGENTRADA,       '     //edilaine SIG130042
        + '                                                   H.DATARECEBIMENTO,  '
        + '                                                   H.MESREFERENCIA,    '
        + '                                                   H.IDHISTRESERVA, H.IDHISTREAL) AS TOT_COTAS, '   //Leandro SIG133908
        + '        SUM(H.VLRREAL) '
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.FLGENTRADA,      '      //edilaine SIG130042
        + '                                                   H.DATARECEBIMENTO, '      //edilaine SIG130042
        + '                                                   H.MESREFERENCIA, '
        + '                                                   H.IDHISTRESERVA, H.IDHISTREAL) TOT_VALOR ' //Leandro SIG133908

        + ' FROM (SELECT NVL(HI.IDHISTRESERVAORI, HI.IDHISTRESERVA) IDHISTRESERVA, '
        + '              HI.IDHISTRESERVA AS IDHISTREAL, '
        + '              HI.IDPESSOA,          '
        + '              HI.IDPLANOPREV,       '
        + '              HI.IDPESSJUR,         '
        + '              HI.SEQPROPOSTA,       '
        + '              HI.IDBENEFICIO,       '
        + '              HI.DATAMOV,           '
        //+ '              HI.DATARECEBIMENTO,   '                                                                                                                            //Edilaine WO40258
        + '              to_date(''01/'' || replace(substr(hi.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hi.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO, '  //Edilaine WO40258
        + '              HI.MESREFERENCIA,     '
        + '              HI.IDTIPORESERVA,     '
        + '              DECODE(HI.FLGENTRADA, 1, (HI.VLRREAL),  -HI.VLRREAL)  VLRREAL,  '
        + '              DECODE(HI.FLGENTRADA, 1, (HI.VLRCOTAS), -HI.VLRCOTAS) VLRCOTAS, '
        + '              HI.SALDOREAL,         '
        + '              HI.SALDOCOTAS,        '
        + '              HI.FLGENTRADA,        '
        + '              HI.VALORINDICE,       '      //edilaine SIG130042
        + '              HI.SEQRESGATE,        '
        + '              0 AS TIPOCALCULO,     '
        + '              HI.PLNCODIGO          '      //edilaine WO25429
        + '        FROM HISTMOVRESERVA HI      '
        + '        JOIN RESERVAXPLANO  RP      '                        
        + '          ON RP.IDPLANOPREV   = HI.IDPLANOPREV   '           
        + '         AND RP.IDTIPORESERVA = HI.IDTIPORESERVA '
        + '       WHERE HI.IDPLANOPREV = '+IntToStr(aIdPlanoPrev)
        + '         AND HI.IDPESSJUR   = '+IntToStr(aIdPessJur)
        + '         AND HI.IDPESSOA    = '+IntToStr(aIdPessoa)
        + '         AND HI.SEQPROPOSTA = 1  '
        + '         AND RP.ANALITICOSINTETI = ''A''  '
        + '         AND (RP.CODHIERARQUIA like ''12%'' OR  '
        + '              RP.CODHIERARQUIA like ''11%'' OR  '
        + '              RP.CODHIERARQUIA like ''17%'')    '
        + '       UNION ALL  '
        //------- PORTABILIDADE
        + '       SELECT NVL(HM.IDHISTRESERVAORI, HM.IDHISTRESERVA) IDHISTRESERVA, '
        + '              HM.IDHISTRESERVA AS IDHISTREAL, '
        + '              HM.IDPESSOA,        '
        + '              HM.IDPLANOPREV,     '
        + '              HM.IDPESSJUR,       '
        + '              HM.SEQPROPOSTA,       '
        + '              HM.IDBENEFICIO,       '
        + '              HM.DATAMOV,           '
        //+ '              HM.DATARECEBIMENTO,   '                                                                                                                              //Edilaine WO40258
        + '              to_date(''01/'' || replace(substr(hm.mesreferencia,6,2),''13'',''11'') ||''/''|| substr(hm.mesreferencia,1,4),''dd/mm/yyyy'') AS DATARECEBIMENTO, '    //Edilaine WO40258
        + '              HM.MESREFERENCIA,     '
        + '              HM.IDTIPORESERVA,     '
        + '              DECODE(HM.FLGENTRADA, 1, (HM.VLRREAL),  -HM.VLRREAL)  VLRREAL,  '
        + '              DECODE(HM.FLGENTRADA, 1, (HM.VLRCOTAS), -HM.VLRCOTAS) VLRCOTAS, '
        + '              HM.SALDOREAL,         '
        + '              HM.SALDOCOTAS,        '
        + '              HM.FLGENTRADA,        '
        + '              HM.VALORINDICE,       '      //edilaine SIG130042
        + '              HM.SEQRESGATE,        '
        + '              (SELECT NVL(FLGREGRESSIVA,0) FROM RESERVAXPLANO R        '
        + '                WHERE R.IDTIPORESERVA = HM.IDTIPORESERVA               '
        + '                  AND R.IDPLANOPREV   = HM.IDPLANOPREV) AS TIPOCALCULO,'
        + '              HM.PLNCODIGO          '      //edilaine WO25429
        + '         from hstcontribprev hst                        '
        + '         join portabilidadeprev por                     '
        + '           on por.idplanoprev     = hst.idplanoprev     '
        + '          and por.idportabilidade = hst.idportabilidade '
        + '          and por.idpessoa        = hst.idpessoa  '
        + '         join histmovreserva hm                   '
        + '           on hm.idpessoa       = por.idpessoa    '
        + '          and hm.idplanoprev    = por.idplanoprev '
        + '          and hm.idpessjur      = por.idpessjur   '
        + '          and hm.idplanoprev    = hst.idplanoprev  '
        + '          and hm.idpessoa       = hst.idpessoa     '
        + '          and hm.numrecebimento = hst.numrecebimento '
        + '         join contribuicao c                        '
        + '           on c.idcontribuicao = por.idcontribuicao '
        + '        WHERE POR.idpessoa    = '+ IntToStr(aIdPessoa)
        + '          AND POR.idpessjur   = '+ IntToStr(aIdPessJur)
        + '          AND POR.idplanoprev = 74                                '
        + '          AND EXISTS (SELECT 1 FROM RESERVAXPLANO RP              '
        + '                       WHERE RP.IDPLANOPREV   = HM.IDPLANOPREV    '
        + '                         AND RP.IDTIPORESERVA = HM.IDTIPORESERVA  '
        + '                         AND RP.FLGPORTABILIDADE = 1)             '
        + '      ) H     '

        + ' JOIN   RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA '
        + '                        AND H.IDPLANOPREV = TP.IDPLANOPREV     '

        + ' JOIN   PARTPREVPLAN PP ON H.IDPESSOA = PP.IDPESSOA            '
        + '                       AND H.IDPESSJUR = PP.IDPESSJUR          '
        + '                       AND H.IDPLANOPREV = PP.IDPLANOPREV      '

        + ' WHERE  H.IDPLANOPREV   = '+IntToStr(aIdPlanoPrev)
        + ' AND    H.IDPESSJUR     = '+IntToStr(aIdPessJur)
        + ' AND    H.IDPESSOA      = '+IntToStr(aIdPessoa)
        + ' AND    H.SEQPROPOSTA   = 1'
        + ' AND    (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(aSeqResgate)+') ' 
        + ' AND    H.PLNCODIGO IS NULL ';   //edilaine WO25429

  // Inicio SIG 132319 Ferrari
  if not bTemresgate then
     sSQL := sSQL
        + ' AND    H.IDBENEFICIO IS NULL ';
  // Fim SIG 132319
  
  if aSeqResgate = -1 then
     sSQL := sSQL
        + ' AND (H.DATAMOV IS NULL OR TRUNC(H.DATAMOV) <> TRUNC(SYSDATE)) ';

  sSQL := sSQL
        + ' ORDER BY H.IDPESSOA, '
        + '          H.FLGENTRADA, '      //edilaine SIG130042
        + '          H.DATARECEBIMENTO, '
        + '          H.MESREFERENCIA, '
        + '          H.IDHISTRESERVA, H.IDHISTREAL ';        //Leandro SIG133908

 Result := sSQL;
end;
//edilaine WO10872 : fim


Function TCtrlRequerBenef.MontaSqlReservasREB(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; sDataCota : string;
                                              const iSeqResgate : integer = -1) : string;
var
  sSQL : string;
  sPercInscr : string;
  bTemresgate : Boolean ;
begin

  //edilaine WO9102 : inicio
  result := MontaSqlReservasNovaREB(aIdPessoa, aIdPessJur, aIdPlanoprev, sDataCota, iSeqResgate);
  exit;
  //edilaine WO9102 : fim


  bTemresgate := TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev);  // SIG 132319 Ferrari

  {busca percentual baseado na inscricao}
  qryAUX.close;
  qryAUX.SQL.Clear;
  qryAUX.SQL.Add('SELECT CASE     ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) <= 10  THEN ');
  qryAUX.SQL.Add('            5   ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) BETWEEN 11 AND 15  THEN ');
  qryAUX.SQL.Add('            10  ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) BETWEEN 16 AND 20 THEN  ');
  qryAUX.SQL.Add('            15  ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) > 21  THEN  ');
  qryAUX.SQL.Add('            20  ');
  qryAUX.SQL.Add('         ELSE   ');
  qryAUX.SQL.Add('           100  ');
  qryAUX.SQL.Add('       END      ');
  qryAUX.SQL.Add('  FROM PARTPREVPLAN PP ');
  qryAUX.SQL.Add(' WHERE PP.IDPESSOA    = '+ IntToStr(aIdPessoa)     );
  qryAUX.SQL.Add('   AND PP.IDPLANOPREV = '+ IntToStr(aIdPlanoPrev)  );
  qryAUX.SQL.Add('    AND PP.IDPESSJUR  = '+ IntToStr(aIdPessJur)    );
  qryAUX.Open;
  sPercInscr := qryAux.Fields[0].AsString;

  {busca tipo de opcao de IR }
  qryAUX.close;
  qryAUX.SQL.Clear;
  qryAUX.SQL.Add('SELECT NVL(tipoopcaoir_atual, -1) tipoopcaoir_atual,      ');
  qryAUX.SQL.Add('       NVL(tipoopcaoir_anterior, -1) tipoopcaoir_anterior ');
  qryAUX.SQL.Add('  FROM (SELECT HOIR.idhistopir,  ');
  qryAUX.SQL.Add('               HOIR.tipoopcaoir tipoopcaoir_atual, ');
  qryAUX.SQL.Add('               LEAD(HOIR.tipoopcaoir) OVER (ORDER BY HOIR.idhistopir DESC) tipoopcaoir_anterior, ');
  qryAUX.SQL.Add('               HOIR.dtfim    ');
  qryAUX.SQL.Add('          FROM histopir HOIR ');
  qryAUX.SQL.Add('         WHERE HOIR.idpessoa = '+ IntToStr(aIdPessoa) );
  qryAUX.SQL.Add('           AND HOIR.idplanprev = 66 ');
  qryAUX.SQL.Add('         ORDER BY HOIR.idhistopir DESC) ');
  qryAUX.SQL.Add(' WHERE ROWNUM = 1 ');
  qryAUX.SQL.Add(' ORDER BY DTFIM DESC');
  qryAUX.Open;

  //leandro sig 135762 inicio
  if qryAUX.Fields[1].AsInteger <> 2 then
  begin
     sSQL := sSQL
        + ' SELECT HOIR.dtinicio DATARECEBIMENTO, '
        + '        100 AS PERCENTUAL,             '
        //+ '        HS.IDHISTRESERVA,              '
        + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
        + '        HS.IDHISTRESERVA AS IDHISTREAL, '

        + '        HS.IDPESSOA,                   '
        + '        HS.MESREFERENCIA,              '
        + '        HS.VALORINDICE,                '        //edilaine SIG130042
        + '        HS.IDTIPORESERVA,              '
        + '        HS.SALDOREAL,                  '
        + '        HS.SALDOCOTAS,                 '
        + '        HS.VLRREAL,                    '
        + '        DECODE(HS.IDTIPORESERVA, 51, HS.VLRCOTAS, '
        + '                                 52, HS.VLRCOTAS, '
        + '                                 53, HS.VLRCOTAS, '
        + '                                 55, HS.VLRCOTAS, '
        + '                                167, HS.VLRCOTAS, '
        + '                                 23, HS.VLRCOTAS, '
        + '                                 33, HS.VLRCOTAS, '
        + '                                218, HS.VLRCOTAS, '   //edilaine WO10872
        + '                                 0 ) AS VLRCOTAS, '
        + '        HS.SEQRESGATE,     '
        + '        HS.FLGENTRADA,     '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , HS.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HISTMOVRESERVA HS, '
        + '        HISTOPIR HOIR      '
        + '  WHERE HS.IDTIPORESERVA IN(51,52,53,55,167,23,33, 218) '            //edilaine WO10872
        + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
        + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
        + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
        + '    AND HOIR.IDPESSOA    = HS.IDPESSOA '
        + '    AND HOIR.IDPLANPREV  = HS.IDPLANOPREV '
        + '    AND HOIR.TIPOOPCAOIR = 2 '
        + '    AND HS.DATARECEBIMENTO < HOIR.DTINICIO '
        + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ';
        if not bTemresgate then        // SIG 132319
          sSQL := sSQL
          + '    AND HS.IDBENEFICIO IS NULL ' ;

        sSQL := sSQL + ' UNION ALL '
  end;

  sSQL := sSQL + ' SELECT HS.DATARECEBIMENTO, '
  //leandro sig135762 fim
        + '        100 AS PERCENTUAL,  '
        //+ '        HS.IDHISTRESERVA,   '
        + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
        + '        HS.IDHISTRESERVA AS IDHISTREAL, '

        + '        HS.IDPESSOA,        '
        + '        HS.MESREFERENCIA,   '
        + '        HS.VALORINDICE,     '        //edilaine SIG130042
        + '        HS.IDTIPORESERVA,   '
        + '        HS.SALDOREAL,       '
        + '        HS.SALDOCOTAS,      '
        + '        HS.VLRREAL,         '
        + '        DECODE(HS.IDTIPORESERVA, 51, HS.VLRCOTAS, '
        + '                                 52, HS.VLRCOTAS, '
        + '                                 53, HS.VLRCOTAS, '
        + '                                 55, HS.VLRCOTAS, '
        + '                                167, HS.VLRCOTAS, '
        + '                                 23, HS.VLRCOTAS, '
        + '                                 33, HS.VLRCOTAS, '
        + '                                218, HS.VLRCOTAS, '       //edilaine WO9102
        + '                                 0 ) AS VLRCOTAS, '
        + '        HS.SEQRESGATE,     '
        + '        HS.FLGENTRADA,     '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , HS.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HISTMOVRESERVA HS, HISTOPIR HOIR '
        + '  WHERE HS.IDTIPORESERVA IN (51, 52, 53, 55, 167, 23, 33, 218) '     //edilaine WO10872
        + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
        + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
        + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
        + '    AND HOIR.IDPESSOA    = HS.IDPESSOA      '
        + '    AND HOIR.IDPLANPREV  = HS.IDPLANOPREV '
        + '    AND HOIR.TIPOOPCAOIR = 2 '   ;
        if not bTemresgate then               // SIG 132319
          sSQL := sSQL
          + '    AND HS.IDBENEFICIO IS NULL ' ;
       sSQL := sSQL
        + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') '
  //leandro sig135762 inicio
        + '    AND HS.DATARECEBIMENTO BETWEEN HOIR.dtinicio AND NVL(HOIR.dtfim, TRUNC(SYSDATE)) ';

  if qryAUX.Fields[1].AsInteger <> 2 then
  begin
     sSQL := sSQL + ' UNION ALL '
        + ' SELECT HOIR.dtinicio DATARECEBIMENTO, '
        + '        0 AS PERCENTUAL,               '
        //+ '        HS.IDHISTRESERVA,              '
        + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
        + '        HS.IDHISTRESERVA AS IDHISTREAL, '

        + '        HS.IDPESSOA,                   '
        + '        HS.MESREFERENCIA,              '
        + '        HS.VALORINDICE,                '        //edilaine SIG130042
        + '        HS.IDTIPORESERVA,              '
        + '        HS.SALDOREAL,                  '
        + '        HS.SALDOCOTAS,                 '
        + '        HS.VLRREAL,                    '
        + '        DECODE(HS.IDTIPORESERVA, 59, HS.VLRCOTAS, '
        + '                                 60, HS.VLRCOTAS, '
        + '                                 61, HS.VLRCOTAS, '
        + '                                 62, HS.VLRCOTAS, '
        + '                                170, HS.VLRCOTAS, '
        + '                                 0) AS VLRCOTAS,  '
        + '        HS.SEQRESGATE, '
        + '        HS.FLGENTRADA, '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , HS.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HISTMOVRESERVA HS, HISTOPIR HOIR  '
        + '  WHERE HS.IDTIPORESERVA IN (59, 60, 61, 62, 170) '
        + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
        + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
        + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
        + '    AND HOIR.IDPESSOA    = HS.IDPESSOA  '
        + '    AND HOIR.IDPLANPREV  = HS.IDPLANOPREV '
        //+ '    AND HOIR.TIPOOPCAOIR = 2  '                     //edilaine WO9102
        + '    AND HS.DATARECEBIMENTO < HOIR.DTINICIO  '
        + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ' ;
        if not bTemresgate then               // SIG 132319
          sSQL := sSQL
          + '    AND HS.IDBENEFICIO IS NULL ' ;
  end;
  //leandro sig135762 fim
  sSQL := sSQL
        + ' UNION ALL '
        + ' SELECT HS.DATARECEBIMENTO, '
        + '        0 AS PERCENTUAL,    '
        //+ '        HS.IDHISTRESERVA,   '
        + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
        + '        HS.IDHISTRESERVA AS IDHISTREAL, '

        + '        HS.IDPESSOA,        '
        + '        HS.MESREFERENCIA,   '
        + '        HS.VALORINDICE,     '        //edilaine SIG130042
        + '        HS.IDTIPORESERVA,   '
        + '        HS.SALDOREAL,       '
        + '        HS.SALDOCOTAS,      '
        + '        HS.VLRREAL,         '
        + '        DECODE(HS.IDTIPORESERVA, 59, HS.VLRCOTAS, '
        + '                                 60, HS.VLRCOTAS, '
        + '                                 61, HS.VLRCOTAS, '
        + '                                 62, HS.VLRCOTAS, '
        + '                                170, HS.VLRCOTAS, '
        + '                                 0) AS VLRCOTAS,  '
        + '        HS.SEQRESGATE, '
        + '        HS.FLGENTRADA, '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , HS.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HISTMOVRESERVA HS, HISTOPIR HOIR '
        + '  WHERE HS.IDTIPORESERVA IN (59, 60, 61, 62, 170) '
        + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
        + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
        + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
        + '    AND HOIR.IDPESSOA    = HS.IDPESSOA  '
        + '    AND HOIR.IDPLANPREV  = HS.IDPLANOPREV  '
        + '    AND HOIR.TIPOOPCAOIR = 2  '
        + '    AND HS.DATARECEBIMENTO BETWEEN HOIR.dtinicio AND NVL(HOIR.dtfim, TRUNC(SYSDATE)) '
        + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ' ;
        if not bTemresgate then               // SIG 132319
          sSQL := sSQL
          + '    AND HS.IDBENEFICIO IS NULL ' ;

        sSQL := sSQL
        + ' UNION ALL  '

        + ' SELECT H.DATARECEBIMENTO, '
        + '        100 PERCENTUAL,    '
        //+ '        H.IDHISTRESERVA,   '
        + '        NVL(H.IDHISTRESERVAORI, H.IDHISTRESERVA) IDHISTRESERVA, '
        + '        H.IDHISTRESERVA AS IDHISTREAL, '

        + '        H.IDPESSOA,        '
        + '        H.MESREFERENCIA,   '
        + '        H.VALORINDICE,     '        //edilaine SIG130042
        + '        H.IDTIPORESERVA,   '
        + '        H.SALDOREAL,       '
        + '        H.SALDOCOTAS,      '
        + '        H.VLRREAL,         '
        + '        H.VLRCOTAS,        '
        + '        H.SEQRESGATE,      '
        + '        H.FLGENTRADA,      '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , H.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H '
        + '  WHERE POR.idpessoa    = '+ IntToStr(aIdPessoa)
        + '    AND POR.idpessjur   = '+ IntToStr(aIdPessJur)
        + '    AND POR.idplanoprev = '+ IntToStr(aIdPlanoprev)
        + '    AND por.tipo        = ''A'' '
        + '    AND POR.opcaoir     = ''R'' '
        + '    AND H.IDTIPORESERVA IN (117) '
        + '    AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE '
        + '    AND POR.IDPESSOA = HST.IDPESSOA  '
        + '    AND POR.IDPESSOA = H.IDPESSOA    '
        + '    AND HST.IDPESSOA = H.IDPESSOA    '
        + '    AND HST.IDPLANOPREV = H.IDPLANOPREV   '
        + '    AND POR.IDPLANOPREV = HST.IDPLANOPREV '
        + '    AND POR.IDPLANOPREV = H.IDPLANOPREV   '
        + '    AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO '
        + '    AND POR.IDPESSJUR = H.IDPESSJUR '
        + '    AND (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ' ;
        if not bTemresgate then               // SIG 132319
          sSQL := sSQL
          + '    AND H.IDBENEFICIO IS NULL ' ;

        sSQL := sSQL
        + ' UNION ALL  '

        + ' SELECT CASE '
        + '           WHEN HOIR.DTINICIO < H.DATARECEBIMENTO THEN '
        + '             H.DATARECEBIMENTO  '
        + '           ELSE                 '
        + '             HOIR.DTINICIO      '
        + '        END AS DATARECEBIMENTO, '
        + '        100 PERCENTUAL,         '
        + '        NVL(H.IDHISTRESERVAORI, H.IDHISTRESERVA) IDHISTRESERVA, '
        + '        H.IDHISTRESERVA AS IDHISTREAL, '

        + '        H.IDPESSOA,             '
        + '        H.MESREFERENCIA,        '
        + '        H.VALORINDICE,          '        //edilaine SIG130042
        + '        H.IDTIPORESERVA,        '
        + '        H.SALDOREAL,            '
        + '        H.SALDOCOTAS,           '
        + '        H.VLRREAL,              '
        + '        H.VLRCOTAS,             '
        + '        H.SEQRESGATE,           '
        + '        H.FLGENTRADA,           '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , H.ROWID AS NUMLINHA '        //edilaine SIG130042

        + '   FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H, HISTOPIR HOIR '
        + '  WHERE POR.idpessoa    = '+ IntToStr(aIdPessoa)
        + '    AND POR.idpessjur   = '+ IntToStr(aIdPessJur)
        + '    AND POR.idplanoprev = '+ IntToStr(aIdPlanoprev)
        + '    AND por.tipo        = ''A'' '
        + '    AND POR.opcaoir     = ''P'' '
        + '    AND H.IDTIPORESERVA IN (117)   '
        + '    AND HOIR.IDPESSOA = H.IDPESSOA '
        + '    AND HOIR.IDPLANPREV = H.IDPLANOPREV '
        //+ '    AND HOIR.TIPOOPCAOIR = 2  '                  //edilaine WO9102
        + '    AND HOIR.DTFIM IS NULL    '
        + '    AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE '
        + '    AND POR.IDPESSOA = HST.IDPESSOA '
        + '    AND POR.IDPESSOA = H.IDPESSOA   '
        + '    AND HST.IDPESSOA = H.IDPESSOA   '
        + '    AND HST.IDPLANOPREV = H.IDPLANOPREV '
        + '    AND POR.IDPLANOPREV = HST.IDPLANOPREV '
        + '    AND POR.IDPLANOPREV = H.IDPLANOPREV '
        + '    AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO '
        + '    AND POR.IDPESSJUR = H.IDPESSJUR '
        + '    AND (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ' ;
        if not bTemresgate then               // SIG 132319
          sSQL := sSQL
          + '    AND H.IDBENEFICIO IS NULL ' ;

  Result := sSQL;

end;

//edilaine WO9102 : inicio
Function TCtrlRequerBenef.MontaSqlReservasNovaREB(aIdPessoa, aIdPessJur, aIdPlanoprev : integer; sDataCota : string;
                                              const iSeqResgate : integer = -1) : string;
var
  sSQL : string;
  sPercInscr : string;
  bTemresgate : Boolean ;
begin

  bTemresgate := TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev);  // SIG 132319 Ferrari

  {busca percentual baseado na inscricao}
  qryAUX.close;
  qryAUX.SQL.Clear;
  qryAUX.SQL.Add('SELECT CASE     ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) <= 10  THEN ');
  qryAUX.SQL.Add('            5   ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) BETWEEN 11 AND 15  THEN ');
  qryAUX.SQL.Add('            10  ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) BETWEEN 16 AND 20 THEN  ');
  qryAUX.SQL.Add('            15  ');
  qryAUX.SQL.Add('         WHEN TRUNC(((TO_DATE('+QuotedStr(sDataCota)+', ''DD/MM/YYYY'')-PP.DTINICIOINSC)/365.25), 2) > 21  THEN  ');
  qryAUX.SQL.Add('            20  ');
  qryAUX.SQL.Add('         ELSE   ');
  qryAUX.SQL.Add('           100  ');
  qryAUX.SQL.Add('       END      ');
  qryAUX.SQL.Add('  FROM PARTPREVPLAN PP ');
  qryAUX.SQL.Add(' WHERE PP.IDPESSOA    = '+ IntToStr(aIdPessoa)     );
  qryAUX.SQL.Add('   AND PP.IDPLANOPREV = '+ IntToStr(aIdPlanoPrev)  );
  qryAUX.SQL.Add('    AND PP.IDPESSJUR  = '+ IntToStr(aIdPessJur)    );
  qryAUX.Open;
  sPercInscr := qryAux.Fields[0].AsString;


  sSQL := ' SELECT HS.DATARECEBIMENTO, '
        + '        100 AS PERCENTUAL,  '
        + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
        + '        HS.IDHISTRESERVA AS IDHISTREAL, '

        + '        HS.IDPESSOA,        '
        + '        HS.MESREFERENCIA,   '
        + '        HS.VALORINDICE,     '        //edilaine SIG130042
        + '        HS.IDTIPORESERVA,   '
        + '        HS.SALDOREAL,       '
        + '        HS.SALDOCOTAS,      '
        + '        HS.VLRREAL,         '
        + '        DECODE(HS.IDTIPORESERVA, 51, HS.VLRCOTAS, '
        + '                                 52, HS.VLRCOTAS, '
        + '                                 53, HS.VLRCOTAS, '
        + '                                 55, HS.VLRCOTAS, '
        + '                                167, HS.VLRCOTAS, '
        + '                                 23, HS.VLRCOTAS, '
        + '                                 33, HS.VLRCOTAS, '
        + '                                218, HS.VLRCOTAS, '
        + '                                 0 ) AS VLRCOTAS, '
        + '        HS.SEQRESGATE,     '
        + '        HS.FLGENTRADA,     '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , HS.ROWID AS NUMLINHA '                    //edilaine SIG130042
        + '   FROM HISTMOVRESERVA HS '
        + '  WHERE HS.IDTIPORESERVA IN (51, 52, 53, 55, 167, 23, 33, 218) '
        + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
        + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
        + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
        + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ';

  if not bTemresgate then                           // SIG 132319
     sSQL := sSQL
        + '    AND HS.IDBENEFICIO IS NULL ' ;

  sSQL := sSQL

        + ' UNION ALL '
        + ' SELECT HS.DATARECEBIMENTO, '
        + '        0 AS PERCENTUAL,    '
        + '        NVL(HS.IDHISTRESERVAORI, HS.IDHISTRESERVA) IDHISTRESERVA, '
        + '        HS.IDHISTRESERVA AS IDHISTREAL, '
        + '        HS.IDPESSOA,        '
        + '        HS.MESREFERENCIA,   '
        + '        HS.VALORINDICE,     '        //edilaine SIG130042
        + '        HS.IDTIPORESERVA,   '
        + '        HS.SALDOREAL,       '
        + '        HS.SALDOCOTAS,      '
        + '        HS.VLRREAL,         '
        + '        DECODE(HS.IDTIPORESERVA, 59, HS.VLRCOTAS, '
        + '                                 60, HS.VLRCOTAS, '
        + '                                 61, HS.VLRCOTAS, '
        + '                                 62, HS.VLRCOTAS, '
        + '                                170, HS.VLRCOTAS, '
        + '                                 0) AS VLRCOTAS,  '
        + '        HS.SEQRESGATE, '
        + '        HS.FLGENTRADA, '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , HS.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HISTMOVRESERVA HS '
        + '  WHERE HS.IDTIPORESERVA IN (59, 60, 61, 62, 170) '
        + '    AND HS.IDPLANOPREV   = '+ IntToStr(aIdPlanoPrev)
        + '    AND HS.IDPESSOA      = '+ IntToStr(aIdPessoa)
        + '    AND HS.IDPESSJUR     = '+ IntToStr(aIdPessJur)
        + '    AND (HS.SEQRESGATE IS NULL OR NVL(HS.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ' ;

  if not bTemresgate then               // SIG 132319
     sSQL := sSQL
        + '    AND HS.IDBENEFICIO IS NULL ' ;

  sSQL := sSQL
        + ' UNION ALL  '

        + ' SELECT H.DATARECEBIMENTO, '
        + '        100 PERCENTUAL,    '
        //+ '        H.IDHISTRESERVA,   '
        + '        NVL(H.IDHISTRESERVAORI, H.IDHISTRESERVA) IDHISTRESERVA, '
        + '        H.IDHISTRESERVA AS IDHISTREAL, '
        + '        H.IDPESSOA,        '
        + '        H.MESREFERENCIA,   '
        + '        H.VALORINDICE,     '        //edilaine SIG130042
        + '        H.IDTIPORESERVA,   '
        + '        H.SALDOREAL,       '
        + '        H.SALDOCOTAS,      '
        + '        H.VLRREAL,         '
        + '        H.VLRCOTAS,        '
        + '        H.SEQRESGATE,      '
        + '        H.FLGENTRADA,      '
        + '        '+sPercInscr+' AS PERC_ASSOCIA '
        + '        , H.ROWID AS NUMLINHA '        //edilaine SIG130042
        + '   FROM HSTCONTRIBPREV HST, PORTABILIDADEPREV POR, HISTMOVRESERVA H '
        + '  WHERE POR.idpessoa    = '+ IntToStr(aIdPessoa)
        + '    AND POR.idpessjur   = '+ IntToStr(aIdPessJur)
        + '    AND POR.idplanoprev = '+ IntToStr(aIdPlanoprev)
        + '    AND HST.IDPORTABILIDADE = POR.IDPORTABILIDADE '
        + '    AND POR.IDPESSOA = HST.IDPESSOA  '
        + '    AND POR.IDPESSOA = H.IDPESSOA    '
        + '    AND HST.IDPESSOA = H.IDPESSOA    '
        + '    AND HST.IDPLANOPREV = H.IDPLANOPREV   '
        + '    AND POR.IDPLANOPREV = HST.IDPLANOPREV '
        + '    AND POR.IDPLANOPREV = H.IDPLANOPREV   '
        + '    AND HST.NUMRECEBIMENTO = H.NUMRECEBIMENTO '
        + '    AND POR.IDPESSJUR = H.IDPESSJUR '
        + '    AND (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(iSeqResgate)+') ' ;

        if not bTemresgate then               // SIG 132319
           sSQL := sSQL
           + '    AND H.IDBENEFICIO IS NULL ' ;

  Result := sSQL;

end;


function TCtrlRequerBenef.MontaSqlReservasNovaNP(aIdPessoa, aIdPessJur, aIdPlanoprev: integer;
                                                 const aSeqResgate : integer): string;
var
  sSQL : string;
  bTemresgate : Boolean;
begin

  bTemresgate := TemResgateAnterior(aIdPessoa, aIdPessJur, aIdPlanoprev);  // SIG 132319 Ferrari

  sSQL := sSQL
        //+ ' SELECT NVL(H.IDHISTRESERVAORI, H.IDHISTRESERVA) IDHISTRESERVA, '
        + ' SELECT H.IDHISTRESERVA, '
        + '        H.IDHISTREAL, '
        + '        H.IDPESSOA, '
        + '        H.DATARECEBIMENTO, '
        + '        H.MESREFERENCIA, '
        + '        H.IDTIPORESERVA, '
        + '        H.VLRREAL, '
        + '        H.VLRCOTAS, '
        + '        H.SALDOREAL, '
        + '        H.SALDOCOTAS, '
        + '        H.FLGENTRADA, '
        + '        H.VALORINDICE, '        //edilaine SIG130042

        + '        SUM(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)) '
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.FLGENTRADA,       '     //edilaine SIG130042
        + '                                                   H.DATARECEBIMENTO,  '
        + '                                                   H.MESREFERENCIA,    '
        + '                                                   H.IDHISTRESERVA, H.IDHISTREAL) AS TOT_COTAS, '   //Leandro SIG133908
        + '        SUM(H.VLRREAL) '
        + '            OVER (PARTITION BY H.IDPESSOA ORDER BY H.FLGENTRADA,      '      //edilaine SIG130042
        + '                                                   H.DATARECEBIMENTO, '      //edilaine SIG130042
        + '                                                   H.MESREFERENCIA, '
        + '                                                   H.IDHISTRESERVA, H.IDHISTREAL) TOT_VALOR ' //Leandro SIG133908


        + ' FROM (SELECT NVL(HI.IDHISTRESERVAORI, HI.IDHISTRESERVA) IDHISTRESERVA, '
        + '              HI.IDHISTRESERVA AS IDHISTREAL, '
        + '              HI.IDPESSOA,          '
        + '              HI.IDPLANOPREV,       '
        + '              HI.IDPESSJUR,         '
        + '              HI.SEQPROPOSTA,       '
        + '              HI.IDBENEFICIO,       '
        + '              HI.DATAMOV,           '
        + '              HI.DATARECEBIMENTO,   '
        + '              HI.MESREFERENCIA,     '
        + '              HI.IDTIPORESERVA,     '
        + '              DECODE(HI.FLGENTRADA, 1, (HI.VLRREAL),  -HI.VLRREAL)  VLRREAL,  '
        + '              DECODE(HI.FLGENTRADA, 1, (HI.VLRCOTAS), -HI.VLRCOTAS) VLRCOTAS, '
        + '              HI.SALDOREAL,         '
        + '              HI.SALDOCOTAS,        '
        + '              HI.FLGENTRADA,        '
        + '              HI.VALORINDICE,       '      //edilaine SIG130042
        + '              HI.SEQRESGATE         '
        + '        FROM HISTMOVRESERVA HI      '
        + '       WHERE HI.IDPLANOPREV = '+IntToStr(aIdPlanoPrev)
        + '         AND HI.IDPESSJUR   = '+IntToStr(aIdPessJur)
        + '         AND HI.IDPESSOA    = '+IntToStr(aIdPessoa)
        + '         AND HI.SEQPROPOSTA = 1  '
        + '      ) H     '

        + ' JOIN   RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA '
        + '                        AND H.IDPLANOPREV = TP.IDPLANOPREV     '

        + ' JOIN   PARTPREVPLAN PP ON H.IDPESSOA = PP.IDPESSOA            '
        + '                       AND H.IDPESSJUR = PP.IDPESSJUR          '
        + '                       AND H.IDPLANOPREV = PP.IDPLANOPREV      '

        + ' WHERE  H.IDPLANOPREV   = '+IntToStr(aIdPlanoPrev)
        + ' AND    H.IDPESSJUR     = '+IntToStr(aIdPessJur)
        + ' AND    H.IDPESSOA      = '+IntToStr(aIdPessoa)
        + ' AND    H.SEQPROPOSTA   = 1'
        + ' AND    TP.ANALITICOSINTETI = ''A'' '
        + ' AND    NVL(TP.FLGCONTROLE, 0) = 0  '
        + ' AND    TP.FLGCOLETIVA = 0 '
        + ' AND    H.IDTIPORESERVA IN (100,110,111,101, 217, 208) '

        + ' AND    (H.SEQRESGATE IS NULL OR NVL(H.SEQRESGATE,-1) = '+IntToStr(aSeqResgate)+') ' ;
// Inicio SIG 132319 Ferrari
  if not bTemresgate then
     sSQL := sSQL
        + ' AND    H.IDBENEFICIO IS NULL ';

// Fim SIG 132319
  if aSeqResgate = -1 then
     sSQL := sSQL
        + ' AND (H.DATAMOV IS NULL OR TRUNC(H.DATAMOV) <> TRUNC(SYSDATE)) ';

  sSQL := sSQL
        + ' ORDER BY H.IDPESSOA, '
        + '          H.FLGENTRADA, '      //edilaine SIG130042
        + '          H.DATARECEBIMENTO, '
        + '          H.MESREFERENCIA, '
        + '          H.IDHISTRESERVA, H.IDHISTREAL ';        //Leandro SIG133908

 Result := sSQL;
end;
//edilaine WO9102 : fim

Function TCtrlRequerBenef.MontaSqlHISTMOVRESERVA(sDataCota : String; dVlrResgate : double; const iLimite : integer; const iSeqResgate : integer) : string;
var
  sSQL, sSQLUnion : string;
begin
   {comum aos dois planos
    sql secundaria para truncar valores calculados e separar reservas }
   sSQL := ' SELECT HR.ORDEM, '
         + '        HR.IDHISTRESERVA, '
         + '        HR.IDHISTREAL,    '
         + '        HR.IDPESSOA, '
         + '        HR.DATARECEBIMENTO, '
         + '        HR.MESREFERENCIA, '
         + '        HR.VALORINDICE, '        //edilaine SIG130042
         + '        HR.IDTIPORESERVA,  '
         + '        HR.VLRREAL, '
         + '        HR.VLRCOTAS, '
         + '        HR.SALDOREAL, '
         + '        HR.SALDOCOTAS, '
         + '        TRUNC(HR.TOT_VALOR, 8) AS TOT_VALOR, '
         + '        TRUNC(HR.TOT_COTAS, 8) AS TOT_COTAS, '
         + '        CASE  '
         + '          WHEN (TRUNC(HR.TOT_COTAS, 8) <= TRUNC('+OraNumero(FloatToStr(dVlrResgate))+', 8)) OR '
         + iff(iLimite > 0, ' (HR.ORDEM <= '+IntToStr(iLimite)+') OR ', '')
         + '               (TRUNC(HR.TOT_COTAS, 8) >= TRUNC('+OraNumero(FloatToStr(dVlrResgate))+', 8) AND (ROWNUM = 1)) THEN '
         + '            ''S''   '
         + '          ELSE      '
         + '            ''N''   '
         + '        END SELECAO ';

    //edilaine WO10872 : inicio
    if iIdPlanoPrev = 66 then
    begin
       sSQL := sSQL
         + '        , HR.VLRCOTAS_REAL '
         + '        , HR.PERC_REAL     ';
    end;
    //edilaine WO10872 : fim

    sSQL := sSQL
         + ' FROM ( SELECT ROWNUM AS ORDEM, O.* '
         + '          FROM ( ';


   if iIdPlanoPrev = 66 then
   begin
     //sSQLUnion := MontaSqlReservasREB(iIdPessoa, iIdPessJur, iIdPlanoPrev, sDataCota, iSeqResgate);    //edilaine 10872
     sSQLUnion := MontaSqlReservasREBNova(iIdPessoa, iIdPessJur, iIdPlanoPrev, sDataCota, iSeqResgate);  //edilaine 10872

     {busca reservas para recompor o saldo}
     sSQL := sSQL
           + '  SELECT RG.DATARECEBIMENTO, '
           + '         RG.IDHISTRESERVA,   '
           + '         RG.IDHISTREAL,      '
           + '         RG.IDPESSOA,        '
           + '         RG.MESREFERENCIA,   '
           + '         RG.VALORINDICE,     '        //edilaine SIG130042
           + '         RG.IDTIPORESERVA,   '
           + '         RG.SALDOREAL,       '
           + '         RG.SALDOCOTAS,      '
           + '         RG.VLRREAL,         '
           + '         RG.VLRCOTAS_66 AS VLRCOTAS, '
           + '         RG.VLRCOTAS    AS VLRCOTAS_REAL, '    //edilaine WO10872
           + '         RG.PERC_REAL,       '                 //edilaine WO10872
           + '         RG.FLGENTRADA,      '
           + '         SUM(DECODE(RG.FLGENTRADA, 1, (RG.VLRCOTAS_66), (RG.VLRCOTAS_66)*-1)) '
           + '              OVER (PARTITION BY RG.IDPESSOA ORDER BY RG.FLGENTRADA, RG.DATARECEBIMENTO,  ' //Leandro SIG133908
           + '                                                      RG.MESREFERENCIA,    '
           + '                                                      RG.IDHISTRESERVA, RG.IDHISTREAL) AS TOT_COTAS, ' //Leandro SIG133908
           + '         SUM(DECODE(RG.FLGENTRADA, 1, (RG.VLRREAL), (RG.VLRREAL)*-1)) '
           + '              OVER (PARTITION BY RG.IDPESSOA ORDER BY RG.FLGENTRADA, RG.DATARECEBIMENTO, '   //Leandro SIG133908
           + '                                                      RG.MESREFERENCIA,   '
           + '                                                      RG.IDHISTRESERVA, RG.IDHISTREAL) TOT_VALOR '    //Leandro SIG133908
           + ' FROM ( '
           + '  SELECT RES.*, '
           + '         DECODE(RES.PERCENTUAL, 100, 100, RES.PERC_ASSOCIA) AS PERC_REAL,  '       //edilaine WO10872
           + '         DECODE(RES.PERCENTUAL, 100, RES.VLRCOTAS, RES.VLRCOTAS * (RES.PERC_ASSOCIA/100)) AS VLRCOTAS_66 '
           + ' FROM ( ' + sSQLUnion + ' ) RES '
           //edilaine SIG130042 : inicio
           + '      ORDER BY RES.IDPESSOA,        '
           + '               RES.FLGENTRADA,      '
           + '               RES.DATARECEBIMENTO, '
           + '               RES.MESREFERENCIA,   '
           + '               RES.IDHISTRESERVA,   '
           + '               RES.IDHISTREAL       ' //Leandro SIG133908
           //edilaine SIG130042 : fim

           + ' ) RG   '
           + ' ORDER BY RG.IDPESSOA,  '
           + '          RG.FLGENTRADA, '           //edilaine SIG130042
           + '          RG.DATARECEBIMENTO, '
           + '          RG.MESREFERENCIA,   '
           + '          RG.IDHISTRESERVA,    '
           + '          RG.IDHISTREAL   '; //Leandro SIG133908
   end
   else  { 74 }
   begin

     {sql principal para acumulo das cotas }
     //sSQLUnion := MontaSqlReservasNP(iIdPessoa, iIdPessJur, iIdPlanoPrev, iSeqResgate);      //edilaine WO10872
     sSQLUnion := MontaSqlReservasNPNova(iIdPessoa, iIdPessJur, iIdPlanoPrev, iSeqResgate);    //edilaine WO10872

     sSQL := sSQL + sSQLUnion;

   end;

   sSQL := sSQL
         + '    ) O '
         + ' ) HR '
         + ' ORDER BY HR.IDPESSOA, '
         + '          HR.FLGENTRADA, '          //edilaine SIG130042
         + '          HR.DATARECEBIMENTO, '
         + '          HR.MESREFERENCIA, '
        // + '          DECODE(HR.FLGENTRADA, 1, HR.IDTIPORESERVA), '         SIG 132319 Ferrari
         + '          HR.IDHISTRESERVA, '
         + '          HR.IDHISTREAL ';          //edilaine SIG130042

   Result := sSQL;
end;                                                                                 



Function TCtrlRequerBenef.GetLinhaLimite(qry : Twwquery;
                                         sDataCota : string;
                                         dVlrResgate : double) : integer;
var
  sSQL : string;
begin
   //localiza linha limite das reservas que serao resgatadas
   sSQL := MontaSqlHISTMOVRESERVA(sDataCota, dVlrResgate);
   sSQL := 'SELECT NVL(MAX(T.ORDEM),0) FROM ('+sSQL+') T WHERE T.SELECAO = ''S'' ';

   try
     result:= 0;
     qry.close;
     qry.SQL.text := sSQL;
     qry.Open;

     result := qry.fields[0].AsInteger;

   except on e: exception do
     raise Exception.create('Ocorreu um erro GetLinhaLimite(): ' + #13#10 + e.Message);
   end;
end;


Function TCtrlRequerBenef.GetHISTMOVRESERVA(qry : Twwquery;
                                           sDataCota : string;
                                           bRetorna: Boolean;
                                           dVlrResgate : double) : double;
var
  sSQL : string;
begin
   //localiza linha limite das reservas que serao resgatadas
   iLinhaLimite := GetLinhaLimite(qry, sDataCota, dVlrResgate);

   sSQL := MontaSqlHISTMOVRESERVA(sDataCota, dVlrResgate, iLinhaLimite);

   try
     result:= 0;
     qry.close;
     qry.SQL.text := sSQL;
     qry.Open;

     if bRetorna then
        result:= qry.fields[0].asFloat;

   except on e: exception do
     raise Exception.create('Ocorreu um erro GetHISTMOVRESERVA(): ' + #13#10 + e.Message);
   end;
end;

Function TCtrlRequerBenef.getCamposHISTMOVRESERVA(sChave: String): String;
begin
  result:= sChave + ',' + //'IDHISTRESERVA,VLRREAL,VLRCOTAS,SALDOREAL,SALDOCOTAS,FLGENTRADA,'
           'DATAALIMENTACAO,'+
           'DATAEFETIVOPAGTO,'+
           'DATAINDICE,'+
           'DATAMOV,'+
           'DATARECEBIMENTO,'+
           'DTALTERACAO,'+
           'FATORRESGATE,'+
           'FLGPROCEDENCIA,'+
           'IDBENEFICIO,'+
           'IDCONTRIBUICAO,'+
           'IDEVENTOGERADOR,'+
           'IDPARTICIPANTE,'+
           'IDPESSJUR,'+
           'IDPESSOA,'+
           'IDPESSOADESTINO,'+
           'IDPESSOAORIGEM,'+
           'IDPLANOPREV,'+
           'IDREGRACALCULO,'+
           'IDTIPORESERVA,'+
           'INDICECORRECAO,'+
           'MESREFERENCIA,'+
           'NUMRECEBIMENTO,'+
           'OBSERVACAO,'+
           'PERCENTUAL,'+
           'PLNCODIGO,'+
           'SALDOCORRIGIDO,'+
           'SALDOREALCONT,'+
           'SEQPROPOSTA,'+
           'TRGDTINCLUSAO,'+
           'TRGUSERINCLUSAO,'+
           'USERALTERACAO,'+
           'VALORINDICE,'+
           'VLRCOTASIR,'+
           'VLRCOTASIRPREVIA';
end;

Function TCtrlRequerBenef.InserirHISTMOVRESERVA(sIDHISTRESERVA: string; dVLRREAL, dVLRCOTAS, dSALDOREAL, dSALDOCOTAS: Double;
                                                iFLGEntrada: Integer): Boolean;
begin
  try
    ExecutarQuery(qryAUX,  ' INSERT INTO CM.HISTMOVRESERVA('+getCamposHISTMOVRESERVA('IDHISTRESERVA,VLRREAL,VLRCOTAS,SALDOREAL,SALDOCOTAS,FLGENTRADA, IDHISTRESERVAORI') +')'+  
                           '        SELECT '+ getCamposHISTMOVRESERVA('SEQHISTMOVRESERVA.Nextval  ,'+
                                                                       TratarValor(dVLRREAL)   + ','+
                                                                       TratarValor(dVLRCOTAS)  + ','+
                                                                       TratarValor(dSALDOREAL) + ','+
                                                                       TratarValor(dSALDOCOTAS)+ ','+
                                                                       IntToStr(iFLGEntrada)   + ','+
                                                                       sIDHISTRESERVA
                                                                      ) +
                           '        FROM CM.HISTMOVRESERVA WHERE IDHISTRESERVA = '+ sIDHISTRESERVA );
  except on e: exception do
    raise Exception.Create('Ocorreu um erro InserirHISTMOVRESERVA(): ' + #13#10 + e.message);
  end;
end;


function TCtrlRequerBenef.GetNumSeqResgate(iIdPlanoPrev, iIdPessJur, iIdPessoa, iSeqProposta : integer;
                                           const bIncrementa : boolean = true) : Integer;
var
  _qryAux : TwwQuery;
begin
  result:= 0;

  _qryAux := Twwquery.Create(nil);
  _qryAux.databasename := 'basedados';

  try
    try
      _qryAux.SQL.Add('SELECT COALESCE(MAX(H.SEQRESGATE),0) AS SEQRESGATE '+
                     ' FROM   HISTMOVRESERVA H  '+
                     ' WHERE  H.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+
                     ' AND    H.IDPESSJUR     = '+IntToStr(iIdPessJur)+
                     ' AND    H.SEQPROPOSTA   = '+IntToStr(iSeqProposta)+
                     ' AND    H.IDPESSOA      = '+IntToStr(iIdPessoa)+
                     ' AND    H.FLGENTRADA = 1');
      _qryAux.Open;

     result:= _qryAux.fieldbyname('SEQRESGATE').asInteger;
     if bIncrementa then
        result := result + 1;

    except on e: exception do
      raise Exception.Create('Ocorreu um erro GetSeqResgate(): ' + #13#10 + e.message);
    end;
  finally
    FreeAndNil(_qryAux);
  end;
end;


function TCtrlRequerBenef.MarcaReservasResgatadas(piIdPlanoPrev, piIdPessJur, piSeqProposta,
                                                 piIdPessoa, piNumProcesso,
                                                 piSeqResgate : Integer;
                                                 sDataCota : string;  //psListaReservas : string;
                                                 prSaldoResgate : double
                                                 ) : boolean;
var
  qryHST: Twwquery;
  iSequencia: Integer;
  dVlrRealRetidoLin,
  dVlrCotasRetidoLin,
  dVlrDeduzSaldoCotas,
  dVlrDeduzSaldoReal    : double;
begin
  result := false;

  qryHST := TwwQuery.Create(nil);
  qryHST.DatabaseName:= 'BaseDados';

  iIdPessoa       := piIdPessoa;
  iIdPlanoPrev    := piIdPlanoPrev;
  iIdPessJur      := piIdPessJur;
  iNumeroProcesso := piNumProcesso;
  iSeqProposta    := piSeqProposta;
  iSequencia      := piSeqResgate;

  try
     try
        //localiza reservas que serao resgatadas
        GetHISTMOVRESERVA(qryHST, sDataCota, false, prSaldoResgate);

        dVlrCotasRetidoLin := 0;
        dVlrRealRetidoLin  := 0;

        //posicionou na reserva que será dividida
        if qryHST.Locate('SELECAO', 'N', []) then
        begin
           //volta no lançamento anterior para verificar quanto falta para completar o saldo
           qryHst.Prior;
           if qryHST.FieldByName('SELECAO').AsString = 'S' then
           begin
             //dVlrCotasRetidoLin  := StrtoFloat(FormatFloat('#0.00000000',prSaldoResgate)) - StrtoFloat(FormatFloat('#0.00000000', qryHST.FieldByName('TOT_COTAS').Asfloat));   //edilaine SIG130042
             dVlrDeduzSaldoCotas := StrtoFloat(FormatFloat('#0.00000000',prSaldoResgate)) - StrtoFloat(FormatFloat('#0.00000000', qryHST.FieldByName('TOT_COTAS').Asfloat));     //edilaine SIG130042
           end;

           //edilaine SIG130042 : inicio
           if dVlrDeduzSaldoCotas < 0.0001 then
              dVlrDeduzSaldoCotas := 0;
           //edilaine SIG130042 : fim

           //avança para linha que será dividida e calcula o valor da retenção da linha, se necessário
           qryHst.next;
           if {dVlrCotasRetidoLin} dVlrDeduzSaldoCotas <> 0 then   //edilaine SIG130042
           begin
             //edilaine WO10872 : inicio
             if (qryHST.FindField('PERC_REAL') <> nil) and
                (qryHST.FieldByName('PERC_REAL').AsInteger < 100) then
             begin
               // quanto não usa 100 da cota, precisa calcular o valor proporcional referente a cota real
               // que ficará retido, para depois no cálculo da idade das cotas nas procedures de Prazo e PMP
               // os valores fiquem iguais
               // Por exemplo:
               //  - valor real da cota      : 55.287788138811
               //  - percentual da associacao: 15
               //  - cota real x percentual  : 8.29316822082165    <-- esse valor de cota foi usada na marcação
               //
               // ao dividir o registro da histmovreserva para compor o que falta do saldo resgatado,
               // é preciso calcular qto esse valor representa do valor real da cota
               // Se a retenção será de 7.36273179 da cota calculada de 8.29316822, qto 7.36273179
               // representa sobre o valor real de 55.287788138811
               // entao: valor retido real = (valor real cota * valor retido) / valor cota calculado

               dVlrCotasRetidoLin  := ArredondaValor(qryHST.FieldByName('TOT_COTAS').AsFloat - prSaldoResgate, 8);
               dVlrCotasRetidoLin  := ArredondaValor((qryHST.FieldByName('VLRCOTAS_REAL').AsFloat * dVlrCotasRetidoLin) / qryHST.FieldByName('VLRCOTAS').AsFloat, 8);

               dVlrDeduzSaldoCotas := ArredondaValor((qryHST.FieldByName('VLRCOTAS_REAL').AsFloat * dVlrDeduzSaldoCotas) / qryHST.FieldByName('VLRCOTAS').AsFloat, 8);

               //regra de 3 para achar o qto fica retido no valor real
               dVlrRealRetidoLin := qryHST.FieldByName('VLRREAL').Asfloat;
               dVlrRealRetidoLin := ArredondaValor((dVlrRealRetidoLin * dVlrCotasRetidoLin) / qryHST.FieldByName('VLRCOTAS_REAL').AsFloat, 2);

               //edilaine SIG130042 : inicio
               dVlrDeduzSaldoReal :=  ArredondaValor(dVlrDeduzSaldoCotas * qryHST.FieldByName('VALORINDICE').AsFloat, 2);
             end
             else
             begin
               dVlrCotasRetidoLin  := ArredondaValor(qryHST.FieldByName('TOT_COTAS').AsFloat - prSaldoResgate, 8);

               //regra de 3 para achar o qto fica retido no valor real
               dVlrRealRetidoLin := qryHST.FieldByName('VLRREAL').Asfloat;
               dVlrRealRetidoLin := ArredondaValor((dVlrRealRetidoLin * dVlrCotasRetidoLin) / qryHST.FieldByName('VLRCOTAS').AsFloat, 2);

               //edilaine SIG130042 : inicio
               dVlrDeduzSaldoReal :=  ArredondaValor(dVlrDeduzSaldoCotas * qryHST.FieldByName('VALORINDICE').AsFloat, 2);
             end;
             //edilaine WO10872 : inicio

             //dVlrDeduzSaldoReal  := 0;
             //dVlrDeduzSaldoCotas := 0;
             //edilaine SIG130042 : fim

             //Atualiza linha atual com valor que falta
             AtlzHISTMOVRESERVA(iSequencia,
                                qryHST.fieldbyname('IDHISTRESERVA').asstring,
                                {dVlrRealRetidoLin}  dVlrDeduzSaldoReal,     //valor real     //edilaine SIG130042
                                {dVlrCotasRetidoLin} dVlrDeduzSaldoCotas,    //valor cotas    //edilaine SIG130042
                                0,    //saldo real
                                0     //saldo cotas
                                );
           end;

           //Inserir linha duplicada com saldo restante
           if (dVlrCotasRetidoLin > 0) then
            begin

              //dVlrRealRetidoLin  := ArredondaValor(qryHST.fieldbyname('VLRREAL').ascurrency - dVlrRealRetidoLin, 2);           //edilaine SIG130042
              //dVlrCotasRetidoLin := ArredondaValor(qryHST.fieldbyname('VLRCOTAS').asFloat{currency} - dVlrCotasRetidoLin, 8);  //edilaine SIG130042

               InserirHISTMOVRESERVA(qryHST.fieldbyname('IDHISTRESERVA').asstring,
                                     dVlrRealRetidoLin,   //valor real
                                     dVlrCotasRetidoLin,  //valor cotas
                                     0, //qryHST.fieldbyname('SALDOREAL').ascurrency,  //saldo real
                                     0, //qryHST.fieldbyname('SALDOCOTAS').ascurrency, //saldo cotas
                                     1  //flgentrada
                                    );
            end;
        end;

        //Atualiza somente o campo: SEQRESGATE
        AtlzHISTMOVRESERVA(iSequencia, prSaldoResgate, sDataCota );

        Result := true;

     except on e: exception do
        raise Exception.Create('Ocorreu um erro MarcaReservasResgatadas(): ' + #13#10 + e.message);
     end;

  finally
     FreeAndNil(qryHST);
  end;
end;


function TCtrlRequerBenef.MarcaReservasComplementares(piIdPlanoPrev,
                                                      piIdPessJur,
                                                      piSeqProposta,
                                                      piIdPessoa : integer;
                                                      piNumeroProcesso : integer = -1    //edilaine WO25429
                                                     ): boolean;
var
  qryBusca     : TwwQuery;
  _qry         : TwwQuery;
  iSeqResgate  : byte;
begin

  Result := TRUE;

  _qry     := TwwQuery.create(nil);
  qryBusca := TwwQuery.create(nil);
  try
    _qry.databasename     := 'BaseDados';
    qryBusca.databasename := 'BaseDados';

    //verificar se há marcaçao das reservas
    qryBusca.SQL.add('SELECT H.* ');
    qryBusca.SQL.add('  FROM HISTMOVRESERVA H ');
    qryBusca.SQL.add(' WHERE H.SEQRESGATE = 1 ');
    qryBusca.SQL.add('   AND H.IDPESSOA    = '+IntToStr(piIdPessoa) );
    qryBusca.SQL.add('   AND H.IDPESSJUR   = '+IntToStr(piIdPessJur) );
    qryBusca.SQL.add('   AND H.IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
    qryBusca.SQL.add('   AND H.SEQPROPOSTA = '+IntToStr(piSeqProposta) );
    qryBusca.Open;

    if qryBusca.eof then
    begin
     //edilaine WO25429 : inicio
     //busca valores resgatados que tenham beneficio concedido
     qryBusca.close;
     qryBusca.Sql.Clear;
     qryBusca.SQL.add('select h.idbeneficio, h.plncodigo, h.ideventogerador, sum(h.vlrcotas) AS TOT_COTAS, ');
     qryBusca.SQL.add('       b.numeroprocesso, b.datainicio                 ');
     qryBusca.SQL.add('  from histmovreserva h                               ');
     qryBusca.SQL.add('  join benefbfciario  b                               ');
     qryBusca.SQL.add('    on b.idpessoa    = h.idpessoa                     ');
     qryBusca.SQL.add('   and b.idpessjur   = h.idpessjur                    ');
     qryBusca.SQL.add('   and b.idplanoprev = h.idplanoprev                  ');
     qryBusca.SQL.add('   and b.seqproposta = h.seqproposta                  ');
     qryBusca.SQL.add('   and b.idbeneficio = h.idbeneficio                  ');
     qryBusca.SQL.add('   and to_char(b.datainiciofund, ''YYYY/MM'') = h.mesreferencia ');
     qryBusca.SQL.add(' where h.plncodigo is not null                        ');
     qryBusca.SQL.add('   and h.flgentrada  = 0                              ');
     qryBusca.SQL.add('   and h.IDPESSOA    = '+IntToStr(piIdPessoa)          );
     qryBusca.SQL.add('   AND h.IDPESSJUR   = '+IntToStr(piIdPessJur)         );
     qryBusca.SQL.add('   AND h.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)       );
     qryBusca.SQL.add('   AND h.SEQPROPOSTA = '+IntToStr(piSeqProposta)       );

     if piNumeroProcesso > 0 then
        qryBusca.SQL.add('   AND b.numeroprocesso <> '+IntToStr(piNumeroProcesso)  );

     qryBusca.SQL.add('group by h.idbeneficio, h.plncodigo, h.ideventogerador, b.numeroprocesso, b.datainicio ');
     qryBusca.SQL.add('order by b.numeroprocesso  ');
     qryBusca.Open;

     {if qryBusca.eof then
     begin
       //busca valores resgatados que não tenham beneficio atrelado a baixa
       qryBusca.close;
       qryBusca.Sql.Clear;
       qryBusca.SQL.add(' SELECT BF.NUMEROPROCESSO, BF.DATAINICIO,  SUM(H.VLRCOTAS) AS TOT_COTAS,');
       qryBusca.SQL.add('        TO_CHAR(BF.DATAFINAL, ''YYYY/MM'') AS MESREF                    ');
       qryBusca.SQL.add('   FROM HISTMOVRESERVA H                                                ');
       qryBusca.SQL.add('   JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA          ');
       qryBusca.SQL.add('                        AND H.IDPLANOPREV   = TP.IDPLANOPREV            ');
       qryBusca.SQL.add('   JOIN EVENTOSPREV EP ON EP.IDEVENTOGERADOR = H.IDEVENTOGERADOR        ');
       qryBusca.SQL.add('                      AND EP.IDPESSOA = H.IDPESSOA                      ');
       qryBusca.SQL.add('                      AND EP.IDPESSJUR = H.IDPESSJUR                    ');
       qryBusca.SQL.add('                      AND EP.IDPLANOPREV = H.IDPLANOPREV                ');
       qryBusca.SQL.add('   JOIN BENEFBFCIARIO BF ON BF.IDPESSJUR = H.IDPESSJUR                  ');
       qryBusca.SQL.add('                        AND BF.IDPESSOA = H.IDPESSOA                    ');
       qryBusca.SQL.add('                        AND BF.IDPLANOPREV = H.IDPLANOPREV              ');
       qryBusca.SQL.add('                        AND BF.IDBENEFICIO = H.IDBENEFICIO              ');
       qryBusca.SQL.add(' WHERE H.IDPESSOA    = '+IntToStr(piIdPessoa) );
       qryBusca.SQL.add('   AND H.IDPESSJUR   = '+IntToStr(piIdPessJur) );
       qryBusca.SQL.add('   AND H.IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
       qryBusca.SQL.add('   AND H.SEQPROPOSTA = '+IntToStr(piSeqProposta) );
       qryBusca.SQL.add('   AND TP.ANALITICOSINTETI = ''A''           ');
       qryBusca.SQL.add('   AND NVL(TP.FLGCONTROLE, 0) = 0            ');
       qryBusca.SQL.add('   AND TP.FLGCOLETIVA = 0                    ');
       qryBusca.SQL.add('   AND H.IDEVENTOGERADOR IS NOT NULL         ');

       //edilaine WO25429 : inicio
       if piNumeroProcesso > 0 then
          qryBusca.SQL.add('   AND BF.NUMEROPROCESSO <> '+IntToStr(piNumeroProcesso)  );


       if piIdPlanoPrev = 66 then
       begin
         qryBusca.SQL.add('   AND SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') ');
         qryBusca.SQL.add('   AND NOT EXISTS (SELECT 1                               ');
         qryBusca.SQL.add('                 FROM PARTPREVPLAN PPP                    ');
         qryBusca.SQL.add('                WHERE PPP.IDPESSOA = H.IDPESSOA           ');
         qryBusca.SQL.add('                  AND PPP.IDPESSJUR = H.IDPESSJUR         ');
         qryBusca.SQL.add('                  AND PPP.IDPLANOPREV = 2                 ');
         qryBusca.SQL.add('                  AND PPP.IDSITPLANOPREV = 1)             ');
       end;

       qryBusca.SQL.add('GROUP BY BF.NUMEROPROCESSO, BF.DATAINICIO, BF.DATAFINAL ');
       qryBusca.SQL.add('ORDER BY BF.DATAINICIO  ');
       qryBusca.Open;
     end;}
     //edilaine WO25429 : fim

     //para cada valor marcar as movimentacoes
     while not qryBusca.eof do
     begin
       iSeqResgate := GetNumSeqResgate(piIdPlanoPrev, piIdPessJur, piIdPessoa, piSeqProposta);

       if not MarcaReservasResgatadas( piIdPlanoPrev,
                                       piIdPessJur,
                                       piSeqProposta,
                                       piIdPessoa,
                                       qryBusca.FieldByName('NUMEROPROCESSO').AsInteger,
                                       iSeqResgate,
                                       qryBusca.FieldByName('DATAINICIO').AsString,
                                       qryBusca.FieldByName('TOT_COTAS').AsFloat
                                     ) then

       begin
          Result := False;
          Exit;
       end;

       if result then
       begin
         //edilaine WO25429 : inicio
         _qry.close;
         _qry.sql.clear;
         _qry.Sql.Add('UPDATE HISTMOVRESERVA SET SEQRESGATE = '+IntToStr(iSeqResgate) );
         _qry.Sql.Add(' WHERE PLNCODIGO   = '+qryBusca.FieldByName('plncodigo').AsString );
         _qry.Sql.Add('   AND IDPESSOA    = '+IntToStr(piIdPessoa)    );
         _qry.Sql.Add('   AND IDPESSJUR   = '+IntToStr(piIdPessJur)   );
         _qry.Sql.Add('   AND IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
         _qry.Sql.Add('   AND SEQPROPOSTA = '+IntToStr(piSeqProposta) );
         _qry.Sql.Add('   AND IDEVENTOGERADOR IS NOT NULL ');
         _qry.Sql.Add('   AND IDBENEFICIO IS NOT NULL     ');
         _qry.Sql.Add('   AND FLGENTRADA = 0              ');

         {_qry.Sql.Add('UPDATE HISTMOVRESERVA SET SEQRESGATE = '+IntToStr(iSeqResgate) );
         _qry.Sql.Add(' WHERE IDHISTRESERVA IN (      ');
         _qry.Sql.Add('      SELECT H.IDHISTRESERVA   ');
         _qry.Sql.Add('        FROM HISTMOVRESERVA H  ');
         _qry.Sql.Add('        JOIN BENEFBFCIARIO BF ON BF.IDPESSJUR = H.IDPESSJUR   ');
         _qry.Sql.Add('                             AND BF.IDPESSOA = H.IDPESSOA     ');
         _qry.Sql.Add('                             AND BF.IDPLANOPREV = H.IDPLANOPREV  ');
         _qry.Sql.Add('                             AND BF.IDBENEFICIO = H.IDBENEFICIO  ');
         _qry.Sql.Add('        JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA  ');
         _qry.Sql.Add('                             AND H.IDPLANOPREV   = TP.IDPLANOPREV    ');
         _qry.Sql.Add('       WHERE H.IDPESSOA    = '+IntToStr(piIdPessoa) );
         _qry.Sql.Add('         AND H.IDPESSJUR   = '+IntToStr(piIdPessJur) );
         _qry.Sql.Add('         AND H.IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
         _qry.Sql.Add('         AND H.SEQPROPOSTA = '+IntToStr(piSeqProposta) );
         _qry.Sql.Add('         AND H.IDEVENTOGERADOR IS NOT NULL ');
         _qry.Sql.Add('         AND H.IDBENEFICIO IS NOT NULL     ');
         _qry.Sql.Add('         AND H.FLGENTRADA = 0              ');
         _qry.Sql.Add('         AND TP.ANALITICOSINTETI = ''A''   ');
         _qry.Sql.Add('         AND NVL(TP.FLGCONTROLE, 0) = 0    ');
         _qry.Sql.Add('         AND TP.FLGCOLETIVA = 0            ');
         _qry.Sql.Add('         AND H.MESREFERENCIA = '+Quotedstr(qryBusca.FieldByName('MESREF').AsString) );
         if piIdPlanoPrev = 66 then
         begin
           _qry.SQL.add('       AND SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') ');
           _qry.SQL.add('       NOT EXISTS (SELECT 1                                   ');
           _qry.SQL.add('                     FROM PARTPREVPLAN PPP                    ');
           _qry.SQL.add('                    WHERE PPP.IDPESSOA = H.IDPESSOA           ');
           _qry.SQL.add('                      AND PPP.IDPESSJUR = H.IDPESSJUR         ');
           _qry.SQL.add('                      AND PPP.IDPLANOPREV = 2                 ');
           _qry.SQL.add('                      AND PPP.IDSITPLANOPREV = 1)             ');
         end;
         _qry.SQL.add(')');
         }//edilaine WO25429 : fim
         try
           _qry.ExecSQL;
         except
           result := false;
         end;

         if result then
         begin
           _qry.close;
           _qry.sql.clear;
           _qry.Sql.Add('UPDATE PROCESSOBENEF SET SEQRESGATE = '+IntToStr(iSeqResgate) );
           _qry.Sql.Add(' WHERE NUMEROPROCESSO = '+qryBusca.FieldByName('NUMEROPROCESSO').AsString );

           try
             _qry.ExecSQL;
           except
             result := false;
           end;
         end;

       end;

       qryBusca.next;
     end;

    end;

  finally
    FreeAndNil(qryBusca);
    FreeAndNil(_qry);
  end;

end;



function TCtrlRequerBenef.GetTotalResgate(piIdPlanoPrev, piIdPessJur, piSeqProposta,
                                          piIdPessoa, piNumeroProcesso : integer
                                          ) : double;
begin
  qryAux.close;
  qryAux.SQL.clear;
  qryAux.SQL.Text := 'SELECT VALORATUAL FROM BENEFBFCIARIO '+
                     ' WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso) +
                     '   AND IDPESSOA       = '+IntToStr(piIdPessoa) +
                     '   AND IDPLANOPREV    = '+IntToStr(piIdPlanoPrev) +
                     '   AND SEQPROPOSTA    = '+IntToStr(piSeqProposta) +
                     '   AND IDPESSJUR      = '+IntToStr(piIdPessJur);
  qryAux.Open;
  if not qryAux.isEmpty then
     result := qryAux.Fields[0].AsFloat
  else
     result := 0 ;

  qryAux.close;
end;


function TCtrlRequerBenef.GetTotalResgate(piIdPlanoPrev, piIdPessJur, piIdPessoa, piSeqProposta, piIdEvento : integer;
                                          sDataCota : string;
                                          dPercRetencao: double;
                                          piNumeroProcesso : integer;
                                          piIdBeneficio    : integer;           //edilaine WO10872
                                          var lstReservas  : TStringList): double;
var
  sSQL, sBase : string;
  sVlrRetem   : string;
  dIndice     : double;      //edilaine WO10872
begin
  sVlrRetem := '0';
  if dPercRetencao > 0 then
     sVlrRetem := OraNumero(FloatToStr((100 - dPercRetencao) / 100));

  dIndice := BuscaIndice(IntTostr(piIdPessJur),IntTostr(piIdPessoa),IntTostr(piIdPlanoPrev));

  if piIdPlanoPrev = 66 then
  begin
     //sBase := MontaSqlReservasREB(piIdPessoa, piIdPessJur, piIdPlanoPrev, sDataCota);      //edilaine 10872
     sBase := MontaSqlReservasREBNova(piIdPessoa, piIdPessJur, piIdPlanoPrev, sDataCota);    //edilaine 10872

     //edilaine WO10872  inicio
     {sSQL := 'SELECT '
           + '       SUM(DECODE(T.FLGENTRADA, 1,VLRCOTAS_66, -VLRCOTAS_66)) AS TOT_RESGATE, '
           + '       SUM(DECODE(T.FLGENTRADA, 1,VLRCOTAS_66, -VLRCOTAS_66)) * '+sVlrRetem+' AS TOT_RETEM '
           + '  FROM (  '
           + '     SELECT RES.*, '
           + '        DECODE(RES.PERCENTUAL, 100, RES.VLRCOTAS, RES.VLRCOTAS * (RES.PERC_ASSOCIA/100)) AS VLRCOTAS_66 '
           + '     FROM ( ' + sBase + ' ) RES '
           + ' ) T ';   }

     sSQL := 'SELECT TRUNC(BF.VALORTOTAL / '+OraNumero(FloatToStr(dIndice))+', 8) AS TOT_RESGATE, '+
             '       BF.INDICEDIB, BF.VALORTOTAL  ' +
             '  FROM BENEFBFCIARIO  BF  ' +
             //' WHERE BF.IDPESSOA       = '+IntToStr(piIdPessoa) +
             ' WHERE BF.IDTITULAR      = '+IntToStr(piIdPessoa) +     //edilaine WO20723
             '   AND BF.IDPESSJUR      = '+IntToStr(piIdPessJur) +
             '   AND BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev) +
             '   AND BF.SEQPROPOSTA    = '+IntToStr(piSeqProposta) +
             '   AND BF.IDBENEFICIO    = '+IntToStr(piIdBeneficio) +
             '   AND BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso);
     //edilaine WO10872  fim

  end
  else
  begin
     //edilaine WO10872  inicio
     {sBase := MontaSqlReservasNP(piIdPessoa, piIdPessJur, piIdPlanoPrev);

     sSQL := 'SELECT '
           + '       SUM(DECODE(T.FLGENTRADA, 1,VLRCOTAS, -VLRCOTAS)) AS TOT_RESGATE, '
           + '       SUM(DECODE(T.FLGENTRADA, 1,VLRCOTAS, -VLRCOTAS)) * '+sVlrRetem+' AS TOT_RETEM '
           + '  FROM ( ' + sBase + ' ) T ';
     }//edilaine WO10872  fim

    sBase := 'SELECT H.IDTIPORESERVA, H.VLRCOTAS, H.VALORINDICE,              '
           + '       (H.VLRCOTAS * H.VALORINDICE) AS VALOR                    '
           + '  FROM HISTMOVRESERVA H                                         '
           {+ '  JOIN BENEFBFCIARIO BF ON BF.IDTITULAR = H.IDPESSOA            '
           + '                       AND BF.IDPESSJUR = H.IDPESSJUR           '
           + '                       AND BF.IDPLANOPREV = H.IDPLANOPREV       '
           + '                       AND BF.SEQPROPOSTA = H.SEQPROPOSTA       '
           + '                       AND BF.IDBENEFICIO = H.IDBENEFICIO       '
           + '  JOIN PROCESSOBENEF P ON P.NUMEROPROCESSO = BF.NUMEROPROCESSO  '
           + '                      AND P.IDEVENTOGERADOR = H.IDEVENTOGERADOR '  }
           //+ ' WHERE H.PLNCODIGO IS NOT NULL  '
           + ' WHERE H.IDEVENTOGERADOR = '+IntToStr(piIdEvento)
           + '   AND H.FLGENTRADA     = 0     '
           //+ '   AND P.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)
           + '   AND H.IDPESSOA       = '+IntToStr(piIdPessoa)
           + '   AND H.IDPESSJUR      = '+IntToStr(piIdPessJur)
           + '   AND H.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)
           + '   AND H.SEQPROPOSTA    = '+IntToStr(piSeqProposta)
           + '   AND TRUNC(H.DATAMOV) = TRUNC(SYSDATE) ';

    sSQL := 'SELECT '
          + '      SUM(T.VLRCOTAS) AS TOT_RESGATE, '
          + '      SUM(T.VLRCOTAS) * '+sVlrRetem+' AS TOT_RETEM '
          + '  FROM ( ' + sBase + ' ) T ';

  end;


  {preenche lista de reservas}
  qryAux.close;
  qryAux.SQL.clear;
  qryAux.SQL.Text := 'SELECT DISTINCT RS.IDTIPORESERVA FROM ('+ sBase +') RS ';
  qryAux.Open;
  while not qryAux.eof do
  begin
     lstReservas.Add( qryAux.Fields[0].AsString );
     qryAux.next;
  end;

  if lstReservas.count > 0 then
  begin
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.Text := sSQL;
    qryAux.Open;

    Result := qryAux.Fields[0].AsFloat;

    {if dPercRetencao = 0 then
       Result := qryAux.Fields[0].AsFloat
    else
       Result := qryAux.Fields[1].AsFloat;}
  end
  else
    Result := 0;

end;



function TCtrlRequerBenef.GetValorIndice(piIdPlanoPrev, piIdPessJur,
  piIdPessoa: integer): double;
var
  rIndice : double;
  sSQL    : string;
begin
  rIndice := 0;

  if piIdPlanoPrev = 74 then
  begin
    sSQL :=
    ' SELECT DISTINCT CO.COTVALOR  '+
    '   FROM RESERVAPART RS,       '+
    '        RESERVAXPLANO TP,     '+
    '        PLANPREV PV,          '+
    '        COTACAOMOEDA CO,      '+
    '        MOEDA,                '+
    '        ( SELECT TP1.INDICEREAJUSTE INDICERE,  '+
    '                  MAX(COTDATA) AS DATAMAX      '+
    '             FROM RESERVAPART RP1,             '+
    '                  RESERVAXPLANO TP1,           '+
    '                  COTACAOMOEDA CO1             '+
    '            WHERE RP1.IDPESSJUR   = '+IntToStr(piIdPessJur) +
    '              AND RP1.IDPESSOA    = '+IntToStr(piIdPessoa)  +
    '              AND RP1.IDPLANOPREV = 74         '+
    '              AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV)     '+
    '              AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA) '+
    '              AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE)    '+
    '            GROUP BY TP1.INDICEREAJUSTE) MAXDATA          '+
    '  WHERE RS.IDPESSJUR = '+IntToStr(piIdPessJur) +
    '    AND RS.IDPESSOA  = '+IntToStr(piIdPessoa)  +
    '    AND (RS.IDPLANOPREV = 74)    '+
    '    AND (TP.FLGCONTROLE = 0)     '+
    '    AND (TP.IDPLANOPREV = RS.IDPLANOPREV)       '+
    '    AND (TP.IDTIPORESERVA = RS.IDTIPORESERVA)   '+
    '    AND (TP.INDICEREAJUSTE = MAXDATA.INDICERE (+ ) ) '+
    '    AND (TP.ANALITICOSINTETI = ''A'')                '+
    '    AND (PV.IDPLANOPREV = RS.IDPLANOPREV)            '+
    '    AND (CO.MOECODIGO (+ ) = MAXDATA.INDICERE)       '+
    '    AND (CO.COTDATA (+ ) = MAXDATA.DATAMAX)          '+
    '    AND (MOEDA.MOECODIGO (+ ) = TP.INDICEREAJUSTE)   '+
    '    AND (CO.COTVALOR IS NOT NULL )                   '+
    '    AND ROWNUM < 2                                   ';
  end
  else
  begin
    sSQL :=
    ' SELECT DISTINCT CO.COTVALOR       '+
    '   FROM RESERVAPART RS,            '+
    '        RESERVAXPLANO TP,          '+
    '        PLANPREV PV,               '+
    '        COTACAOMOEDA CO,  MOEDA,   '+
    '        (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX  '+
    '           FROM RESERVAPART RP1, RESERVAXPLANO TP1, COTACAOMOEDA CO1  '+
    '          WHERE RP1.IDPESSJUR = '+IntToStr(piIdPessJur) +
    '     AND RP1.IDPESSOA =  '+IntToStr(piIdPessoa)  +
    '     AND (RP1.IDPLANOPREV = 66)                  '+
    '     AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV)     '+
    '     AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA) '+
    '     AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE)    '+
    '   GROUP BY TP1.INDICEREAJUSTE) MAXDATA          '+
    '   WHERE RS.IDPESSJUR =  '+IntToStr(piIdPessJur) +
    '     AND RS.IDPESSOA  =  '+IntToStr(piIdPessoa)  +
    '     AND (RS.IDPLANOPREV = 66)                  '+
    '     AND (TP.FLGCONTROLE = 0)                   '+
    '     AND (TP.IDPLANOPREV = RS.IDPLANOPREV)      '+
    '     AND (TP.IDTIPORESERVA = RS.IDTIPORESERVA)  '+
    '     AND (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+)) '+
    '     AND (TP.ANALITICOSINTETI = ''A'')             '+
    '     AND (PV.IDPLANOPREV = RS.IDPLANOPREV)         '+
    '     AND (CO.MOECODIGO(+) = MAXDATA.INDICERE)      '+
    '     AND (CO.COTDATA(+) = MAXDATA.DATAMAX)         '+
    '     AND (MOEDA.MOECODIGO(+) = TP.INDICEREAJUSTE)  '+
    '     AND (CO.COTVALOR IS NOT NULL) AND ROWNUM < 2  ';
  end;

  try
    qryAux.close;
    qryAux.sql.text := sSQL;
    qryAux.Open;
    if not qryAux.isEmpty then
       rIndice := qryAux.Fields[0].AsFloat;

    result := rIndice;
  except
    result := 0;
  end;

end;



procedure TCtrlRequerBenef.SetListaHistRemover(const Value: string);
begin
  FListaHistRemover := Value;
end;

end.


