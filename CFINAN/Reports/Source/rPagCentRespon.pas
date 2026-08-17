Unit rPagCentRespon;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Db, Wwdatsrc, DBTables, Wwquery,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCtrlParamIntegra;

Type
  TRptPagCentRespon = Class(TFrmCmReport)
    PpPagCentRespon: TppBDEPipeline;
    DsPagCentRespon: TwwDataSource;
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
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptPagCentRespon: TRptPagCentRespon;

Implementation

{$R *.DFM}

Procedure TRptPagCentRespon.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  With SqlPagCentRespon Do
  Begin
    Close;
    Sql.Text :=
      'SELECT  /*+ RULE */ ' +
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
      ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.RecPag + #39 +
      ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 + ParamIntegra.RecPag + #39 + ' and ' +
      ' b.idusuario=:idusuario)  ' +
      ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.RecPag + #39 +
      ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.RecPag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
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
      ' ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.RecPag + #39 +
      ' and not exists  (select 1 from UsuarioxTpdocto b where  recpag=' + #39 + ParamIntegra.RecPag + #39 + ' and ' +
      ' b.idusuario=:idusuario)  ' +
      ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =' + #39 + ParamIntegra.RecPag + #39 +
      ' and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.RecPag + #39 + ' and a.codtipdoc=b.codtipdoc and ' +
      ' b.idusuario=:idusuario )) )  ' +
      '  AND (D.CODDOCUMENTO = RP.CODDOCUMENTO) AND ' +
      ' (RP.NUMLANCTO = L.NUMLANCTO)      ' +
      '  GROUP BY L.DATALANCTO,DOCrat.NOME, D.CODCENTROCUSTO, RP.NUMCHQBORDERO,PF.DESCRICAO, ' +
      ' h.HISTORICOCOMPL, D.NODOCUMENTO, D.COMPLDOCUMENTO,      ' +
      '  P.RAZAOSOCIAL, L.HISTORICOCOMPL,DOCrat.CODCENTRORESPON,   ' +
      ' P.IDPESSOA    ' +
      '  ORDER BY CENTRESPON,CODCENTRORESPON, DATALANCTO, RAZAOSOCIAL, IDPESSOA   ';
    Prepare;
    ParamByName('PIDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;
    ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
    ParamByName('idusuario').AsFloat := CrmRptCM.IdUsuario;
    Open;
  End;
End;

Procedure TRptPagCentRespon.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  CmpRptCM.ParamValues[0].TextDefault := DatetoStr(date);
  CmpRptCM.ParamValues[1].TextDefault := DatetoStr(date);
  If ParamIntegra.recpag = 'R' Then
    CmpRptCM.ParamValues[3].LookupSettings.SQL.text := ' SELECT EMPRESACLIENTE.IDFORCLI, ' + #13 +
      '   PESSOA.RAZAOSOCIAL ,  ' + #13 +
      '   PESSOA.NOME ,              ' + #13 +
      '   PESSOA.NUMDOCUMENTO ,      ' + #13 +
      '   CLIENTEPESS.CODCLIENTE ,   ' + #13 +
      '   ENDPESS.LOGRADOURO ,       ' + #13 +
      '   CIDADES.NOME ,             ' + #13 +
      '   ESTADO.CODESTADO ,         ' + #13 +
      '   PAIS.NOMEPAIS,             ' + #13 +
      '   PESSOA.IDPESSOA            ' + #13 +
      ' FROM                         ' + #13 +
      '   PESSOA,                    ' + #13 +
      '   EMPRESACLIENTE,            ' + #13 +
      '   CLIENTEPESS,               ' + #13 +
      '   ENDPESS,                   ' + #13 +
      '   CIDADES,                   ' + #13 +
      '   ESTADO,                    ' + #13 +
      '   PAIS                       ' + #13 +
      ' WHERE                        ' + #13 +
      '   ( (EMPRESACLIENTE.IDPESSOA= ' + Floattostr(CrmRptCM.IdEmpresa) + ') ) AND ' + #13 +
      '   ( (PESSOA.IDPESSOA=EMPRESACLIENTE.IDFORCLI) ) AND' + #13 +
      '   ( (PESSOA.IDPESSOA=CLIENTEPESS.IDPESSOA) ) AND' + #13 +
      '   ( (ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL) ) AND' + #13 +
      '   ( (CIDADES.IDCIDADES(+) = ENDPESS.IDCIDADES) ) AND' + #13 +
      '   ( (ESTADO.IDESTADO(+) = CIDADES.IDESTADO) ) AND' + #13 +
      '   ( (PAIS.IDPAIS(+) = ESTADO.IDPAIS) )' + #13 +
      ' ORDER BY RAZAOSOCIAL ASC'
  Else
    CmpRptCM.ParamValues[3].LookupSettings.SQL.text := 'SELECT EMPRESAFORN.IDFORCLI, ' + #13 +
      '   PESSOA.RAZAOSOCIAL ,       ' + #13 +
      '   PESSOA.NOME,              ' + #13 +
      '   PESSOA.NUMDOCUMENTO ,      ' + #13 +
      '   FORNSERV.CODCORRESP ,      ' + #13 +
      '   ENDPESS.LOGRADOURO ,       ' + #13 +
      '   CIDADES.NOME ,             ' + #13 +
      '   ESTADO.CODESTADO ,         ' + #13 +
      '   PAIS.NOMEPAIS ,            ' + #13 +
      '   PESSOA.IDPESSOA            ' + #13 +
      ' FROM                            ' + #13 +
      '   PESSOA,                         ' + #13 +
      '   EMPRESAFORN,                    ' + #13 +
      '   FORNSERV,                       ' + #13 +
      '   ENDPESS,                        ' + #13 +
      '   CIDADES,                        ' + #13 +
      '   ESTADO,                         ' + #13 +
      '   PAIS                            ' + #13 +
      'WHERE                              ' + #13 +
      '   ((PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI)) And         ' + #13 +
      '   ((PESSOA.IDPESSOA = FORNSERV.IDPESSOA)) And            ' + #13 +
      '   ((ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL)) And  ' + #13 +
      '   ((CIDADES.IDCIDADES(+) = ENDPESS.IDCIDADES)) And       ' + #13 +
      '   ((ESTADO.IDESTADO(+) = CIDADES.IDESTADO)) And          ' + #13 +
      '   ((PAIS.IDPAIS(+) = ESTADO.IDPAIS))                     ' + #13 +
      'ORDER BY RAZAOSOCIAL ASC ';
End;

Procedure TRptPagCentRespon.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    CmpRptCM.Caption := 'Valores Recebidos Por Centro de Responsabilidade';
  End
  Else
  Begin
    CmpRptCM.Caption := 'Valores Pagos Por Centro de Responsabilidade';
    CmpRptCM.ParamValues[0].Caption := ' Data De Pagamento do Documento Inicial';
    CmpRptCM.ParamValues[1].Caption := ' Data De Pagamento do Documento Final';
  End;

End;

End.

