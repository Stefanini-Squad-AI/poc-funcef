{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
 -------------------------------------------------------------------------------}

Unit rApGr2;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppReport,
  ppSubRpt, ppBands, ppClass, ppVar, ppStrtch, ppMemo, ppPrnabl, ppCache,
  ppProd, Db, DBTables, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  TXRB;

Type
  TRptApGr2 = Class(TFrmCmReport)
    PpApGr: TppBDEPipeline;
    PpApGrppField1: TppField;
    PpApGrppField2: TppField;
    PpApGrppField3: TppField;
    PpApGrppField4: TppField;
    PpApGrppField5: TppField;
    PpApGrppField6: TppField;
    PpApGrppField7: TppField;
    PpApGrppField8: TppField;
    PpApGrppField9: TppField;
    PpApGrppField10: TppField;
    PpApGrppField11: TppField;
    PpApGrppField12: TppField;
    PpApGrppField13: TppField;
    PpApGrppField14: TppField;
    PpApGrppField15: TppField;
    PpApGrppField16: TppField;
    PpApGrppField17: TppField;
    PpApGrppField18: TppField;
    PpApGrppField19: TppField;
    PpApGrppField20: TppField;
    PpApGrppField21: TppField;
    PpApGrppField22: TppField;
    DsApGr: TwwDataSource;
    DsContabLanc: TwwDataSource;
    PpContabLanc: TppBDEPipeline;
    DsContab3: TwwDataSource;
    PpContab3: TppBDEPipeline;
    SqlAp: TCMSqlParams;
    CdsAp: TCMClientDataSet;
    PpTotApGr: TppBDEPipeline;
    DsTotApGr: TwwDataSource;
    SqlTotApGr: TCMSqlParams;
    CdsTotApGr: TCMClientDataSet;
    SqlGr: TCMSqlParams;
    CdsGr: TCMClientDataSet;
    CdsContab3: TCMClientDataSet;
    SqlContab3: TCMSqlParams;
    CdsContabLanc: TCMClientDataSet;
    SqlContabLanc: TCMSqlParams;
    RptApGr2: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    ppDBText8: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel10: TppLabel;
    ppShape3: TppShape;
    ppLabel34: TppLabel;
    ppLabel41: TppLabel;
    RptApGr2Shape1: TppShape;
    RptApGr2Label1: TppLabel;
    RptApGr2Shape2: TppShape;
    RptApGr2Label2: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLine57: TppLine;
    ppLabel49: TppLabel;
    ppDBText12: TppDBText;
    ppDBCalc13: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel51: TppLabel;
    ppDBText47: TppDBText;
    ppDBText52: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine58: TppLine;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel52: TppLabel;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppLine59: TppLine;
    ppLabel53: TppLabel;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLine61: TppLine;
    ppLabel54: TppLabel;
    ppDBText59: TppDBText;
    ppLabel69: TppLabel;
    ppDBText61: TppDBText;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppLabel73: TppLabel;
    ppLabel78: TppLabel;
    ppDBText67: TppDBText;
    ppLabel79: TppLabel;
    ppLabel125: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel139: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppLabel143: TppLabel;
    ppDBText70: TppDBText;
    ppLine62: TppLine;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand30: TppDetailBand;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand31: TppDetailBand;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBMemo3: TppDBMemo;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsApAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptApGr2: TRptApGr2;

Implementation

{$R *.DFM}

Procedure TRptApGr2.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;

  If ( Trim( CmpRptCM.ParamValues[0].AsString ) = '' ) Then

    Exit
  Else Begin

    SqlTotApGr.sql.text :=
