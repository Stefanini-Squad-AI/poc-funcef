unit uCtrlInformeRendimentos;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, DB, uCtrlFuncoesAA, JCLSysUtils;

Type

  TCtrlInformeRendimentos = class(TCmControlObject)
  private
    function BuscaEmpresaProp(iIdPessoaProp : Integer): Olevariant;
    function BuscaCodInforme : Olevariant;
  protected
  public
    function BuscaDadosInforme(iIdPessoa, iIdEmpresaProp, iAno, FlgFolhaPag, FlgFohaBen, FlgReserva  : Integer): Olevariant;
    function BuscaDadosCompl(iIdPessoa, Ano : Integer): String;

    function BuscaDadosInformeFormatado(iIdPessoa, iIdEmpresaProp, iAno, FlgFolhaPag, FlgFohaBen, FlgReserva  : Integer): Olevariant;

    function BuscaAnos( iIdPessoa, iIdEmpresaProp, FlgFolhaPag, FlgFohaBen, FlgReserva  : Integer): Olevariant;

  published

end;

implementation

{ TCtrlInformeRendimentos }

function TCtrlInformeRendimentos.BuscaEmpresaProp(iIdPessoaProp : Integer): Olevariant;
Begin
  result := GetDataPacket ( ' SELECT   P.RAZAOSOCIAL,                                                                     '+
                            ' P.NUMDOCUMENTO,                                                                             '+
                            ' EN.LOGRADOURO AS ENDEREO,                                                                   '+
                            ' EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME AS CIDADE,  EN.CEP,                         '+
                            ' ES.CODESTADO AS UF, REPLACE(REPLACE(REPLACE(T.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, T.DDD   '+
                            ' FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES,                                           '+
                            ' (SELECT DISTINCT IDENDERECO, TIPO, NUMERO, DDD FROM TELENDPESS) T                           '+
                            ' WHERE  (P.IDPESSOA =  '+ intToStr(iIdPessoaProp) + ') AND                                   '+
                            '        (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND                                            '+
                            '        (EN.IDCIDADES     = C.IDCIDADES(+)) AND                                              '+
                            '        (ES.IDESTADO(+)    = C.IDESTADO) AND                                                 '+
                            '        (EN.IDPESSOA(+)   = P.IDPESSOA) AND                                                  '+
                            '        (EN.IDENDERECO = T.IDENDERECO(+))                                                    ');
end;


function TCtrlInformeRendimentos.BuscaCodInforme : Olevariant;
begin
  result := GetDataPacket(' SELECT DISTINCT CODINFORME FROM INFORME ORDER BY CODINFORME ');
end;


function TCtrlInformeRendimentos.BuscaDadosInforme(iIdPessoa, iIdEmpresaProp, iAno, FlgFolhaPag, FlgFohaBen, FlgReserva  : Integer): Olevariant;
var sSqlDados, sDataIni, sDataFin, sAno : String;
    iIdEmpresaPropLocal : Integer;
    CdsLocalEmpProp, CdsLocalInforme, cdsLocalCodInforme : TcmClientDataSet;
    sDadosComp : string;
