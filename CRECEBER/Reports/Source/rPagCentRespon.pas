Unit rPagCentRespon;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, uCmRptManager, TXComp, CmParamReport, uCtrlParamIntegra,
  DBClient, uCMClientDataSet, uCmSqlParams, TXRB;

Type
  TRptPagCentRespon = Class(TFrmCmReport)
    DsPagCentRespon: TwwDataSource;
    PpPagCentRespon: TppBDEPipeline;
    RptPagCentRespon: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel33: TppLabel;
    ppLabel114: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel124: TppLabel;
    ppLabel127: TppLabel;
    ppLabel121: TppLabel;
    RptPagCentResponLabel3: TppLabel;
    ppDetailBand27: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText46: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    RptPagCentResponDBText2: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppLine51: TppLine;
    ppLabel116: TppLabel;
    ppCalc46: TppSystemVariable;
    ppCalc47: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppLabel117: TppLabel;
    ppDBCalc12: TppDBCalc;
    RptPagCentResponLine3: TppLine;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    RptPagCentResponLabel1: TppLabel;
    RptPagCentResponDBText1: TppDBText;
    ppLine50: TppLine;
    RptPagCentResponLine1: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel128: TppLabel;
    ppDBCalc14: TppDBCalc;
    RptPagCentResponGroup1: TppGroup;
    RptPagCentResponGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel118: TppLabel;
    ppDBText51: TppDBText;
    RptPagCentResponLine2: TppLine;
    RptPagCentResponGroupFooterBand1: TppGroupFooterBand;
    RptPagCentResponLabel2: TppLabel;
    RptPagCentResponDBCalc1: TppDBCalc;
    ppLine52: TppLine;
    SqlPagCentRespon: TCMSqlParams;
    CdsPagCentRespon: TCMClientDataSet;
    CdsPrevObra: TCMClientDataSet;
    SqlPrevObra: TCMSqlParams;
    CdsPrevObra2: TCMClientDataSet;
    SqlPrevObra2: TCMSqlParams;
    Procedure FormCreate(Sender: TObject);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptPagCentRespon: TRptPagCentRespon;

Implementation

Uses uSistema, uModulo;

{$R *.DFM}

Procedure TRptPagCentRespon.FormCreate(Sender: TObject);
Begin
  Inherited;
  CmpRptCM.Caption := 'Valores ' + FuncaoGeral.Decode(ParamIntegra.recpag, 'R', 'Recebidos', 'Pagos') + ' Por Centro de Responsabilidade';
End;

