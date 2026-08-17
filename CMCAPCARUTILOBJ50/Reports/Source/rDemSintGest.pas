{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

Unit rDemSintGest;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppMemo, ppStrtch, ppRegion,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, Db, Wwdatsrc, DBTables, uCmRptManager, TXComp,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  TXRB;

Type
  TRptDemSintGest = Class(TFrmCmReport)
    Dsdemsintgest: TwwDataSource;
    PpDemsintgest: TppBDEPipeline;
    Rptdemsintgest: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel47: TppLabel;
    ppLine24: TppLine;
    ppLabel48: TppLabel;
    rptdemsintgestRegion1: TppRegion;
    rptdemsintgestMemo1: TppMemo;
    ppDetailBand13: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText17: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    rptdemsintgestLine2: TppLine;
    rptdemsintgestLine1: TppLine;
    ppFooterBand9: TppFooterBand;
    ppLine26: TppLine;
    ppLabel78: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    rptdemsintgestShape3: TppShape;
    ppLabel79: TppLabel;
    ppDBCalc3: TppDBCalc;
    rptdemsintgestDBCalc3: TppDBCalc;
    rptdemsintgestGroup1: TppGroup;
    rptdemsintgestGroupHeaderBand1: TppGroupHeaderBand;
    rptdemsintgestShape1: TppShape;
    rptdemsintgestDBText1: TppDBText;
    rptdemsintgestLabel2: TppLabel;
    rptdemsintgestLabel3: TppLabel;
    rptdemsintgestGroupFooterBand1: TppGroupFooterBand;
    rptdemsintgestShape2: TppShape;
    rptdemsintgestDBCalc1: TppDBCalc;
    rptdemsintgestDBCalc2: TppDBCalc;
    rptdemsintgestLabel4: TppLabel;
    SqlDemSintGest: TCMSqlParams;
    CdsDemSintGest: TCMClientDataSet;
    CdsAuxDemSintGest: TCMClientDataSet;
    SqlAuxDemSintGest: TCMSqlParams;
    CdsAutPagDoc: TCMClientDataSet;
    SqlAutPagDoc: TCMSqlParams;
    CdsCentroRespon: TCMClientDataSet;
    SqlCentroRespon: TCMSqlParams;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    Function BuscaCentRespon: String;
  public
    { Public declarations }
  End;

Var
  RptDemSintGest: TRptDemSintGest;

Implementation

Uses umodulo;

{$R *.DFM}

Function TRptDemSintGest.BuscaCentRespon: String;
Begin
  Result := '';
End;

Procedure TRptDemSintGest.CrmRptCMBeforePrint(Sender: TObject);
Var
  sListaDescricao: String;
  sCampodata, sDescData, sListaCentroRespon, Descricao, Quebra, sStatus: String;
Begin
  Inherited;
  Case CmpRptCM.ParamValues[2].RadioGroupSettings.ItemIndex Of
    0:
      Begin
        sCampodata := 'TRGDTINCLUSAO ';
        sDescData := ' - Data de Inclusão ';
      End;
    1:
      Begin
        sCampodata := 'DATAEMISSAO ';
        sDescData := ' - Data de Emissão ';
      End;
    2:
      Begin
        sCampodata := 'DATAPROGRAMADA ';
        sDescData := ' - Data Programada ';
      End;
  End;

  Case CmpRptCM.ParamValues[4].RadioGroupSettings.ItemIndex Of
    0: sStatus := '0';
    1: sStatus := '2';
    2: sStatus := '';
  End;

  rptdemsintgestMemo1.Lines.Clear;
  sListaCentroRespon := BuscaCentRespon;

  If sListaDescricao <> '' Then
    Begin
      rptdemsintgestMemo1.lines.add('Centro(s) de Responsabilidade selecionado(s): ' + sListaDescricao);
      rptdemsintgestMemo1.lines.add('');
    End;

  If ParamIntegra.RecPag = 'P' Then
    Begin
      ppLabel47.caption := 'Demonstrativo Sintético de Gestão  no período: ' + CmpRptCM.ParamValues[5].AsString + ' - ' + CmpRptCM.ParamValues[6].AsString + ' (Contas a Pagar) ';
      rptdemsintgestMemo1.lines.add('Despesas/Pagamentos');
    End
  Else
    Begin
      ppLabel47.caption := 'Demonstrativo Sintético de Gestão no período: ' + CmpRptCM.ParamValues[5].AsString + ' - ' + CmpRptCM.ParamValues[6].AsString + ' (Contas a Receber) ';
      rptdemsintgestMemo1.lines.add('Receitas/Recebimentos');
    End;
  rptdemsintgestMemo1.lines.add('');

  If sStatus <> '' Then
    rptdemsintgestMemo1.lines.add(' Listagem de Documentos ' + CmpRptCM.ParamValues[4].RadioGroupSettings.Items[CmpRptCM.ParamValues[4].RadioGroupSettings.ItemIndex]);

  With SqlDemSintGest Do
    Begin
      SQL.Clear;
//      SQL.Add('SELECT /*+ RULE */ CODTIPRECDES, DESCRICAO, SUM(VALORATU) AS VALORATU, SUM(VALORANT) AS VALORANT, ANASINT ' + #13 +  //Everson TIBERO
      SQL.Add('SELECT CODTIPRECDES, DESCRICAO, SUM(VALORATU) AS VALORATU, SUM(VALORANT) AS VALORANT, ANASINT ' + #13 + //Everson TIBERO
        'FROM ' + #13 +
        '(SELECT T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU, (0) AS VALORANT, T.ANASINT ' + #13 +
        ' FROM TIPORECEBDESEMB T ' + #13 +
        ' WHERE T.ANASINT = ''S'' AND  T.RECPAG = :PRECPAG AND T.IDPESSOA = :PIDPESSOA ' + #13 +
        ' UNION ' + #13 +
        ' SELECT T.CODTIPRECDES, T.DESCRICAO, ' + #13 +
        '        SUM(DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',R.VALOR,R.VALOR * -1), ' + #13 +
        '        DECODE(L.DEBCRE,''D'',R.VALOR,R.VALOR * -1))) AS VALORATU ,(0) AS VALORANT, T.ANASINT ' + #13 +
        ' FROM RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T ' + #13 +
        ' WHERE ' + #13 +
        ' -- #ADF1 ');
      If trim(sListaCentroRespon) <> '' Then
        SQL.Add(' R.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');
      SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + CmpRptCM.ParamValues[5].AsString + #39 + ',''DD/MM/YYYY'') AND ');
      sql.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');
      Case CmpRptCM.ParamValues[4].RadioGroupSettings.ItemIndex Of
        0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
        1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
      End;
      If Not CmpRptCM.ParamValues[1].AsBoolean Then
        SQL.Add(' (D.codtipdoc <> ' + inttostr(modulo.CodDocCPMF) + ') AND ');
      If sStatus = '0' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
      Else If sStatus = '2' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');

      SQL.Add(' T.RECPAG = :PRECPAG AND    ((d.numfatura is null and rtrim(d.operacao) in (''1'',''11'') ) or rtrim(d.operacao) not in (''1'',''11''))    and ' + #13 +
        ' D.RECPAG = :PRECPAG AND ' + #13 +
        ' T.IDPESSOA = :PIDPESSOA AND ' + #13 +
        ' --      T.ANASINT = ''A'' AND ' + #13 +
        ' L.ESTORNO IS NULL AND ' + #13 +
        ' T.CODTIPRECDES  = R.CODTIPRECDES AND ' + #13 +
        ' T.IDPESSOA = R.IDPESSOA AND ' + #13 +
        ' T.RECPAG = R.RECPAG AND ' + #13 +
        ' D.CODDOCUMENTO = R.CODDOCUMENTO AND ' + #13 +
        ' D.CODDOCUMENTO = L.CODDOCUMENTO AND ' + #13 +
        ' D.OPERACAO = L.OPERACAO ' + #13 +
        ' GROUP BY ' + #13 +
        ' T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG ' + #13 +
        ' UNION ' + #13 +
        '  SELECT ' + #13 +
        ' T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU, ' + #13 +
        ' DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',SUM(R.VALOR),SUM(R.VALOR) * -1), ' + #13 +
        ' DECODE(L.DEBCRE,''D'',SUM(R.VALOR),SUM(R.VALOR) * -1)) AS VALORANT , T.ANASINT ' + #13 +
        ' FROM RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, CENTRESPON CR, TIPORECEBDESEMB T ' + #13 +
        ' WHERE ' + #13 +
        ' -- #ADF2 ');
      If trim(sListaCentroRespon) <> '' Then
        SQL.Add(' R.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');

      Case CmpRptCM.ParamValues[4].RadioGroupSettings.ItemIndex Of
        0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
        1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
      End;
      If Not CmpRptCM.ParamValues[1].AsBoolean Then
        SQL.Add(' (D.codtipdoc <> ' + inttostr(modulo.CodDocCPMF) + ') AND ');

      SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + DateToStr(IncMonth(CmpRptCM.ParamValues[5].AsDateTime, -1)) + #39 + ',''DD/MM/YYYY'') AND ');
      SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');
      If sStatus = '0' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
      Else If sStatus = '2' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');
      SQL.Add(' T.RECPAG = :PRECPAG AND   ((d.numfatura is null and rtrim(d.operacao) in (''1'',''11'') ) or rtrim(d.operacao) not in (''1'',''11''))    and ' + #13 +
        ' D.RECPAG = :PRECPAG AND ' + #13 +
        ' T.IDPESSOA = :PIDPESSOA AND ' + #13 +
        ' --      T.ANASINT = ''A'' AND ' + #13 +
        ' L.ESTORNO IS NULL AND ' + #13 +
        ' T.CODTIPRECDES = R.CODTIPRECDES AND ' + #13 +
        ' T.IDPESSOA = R.IDPESSOA AND ' + #13 +
        ' T.RECPAG = R.RECPAG AND ' + #13 +
        ' D.CODDOCUMENTO = R.CODDOCUMENTO AND ' + #13 +
        ' D.CODDOCUMENTO = L.CODDOCUMENTO AND ' + #13 +
        ' D.OPERACAO = L.OPERACAO AND ' + #13 +
        ' CR.IDPESSOA = R.IDPESSOA(+) AND ' + #13 +
        ' CR.CODCENTRORESPON = R.CODCENTRORESPON(+) ' + #13 +
        ' GROUP BY ' + #13 +
        ' T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG ' + #13 +
        ' UNION ' + #13 +
        ' SELECT  T.CODTIPRECDES, T.DESCRICAO, ' + #13 +
        '         SUM(DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',R.VALOR,R.VALOR * -1), ' + #13 +
        '         DECODE(L.DEBCRE,''D'',R.VALOR,R.VALOR * -1))  * parcela.valor/valorlanc.valor) AS VALORATU ,(0) AS VALORANT, ' + #13 +
        '  T.ANASINT ' + #13 +
        '  FROM RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T  , ' + #13 +
        '  (select  d.numfatura, SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ' + #13 +
        '  DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1)))  AS VALOR ' + #13 +
        '  from lanctodocum l , documento d ' + #13 +
        '  where d.coddocumento=l.coddocumento ' + #13 +
        '  and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA ' + #13 +
        '  and rtrim(d.operacao)in (''1'',''11'')   and l.estorno is null ' + #13 +
        '  and d.numfatura is not null group by d.numfatura) valorlanc, ' + #13 +
        '  (select  d.numfatura, SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ' + #13 +
        '  DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1))) AS VALOR from ' + #13 +
        '  lanctodocum l , documento d ' + #13 +
        '  where ' + #13 +
        '  -- #ADF3 ');

      SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + CmpRptCM.ParamValues[5].AsString + #39 + ',''DD/MM/YYYY'') AND ');
      SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');

      Case CmpRptCM.ParamValues[4].RadioGroupSettings.ItemIndex Of
        0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
        1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
      End;
      If Not CmpRptCM.ParamValues[1].AsBoolean Then
        SQL.Add(' (D.codtipdoc <> ' + inttostr(modulo.CodDocCPMF) + ') AND ');
      If sStatus = '0' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
      Else If sStatus = '2' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');
      SQL.Add('  d.coddocumento=l.coddocumento    and l.estorno is null ' + #13 +
        '  and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA ' + #13 +
        '  and rtrim(d.operacao)in (''3'',''13'') and d.operacao=l.operacao ' + #13 +
        '  and d.numfatura is not null group by d.numfatura) parcela ' + #13 +
        '  WHERE ' + #13 +
        ' -- #ADF4 ');
      If trim(sListaCentroRespon) <> '' Then
        SQL.Add('  R.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');

      SQL.Add('       d.numfatura=parcela.numfatura and parcela.numfatura=valorlanc.numfatura and ' + #13 +
        '       valorlanc.valor<> 0 and ' + #13 +
        '       T.RECPAG = :PRECPAG     AND ( rtrim(d.operacao) in (''1'',''11'')  ) and  d.numfatura is not null and ' + #13 +
        '       D.RECPAG = :PRECPAG AND ' + #13 +
        '       T.IDPESSOA = :PIDPESSOA AND ' + #13 +
        ' --      T.ANASINT = ''A'' AND ' + #13 +
        '       L.ESTORNO IS NULL AND ' + #13 +
        '       T.CODTIPRECDES  = R.CODTIPRECDES AND ' + #13 +
        '       T.IDPESSOA = R.IDPESSOA AND ' + #13 +
        '       T.RECPAG = R.RECPAG AND ' + #13 +
        '       D.CODDOCUMENTO = R.CODDOCUMENTO AND ' + #13 +
        '       D.CODDOCUMENTO = L.CODDOCUMENTO AND ' + #13 +
        '       D.OPERACAO = L.OPERACAO ' + #13 +
        '    GROUP BY ' + #13 +
        '       T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG ' + #13 +
        '    UNION ' + #13 +
        '    SELECT ' + #13 +
        '       T.CODTIPRECDES, T.DESCRICAO,  (0) AS VALORATU   , ' + #13 +
        '       SUM(DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',R.VALOR,R.VALOR * -1), ' + #13 +
        '       DECODE(L.DEBCRE,''D'',R.VALOR,R.VALOR * -1))  * parcela.valor/valorlanc.valor) AS VALORANT , ' + #13 +
        '       T.ANASINT ' + #13 +
        '    FROM ' + #13 +
        '       RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T  , ' + #13 +
        '       (select  d.numfatura, SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ' + #13 +
        '         DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1)))  AS VALOR from ' + #13 +
        '         lanctodocum l , documento d ' + #13 +
        '          where d.coddocumento=l.coddocumento ' + #13 +
        '          and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA ' + #13 +
        '          and rtrim(d.operacao)in (''1'',''11'')   and l.estorno is null ' + #13 +
        '          and d.numfatura is not null group by d.numfatura) valorlanc, ' + #13 +
        '       (select  d.numfatura, SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ' + #13 +
        '         DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1))) AS VALOR from ' + #13 +
        '         lanctodocum l , documento d ' + #13 +
        '          where ' + #13 +
        ' -- #ADF5 ');
      Case CmpRptCM.ParamValues[4].RadioGroupSettings.ItemIndex Of
        0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
        1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
      End;
      If Not CmpRptCM.ParamValues[1].AsBoolean Then
        SQL.Add(' (D.codtipdoc <> ' + inttostr(modulo.CodDocCPMF) + ') AND ');
      SQL.Add(' TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + DateToStr(IncMonth(CmpRptCM.ParamValues[5].AsDateTime, -1)) + #39 + ',''DD/MM/YYYY'') AND ');
      SQL.Add(' TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');
      If sStatus = '0' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
      Else If sStatus = '2' Then
        SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');

      SQL.Add('          d.coddocumento=l.coddocumento    and l.estorno is null ' + #13 +
        '          and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA ' + #13 +
        '          and rtrim(d.operacao)in (''3'',''13'') and d.operacao=l.operacao ' + #13 +
        '          and d.numfatura is not null group by d.numfatura) parcela ' + #13 +
        '    WHERE ' + #13 +
        ' -- #ADF6 ');

      If trim(sListaCentroRespon) <> '' Then
        SQL.Add(' R.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');

      SQL.Add('       valorlanc.valor <> 0 and ' + #13 +
        '       d.numfatura=parcela.numfatura and parcela.numfatura=valorlanc.numfatura and ' + #13 +
        '       T.RECPAG = :PRECPAG     AND ( rtrim(d.operacao) in (''1'',''11'')  ) and  d.numfatura is not null and ' + #13 +
        '       D.RECPAG = :PRECPAG AND ' + #13 +
        '       T.IDPESSOA = :PIDPESSOA AND ' + #13 +
        ' --      T.ANASINT = ''A'' AND ' + #13 +
        '       L.ESTORNO IS NULL AND ' + #13 +
        '       T.CODTIPRECDES  = R.CODTIPRECDES AND ' + #13 +
        '       T.IDPESSOA = R.IDPESSOA AND ' + #13 +
        '       T.RECPAG = R.RECPAG AND ' + #13 +
        '       D.CODDOCUMENTO = R.CODDOCUMENTO AND ' + #13 +
        '       D.CODDOCUMENTO = L.CODDOCUMENTO AND ' + #13 +
        '       D.OPERACAO = L.OPERACAO ' + #13 +
        '    GROUP BY ' + #13 +
        '       T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG ' + #13 +
        '       ) ' + #13 +
        ' GROUP BY ' + #13 +
        '    CODTIPRECDES, DESCRICAO, ANASINT ' + #13 +
        ' ORDER BY ' + #13 +
        '    CODTIPRECDES ');
      ParamByName('precpag').AsString := ParamIntegra.RecPag;
      ParamByName('pidpessoa').AsFloat := CrmRptCM.IdEmpresa;
      open;
    End;
  SqlAuxDemsIntGest.open;
  CdsDemsIntGest.first;

  While Not CdsDemsIntGest.eof Do
    Begin
      If CdsDemSintGest.fieldbyname('anasint').AsString = 'S' Then
        Begin
          descricao := CdsDemSintGest.fieldbyname('DESCRICAO').AsString;
          quebra := CdsDemSintGest.fieldbyname('codtiprecdes').AsString;
        End
      Else
        Begin
          CdsAuxDemSintGest.append;
          CdsAuxDemSintGest.FieldByName('codtiprecdes').AsString := CdsDemSintGest.FieldByName('codtiprecdes').AsString;
          CdsAuxDemSintGest.FieldByName('descricao').AsString := CdsDemSintGest.FieldByName('DESCRICAO').AsString;
          CdsAuxDemSintGest.FieldByName('valoratu').AsString := CdsDemSintGest.FieldByName('VALORATU').AsString;
          CdsAuxDemSintGest.FieldByName('valorant').AsString := CdsDemSintGest.FieldByName('VALORANT').AsString;
          CdsAuxDemSintGest.FieldByName('quebra').AsString := quebra;
          CdsAuxDemSintGest.FieldByName('descr').AsString := descricao;
          CdsAuxDemSintGest.post;
        End;
      CdsDemSintGest.next;
    End;
  CdsAuxDemSintGest.first;
End;

End.