Begin

  iIdEmpresaPropLocal := iIdEmpresaProp;
  sDataIni            := '';
  sDataFin            := '';
  sSqlDados           := '';
  sDadosComp          := ' ';

  CdsLocalEmpProp    := TcmClientDataSet.Create(nil);
  CdsLocalCodInforme := TcmClientDataSet.Create(nil);
  sDadosComp         := BuscaDadosCompl(iIdPessoa, iAno);

  try
     //Se iAno = 0, então listar todos os anos (DAVID)
     if iAno < 0 then
     begin
       sDataIni := '01/01/1900';
       sDataFin := '31/12/' + FormatDateTime( 'yyyy', Now );
     end
     else
     begin
       sAno := IntToStr(iAno);
       sDataIni := trim('01/01/'+ sAno );
       sDataFin := trim('31/12/'+ sAno );
     end;

     CdsLocalEmpProp.Data    := BuscaEmpresaProp(iIdEmpresaPropLocal);

     CdsLocalCodInforme.Data := BuscaCodInforme;

     sSqlDados := sSqlDados + ' SELECT  ' + QuotedStr( IntToStr( iAno ) ) + ' AS ANO, TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, '+#13#10+
                              '         ANOATUAL, '+#13#10+
                              '         NVL(' +QuotedStr(sDadosComp)+ ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, '+#13#10+
                              '         P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, '+#13#10+
                              '         NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, '+#13#10+
                              '         EN.LOGRADOURO||'', ''||EN.NUMERO||'', ''||EN.COMPLEMENTO AS ENDEREO, '+#13#10+
                              '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, '+#13#10+
                              '         ES.CODESTADO AS UF, '+#13#10;

     CdsLocalCodInforme.First;
     While not CdsLocalCodInforme.Eof do
     Begin
       sSqlDados := sSqlDados + ' DECODE(SIGN(SUM(DECODE(XB.CODINFORME,'+CdsLocalCodInforme.fieldByname('CODINFORME').AsString+', VLR, 0 ))),-1,0,SUM(DECODE(XB.CODINFORME,'+CdsLocalCodInforme.fieldByname('CODINFORME').AsString+', VLR, 0 ))) AS VLR'+trim(CdsLocalCodInforme.fieldByname('CODINFORME').AsString)+','+#13#10;
       CdsLocalCodInforme.Next;
     end;

     sSqlDados := sSqlDados + '         (''-'') AS TELEFONE, (''C'') AS  TIPO  '+#13#10+
                              ' FROM  PESSOA P,PESSOA E, ENDPESS EN, CIDADES C, ESTADO ES, '+#13#10+
                              '      NATURENDIMENTO NAT , '+#13#10+
                              '      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME, ANOATUAL, '+#13#10+
                              '               SUM(U.VLR) AS VLR '+#13#10+
                              '        FROM '+#13#10+
                              '       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME, TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ) AS ANOATUAL, '+#13#10+
                              '                SUM(DECODE(I.CODDIRF,''6'',(LI.VLRLANC*-1),DECODE(I.CODDIRF,''7'',(LI.VLRLANC*-1),LI.VLRLANC))) AS VLR '+#13#10+
                              '        FROM INFORME I, LANCXINFORME LI, LANCIRRF L '+#13#10+
                              '        WHERE (I.IDINFORME = LI.IDINFORME) AND '+#13#10+
                              '              (LI.IDLANCIRRF = L.IDLANCIRRF) AND '+#13#10+
                              '              (L.CODNATUREZA <> ''8888'') AND '+#13#10;


     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados := sSqlDados + '  L.IDMODULO IN ( '
     end;

     if FlgFohaBen = 1 then
       sSqlDados := sSqlDados +  '18,';
     if FlgFolhaPag = 1 then
        sSqlDados := sSqlDados + '21,';
     if FlgReserva = 1 then
        sSqlDados := sSqlDados + '10,';

     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       // RETIRAR A ÚLTIMA VÍRGULA
       sSqlDados[length(sSqlDados)] := ' ';
       sSqlDados := sSqlDados + ') AND';
     end;
     if iIdPessoa <> -1999  then
     begin
        sSqlDados := sSqlDados + ' (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND '+#13#10;

     end;

     sSqlDados := sSqlDados + '              (L.DATALANCAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFin) +',''DD/MM/YYYY'')) AND '+#13#10+
                              '              (SUBSTR(L.NUMDOCUMENTO,1,8) = '+ QuotedStr(Copy(CdsLocalEmpProp.fieldByname('NUMDOCUMENTO').AsString,1,8))+') '+#13#10+
                              '        GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME, TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ) ) '+#13#10+
                              '   UNION ALL '+
                              '      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.CODINFORME, ANOATUAL, '+#13#10+
                              '               nvl(SUM(UL.VLR), 0) AS VLR '+#13#10+
                              '       FROM '+#13#10+
                              '          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ) AS ANOATUAL, '+#13#10+
                              '                  nvl(SUM(L.VLRBASE), 0) AS VLR '+#13#10+
                              '              FROM INFORME I, LANCIRRF L '+#13#10+
                              '              WHERE (I.FLGBASE = ''S'') AND '+#13#10+
                              '                    (L.CODNATUREZA <> ''8888'') AND '+#13#10+
                              '                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND '+#13#10;

     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados := sSqlDados + '  L.IDMODULO IN ( '
     end;

     if FlgFohaBen = 1 then
       sSqlDados := sSqlDados +  '18,';
     if FlgFolhaPag = 1 then
        sSqlDados := sSqlDados + '21,';
     if FlgReserva = 1 then
        sSqlDados := sSqlDados + '10,';


     // RETIRAR A ÚLTIMA VÍRGULA
     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados[length(sSqlDados)] := ' ';
       sSqlDados := sSqlDados + ') AND';
     end;


     if iIdPessoa <> -1999  then
     begin
        sSqlDados := sSqlDados + '                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND '+#13#10;
     end;

     sSqlDados := sSqlDados + '    (L.DATALANCAMENTO BETWEEN TO_DATE('+QuotedStr(sDataIni)+' ,''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) +',''DD/MM/YYYY'')) AND '+#13#10+
                              '    (SUBSTR(L.NUMDOCUMENTO,1,8) = '+ QuotedStr(Copy(CdsLocalEmpProp.fieldByname('NUMDOCUMENTO').AsString,1,8))+ ') '+#13#10+
                              ' GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ) ) '+#13#10+
                              ' UNION ALL '+#13#10+
                              ' (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ) AS ANOATUAL, '+#13#10+
                              '    nvl(SUM(L.VLRIRRF), 0) AS VLR '+#13#10+
                              '  FROM INFORME I, LANCIRRF L '+#13#10+
                              '  WHERE (I.FLGIRRF = ''S'') AND '+#13#10+
                              '        (L.CODNATUREZA <> ''8888'') AND '+#13#10+
                              '        (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND '+#13#10;


     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados := sSqlDados + '  L.IDMODULO IN ( '
     end;

     if FlgFohaBen = 1 then
       sSqlDados := sSqlDados +  '18,';
     if FlgFolhaPag = 1 then
        sSqlDados := sSqlDados + '21,';
     if FlgReserva = 1 then
        sSqlDados := sSqlDados + '10,';


     // RETIRAR A ÚLTIMA VÍRGULA
     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados[length(sSqlDados)] := ' ';
       sSqlDados := sSqlDados + ') AND';
     end;


     if iIdPessoa <> -1999  then
     begin
        sSqlDados := sSqlDados + ' (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND '+#13#10;
     end;

     sSqlDados := sSqlDados + '  (L.DATALANCAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFin) +',''DD/MM/YYYY'')) AND '+#13#10+
                              '  (SUBSTR(L.NUMDOCUMENTO,1,8) = '+ QuotedStr(Copy(CdsLocalEmpProp.fieldByname('NUMDOCUMENTO').AsString,1,8))+ ' ) '+#13#10+
                              '   GROUP BY TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ), L.IDBENEFIRRF, L.CODNATUREZA) '+#13#10+
                              '   UNION ALL '+#13#10+
                              '   (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ) AS ANOATUAL, '+#13#10+
                              '    nvl(SUM(L.VLRINSS), 0) AS VLR  '+#13#10+
                              '    FROM INFORME I, LANCIRRF L '+#13#10+
                              '    WHERE (I.CODDIRF = 4) AND '+#13#10+
                              '          (L.CODNATUREZA <> ''8888'') AND '+#13#10;


     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados := sSqlDados + '  L.IDMODULO IN ( '
     end;

     if FlgFohaBen = 1 then
       sSqlDados := sSqlDados +  '18,';
     if FlgFolhaPag = 1 then
        sSqlDados := sSqlDados + '21,';
     if FlgReserva = 1 then
        sSqlDados := sSqlDados + '10,';


     // RETIRAR A ÚLTIMA VÍRGULA
     if (FlgFohaBen = 1) or (FlgFolhaPag = 1) or (FlgReserva = 1) then
     begin
       sSqlDados[length(sSqlDados)] := ' ';
       sSqlDados := sSqlDados + ') AND';
     end;


     if iIdPessoa <> -1999  then
     begin
        sSqlDados := sSqlDados + '                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND '+#13#10;
     end;

     sSqlDados := sSqlDados + ' (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND '+#13#10+
                              '             (L.DATALANCAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFin) +',''DD/MM/YYYY'')) AND '+#13#10+
                              '             (SUBSTR(L.NUMDOCUMENTO,1,8) = '+ QuotedStr(Copy(CdsLocalEmpProp.fieldByname('NUMDOCUMENTO').AsString,1,8)) +') '+#13#10+
                              '              GROUP BY TO_CHAR( L.DATALANCAMENTO, ''YYYY'' ), L.IDBENEFIRRF, L.CODNATUREZA)) UL '+#13#10+
                              '  GROUP BY ANOATUAL, UL.IDBENEFIRRF, UL.CODNATUREZA, '+#13#10+
                              '                 UL.CODINFORME)) U '+#13#10+
                              ' GROUP BY ANOATUAL, U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME) XB '+#13#10+
                              ' WHERE  (P.TIPO = ''F'') AND '+#13#10;

     if iIdPessoa <> -1999  then
     begin
        sSqlDados := sSqlDados + '    (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND '+#13#10;
     end;

     sSqlDados := sSqlDados + '       (P.IDPESSOA = XB.IDBENEFIRRF) AND '+#13#10+
                              '       (E.IDPESSOA   = '+IntToStr(iIdEmpresaPropLocal)+') AND '+#13#10+
                              '       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND '+#13#10+
                              '       (EN.IDENDERECO(+) = E.IDENDCOMERCIAL) AND '+#13#10+
                              '       (EN.IDCIDADES     = C.IDCIDADES(+)) AND '+#13#10+
                              '       (ES.IDESTADO(+)    = C.IDESTADO) AND '+#13#10+
                              '       (EN.IDPESSOA(+)   = E.IDPESSOA) '+#13#10+
                              ' GROUP BY ANOATUAL, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, '+#13#10+
                              '         E.NUMDOCUMENTO,  E.RAZAOSOCIAL, '+#13#10+
                              '         NAT.CODNATUREZA,  NAT.DESCRICAO, '+#13#10+
                              '         EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, '+#13#10+
                              '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, '+#13#10+
                              '         ES.CODESTADO '+#13#10+
                              ' ORDER BY  P.RAZAOSOCIAL, NAT.CODNATUREZA ';


    Result := GetDataPacket( sSqlDados );
  finally
    CdsLocalEmpProp.Free;
    CdsLocalCodInforme.Free;
  end;
