unit uCtrlUtilLancaEspecial;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uSistema,
     DbClient, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlUtilLancaEspecial = Class(TCmControlObject)

    public
      function    ListaDadosLancIRRF(const sDataIni     : String;
                                     const sDataFim     : String;
                                     const sNatureza    : String;
                                     const sRendimentos : String) : OleVariant;

      function    ListaDadosLancFUNCEF(const sDataIni     : String;
                                       const sDataFim     : String;
                                       const sNatureza    : String;
                                       const sRendimentos : String) : OleVariant;


      function    ListaDadosInforme(const iIDLancIrrf : Integer; sRendimentos : String) : OleVariant;

      function    TipoEmpresa : OleVariant;

      function    ListaDadosLancINSS(const sDataIni     : String;
                                     const sDataFim     : String;
                                     const sNatureza    : String;
                                     const sRendimentos : String) : OleVariant;

      function    LancNext (const sSQL : String): OleVariant;
    End;



implementation

{ TCtrlUtilLancaEspecial }



function TCtrlUtilLancaEspecial.TipoEmpresa: OleVariant;
begin
   Result := GetDataPacket('SELECT NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');
end;



function TCtrlUtilLancaEspecial.ListaDadosInforme(const iIDLancIrrf: Integer; sRendimentos : String): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT LI.* FROM LANCXINFORME LI, INFORME I'     + #13 +
   'WHERE LI.IDLANCIRRF = ' + IntToStr(iIDLancIrrf)  + #13 +
   'AND   I.IDINFORME   = LI.IDINFORME '             + #13 +
   'AND   I.CODDIRF IN ('+ sRendimentos + ') '       + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlUtilLancaEspecial.ListaDadosLancIRRF(const sDataIni, sDataFim, sNatureza, sRendimentos: String): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                          + #13 +
   '    L.IDLANCIRRF '                                                + #13 +
   'FROM '                                                            + #13 +
   '    LANCIRRF L, LANCXINFORME LI, INFORME I '                      + #13 +
   'WHERE '                                                           + #13 +
   '    L.IDMODULO <> 21 '                                            + #13 +
   'AND L.DATALANCAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFim) + ',''DD/MM/YYYY'') ' + #13 +
   'AND L.CODNATUREZA IN (' + sNatureza + ') '                        + #13 +
   'AND LI.IDLANCIRRF = L.IDLANCIRRF '                                + #13 +
   'AND LI.IDINFORME = I.IDINFORME '                                  + #13 +
   'AND I.CODDIRF IN ('+ sRendimentos + ') '                          + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlUtilLancaEspecial.ListaDadosLancFUNCEF(const sDataIni, sDataFim, sNatureza, sRendimentos: String): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                          + #13 +
   '    L.IDLANCIRRF, L.IDBENEFIRRF, LI.FONTEPAGADORA '               + #13 +
   'FROM '                                                            + #13 +
   '    LANCIRRF L, LANCXINFORME LI, INFORME I '                      + #13 +
   'WHERE '                                                           + #13 +
   '    L.IDMODULO <> 21 '                                            + #13 +
   'AND L.DATALANCAMENTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(sDataFim) + ',''DD/MM/YYYY'') ' + #13 +
   'AND L.CODNATUREZA IN (' + sNatureza + ') '                        + #13 +
   'AND LI.IDLANCIRRF = L.IDLANCIRRF '                                + #13 +
   'AND LI.IDINFORME = I.IDINFORME '                                  + #13 +
   'AND I.CODDIRF IN ('+ sRendimentos + ') '                          + #13 +
   'ORDER BY '                                                        + #13 +
   '    L.IDBENEFIRRF, LI.FONTEPAGADORA, L.IDLANCIRRF '               + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlUtilLancaEspecial.ListaDadosLancINSS(const sDataIni, sDataFim, sNatureza, sRendimentos: String): OleVariant;
var
   sSQL : String;
begin
   sSQL :=  'SELECT L.CODDOCUMENTO, D.IDFORCLI, L.CODALTERADOR, LB.DATALANCTO, ' +
            '       LBBASE.VALOR AS VALBASE , D.IDPESSOA, SUM(L.VALOR) AS VALOR ' +
            'FROM LANCTODOCUM L, ALTXIMPOSTO A, DOCUMENTO D,  '+
            '   (SELECT LB.CODDOCUMENTO, LB.DATALANCTO , LB.VALOR '+
            '    FROM LANCTODOCUM LB '+
            '    WHERE (LB.OPERACAO = 5) AND '+
            '          (LB.DATALANCTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND '+
            '                                 TO_DATE('+ QuotedStr(sDataFim) + ',''DD/MM/YYYY'') ) ) LB, '+
            '   (SELECT LBBASE.CODDOCUMENTO, LBBASE.VALOR '+
            '    FROM LANCTODOCUM LBBASE '+
            '    WHERE (LBBASE.OPERACAO = 2) ) LBBASE '+
            'WHERE (L.CODALTERADOR = A.CODALTERADOR) AND '+
            '      (A.CODIMPOSTO = 2) AND '+
            '      (L.CODDOCUMENTO = LB.CODDOCUMENTO) AND '+
            '      (L.CODDOCUMENTO = LBBASE.CODDOCUMENTO) AND '+
            '      (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
            '      (L.CODDOCUMENTO NOT IN (SELECT L1.CODDOCUMENTO '+
            '                              FROM LANCTODOCUM L1, ALTXIMPOSTO A1, '+
            '                                   (SELECT LB1.CODDOCUMENTO, LB1.DATALANCTO '+
            '                                    FROM LANCTODOCUM LB1 '+
            '                                    WHERE (LB1.OPERACAO = 5) AND '+
            '                                          (LB1.DATALANCTO BETWEEN TO_DATE('+ QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND '+
            '                                                                  TO_DATE('+ QuotedStr(sDataFim) + ',''DD/MM/YYYY'') ) ) LB1 '+
            '                              WHERE (L1.CODALTERADOR = A1.CODALTERADOR) AND '+
            '                                    (A1.CODIMPOSTO = 1) AND '+
            '                                     L1.CODDOCUMENTO = LB1.CODDOCUMENTO)) '+
            'GROUP BY L.CODDOCUMENTO, D.IDFORCLI, L.CODALTERADOR, LB.DATALANCTO, ' +
            '       LBBASE.VALOR, D.IDPESSOA ' +            
            'ORDER BY L.CODDOCUMENTO ';
   Result := GetDataPacket(sSQL);
end;



function TCtrlUtilLancaEspecial.LancNext(const sSQL: String): OleVariant;
begin
   Result := GetDataPacket(sSQL);
end;



end.
