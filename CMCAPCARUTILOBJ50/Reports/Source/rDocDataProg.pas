//==============================================================================
//Analista : Marcus Oliveira
//Pendência: 25639
//Data     : 27/06/2007
//Descrição: Removendo a quebra por tiporecebdesemb
//==============================================================================
//Analista : Marcus Oliveira
//Pendência: 25510
//Data     : 05/06/2007
//Descrição: Corrigido a pend 25335
//==============================================================================
//Analista : Marcus Oliveira
//Pendência: 25335
//Data     : 17/05/2007
//Descrição: Corrigido o erro no relatório onde duplicava quando existia um estorno.
//==============================================================================
//Analista : Marcus Oliveira
//Pendência: 25238
//Data     : 09/05/2007
//Descrição: Criado um campo contador para cada linha impressa dentro do grupo
//           DataProgramada
//==============================================================================
//Analista : Marcus Oliveira
//Pendência: 24814
//Data     : 11/04/2007
//Descrição: Não exibir documentos estornados dentro do lote.

Unit rDocDataProg;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, uCmRptManager, TXComp, CmParamReport, uCtrlParamIntegra,
  DBClient, uCMClientDataSet, uCmSqlParams, CMProcuraSubTipo, TXRB;

Type
  TRptDocDataProg = Class(TFrmCmReport)
    DsDocDataProg: TwwDataSource;
    PpDocDataProg: TppBDEPipeline;
    RptDocDataProg: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel8: TppLabel;
    RptDocDataProgLine2: TppLine;
    ppLine66: TppLine;
    pplTitRelatDataProg: TppLabel;
    ppLabel159: TppLabel;
    ppLabel157: TppLabel;
    ppLabel156: TppLabel;
    ppLabel155: TppLabel;
    ppLabel154: TppLabel;
    ppLabel153: TppLabel;
    ppLabel158: TppLabel;
    ppLabel160: TppLabel;
    ppLabel152: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLine8: TppLine;
    ppLabel9: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    RptDocDataProgSummaryBand1: TppSummaryBand;
    ppLabel151: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppLine65: TppLine;
    RptDocDataProgGroup1: TppGroup;
    RptDocDataProgGroupHeaderBand1: TppGroupHeaderBand;
    RptDocDataProgDBText8: TppDBText;
    RptDocDataProgLabel10: TppLabel;
    ppDBText80: TppDBText;
    ppLine7: TppLine;
    RptDocDataProgGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc24: TppDBCalc;
    ppLabel150: TppLabel;
    RptDocDataProgLine1: TppLine;
    RptDocDataProgDBText7: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText85: TppDBText;
    SqlDocDataProg: TCMSqlParams;
    CdsDocDataProg: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    Contador: TppDBCalc;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    stiponome, stiporecdes: String;
  public
    { Public declarations }
  End;

Var
  RptDocDataProg: TRptDocDataProg;

Implementation

{$R *.DFM}

