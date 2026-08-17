Unit rPosSaldosAnalitico;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlParamIntegra;

Type
  TRptPosSaldosAnalitico = Class(TFrmCmReport)
    DsPosSadosAnalitico: TwwDataSource;
    PpPosSadosAnalitico: TppBDEPipeline;
    RptPosSadosAnalitico: TppReport;
    ppHeaderBand25: TppHeaderBand;
    ppLabel22: TppLabel;
    LblPosTipoCli: TppLabel;
    ppLabel89: TppLabel;
    ppLabel96: TppLabel;
    ppLabel115: TppLabel;
    ppDetailBand26: TppDetailBand;
    ppFooterBand25: TppFooterBand;
    ppLabel123: TppLabel;
    ppLine53: TppLine;
    ppCalc45: TppSystemVariable;
    RptPosSadosAnaliticoCalc1: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLine54: TppLine;
    RptPosSadosAnaliticoDBCalc3: TppDBCalc;
    RptPosSadosAnaliticoDBCalc4: TppDBCalc;
    RptPosSadosAnaliticoLabel3: TppLabel;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    RptPosSadosAnaliticoLabel1: TppLabel;
    RptPosSadosAnaliticoDBText1: TppDBText;
    RptPosSadosAnaliticoLine1: TppLine;
    RptPosSadosAnaliticoLine2: TppLine;
    ppGroupFooterBand7: TppGroupFooterBand;
    RptPosSadosAnaliticoDBCalc1: TppDBCalc;
    RptPosSadosAnaliticoDBCalc2: TppDBCalc;
    RptPosSadosAnaliticoLabel2: TppLabel;
    RptPosSadosAnaliticoGroup1: TppGroup;
    RptPosSadosAnaliticoGroupHeaderBand1: TppGroupHeaderBand;
    RptPosSadosAnaliticoGroupFooterBand1: TppGroupFooterBand;
    RptPosSadosAnaliticoDBText2: TppDBText;
    RptPosSadosAnaliticoDBCalc5: TppDBCalc;
    RptPosSadosAnaliticoDBCalc6: TppDBCalc;
    CdsPosSadosAnalitico: TCMClientDataSet;
    SqlPosSadosAnalitico: TCMSqlParams;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    stiponome: String;
  public
    { Public declarations }
  End;

Var
  RptPosSaldosAnalitico: TRptPosSaldosAnalitico;

Implementation

Uses uSistema;

{$R *.DFM}

Procedure TRptPosSaldosAnalitico.CrmRptCMBeforePrint(Sender: TObject);
Var
  sDataPagto: String;