//      'SELECT  /*+ RULE */ D.NUMAPGR,  ' + #13 +    //Everson TIBERO
      'SELECT D.NUMAPGR,  ' + #13 +  //Everson TIBERO
      '  SUM(decode(l.operacao,''10'',DECODE(D.RECPAG,''R'',DECODE(DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,''C'',L.VALOR,L.VALOR*-1)),     ' + #13
        +
      '                                        DECODE(D.RECPAG,''R'',DECODE(DEBCRE,''C'',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,''D'',L.VALOR,L.VALOR*-1)) ) ) AS VALOR  ' + #13
        +
      'FROM   ' + #13 +
      '  DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R  ' + #13 +
      'WHERE          ' + #13 +
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND ' + #13 +
      '  L.CODDOCUMENTO = R.CODDOCUMENTO AND ' + #13 +
      '  L.NUMLANCTO    = R.NUMLANCTO    AND  ' + #13 +
      '  D.NUMAPGR      = ' + CmpRptCM.ParamValues[0].AsString + #13 +
      'GROUP BY ' + #13 +
      'D.NUMAPGR';

    SqlAp.sql.text :=
      'SELECT ' + #13 +
      '    (''Nº '' || RTRIM(TO_CHAR(NUMAPGR))) AS DESCNUMAPGR, ' + #13 +
      '     NUMBANCO, ' + #13 +
      '     PLANO,   ' + #13 +
      '     NOMEBANCO,  ' + #13 +
      '     NUMAGENCIA,  ' + #13 +
      '     NOCONTACORR,  ' + #13 +
      '     DATALANCTO,  ' + #13 +
      '     TIPODOC,   ' + #13 +
      '     FORCLI,   ' + #13 +
      '     CODDOCUMENTO,  ' + #13 +
      '     NUMDOC,    ' + #13 +
      '     NUMCHQBORDERO, ' + #13 +
      '     CONTACONTABIL, ' + #13 +
      '     HISTORICO,   ' + #13 +
      '     DEBCRE,  ' + #13 +
      '     VALOR,  ' + #13 +
      '     VALORDOC,  ' + #13 +
      '     DATADOC,  ' + #13 +
      '     DESCESTORNO, ' + #13 +
      '     NUMAPGR   ' + #13 +
      ' FROM       ' + #13 +
      ' (        ' + #13 +
      ' SELECT   ' + #13 +
      '        D.NUMAPGR,   ' + #13 +
      '        D.PLANO,   ' + #13 +
      '        B.NUMBANCO, ' + #13 +
      '        PB.RAZAOSOCIAL AS NOMEBANCO,  ' + #13 +
      '        AG.NUMAGENCIA,     ' + #13 +
      '        PC.NOCONTACORR,   ' + #13 +
      '        L.DATALANCTO,  ' + #13 +
      '        TD.DESCRICAO AS TIPODOC, ' + #13 +
      '        PD.RAZAOSOCIAL AS FORCLI,' + #13 +
      '        D.CODDOCUMENTO, ' + #13 +
      '        (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC, ' + #13 +
      '        R.NUMCHQBORDERO,      ' + #13 +
      '        PC.PLACONTA AS CONTACONTABIL,   ' + #13 +
      '        (''BAIXA DOC Nº '' || D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS HISTORICO, ' + #13 +
      '       DECODE(L.DEBCRE,''D'',''C'',''D'') AS DEBCRE,    ' + #13 +
      '       L.VALOR, ' + #13 +
      '       LANC.VALOR AS VALORDOC,   ' + #13 +
      '       LANC.DATALANCTO AS DATADOC,  ' + #13 +
      '       DECODE(L.ESTORNO,NULL,'''',''PAGAMENTO CANCELADO\ESTORNADO'') AS DESCESTORNO ' + #13 +
      'FROM   ' + #13 +
      '    DOCUMENTO D, ' + #13 +
      '    LANCTODOCUM L, ' + #13 +
      '    EMPRESAFORN E,   ' + #13 +
      '    RECBTOPAGTO R,  ' + #13 +
      '    PORTADORFORMA P, ' + #13 +
      '    PORTADORCONTA PC, ' + #13 +
      '    PLANILHA PL,    ' + #13 +
      '    AGENCIABANCARIA AG,  ' + #13 +
      '    BANCO B,      ' + #13 +
      '    PESSOA PB,   ' + #13 +
      '    TIPODOCRECPAG TD,  ' + #13 +
      '    PESSOA PD,      ' + #13 +
      '    (SELECT     ' + #13 +
      '        VALOR,CODDOCUMENTO, DATALANCTO ' + #13 +
      '     FROM ' + #13 +
      '        LANCTODOCUM WHERE RTRIM(OPERACAO) IN (''1'',''2'',''3'',''15'',''10'')) LANC   ' + #13 +
      ' WHERE    ' + #13 +
      ' ((RTRIM(D.OPERACAO) = ''10'') OR (RTRIM(D.OPERACAO) = ''15'') OR (D.STATUS = ''2'') OR ((D.STATUS = ''0'') AND (L.ESTORNO > 0))) AND   ' + #13
        +
      ' (D.RECPAG = :PRECPAG)                AND  ' + #13 +
      ' (D.IDPESSOA = :PIDEMPRESA)           AND  ' + #13 +
      ' (D.NUMCPBAIXA = :PNUMAPGR)              AND  ' + #13 +
      ' (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND  ' + #13 +
      ' (D.IDFORCLI = PD.IDPESSOA)           AND  ' + #13 +
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND  ' + #13 +
      ' (R.NUMLANCTO = L.NUMLANCTO)          AND  ' + #13 +
      ' (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND ' + #13 +
      ' (R.CODPORTFORMA = P.CODPORTFORMA)    AND ' + #13 +
      ' (PC.IDBANCO = B.IDPESSOA)	    AND   ' + #13 +
      ' (B.IDPESSOA = PB.IDPESSOA)           AND  ' + #13 +
      ' (D.IDFORCLI = E.IDFORCLI)            AND  ' + #13 +
      ' (D.IDPESSOA = E.IDPESSOA)            AND   ' + #13 +
      ' (P.CODPORTADOR = PC.CODPORTADOR)     AND   ' + #13 +
      ' (PL.PLNCODIGO(+) = L.PLNCODIGO)      AND ' + #13 +
      ' (AG.IDPESSOA = PC.IDAGENCIA)         AND   ' + #13 +
      ' (TD.CODTIPDOC = D.CODTIPDOC) ' + #13 +
      'UNION  ' + #13 +
      'SELECT   ' + #13 +
      '       D.NUMAPGR, ' + #13 +
      '       D.PLANO,   ' + #13 +
      '       B.NUMBANCO, ' + #13 +
      '       PB.RAZAOSOCIAL AS NOMEBANCO, ' + #13 +
      '       AG.NUMAGENCIA,' + #13 +
      '       PC.NOCONTACORR, ' + #13 +
      '       L.DATALANCTO,   ' + #13 +
      '       TD.DESCRICAO AS TIPODOC, ' + #13 +
      '       PD.RAZAOSOCIAL AS FORCLI, ' + #13 +
      '       D.CODDOCUMENTO,     ' + #13 +
      '       (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,  ' + #13 +
      '       R.NUMCHQBORDERO,      ' + #13 +
      '       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTACONTABIL,' + #13 +
      '       (''BAIXA DOC Nº '' || D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS HISTORICO,' + #13 +
      '       L.DEBCRE,   ' + #13 +
      '       L.VALOR,  ' + #13 +
      '       LANC.VALOR AS VALORDOC,    ' + #13 +
      '       LANC.DATALANCTO AS DATADOC, ' + #13 +
      '       DECODE(L.ESTORNO,NULL,'''',''PAGAMENTO CANCELADO\ESTORNADO'') AS DESCESTORNO ' + #13 +
      'FROM  ' + #13 +
      '    DOCUMENTO D, ' + #13 +
      '    LANCTODOCUM L, ' + #13 +
      '    EMPRESAFORN E, ' + #13 +
      '    RECBTOPAGTO R,  ' + #13 +
      '    PORTADORFORMA P, ' + #13 +
      '    PORTADORCONTA PC,  ' + #13 +
      '    PLANILHA PL,     ' + #13 +
      '    AGENCIABANCARIA AG,  ' + #13 +
      '    BANCO B,     ' + #13 +
      '    PESSOA PB,    ' + #13 +
      '    TIPODOCRECPAG TD, ' + #13 +
      '    PESSOA PD,     ' + #13 +
      '    (SELECT        ' + #13 +
      '        VALOR,CODDOCUMENTO, DATALANCTO    ' + #13 +
      '     FROM        ' + #13 +
      '        LANCTODOCUM WHERE RTRIM(OPERACAO) IN (''1'',''2'',''3'',''15'',''10'')) LANC ' + #13 +
      ' WHERE  ' + #13 +
      ' ((RTRIM(D.OPERACAO) = ''10'') OR (RTRIM(D.OPERACAO) = ''15'') OR (D.STATUS = ''2'') OR ((D.STATUS = ''0'') AND (L.ESTORNO > 0))) AND ' + #13
        +
      ' (D.RECPAG = :PRECPAG)                AND     ' + #13 +
      ' (D.IDPESSOA = :PIDEMPRESA)           AND  ' + #13 +
      ' (D.NUMCPBAIXA = :PNUMAPGR)              AND  ' + #13 +
      ' (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND  ' + #13 +
      ' (D.IDFORCLI = PD.IDPESSOA)           AND ' + #13 +
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND ' + #13 +
      ' (R.NUMLANCTO = L.NUMLANCTO)          AND ' + #13 +
      ' (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND ' + #13 +
      ' (R.CODPORTFORMA = P.CODPORTFORMA)    AND ' + #13 +
      ' (PC.IDBANCO = B.IDPESSOA)	    AND  ' + #13 +
      ' (B.IDPESSOA = PB.IDPESSOA)           AND  ' + #13 +
      ' (D.IDFORCLI = E.IDFORCLI)            AND  ' + #13 +
      ' (D.IDPESSOA = E.IDPESSOA)            AND  ' + #13 +
      ' (P.CODPORTADOR = PC.CODPORTADOR)     AND   ' + #13 +
      ' (PL.PLNCODIGO(+) = L.PLNCODIGO)      AND  ' + #13 +
      ' (AG.IDPESSOA = PC.IDAGENCIA)         AND  ' + #13 +
      ' (TD.CODTIPDOC = D.CODTIPDOC) ' + #13 +
      ')        ' + #13 +
      'ORDER BY   ' + #13 +
      '  PLANO, ' + #13 +
      '  NUMBANCO,   ' + #13 +
      '  NOCONTACORR,  ' + #13 +
      '  NUMCHQBORDERO,  ' + #13 +
      '  CODDOCUMENTO, ' + #13 +
      '  DATALANCTO,  ' + #13 +
      '  DEBCRE   ';

    If ParamIntegra.RecPag = 'R' Then SqlAp.SQL.Text := SqlGr.SQL.Text;

    SqlTotApGr.Open;

    With SqlAp Do
    Begin
      Prepare;
      ParamByName('PIDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;
      ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
      ParamByName('PNUMAPGR').AsInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
      Open;
    End;

    CdsApAfterScroll(CdsAp);

    If CmpRptCM.ParamValues[1].AsBoolean Then
    Begin
      CdsAp.Filtered := False;
      CdsAp.Filter := 'DESCESTORNO = ''PAGAMENTO CANCELADO\ESTORNADO''';
      CdsAp.Filtered := True;
    End
    Else
    Begin
      CdsAp.Filtered := False;
      CdsAp.Filter := '';
    End;
  End;
End;

procedure TRptApGr2.CdsApAfterScroll(DataSet: TDataSet);
begin
  inherited;
  With SqlContab3 Do
  Begin
    Prepare;
    ParamByName('CodDocumento').AsFloat := CdsAp.FieldByName('CodDocumento').AsFloat;
    open;
  End;

  With SqlContabLanc Do
  Begin
    Prepare;
    ParamByName('CodDocumento').AsFloat := CdsAp.FieldByName('CodDocumento').AsFloat;
    open;
  End;
end;

End.