Procedure TRptDocDataProg.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  If (Not CmpRptCM.ParamValues[0].IsNull) And (Not
    CmpRptCM.ParamValues[1].IsNull) Then
    pplTitRelatDataProg.Caption := 'Documentos em Aberto por Data Programada de '
      + CmpRptCM.ParamValues[0].AsString + ' a ' +
      CmpRptCM.ParamValues[1].AsString
  Else If (Not CmpRptCM.ParamValues[0].IsNull) Then
    pplTitRelatDataProg.Caption :=
      'Documentos em Aberto por Data Programada a partir de ' +
      CmpRptCM.ParamValues[0].AsString
  Else If (Not CmpRptCM.ParamValues[1].IsNull) Then
    pplTitRelatDataProg.Caption :=
      'Documentos em Aberto por Data Programada até ' +
      CmpRptCM.ParamValues[1].AsString
  Else
    pplTitRelatDataProg.Caption := 'Documentos em Aberto por Data Programada';
  If ParamIntegra.RecPag = 'P' Then
  Begin
    ppLabel153.Caption := 'Fornecedor';
    ppLabel157.Caption := 'Valor a Pagar';
  End
  Else
  Begin
    ppLabel153.Caption := 'Cliente';
    ppLabel157.Caption := 'Valor a Receber';
  End;
  ppLabel152.Caption := '';
  If (Not CmpRptCM.ParamValues[2].IsNull) Then
    ppLabel152.Caption := ppLabel152.Caption + '  Tipo de Documento: ' +
      stiponome;
  If Not CmpRptCM.ParamValues[3].IsNull Then
    ppLabel152.Caption := ppLabel152.Caption + '  ' +
      CmpRptCM.ParamValues[3].Caption + ': ' + stiporecdes;
  Case StrToInt(CmpRptCM.ParamValues[4].AsString) Of
    0: ppLabel152.Caption := ppLabel152.Caption +
      '   Somente Lançamentos Efetivos';
    1: ppLabel152.Caption := ppLabel152.Caption +
      '   Somente Lançamentos Previstos';
    2: ppLabel152.Caption := ppLabel152.Caption +
      '   Lançamentos Efetivos e Previstos';
  End;
  With SqlDocDataProg Do
  Begin
    SQL.Clear;
    SQL.Append('SELECT                                                                                             ');
    //Marcus Oliveira P. 24814 11/04/2007
    SQL.Append('DECODE(LD.FLGESTORNO, ''S'', '''', LD.NUMLOTE ) AS NUMLOTE,                                          ');
    SQL.Append('   U.DATAPROGRAMADA,                                                                               ');
    SQL.Append('   U.IDFORCLI,                                                                                     ');
    SQL.Append('   U.CODDOCUMENTO,                                                                                 ');
    SQL.Append('   U.DATAVENCTO,                                                                                   ');
    SQL.Append('   U.TIPO,                                                                                         ');
    SQL.Append('   U.NODOCUMENTO,                                                                                  ');
    SQL.Append('   P.RAZAOSOCIAL,                                                                                  ');
    SQL.Append('   P.NOME,                                                                                         ');
    SQL.Append('   P.NUMDOCUMENTO AS CGCCPF,                                                                       ');
    SQL.Append('   U.HISTORICOCOMPL,                                                                               ');
    SQL.Append('   U.DATALANCTO,                                                                                   ');

    //Analista : Marcus Oliveira - Pendência: 25639 - 27/06/2007
    SQL.Append('   U.RECPAG,                                                                                       ');
    SQL.Append('   U.IDPESSOA,                                                                                     ');
    SQL.Append('   U.CODTIPDOC,                                                                                    ');
    SQL.Append('   TD.DESCRICAO AS DESCTIPODOC,                                                                    ');
    SQL.Append('   DECODE(SIGN(TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')-U.DATAPROGRAMADA),1,        ');
    SQL.Append('          ''Vencido a ''||to_char(abs((TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')-U.DATAPROGRAMADA))), ');
    SQL.Append('          ''A Vencer em ''||to_char(abs((TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')-U.DATAPROGRAMADA))))||'' Dias'' AS MENSAGEM, ');
    SQL.Append('   U.SALDO                                                                                         ');
    SQL.Append('FROM                                                                                               ');
    SQL.Append('   ( SELECT LD.* FROM LOTEXDOCUM LD, LOTEPAGTO LP                                                  ' );
    SQL.Append('     WHERE ( LP.NUMLOTE = LD.NUMLOTE ) AND                                                         ' );
    SQL.Append('           ( NVL(FLGESTORNO, ''N'' ) <> ''S'' ) AND                                                  ' );
    SQL.Append('           ( (LP.FLAGCANCEL  IN (''R'', ''B'' )) OR (LP.FLAGCANCEL  IS NULL) )                     ' );
    SQL.Append('       ) LD,                                                                                       ' );

    SQL.Append('   PESSOA P,                                                                                       ');
    SQL.Append('   TIPODOCRECPAG TD,                                                                               ');
    SQL.Append('   (                                                                                               ');
    SQL.Append('   (SELECT                                                                                         ');
    SQL.Append('       D.DATAPROGRAMADA,                                                                           ');
    SQL.Append('       D.IDFORCLI,                                                                                 ');
    SQL.Append('       D.CODDOCUMENTO,                                                                             ');
    SQL.Append('       D.DATAVENCTO,                                                                               ');
    SQL.Append('       DECODE(D.OPERACAO,''2 '',''Efetivo'', DECODE(D.OPERACAO,''1 '',''Efetivo'',''Previsto'')) AS TIPO, ');
    SQL.Append('       DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                                        ');
    SQL.Append('       (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,                          ');
    SQL.Append('       L.HISTORICOCOMPL,                                                                           ');
    SQL.Append('       L.DATALANCTO,                                                                               ');
    SQL.Append('       R.RECPAG,                                                                                   ');
    SQL.Append('       D.IDPESSOA,                                                                                 ');
    SQL.Append('       D.CODTIPDOC,                                                                                ');
    SQL.Append('       SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO                                                   ');
    SQL.Append('    FROM                                                                                           ');
    SQL.Append('       DOCUMENTO D,                                                                                ');
    SQL.Append('       LANCTODOCUM L,                                                                              ');
    SQL.Append('       RATEIODOCUM R,                                                                              ');
    SQL.Append('       (SELECT                                                                                     ');
    SQL.Append('           D.CODDOCUMENTO,                                                                         ');
    SQL.Append('           SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),                    ');
    SQL.Append('           DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO                                    ');
    SQL.Append('        FROM                                                                                       ');
    SQL.Append('           DOCUMENTO D,                                                                            ');
    SQL.Append('           LANCTODOCUM L                                                                           ');
    SQL.Append('        WHERE                                                                                      ');
    SQL.Append('                (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                  ');
    SQL.Append('            AND (D.OPERACAO IN (''2 '',''12'',''1 '',''11'',''14''))                                      ');
    If Not CmpRptCM.ParamValues[0].IsNull Then
      SQL.Append('            AND (D.DATAPROGRAMADA >=TO_Date(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''dd/mm/yyyy''))  ');
    If Not CmpRptCM.ParamValues[1].IsNull Then
      SQL.Append('            AND (D.DATAPROGRAMADA <=TO_Date(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''dd/mm/yyyy''))  ');
    SQL.Append('            AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                                        ');
    SQL.Append('            AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa)
      + ')                                  ');
    SQL.Append('            AND ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))                                        ');
    SQL.Append('        GROUP BY D.CODDOCUMENTO) S                                                                 ');
    SQL.Append('    WHERE                                                                                          ');
    SQL.Append('       (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                           ');
    SQL.Append('        AND (D.OPERACAO = L.OPERACAO)                                                              ');
    SQL.Append('        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)                                                      ');
    SQL.Append('        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                                      ');
    SQL.Append('        AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                                            ');
    SQL.Append('        AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa) +
      ')                                      ');
    If Not CmpRptCM.ParamValues[0].IsNull Then
      SQL.Append('        AND (D.DATAPROGRAMADA >=TO_Date(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''dd/mm/yyyy''))  ');
    If Not CmpRptCM.ParamValues[1].IsNull Then
      SQL.Append('        AND (D.DATAPROGRAMADA <=TO_Date(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''dd/mm/yyyy''))  ');
    If Not CmpRptCM.ParamValues[3].IsNull Then
      SQL.Append('        AND (R.CODTIPRECDES = ''' +
        CmpRptCM.ParamValues[3].AsString + ''') ');
    SQL.Append('        AND (NVL(L.VALOR,0) <> 0)                                                                  ');
    SQL.Append('        AND (D.OPERACAO IN (''2 '',''12'',''1 '',''11'',''14''))                                          ');
    SQL.Append('        AND ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))                                            ');
    SQL.Append('    GROUP BY                                                                                       ');
    SQL.Append('        D.IDFORCLI,                                                                                ');
    SQL.Append('        D.DATAVENCTO,                                                                              ');
    SQL.Append('        D.COMPLDOCUMENTO,                                                                          ');
    SQL.Append('        D.NODOCUMENTO,                                                                             ');
    SQL.Append('        D.DATAPROGRAMADA,                                                                          ');
    SQL.Append('        L.HISTORICOCOMPL,                                                                          ');
    SQL.Append('        L.DATALANCTO,                                                                              ');
    SQL.Append('        R.RECPAG,                                                                                  ');
    SQL.Append('        D.IDPESSOA,                                                                                ');
    SQL.Append('        D.OPERACAO,                                                                                ');
    SQL.Append('        D.CODTIPDOC,                                                                               ');
    SQL.Append('        D.CODDOCUMENTO)                                                                            ');
    SQL.Append('UNION ALL                                                                                          ');
    SQL.Append('   (                                                                                               ');
    SQL.Append('   SELECT                                                                                          ');
    SQL.Append('      D.DATAPROGRAMADA,                                                                            ');
    SQL.Append('      D.IDFORCLI,                                                                                  ');
    SQL.Append('      D.CODDOCUMENTO,                                                                              ');
    SQL.Append('      D.DATAVENCTO,                                                                                ');
    SQL.Append('      DECODE(D.OPERACAO,''3 '',''Efetivo'', ''Previsto'') AS TIPO,                                 ');
    SQL.Append('      DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                                         ');
    SQL.Append('      (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,                           ');
    SQL.Append('      L.HISTORICOCOMPL,                                                                            ');
    SQL.Append('      L.DATALANCTO,                                                                                ');
    SQL.Append('      R.RECPAG,                                                                                    ');
    SQL.Append('      D.IDPESSOA,                                                                                  ');
    SQL.Append('      D.CODTIPDOC,                                                                                 ');
    SQL.Append('      SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS SALDO                                          ');
    SQL.Append('   FROM                                                                                            ');
    SQL.Append('      DOCUMENTO D,                                                                                 ');
    SQL.Append('      LANCTODOCUM L,                                                                               ');
    SQL.Append('      (SELECT                                                                                      ');
    SQL.Append('          D.NUMFATURA,                                                                             ');
    SQL.Append('          SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),                     ');
    SQL.Append('          DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDOTOT                                  ');
    SQL.Append('       FROM                                                                                        ');
    SQL.Append('          DOCUMENTO D,                                                                             ');
    SQL.Append('          LANCTODOCUM L                                                                            ');
    SQL.Append('       WHERE                                                                                       ');
    SQL.Append('          (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                        ');
    SQL.Append('           AND (D.OPERACAO = L.OPERACAO)                                                           ');
    SQL.Append('           AND (D.OPERACAO IN (''1 '',''11''))                                                     ');
    SQL.Append('           AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                                         ');
    SQL.Append('           AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa)
      +
      ')                                   ');
    SQL.Append('           AND (D.NUMFATURA IS NOT NULL)                                                           ');
    SQL.Append('       GROUP BY D.NUMFATURA) SS,                                                                   ');
    SQL.Append('       (SELECT                                                                                     ');
    SQL.Append('           D.CODDOCUMENTO,                                                                         ');
    SQL.Append('           SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),                    ');
    SQL.Append('           DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDODOC                                 ');
    SQL.Append('        FROM                                                                                       ');
    SQL.Append('           DOCUMENTO D,                                                                            ');
    SQL.Append('           LANCTODOCUM L                                                                           ');
    SQL.Append('        WHERE                                                                                      ');
    SQL.Append('           (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                       ');
    SQL.Append('            AND (D.OPERACAO IN (''3 '',''13''))                                                    ');
    SQL.Append('            AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                                        ');
    SQL.Append('            AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa)
      + ')                                  ');
    If Not CmpRptCM.ParamValues[0].IsNull Then
      SQL.Append('            AND (D.DATAPROGRAMADA >=TO_Date(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''dd/mm/yyyy''))  ');
    If Not CmpRptCM.ParamValues[1].IsNull Then
      SQL.Append('            AND (D.DATAPROGRAMADA <=TO_Date(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''dd/mm/yyyy''))  ');
    SQL.Append('            AND ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))                                        ');
    SQL.Append('        GROUP BY D.CODDOCUMENTO) S,                                                                ');
    SQL.Append('       (SELECT                                                                                     ');
    SQL.Append('           D.NUMFATURA,                                                                            ');
    SQL.Append('           R.CODTIPRECDES,                                                                         ');
    SQL.Append('           R.IDPESSOA,                                                                             ');
    SQL.Append('           R.RECPAG,                                                                               ');
    SQL.Append('           SUM(R.VALOR) AS VALORRAT                                                                ');
    SQL.Append('        FROM                                                                                       ');
    SQL.Append('           DOCUMENTO D,                                                                            ');
    SQL.Append('           RATEIODOCUM R                                                                           ');
    SQL.Append('        WHERE                                                                                      ');
    SQL.Append('           (D.CODDOCUMENTO = R.CODDOCUMENTO)                                                       ');
    SQL.Append('            AND (D.OPERACAO IN (''1 '',''11''))                                                    ');
    SQL.Append('            AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                                        ');
    SQL.Append('            AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa)
      + ')                                  ');
    SQL.Append('            AND (D.NUMFATURA IS NOT NULL)                                                          ');
    SQL.Append('        GROUP BY                                                                                   ');
    SQL.Append('            R.CODTIPRECDES,                                                                        ');
    SQL.Append('            R.IDPESSOA,                                                                            ');
    SQL.Append('            R.RECPAG,                                                                              ');
    SQL.Append('            D.NUMFATURA) R                                                                         ');
    SQL.Append('WHERE                                                                                              ');
    SQL.Append('   (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                               ');
    SQL.Append('    AND (D.OPERACAO = L.OPERACAO)                                                                  ');
    SQL.Append('    AND (D.NUMFATURA = R.NUMFATURA)                                                                ');
    SQL.Append('    AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                                          ');
    SQL.Append('    AND (D.NUMFATURA = SS.NUMFATURA)                                                               ');
    SQL.Append('    AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                                                ');
    SQL.Append('    AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa) +
      ')                                          ');
    If Not CmpRptCM.ParamValues[0].IsNull Then
      SQL.Append('    AND (D.DATAPROGRAMADA >=TO_Date(''' +
        CmpRptCM.ParamValues[0].AsString + ''',''dd/mm/yyyy''))  ');
    If Not CmpRptCM.ParamValues[1].IsNull Then
      SQL.Append('    AND (D.DATAPROGRAMADA <=TO_Date(''' +
        CmpRptCM.ParamValues[1].AsString + ''',''dd/mm/yyyy''))  ');
    If Not CmpRptCM.ParamValues[3].IsNull Then
      SQL.Append('    AND (R.CODTIPRECDES = ''' +
        CmpRptCM.ParamValues[3].AsString + ''') ');
    SQL.Append('    AND (NVL(SS.SALDOTOT,0) <> 0 )                                                                 ');
    SQL.Append('    AND (D.OPERACAO IN (''3 '',''13''))                                                            ');
    SQL.Append('    AND ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))                                                ');
    SQL.Append('GROUP BY                                                                                           ');
    SQL.Append('       D.IDFORCLI,                                                                                 ');
    SQL.Append('       D.DATAVENCTO,                                                                               ');
    SQL.Append('       D.COMPLDOCUMENTO,                                                                           ');
    SQL.Append('       D.NODOCUMENTO,                                                                              ');
    SQL.Append('       D.DATAPROGRAMADA,                                                                           ');
    SQL.Append('       L.HISTORICOCOMPL,                                                                           ');
    SQL.Append('       L.DATALANCTO,                                                                               ');
    SQL.Append('       R.RECPAG,                                                                                   ');
    SQL.Append('       D.IDPESSOA,                                                                                 ');
    SQL.Append('       D.OPERACAO,                                                                                 ');
    SQL.Append('       D.CODTIPDOC,                                                                                ');
    SQL.Append('       D.CODDOCUMENTO )                                                                            ');
    SQL.Append(') U                                                                                                ');
    SQL.Append('WHERE (U.IDFORCLI = P.IDPESSOA)                                                                    ');
    //Marcus Oliveira 17/05/2007 25335
    SQL.Append('  AND (NVL(LD.FLGESTORNO,''N'') <> ''S'')                                                              ');
    SQL.Append('  AND (U.CODTIPDOC = TD.CODTIPDOC)                                                                 ');
    SQL.Append('  AND (LD.CODDOCUMENTO(+) = U.CODDOCUMENTO)                                                        ');
    If Not CmpRptCM.ParamValues[2].IsNull Then
      SQL.Append('   AND (U.CODTIPDOC = ' + CmpRptCM.ParamValues[2].AsString + ')                                 ');
    If CmpRptCM.ParamValues[5].AsInteger <> 0 Then
      SQL.Append(' AND (U.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[5].AsInteger) + ')                                       ');
    Case StrToInt(CmpRptCM.ParamValues[4].AsString) Of
      0:
        SQL.Append('  AND (U.TIPO = ''Efetivo'')                                                                 ');
      1:
        SQL.Append('  AND (U.TIPO = ''Previsto'')                                                                 ');
    End;
    SQL.Append('ORDER BY U.IDPESSOA, U.DATAPROGRAMADA, P.RAZAOSOCIAL, U.NODOCUMENTO, U.CODDOCUMENTO                ');

    Open;
  End;
End;

Procedure TRptDocDataProg.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    CmpRptCM.ParamValues[5].Caption := ' Cliente ';
    CmpRptCM.ParamValues[3].caption := 'Tipo de Recebimento';
  End
  Else
  Begin
    CmpRptCM.ParamValues[5].Caption := ' Fornecedor ';
    CmpRptCM.ParamValues[3].caption := 'Tipo de Desembolso';
  End;
End;

Procedure TRptDocDataProg.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(date);
  If ParamIntegra.RecPag = 'R' Then
  Begin
    CmpRptCM.ParamValues[2].LookupSettings.SQL.text :=
      ' SELECT  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39
      + ParamIntegra.recpag + #39 + ' and b.idusuario=' +
      FloatToStr(CrmRptCM.IdUsuario) + ') ' +
      ' union  SELECT  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
      ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
      FloatToStr(CrmRptCM.IdUsuario) + ') ORDER BY DEBCRE DESC,DESCRICAO';
    CmpRptCM.ParamValues[3].LookupSettings.SQL.text :=
      'select descricao,codtiprecdes from tiporecebdesemb   WHERE idpessoa=' +
      FloatToStr(CrmRptCM.idempresa) + ' and RECPAG =   ''' + ParamIntegra.RecPag
      + '''';
  End
  Else
  Begin
    CmpRptCM.ParamValues[2].LookupSettings.SQL.text :=
      ' SELECT  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39
      +
      ParamIntegra.recpag + #39 + ' and b.idusuario=' +
      FloatToStr(CrmRptCM.IdUsuario) + ') ' +
      ' union  SELECT  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
      ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
      FloatToStr(CrmRptCM.idusuario) + ') ORDER BY DEBCRE DESC,DESCRICAO';
    CmpRptCM.ParamValues[3].LookupSettings.SQL.text :=
      'select descricao,codtiprecdes from tiporecebdesemb   WHERE idpessoa=' +
      FloatToStr(CrmRptCM.idempresa) + ' and RECPAG =   ''' + ParamIntegra.RecPag
      + '''';
  End;
  If ParamIntegra.recpag = 'R' Then
  Begin
    CmpRptCM.ParamValues[5].Caption := 'Cliente';
    CmpRptCM.ParamValues[5].ProcuraFCSettings.ForCli := fcCliente;
    CmpRptCM.ParamValues[5].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End
  Else
  Begin
    CmpRptCM.ParamValues[5].Caption := 'Fornecedor';
    CmpRptCM.ParamValues[5].ProcuraFCSettings.ForCli := fcFornecedor;
    CmpRptCM.ParamValues[5].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End;
End;

Procedure TRptDocDataProg.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
Begin
  Inherited;
  Case index Of
    2: stiponome := TPainelControles(Sender).CtrlLookup.Text;
    3: stiporecdes := TPainelControles(Sender).CtrlLookup.Text;
  End;
End;

End.