Begin
  Inherited;
  If CmpRptCM.ParamValues[0].IsNull Then
    sDataPagto := DateToStr(Date)
  Else
    sDataPagto := CmpRptCM.ParamValues[0].AsString;

  LblPosTipoCli.Caption := 'Posição dos Saldos Em ' + sDataPagto;

  If Not CmpRptCM.ParamValues[2].IsNull Then
    LblPosTipoCli.Caption := LblPosTipoCli.Caption + ' Tipo de Cliente: ' + stiponome;

  If Not CmpRptCM.ParamValues[1].AsBoolean Then
    LblPosTipoCli.Text := Trim(LblPosTipoCli.Text + ' - Adiantamentos Não Inclusos');

  With SqlPosSadosAnalitico Do
    Begin
      Sql.Text :=
        ' SELECT  /*+ RULE */ ' +
        '    T.DESCRICAO, T.IDTIPOCLIENTE,P.RAZAOSOCIAL, P.IDPESSOA, ' +
        '    DECODE(RTRIM(DOCUMENTO.OPERACAO),''3'', ' +
        '    S2.SALDOS2 * ' +
        '    DECODE(S1.SALDOS1,0,0, ' +
        '    SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR), ' +
        '    DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1)))/S1.SALDOS1), ' +
        '    SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR*-1, ' +
        '    LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1)))) AS SALDO, ' +
        '    DECODE(RTRIM(DOCUMENTO.OPERACAO),''3'', ' +
        '    S2.SALDOOMS2 * ' +
        '    DECODE(S1.SALDOOMS1,0,0, ' +
        '    SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOROUTRAMOEDA*-1,LANCTODOCUM.VALOROUTRAMOEDA), ' +
        '    DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOROUTRAMOEDA,LANCTODOCUM.VALOROUTRAMOEDA*-1)))/S1.SALDOOMS1), ' +
        '    SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOROUTRAMOEDA*-1,LANCTODOCUM.VALOROUTRAMOEDA),DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOROUTRAMOEDA,LANCTODOCUM.VALOROUTRAMOEDA*-1)))) AS SALDOOM ' +
        ' FROM ' +
        '   DOCUMENTO, LANCTODOCUM, TIPOCLIENTE T, CLIENTEPESS C, PESSOA P, ' +
        '  (SELECT D.NUMFATURA, ' +
        '         SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR),DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS SALDOS1, ' +
        '         SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOMS1 ' +
        '         FROM DOCUMENTO D, LANCTODOCUM L WHERE ' +
        '          RTRIM(D.OPERACAO) = ''1'' AND D.NUMFATURA IS NOT NULL AND D.CODDOCUMENTO = L.CODDOCUMENTO ' +
        '          GROUP BY D.NUMFATURA) S1, ' +
        ' ' +
        '         (SELECT D.NUMFATURA, ' +
        '         SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR),DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS SALDOS2, ' +
        '         SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOMS2 ' +
        '         FROM DOCUMENTO D, LANCTODOCUM L WHERE  L.DATALANCTO <= :PDATAFIM AND ' +
        '          RTRIM(D.OPERACAO) = ''1'' AND D.NUMFATURA IS NOT NULL AND D.CODDOCUMENTO = L.CODDOCUMENTO GROUP BY D.NUMFATURA) S2 ' +
        ' ' +
        ' WHERE (DOCUMENTO.IDPESSOA = :PIDPESSOA) AND ' +
        '       ((LANCTODOCUM.DATALANCTO <= :PDATAFIM AND RTRIM(LANCTODOCUM.OPERACAO) <> ''3'') OR (RTRIM(LANCTODOCUM.OPERACAO) = ''3''))  AND (DOCUMENTO.RECPAG =  ''' + ParamIntegra.RecPag + ''' ) AND ' +
        '       ((RTRIM(DOCUMENTO.OPERACAO) = ''1'' AND RTRIM(DOCUMENTO.STATUS) <> ''2'') OR RTRIM(DOCUMENTO.OPERACAO) IN (''2'',''3''' + FuncaoGeral.Decode(CmpRptCM.ParamValues[1].AsBoolean, true, ',''15''', '') + ')) ' +
        '       AND (LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO) ' +
        '       AND (S1.NUMFATURA(+) = DOCUMENTO.NUMFATURA) ' +
        '       AND (S2.NUMFATURA(+) = DOCUMENTO.NUMFATURA) ' +
        '       AND (DOCUMENTO.IDFORCLI = P.IDPESSOA) ' +
        '       AND (DOCUMENTO.IDFORCLI = C.IDPESSOA(+)) ' +
        '       AND (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+)) ' +
        FuncaoGeral.Decode(Trim(CmpRptCM.ParamValues[2].AsString), '', '', ' AND (T.IDTIPOCLIENTE = ' + CmpRptCM.ParamValues[2].AsString + ')') +
        ' GROUP BY  T.DESCRICAO, T.IDTIPOCLIENTE, P.RAZAOSOCIAL, P.IDPESSOA, ' +
        '           DOCUMENTO.OPERACAO, S1.SALDOS1, S2.SALDOS2, S1.SALDOOMS1, S2.SALDOOMS2 ' +
        ' HAVING  DECODE(S1.SALDOS1,0,0, ' +
        '         DECODE(RTRIM(DOCUMENTO.OPERACAO),''3'',S2.SALDOS2 *  SUM(DECODE(DOCUMENTO.RECPAG,''P'', ' +
        '         DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR), ' +
        '         DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1)))/S1.SALDOS1, ' +
        '         SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR), ' +
        '         DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1))))) <> 0 ' +
        ' ORDER BY T.DESCRICAO, T.IDTIPOCLIENTE,P.RAZAOSOCIAL, P.IDPESSOA ';
      Prepare;
      ParamByName('PDATAFIM').AsDateTime := StrToDate(sDataPagto);
      ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;

    End;
End;

Procedure TRptPosSaldosAnalitico.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
Begin
  Inherited;
  If index = 2 Then stiponome := TPainelControles(Sender).CtrlLookup.Text;
End;

End.