end;


function TCtrlInformeRendimentos.BuscaDadosCompl(iIdPessoa,  Ano: Integer): String;
var
  sSql : string;
  CdsLocal : TcmClientDataSet;
begin
  result := '  ';
  CdsLocal := TcmClientDataSet.Create(nil);
  try
    sSql :=
    ' SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR '+#13#10+
    ' FROM HISTRUBSAL H, PESSOA P, RUBRICAINDIV R, PROVDESC PR                     '+#13#10+
    ' WHERE  H.MES BETWEEN '+ quotedStr(intToStr(Ano) + '/01') + ' AND ' + QuotedStr(intToStr(Ano) + '/12') +#13#10+
    ' AND    R.IDPESSOA    = '+ IntToStr(iIdPessoa)                                 +#13#10+
    ' AND    H.IDRUBRICA = R.IDRUBRICA                                             '+#13#10+
    ' AND    H.IDRUBRICA = PR.IDPROVENTO                                           '+#13#10+
    ' AND    PR.CODRUBCLT = '+ quotedStr('50018')                                   +#13#10+
    ' AND    R.IDFAVORECIDO = P.IDPESSOA                                           '+#13#10+
    ' AND    H.IDPESSOA = R.IDPESSOA                                               '+#13#10+
    ' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME                              '+#13#10+
    ' UNION                                                                        '+#13#10+
    ' SELECT DISTINCT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR '+#13#10+
    '  FROM PESSOA P, RUBRICAINDIV R, LANCIRRF L, PROVDESC PR, HISTRUBSAL H                 '+#13#10+
    ' WHERE L.IDBENEFIRRF = R.IDPESSOA                                                      '+#13#10+
    '   AND P.IDPESSOA    = R.IDFAVORECIDO                                                  '+#13#10+
    '   AND R.IDPESSOA    = '+ IntToStr(iIdPessoa)                                           +#13#10+
    '   AND R.IDRUBRICA   = H.IDRUBRICA                                                     '+#13#10+
    '   AND R.FLGPENSAOALIM   = 1                                                           '+#13#10+
    '   AND R.FLGTPRUBMANUT   = 1                                                           '+#13#10+
    '   AND H.MES BETWEEN '+ quotedStr(intToStr(Ano) + '/01') + ' AND ' + QuotedStr(intToStr(Ano) + '/12') +#13#10+
    '   AND H.IDRUBRICA = PR.IDPROVENTO                                                     '+#13#10+
    ' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME                                       '+#13#10+
    ' ORDER BY NOME                                                                         ' ;

    CdsLocal.Data := GetDataPacket ( sSql )

  finally
    CdsLocal.First;
    while not CdsLocal.EOF do
    begin
      Result := Result + CdsLocal.fieldByname('NUMDOCUMENTO').AsString + ' - ' + CdsLocal.fieldByname('NOME').AsString + ' - '+ FormatFloat('#,##0.00;(#,##0.00)',CdsLocal.fieldByname('VALOR').AsFloat)+#13#10;
      CdsLocal.Next;
    end;
    CdsLocal.Free;
  end;

