// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 08/03/2007
// Alteração   : Control para a validação do arquivo de informe gerado pelo IRRF (Folha de Benefício)
//------------------------------------------------------------------------------

unit uValidaInforme;

interface

uses uCmControlObject, Sysutils, uCMClientDataSet;

Type
  TValidaInforme = Class( TCmControlObject )
  Private

  Public
    Function RetornaIDPessoa(sCPF:String):Integer;
    Function ListaDepositoIRRF(psCPF:String; piAno: Integer):OleVariant;
    Function ListaDepositoIRRF13(psCPF:String; piAno: Integer):OleVariant;
    Function ListaDepositoRendimento(psMatricula:String):OleVariant;
    Function ListaDepositoRendimento13(psCPF:String; piAno: Integer):OleVariant;
    Function ListaCompleta(psCPF:String; piAno: Integer):OleVariant;
    Function ListaCompleta2(psIDsPessoa:String; piAno: Integer): OleVariant;

  End;

implementation

{ TValidaInforme }


{ TValidaInforme }

function TValidaInforme.ListaCompleta(psCPF:String; piAno: Integer): OleVariant;
var sSQL, AnoMesIni, AnoMesFim : String;
    iIDPessoaPen : Integer;
begin
  AnoMesIni := '01/01/' + IntToStr(piAno);
  AnoMesFim := '31/12/' + IntToStr(piAno);

  iIDPessoaPen := RetornaIDPessoa(psCPF);

  sSQL := ' SELECT DISTINCT DEP.ORDEM, DEP.IDBENEFIRRF, DEP.TEM, DEP.VALORTOT ' + #13 +
          ' FROM ( SELECT ''1'' AS ORDEM, L.IDBENEFIRRF, ''DEP JUD REND'' AS TEM, ' + #13 +
          '              SUM(LI.VLRLANC) AS VALORTOT ' + #13 +
          '       FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '       WHERE (L.IDLANCIRRF   = LI.IDLANCIRRF) ' + #13 +
          '         AND (LI.IDINFORME   = I.IDINFORME) ' + #13 +
          '         AND ((P.DATAINICIO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) OR ' + #13 +
          '              (P.DATAFINAL  BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) OR ' + #13 +
          '              (P.DATAFINAL  IS NULL)) ' + #13 +
          '         AND ((I.CODDIRF = ''9'') OR (I.IDINFORME IN (34))) ' + #13 +
          '         AND (L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '         AND (L.IDBENEFIRRF = P.IDPESSOA(+)) ' + #13 +
          '         AND (NVL(L.IDMODULORESPON,L.IDMODULO) IN (18, 21)) ' + #13 +
          '         AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '       GROUP BY L.IDBENEFIRRF ' + #13 +
          '	   UNION ' + #13 +
          '	   SELECT ''2'' AS ORDEM, L.IDBENEFIRRF, ''DEP JUD IRRF'' AS TEM, ' + #13 +
          '	          SUM(LI.VLRLANC) AS VALORTOT ' + #13 +
          '       FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '       WHERE (L.IDLANCIRRF = LI.IDLANCIRRF) ' + #13 +
          '         AND (LI.IDINFORME = I.IDINFORME) ' + #13 +
          '         AND (I.CODDIRF = ''14'') ' + #13 +
          '         AND (L.IDBENEFIRRF = P.IDPESSOA(+)) ' + #13 +
          '         AND (L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '         AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '       GROUP BY L.IDBENEFIRRF ' + #13 +
          '       UNION ' + #13 +
          '       SELECT ''3'' AS ORDEM, L.IDBENEFIRRF, ''DEP JUD REND 13'' AS TEM, ' + #13 +
          '	          SUM(LI.VLRLANC) AS VALORTOT ' + #13 +
          '       FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '       WHERE (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '         AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '         AND ((I.CODDIRF      = ''11'') OR (I.IDINFORME IN (14, 37))) ' + #13 +
          '         AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '         AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '       GROUP BY L.IDBENEFIRRF ' + #13 +
          '	   UNION ' + #13 +
          '       SELECT ''4'' AS ORDEM, L.IDBENEFIRRF, ''DEP JUD IRRF 13'' AS TEM, ' + #13 +
          '	          SUM(LI.VLRLANC) AS VALORTOT ' + #13 +
          '       FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '       WHERE (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '         AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '         AND (I.CODDIRF       = ''17'') ' + #13 +
          '         AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '         AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '         AND (L.CODNATUREZA   IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '       GROUP BY L.IDBENEFIRRF) DEP, ' + #13 +
          '	PESSOA PES ' + #13 +
          ' WHERE (PES.IDPESSOA = DEP.IDBENEFIRRF) ' + #13 +
          '   AND (PES.IDPESSOA = ' + IntToStr(iIDPessoaPen) + ') ' + #13 +
          ' ORDER BY ORDEM  ';

  Result := GetDataPacket(sSql);
end;

function TValidaInforme.ListaCompleta2(psIDsPessoa:String; piAno: Integer): OleVariant;
var sSQL, AnoMesIni, AnoMesFim : String;
    iIDPessoaPen : Integer;
begin
  AnoMesIni := '01/01/' + IntToStr(piAno);
  AnoMesFim := '31/12/' + IntToStr(piAno);

  sSQL := ' SELECT DISTINCT DEP.IDBENEFIRRF ' + #13 +
          ' FROM ( SELECT L.IDBENEFIRRF' + #13 +
          '        FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '        WHERE (L.IDLANCIRRF   = LI.IDLANCIRRF) ' + #13 +
          '          AND (LI.IDINFORME   = I.IDINFORME) ' + #13 +
          '          AND ((P.DATAINICIO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                 AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) OR ' + #13 +
          '               (P.DATAFINAL  BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                 AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) OR ' + #13 +
          '               (P.DATAFINAL  IS NULL)) ' + #13 +
          '          AND ((I.CODDIRF = ''9'') OR (I.IDINFORME IN (34))) ' + #13 +
          '          AND (L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '          AND (L.IDBENEFIRRF = P.IDPESSOA(+)) ' + #13 +
          '          AND (NVL(L.IDMODULORESPON,L.IDMODULO) IN (18, 21)) ' + #13 +
          '          AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '	    UNION ' + #13 +
          '	    SELECT L.IDBENEFIRRF ' + #13 +
          '         FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '         WHERE (L.IDLANCIRRF = LI.IDLANCIRRF) ' + #13 +
          '           AND (LI.IDINFORME = I.IDINFORME) ' + #13 +
          '           AND (I.CODDIRF = ''14'') ' + #13 +
          '           AND (L.IDBENEFIRRF = P.IDPESSOA(+)) ' + #13 +
          '           AND (L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '           AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '         UNION ' + #13 +
          '         SELECT L.IDBENEFIRRF ' + #13 +
          '         FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '         WHERE (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '           AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '           AND ((I.CODDIRF      = ''11'') OR (I.IDINFORME IN (14, 37))) ' + #13 +
          '           AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '           AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '         GROUP BY L.IDBENEFIRRF ' + #13 +
          '	    UNION ' + #13 +
          '         SELECT L.IDBENEFIRRF ' + #13 +
          '         FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          '         WHERE (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '           AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '           AND (I.CODDIRF       = ''17'') ' + #13 +
          '           AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '           AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                                  AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ' + #13 +
          '           AND (L.CODNATUREZA   IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ) DEP, ' + #13 +
          '	 PESSOA PES ' + #13 +
          '  WHERE (PES.IDPESSOA = DEP.IDBENEFIRRF) ' + #13 +
          '    AND (PES.IDPESSOA IN (' + psIDsPessoa + ') ) ';

  Result := GetDataPacket(sSql);
end;

function TValidaInforme.ListaDepositoIRRF(psCPF:String; piAno: Integer): OleVariant;
var sSQL, AnoMesIni, AnoMesFim : String;
    iIDPessoaPen : Integer;
begin
  AnoMesIni := '01/01/' + IntToStr(piAno);
  AnoMesFim := '31/12/' + IntToStr(piAno);

  iIDPessoaPen := RetornaIDPessoa(psCPF);

  sSQL := ' SELECT 1 ' + #13 +
          ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          ' WHERE (L.IDBENEFIRRF   = ' + IntToStr(iIDPessoaPen) + ') ' + #13 +
          '   AND (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '   AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '   AND (I.CODDIRF       = ''14'') ' + #13 +
          '   AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '   AND (L.CODNATUREZA   IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '   AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                            AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ';

  Result := GetDataPacket(sSql);
end;

function TValidaInforme.ListaDepositoIRRF13(psCPF:String; piAno: Integer): OleVariant;
var sSQL, AnoMesIni, AnoMesFim : String;
    iIDPessoaPen : Integer;
begin
  AnoMesIni := '01/01/' + IntToStr(piAno);
  AnoMesFim := '31/12/' + IntToStr(piAno);

  iIDPessoaPen := RetornaIDPessoa(psCPF);

  sSQL := ' SELECT 1 ' + #13 +
          ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          ' WHERE (L.IDBENEFIRRF   = ' + IntToStr(iIDPessoaPen) + ') ' + #13 +
          '   AND (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '   AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '   AND (I.CODDIRF       = ''17'') ' + #13 +
          '   AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '   AND (L.CODNATUREZA   IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'')) ' + #13 +
          '   AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                            AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY'')) ';

  Result := GetDataPacket(sSql);
end;

function TValidaInforme.ListaDepositoRendimento(
  psMatricula: String): OleVariant;
var sSQL:String;
begin
  sSQL := '';

  Result := GetDataPacket(sSql);
end;

function TValidaInforme.ListaDepositoRendimento13(psCPF:String; piAno: Integer): OleVariant;
var sSQL, AnoMesIni, AnoMesFim : String;
    iIDPessoaPen : Integer;
begin
  AnoMesIni := '01/01/' + IntToStr(piAno);
  AnoMesFim := '31/12/' + IntToStr(piAno);

  iIDPessoaPen := RetornaIDPessoa(psCPF);

  sSQL := ' SELECT 1 ' + #13 +
          ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' + #13 +
          ' WHERE (L.IDBENEFIRRF   = ' + IntToStr(iIDPessoaPen) + ') ' + #13 +
          '   AND (L.IDLANCIRRF    = LI.IDLANCIRRF) ' + #13 +
          '   AND (LI.IDINFORME    = I.IDINFORME) ' + #13 +
          '   AND ((I.CODDIRF      = ''11'') OR (I.IDINFORME IN (14, 37))) ' + #13 +
          '   AND (L.IDBENEFIRRF   = P.IDPESSOA(+)) ' + #13 +
          '   AND (L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(AnoMesIni) + ', ''DD/MM/YYYY'') ' + #13 +
          '                            AND TO_DATE(' + QuotedStr(AnoMesFim) + ', ''DD/MM/YYYY''))';

  Result := GetDataPacket(sSql);
end;

function TValidaInforme.RetornaIDPessoa(sCPF: String): Integer;
var cds : TCMClientDataSet;
begin
  Result := -1;
  Cds    := TCMClientDataSet.Create(nil);

  Try
    cds.Data := GetDataPacket(' SELECT P.IDPESSOA FROM PESSOA P '+
                              ' WHERE (P.NUMDOCUMENTO = '+ quotedStr(sCpf)+ ') ');

    Result := Cds.FieldByName('IDPESSOA').AsInteger;
  Finally
    Cds.free;
  End;
end;



end.