Procedure TRptPagCentRespon.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql: String;
Begin
  Inherited;
  sSql :=
    'SELECT ' +
    '   C.NOME, D.DATAPROGRAMADA, ' +
    '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL,C.CODCENTRORESPON, ' +
    '   SUM(((SALDO.SVALOR * R.VALOR) / L.VALOR)) AS SALDORATEIO ' +
    'FROM ' +
    '   DOCUMENTO D, ' +
    '   PESSOA P, ' +
    '   LANCTODOCUM L, ' +
    '   CENTRESPON C, ' +
    '   RATEIODOCUM R, ' +
    '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAMOEDA) AS SVALOROUTRAMOEDA FROM ' +
    '     (SELECT DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1) AS VREAL, ' +
    '        DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1) AS VOUTRAMOEDA, ' +
    '        L.CODDOCUMENTO ' +
    '        FROM LANCTODOCUM L ,DOCUMENTO D ' +
    '        WHERE L.CODDOCUMENTO = D.CODDOCUMENTO ' +
    '  AND  (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    ' D.RECPAG = ''P'' AND D.IDPESSOA = :PIDPESSOA)  S ' +
    '        GROUP BY S.CODDOCUMENTO) SALDO ' +
    'WHERE ' +
    '   (RTRIM(C.CODCENTRORESPON) = :OBRA) AND ' +
    '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    '   (D.IDPESSOA = :PIDPESSOA) AND ';

  If Modulo.EmiteLancaBaixa Then
    sSql := sSql +
      ' ((((D.STATUS <> ''2'') or (D.STATUS is null)) AND ' +
      ' (rtrim(L.operacao) in (''1'',''2'',''3'',''14''))) OR  ' +
      ' (((D.STATUS) = ''2'') AND (D.OPERACAO = ''10'') AND ' +
      ' (D.FLGEMITELANCBAIX IS NULL))) AND '
  Else
    sSql := sSql +
      '   (RTRIM(L.OPERACAO) IN (''1'',''2'',''3'',''14'')) AND ' +
      '   ((D.STATUS <> ''2'') or (D.STATUS is null)) AND ';
  sSql := sSql +
    ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
    ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 + ParamIntegra.recpag + #39 + ' and ' +
    ' b.idusuario=:idusuario)  ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
    ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
    ' b.idusuario=:idusuario ))   ) and     ';

  sSql := sSql +
    '   (D.RECPAG = ''P'')  AND ' +
    '   (D.IDFORCLI = P.IDPESSOA) AND ' +
    '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
    '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
    '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND ' +
    '   (R.IDPESSOA = C.IDPESSOA(+)) AND (l.valor<>0) AND ' +
    '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO) ' +
    'GROUP BY ' +
    '    C.NOME, D.DATAPROGRAMADA, ' +
    '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, C.CODCENTRORESPON ' +
    'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0 ';
  ;
  SqlPrevObra.Sql.Text := sSql;

  sSql :=
    'SELECT ' +
    '   C.NOME, D.DATAPROGRAMADA, ' +
    '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, C.CODCENTRORESPON, ' +
    '   SUM((SALDO.SVALOR * R.VALOR/ L.VALOR)) AS SALDORATEIO ' +
    'FROM ' +
    '   DOCUMENTO D, ' +
    '   PESSOA P, ' +
    '   LANCTODOCUM L, ' +
    '   CENTRESPON C, ' +
    '   RATEIODOCUM R, ' +
    '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAMOEDA) AS SVALOROUTRAMOEDA FROM ' +
    '      (SELECT DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1) AS VREAL, ' +
    '        DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1) AS VOUTRAMOEDA, ' +
    '        L.CODDOCUMENTO ' +
    '        FROM LANCTODOCUM L ,DOCUMENTO D ' +
    '        WHERE (L.CODDOCUMENTO = D.CODDOCUMENTO) AND (D.RECPAG = ''P'') ' +
    ' AND (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    '  (D.IDPESSOA = :PIDPESSOA))  S ' +
    '        GROUP BY S.CODDOCUMENTO) SALDO ' +
    'WHERE ' +
    '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,''dd/mm/yyyy'') AND to_date(:PDATAFIM,''dd/mm/yyyy'')) AND ' +
    '   (D.IDPESSOA = :PIDPESSOA) AND ' +
    ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
    ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 + ParamIntegra.recpag + #39 + ' and ' +
    ' b.idusuario=:idusuario)  ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
    ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
    ' b.idusuario=:idusuario ))     ) and     ';

  If Modulo.EmiteLancaBaixa Then
    sSql := sSql +
      ' ((((D.STATUS <> ''2'') or (D.STATUS is null) ) AND ' +
      ' (rtrim(L.operacao) in (''1'',''2'',''3'',''14''))) OR  ' +
      ' (((D.STATUS = ''2'') or (d.status is null)) AND (D.OPERACAO = ''10'') AND ' +
      ' (D.FLGEMITELANCBAIX IS NULL))) AND '
  Else
    sSql := sSql +
      '   (RTRIM(L.OPERACAO) IN (''1'',''2'',''3'',''14'')) AND ' +
      '   ((D.STATUS <> ''2'') or (D.STATUS is null)) AND ';

  sSql := sSql +
    '   (D.RECPAG = ''P'') AND ' +
    '   (D.IDFORCLI = P.IDPESSOA) AND ' +
    '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
    '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
    '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND ' +
    '   (R.IDPESSOA = C.IDPESSOA(+)) AND ' +
    '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO) and (L.VALOR <> 0)' +
    'GROUP BY     C.NOME, D.DATAPROGRAMADA, ' +
    '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL, C.CODCENTRORESPON ' +
    'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0 ';

  SqlPrevObra2.Sql.Text := sSql;

  With SqlPagCentRespon Do
    Begin
      Sql.Text :=
        'SELECT ' +
        'C.NOME AS CENTRESPON, ' +
        'L.DATALANCTO, ' +
        'RP.NUMCHQBORDERO, ' +
        'PF.DESCRICAO AS PORTFORMA, ' +
        '(RTRIM(TO_CHAR(D.NODOCUMENTO)) || '' '' || D.COMPLDOCUMENTO) AS DOCCOMPL, ' +
        'P.RAZAOSOCIAL, P.IDPESSOA, ' +
        'C.CODCENTRORESPON, ' +
        'DOCINI.HISTORICOCOMPL, ' +
        'SUM(((L.VALOR * R.VALOR) /DOCINI.VALOR)) AS VALORRATEIO ' +
        'FROM ' +
        'PESSOA P, ' +
        '(SELECT D.CODDOCUMENTO,L.VALOR, L.HISTORICOCOMPL FROM DOCUMENTO D, LANCTODOCUM L WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ' +
        'AND D.OPERACAO = L.OPERACAO AND RTRIM(L.OPERACAO) IN (''1'',''2'',''3'',''10'',''15'')) DOCINI, ' +
        'DOCUMENTO D, ' +
        'LANCTODOCUM L, ' +
        'RATEIODOCUM R, ' +
        'RECBTOPAGTO RP, ' +
        'PORTADORFORMA PF, ' +
        'CENTRESPON C ' +
        'WHERE ' +
        '(D.IDPESSOA = :PIDEMPRESA) AND ' +
        '(RTRIM(L.OPERACAO) IN (''5'',''15'',''10'')) AND ' +
        '(L.DATALANCTO BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'') AND TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ' +
        '(D.RECPAG = :PRECPAG)  AND ';

      If Not CmpRptCM.ParamValues[2].IsNull Then
        Sql.Text := Sql.Text + '(RTRIM(C.CODCENTRORESPON) = ' + CmpRptCM.ParamValues[2].AsString + ') AND ';


      If Not CmpRptCM.ParamValues[3].IsNull Then
        Sql.Text := Sql.Text + '(D.IDFORCLI = ' + CmpRptCM.ParamValues[3].AsString + ') AND ';

      Sql.Text := Sql.Text +
        ' (DOCINI.VALOR <> 0) AND ' +
        ' (RP.CODPORTFORMA = PF.CODPORTFORMA(+)) AND ' +
        ' (DOCINI.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
        ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
        ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 + ParamIntegra.recpag + #39 + ' and ' +
        ' b.idusuario=:idusuario)  ' +
        ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
        ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
        ' b.idusuario=:idusuario )) ) and     ' +
        ' (D.IDFORCLI = P.IDPESSOA) AND ' +
        ' (L.ESTORNO IS NULL) AND ' +
        ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
        ' (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
        ' (R.CODCENTRORESPON = C.CODCENTRORESPON(+))  AND ' +
        ' (R.IDPESSOA = C.IDPESSOA(+)) AND ' +
        ' (D.CODDOCUMENTO = RP.CODDOCUMENTO) AND ' +
        ' (RP.NUMLANCTO = L.NUMLANCTO) ' +
        'GROUP BY ' +
        'L.DATALANCTO,C.NOME, D.CODCENTROCUSTO, RP.NUMCHQBORDERO,PF.DESCRICAO, DOCINI.HISTORICOCOMPL, ' +
        'D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOMPL,C.CODCENTRORESPON, P.IDPESSOA ';

      Sql.Text := Sql.Text + '     union all ' +
        ' SELECT DOCrat.nome AS CENTRESPON, L.DATALANCTO, RP.NUMCHQBORDERO, ' +
        ' PF.DESCRICAO AS PORTFORMA,   ' +
        ' (RTRIM(TO_CHAR(D.NODOCUMENTO)) || '' '' || D.COMPLDOCUMENTO) AS DOCCOMPL,  ' +
        ' P.RAZAOSOCIAL, P.IDPESSOA, DOCrat.CODCENTRORESPON, h.HISTORICOCOMPL, ' +
        '  SUM(((L.VALOR * docrat.VALOR) /DOCINI.VALOR)) AS VALORRATEIO ' +
        ' FROM PESSOA P, (SELECT D.NUMFATURA,SUM(L.VALOR) AS VALOR  ' +
        '                FROM DOCUMENTO D, LANCTODOCUM L  ' +
        '                WHERE l.OPERACAO = ''1'' and d.numfatura is not null  ' +
        '                AND D.CODDOCUMENTO = L.CODDOCUMENTO GROUP BY D.NUMFATURA) DOCINI,' +

      ' (SELECT D.NUMFATURA,SUM(r.VALOR) AS VALOR , c.nome,c.CODCENTRORESPON ' +
        '                FROM DOCUMENTO D, LANCTODOCUM L ,CENTRESPON C ,rateiodocum r ' +
        '                WHERE l.OPERACAO = ''1'' and d.numfatura is not null ' +
        '                AND D.CODDOCUMENTO = L.CODDOCUMENTO     ' +
        '                AND  (D.CODDOCUMENTO = R.CODDOCUMENTO)  ' +
        '                AND (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) ' +
        '                 AND (R.IDPESSOA = C.IDPESSOA(+)) ' +
        '                GROUP BY D.NUMFATURA, c.nome,c.CODCENTRORESPON) DOCrat, ' +
        ' (select HISTORICOCOMPL,coddocumento from lanctodocum where operacao=''3'' ) h, ' +

      '                DOCUMENTO D, LANCTODOCUM L,  RECBTOPAGTO RP, ' +
        '                PORTADORFORMA PF   ' +

      ' where (D.IDPESSOA = :PIDEMPRESA) AND ' +
        '  (RTRIM(L.OPERACAO) IN (''5'',''15'' )) AND ' +
        '(L.DATALANCTO BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY'') AND TO_DATE(''' + CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY'')) AND ' +
        '(D.RECPAG = :PRECPAG)  AND ';

      If Not CmpRptCM.ParamValues[2].IsNull Then
        Sql.Text := Sql.Text + '(RTRIM(docrat.CODCENTRORESPON) = ' + CmpRptCM.ParamValues[2].AsString + ') AND ';

      If Not CmpRptCM.ParamValues[3].IsNull Then
        Sql.Text := Sql.Text + '(D.IDFORCLI = ' + CmpRptCM.ParamValues[3].AsString + ') AND ';

      Sql.Text := Sql.Text +
        ' (DOCINI.VALOR <> 0) AND    ' +
        ' (RP.CODPORTFORMA = PF.CODPORTFORMA(+))     ' +
        ' AND (DOCINI.numfatura = D.numfatura) AND ' +
        '     (DOCrat.numfatura = D.numfatura) AND ' +
        '  (D.IDFORCLI = P.IDPESSOA) AND  ' +
        '  (L.ESTORNO IS NULL) AND ' +
        '  (D.CODDOCUMENTO = L.CODDOCUMENTO)  ' +
        ' and  (D.CODDOCUMENTO =h.CODDOCUMENTO)  and ' +
        ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
        ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 + ParamIntegra.recpag + #39 + ' and ' +
        ' b.idusuario=:idusuario)  ' +
        ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.recpag + #39 +
        ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
        ' b.idusuario=:idusuario )) )  ' +
        '  AND (D.CODDOCUMENTO = RP.CODDOCUMENTO) AND ' +
        ' (RP.NUMLANCTO = L.NUMLANCTO)      ' +

      '  GROUP BY L.DATALANCTO,DOCrat.NOME, D.CODCENTROCUSTO, RP.NUMCHQBORDERO,PF.DESCRICAO, ' +
        ' h.HISTORICOCOMPL, D.NODOCUMENTO, D.COMPLDOCUMENTO,      ' +
        '  P.RAZAOSOCIAL, L.HISTORICOCOMPL,DOCrat.CODCENTRORESPON,   ' +
        ' P.IDPESSOA    ' +

      '  ORDER BY CENTRESPON,CODCENTRORESPON, DATALANCTO, RAZAOSOCIAL, IDPESSOA   ';

      prepare;
      ParamByName('PIDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;
      ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
      ParamByName('idusuario').AsFloat := CrmRptCM.idusuario;
      Open;
    End;
End;

Procedure TRptPagCentRespon.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  CmpRptCM.ParamValues[3].LookupSettings.SQL.text := ' SELECT EMPRESACLIENTE.IDFORCLI, ' +
    '   PESSOA.RAZAOSOCIAL ,  ' +
    '   PESSOA.NOME ,              ' +
    '   PESSOA.NUMDOCUMENTO ,      ' +
    '   CLIENTEPESS.CODCLIENTE ,   ' +
    '   ENDPESS.LOGRADOURO ,       ' +
    '   CIDADES.NOME ,             ' +
    '   ESTADO.CODESTADO ,         ' +
    '   PAIS.NOMEPAIS,             ' +
    '   PESSOA.IDPESSOA            ' +
    ' FROM                         ' +
    '   PESSOA,                    ' +
    '   EMPRESACLIENTE,            ' +
    '   CLIENTEPESS,               ' +
    '   ENDPESS,                   ' +
    '   CIDADES,                   ' +
    '   ESTADO,                    ' +
    '   PAIS                       ' +
    ' WHERE                        ' +
    '   ( (EMPRESACLIENTE.IDPESSOA= ' + Floattostr(CrmRptCM.IdEmpresa) + ') ) AND ' +
    '   ( (PESSOA.IDPESSOA=EMPRESACLIENTE.IDFORCLI) ) AND' +
    '   ( (PESSOA.IDPESSOA=CLIENTEPESS.IDPESSOA) ) AND' +
    '   ( (ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL) ) AND' +
    '   ( (CIDADES.IDCIDADES(+) = ENDPESS.IDCIDADES) ) AND' +
    '   ( (ESTADO.IDESTADO(+) = CIDADES.IDESTADO) ) AND' +
    '   ( (PAIS.IDPAIS(+) = ESTADO.IDPAIS) )' +
    ' ORDER BY RAZAOSOCIAL ASC';
End;

End.