end;

function TCtrlInformeRendimentos.BuscaAnos( iIdPessoa, iIdEmpresaProp,
 FlgFolhaPag, FlgFohaBen, FlgReserva  : Integer): Olevariant;
var
  cdsLocal :TCmClientDataSet;
  sSQL : string;
  sAnoAtual, sAnosAnt : string;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := BuscaDadosInforme( iIdPessoa, iIdEmpresaProp, -1, FlgFolhaPag,
                                        FlgFohaBen, FlgReserva );

    sSQL := '';
    sAnosAnt := '';
    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      sAnoAtual := cdsLocal.FieldByName('ANOATUAL').AsString;

      if Pos( sAnoAtual, sAnosAnt ) <= 0 then
      begin
        if sSQL <> '' then sSQL := sSQL + ' union ';
        sSQL := sSQL + ' select ' + cdsLocal.FieldByName('ANOATUAL').AsString +
         ' as ANO from DUAL ';
      end;

      sAnosAnt := sAnosAnt + ';' + sAnoAtual;
      cdsLocal.Next;
    end;

    //Previne se não há nenhum ano disponível
    if sSQL = '' then sSQL := ' select * from dual where 1 = 2 ';

    Result := GetDataPacket( sSQL );

  finally
    cdsLocal.Free;
  end;
  
end;

function TCtrlInformeRendimentos.BuscaDadosInformeFormatado(iIdPessoa,
  iIdEmpresaProp, iAno, FlgFolhaPag, FlgFohaBen,
  FlgReserva: Integer): Olevariant;
var
  cdsLocal,
  CdsAux  : TCmClientDataSet;
  i : integer;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  cdsAux := TCmClientDataSet.Create( nil );
  try

    cdsLocal.Data := BuscaDadosInforme( iIdPessoa, iIdEmpresaProp, iAno, FlgFolhaPag,
                                        FlgFohaBen, FlgReserva );

    if cdsLocal.IsEmpty then
      raise Exception.Create('Não foi possível recuperar dados do informe.');

    for i := 0 to CdsLocal.FieldCount - 1 do
    begin
      if Copy( CdsLocal.Fields[i].FieldName, 1, 3 ) <> 'VLR' then
        CdsAux.FieldDefs.Add( CdsLocal.Fields[i].FieldName, CdsLocal.Fields[i].DataType,
                              CdsLocal.Fields[i].Size, CdsLocal.Fields[i].Required)
      else
        CdsAux.FieldDefs.Add( CdsLocal.Fields[i].FieldName, ftString,
                              15, CdsLocal.Fields[i].Required);
    end;

    CdsLocal.First;
    CdsAux.CreateDataSet;
    while not CdsLocal.Eof do
    begin
      CdsAux.Insert;

      for i := 0 to CdsLocal.FieldCount - 1 do
        if Copy( CdsAux.Fields[i].FieldName, 1, 3 ) <> 'VLR' then
          CdsAux.Fields[i].Value := CdsLocal.Fields[i].Value
        else
          CdsAux.Fields[i].Value := FormatFloat( '#,##0.00', CdsLocal.Fields[i].AsFloat );

      CdsAux.Post;

      CdsLocal.Next;
    end;

    CdsLocal.Close;

    Result := CdsAux.Data;

  finally
    cdsLocal.Free;
    cdsAux.Free;
  end;
end;

end.
