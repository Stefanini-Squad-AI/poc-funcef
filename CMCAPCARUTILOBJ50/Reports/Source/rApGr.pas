{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
 -------------------------------------------------------------------------------
// Autor(a)  : Marcus Oliveira
// Data      : 15/08/2007
// Pendência : 25941
// Alteração : Exibir o total do Cheque borderô
//------------------------------------------------------------------------------
// Autor(a)  : Antonio Marcos (amf)
// Data      : 25/05/2006
// Pendência : 22321
// Alteração : Alteração na sqlGr(.dfm) e na sqlAp (.pas):
//             A Autorização de Pagamento e A Guia de Recebimento com múltiplas contas
//             de baixa, estavam considerando a conta do fornecedor ao invés das
//             contas contábeis do Tipo de Reembolso.
//------------------------------------------------------------------------------
// Rotina    : CrmRptCMBeforePrint
// Autor(a)  : Bruno Bastos
// Data      : 16/11/2004
// Pendência : 16929
// Alteração : Alterada a query cdsContabLanc para não trazer registro caso o
//             usuário não marque o checkbox para apresentar os lançamentos de
//             provisionamento contábil na form filtro (FRelApGr).
//------------------------------------------------------------------------------
// Alteração : Alterado o Order by da query
// Rotina    : SqlAp (.sql)
// Autor(a)  : tavares
// Data      : 07/08/2004
// Pendência : 17291
// Alteração : Alterado a query para trazer as aps com documentos grupados
//------------------------------------------------------------------------------
// Rotina    : SqlAp (.sql)
// Autor(a)  : Gleyber
// Data      : 05/08/2003
// Pendência : 14888
// -----------------------------------------------------------------------------
// Rotina    : Propriedade SkipWhenNoRecords dos componentes PpTotApGr,
//             PpContabLanc e PpContab3
// Autor(a)  : Gleyber
// Data      : 05/08/2003
// Pendência : 14783
// Alteração : Alterado para False para mostrar o relatório quando as
//             subqueries forem vazias
// -----------------------------------------------------------------------------
// Rotina    : CrmRptCMBeforePrint
// Autor(a)  : DAVID
// Data      : 11/03/2004
// Pendência : 16183
// Alteração : Alterada a condição da query para trazer documentos parcialmente
//             pagos.
// -----------------------------------------------------------------------------}

Unit rApGr;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppReport,
  ppSubRpt, ppBands, ppClass, ppVar, ppStrtch, ppMemo, ppPrnabl, ppCache,
  ppProd, Db, DBTables, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  Wwquery, uMensErro, TXRB, uSistema;

Type
  TRptApGr = Class(TFrmCmReport)
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
    RptApGr: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel122: TppLabel;
    LblApGr: TppLabel;
    ppLine55: TppLine;
    RptApGrDBText8: TppDBText;
    ppDetailBand28: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText49: TppDBText;
    ppDBText53: TppDBText;
    RptApGrDBMemo1: TppDBMemo;
    ppFooterBand27: TppFooterBand;
    RptApGrShape3: TppShape;
    ppLine56: TppLine;
    ppLabel126: TppLabel;
    RptApGrShape1: TppShape;
    RptApGrShape2: TppShape;
    RptApGrLabel1: TppLabel;
    Lblag1: TppLabel;
    Lblag2: TppLabel;
    Lblag3: TppLabel;
    RptApGrShape4: TppShape;
    Lblag4: TppLabel;
    RptApGrShape5: TppShape;
    Lblag5: TppLabel;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    RptApGrSummaryBand1: TppSummaryBand;
    RptApGrLine3: TppLine;
    RptApGrLabel7: TppLabel;
    RptApGrDBText11: TppDBText;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLabel140: TppLabel;
    ppDBText63: TppDBText;
    ppDBText62: TppDBText;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLine60: TppLine;
    RptApGroup1: TppGroup;
    RptApGroupHeaderBand1: TppGroupHeaderBand;
    RptApGrLabel2: TppLabel;
    RptApGrDBText1: TppDBText;
    RptApGrDBText2: TppDBText;
    RptApGrLine1: TppLine;
    RptApGrLabel3: TppLabel;
    RptApGroupFooterBand1: TppGroupFooterBand;
    RptApGrGroup1: TppGroup;
    RptApGrGroupHeaderBand1: TppGroupHeaderBand;
    RptApLine1: TppLine;
    LblNumChq: TppLabel;
    DbNumChq: TppDBText;
    RptApGrLabel6: TppLabel;
    RptApGrDBText10: TppDBText;
    RptApGrGroupFooterBand1: TppGroupFooterBand;
    RptApGrGroup2: TppGroup;
    RptApGrGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppDBText60: TppDBText;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel138: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    RptApGrLabel4: TppLabel;
    RptApGrDBText3: TppDBText;
    RptApGrDBText9: TppDBText;
    RptApGrLabel5: TppLabel;
    LblDbEstorno: TppDBText;
    RptApGrLine2: TppLine;
    RptApGrGroupFooterBand2: TppGroupFooterBand;
    RptContab3: TppSubReport;
    RptApGrChildReport2: TppChildReport;
    RptApGrDetailBand1: TppDetailBand;
    RptApGrDBText4: TppDBText;
    RptApGrDBText6: TppDBText;
    RptApGrDBText7: TppDBText;
    RptApGrChildReport2DBMemo1: TppDBMemo;
    RptContabLanc: TppSubReport;
    RptApGrChildReport1: TppChildReport;
    RptApGrChildReport1DetailBand1: TppDetailBand;
    RptApGrChildReport1DBText1: TppDBText;
    RptApGrChildReport1DBText3: TppDBText;
    RptApGrChildReport1DBText4: TppDBText;
    RptApGrChildReport1DBMemo1: TppDBMemo;
    DsContabLanc: TwwDataSource;
    PpContabLanc: TppBDEPipeline;
    DsContab3: TwwDataSource;
    PpContab3: TppBDEPipeline;
    SqlAp: TCMSqlParams;
    CdsAp: TCMClientDataSet;
    PpTotApGr: TppBDEPipeline;
    DsTotApGr: TwwDataSource;
    SqlGr: TCMSqlParams;
    CdsGr: TCMClientDataSet;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    CdsTotApGr: TwwQuery;
    CdsContabLanc: TwwQuery;
    CdsContab3: TwwQuery;
    CdsTotApGrNUMAPGR: TFloatField;
    CdsTotApGrVALOR: TFloatField;
    CdsContabLancOPERACAO: TStringField;
    CdsContabLancLACDEBCRE: TStringField;
    CdsContabLancPLACONTA: TStringField;
    CdsContabLancLACVALOR: TFloatField;
    CdsContabLancHISTLANCAMENTOCONTABIL: TStringField;
    lblMostraProv: TppLabel;
    sqlCalBordero: TCMSqlParams;
    cdsCalBordero: TCMClientDataSet;
    bordero: TppBDEPipeline;
    dsBordero: TwwDataSource;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure RptApGrDBText10Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptApGr: TRptApGr;

Implementation

{$R *.DFM}

Procedure TRptApGr.CrmRptCMBeforePrint(Sender: TObject);
var
  LblRelats: TppLabel;
Begin
  Inherited;

  Try
    SqlTeste.SQL.Text := 'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
      + FloatToStr(CrmRptCM.IdModulo) + ') AND (IDPESSOA = '
      + FloatToStr(CrmRptCM.idEmpresa) + ')';
    SqlTeste.Open;
    CdsTeste.First;
    While Not CdsTeste.Eof Do
    Begin
      Try
        LblRelats := (FindComponent(CdsTeste.FieldByName('NOMECOMPO').AsString) As TppLabel);
        If LblRelats = Nil Then
          LblRelats := (FindComponent(Cdsteste.FieldByName('NOMECOMPO').AsString) As TppLabel);

        If LblRelats <> Nil Then
          LblRelats.Caption := CdsTeste.FieldByName('VALOR').AsString;
      Finally
        CdsTeste.Next;
      End;
    End;

    CdsTotApGr.sql.text :=
//      'SELECT  /*+ RULE */ D.NUMAPGR,  ' + #13 +    //Everson TIBERO
      'SELECT D.NUMAPGR,  ' + #13 +   //Everson TIBERO
      '  SUM(decode(l.operacao,''10'',DECODE(D.RECPAG,''R'',DECODE(DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,''C'',L.VALOR,L.VALOR*-1)),     ' + #13
        +
      '      DECODE(D.RECPAG,''R'',DECODE(DEBCRE,''C'',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,''D'',L.VALOR,L.VALOR*-1)) ) ) AS VALOR  ' + #13
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
      '       L.VALOR AS VALORDOC,                              ' + #13 +
      '       LANC.VALOR AS VALOR,                              ' + #13 +
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
      ' ((RTRIM(D.OPERACAO) = ''3'') OR (RTRIM(D.OPERACAO) = ''10'') OR (RTRIM(D.OPERACAO) = ''15'') OR (RTRIM(D.OPERACAO) = ''2'') OR ((D.STATUS = ''0'') AND (L.ESTORNO > 0))) AND ' + #13 +
      ' (D.RECPAG = :PRECPAG)                AND  ' + #13 +
      ' (D.IDPESSOA = :PIDEMPRESA)           AND  ' + #13 +
      ' (D.NUMAPGR = :PNUMAPGR)              AND  ' + #13 +
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
      '       DECODE(D.PLACONTA,NULL,BD.PLACONTA ,D.PLACONTA) AS CONTACONTABIL,' + #13 +
      '       (''BAIXA DOC Nº '' || D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS HISTORICO,' + #13 +
      '       L.DEBCRE,   ' + #13 +
      '       L.VALOR,  ' + #13 +
      '       DECODE(D.PLACONTA,NULL,BD.VALOR ,L.VALOR) AS CONTACONTABIL, ' + #13 +
      '       L.DATALANCTO AS DATADOC,                            ' + #13 +
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
      '    CCBAIXASXDOCUM BD ' + #13 +
      ' WHERE  ' + #13 +
      ' ((RTRIM(D.OPERACAO) = ''3'') OR (RTRIM(D.OPERACAO) = ''10'') OR (RTRIM(D.OPERACAO) = ''15'') OR (RTRIM(D.OPERACAO) = ''2'') OR ((D.STATUS = ''0'') AND (L.ESTORNO > 0))) AND ' + #13 +
      //fim  andre tavares - pendencia 17291 - 04/08/2004

      ' (D.RECPAG = :PRECPAG)                AND     ' + #13 +
      ' (D.IDPESSOA = :PIDEMPRESA)           AND  ' + #13 +
      ' (D.NUMAPGR = :PNUMAPGR)              AND  ' + #13 +
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
      ' (TD.CODTIPDOC = D.CODTIPDOC)              ' + #13 +
      ' AND (D.CODDOCUMENTO = BD.CODDOCUMENTO(+)) ' + #13 +
      ')        ' + #13 +
      'ORDER BY   ' + #13 +
      '  NUMBANCO,   ' + #13 +
      '  FORCLI,   ' + #13 + // Gleyber - 20/08/2003 - Pendencia 14888
      '  NOCONTACORR,  ' + #13 +
      '  NUMCHQBORDERO,  ' + #13 +
      '  CODDOCUMENTO, ' + #13 +
      '  DATALANCTO,  ' + #13 +
      '  DEBCRE   ';

    //Bruno Bastos - Pend. 16929 - Início
    {Foi colocado no where desta query  a linha 1=2, para que não retorne nenhuma
    linha}
    If Not CmpRptCM.ParamValues[2].AsBoolean Then
    Begin
      lblMostraProv.Caption := 'Sem Provisionamento Contábil';
      CdsContabLanc.Sql.Clear;
      CdsContabLanc.Sql.Add(' SELECT '+
                            '   DOC.OPERACAO, LC.LACDEBCRE, LC.PLACONTA, '+
                            '   LC.LACVALOR, LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC.LACHIST5 AS HISTLANCAMENTOCONTABIL '+
                            ' FROM '+
                            '   DOCUMENTO DOC, '+
                            '   LANCTODOCUM LAN, '+
                            '   LANCAMENTO LC '+
                            ' WHERE '+
                            '  (DOC.CODDOCUMENTO = :CODDOCUMENTO)    AND '+
                            '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND '+
                            '  (LAN.PLNCODIGO    = LC.PLNCODIGO)     AND '+
                            '  (LAN.OPERACAO     <> ''5'')           AND '+
                            '  (LAN.OPERACAO     <> ''15'')          AND '+
                            '  (LAN.OPERACAO     <> ''3'')           AND '+
                            '  ((DOC.OPERACAO    <> ''1'')           AND '+
                            '  ((DOC.NUMFATURA IS NULL) OR (DOC.NUMFATURA = 0))) AND '+
                            '  1 = 2 '+
                            ' ORDER BY '+
                            '   LC.LACDEBCRE, '+
                            '   LC.PLACONTA ');
    End;
    //Bruno Bastos - Pend. 16929 - Fim

    If ParamIntegra.RecPag = 'P' Then
    Begin
    End
    Else
      SqlAp.SQL.Text := SqlGr.SQL.Text;
    CdsTotApGr.Open;
    With SqlAp Do
    Begin
      Prepare;
      ParamByName('PIDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;
      ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
      ParamByName('PNUMAPGR').AsInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
      Open;
    End;

    //Marcus Oliveira P.25941 15/08/2007 Inicio
    sqlCalBordero.Prepare;
    sqlCalBordero.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa  ;
    sqlCalBordero.ParamByName('NUMAPGR').AsInteger   := StrToInt(CmpRptCM.ParamValues[0].AsString);
    //sqlCalBordero.ParamByName('NUMCHQB').AsInteger   := CdsAp.fieldByName('NUMCHQBORDERO').AsInteger;
    //pendência 26807 - 14/11/2007
    sqlCalBordero.ParamByName('NUMCHQB').asString   := CdsAp.fieldByName('NUMCHQBORDERO').asString; //CdsAp.fieldByName('NUMCHQBORDERO').AsInteger;
    sqlCalBordero.Open;
    //Marcus Oliveira P.25941 15/08/2007 Fim
    
    If CmpRptCM.ParamValues[1].AsBoolean Then
    Begin
      If (CdsTotApGr.FieldByName('VALOR').AsFloat > 0) Then
      Begin
        If (ParamIntegra.RecPag = 'P') Then
          LblApGr.Caption := 'Autorização de Pagamentos AP - CANCELADOS'
        Else
          LblApGr.Caption := 'Guia de Recebimento GR - CANCELADOS';
      End
      Else
        LblApGr.Caption := 'Guia De Devolução - CANCELADOS';
      CdsAp.Filter := 'DESCESTORNO = ''PAGAMENTO CANCELADO\ESTORNADO''';
      CdsAp.Filtered := True;
    End
    Else
    Begin
      If (CdsTotApGr.FieldByName('VALOR').AsFloat > 0) Then
      Begin
        If ParamIntegra.RecPag = 'P' Then
          LblApGr.Caption := 'Autorização de Pagamentos AP - GERAL'
        Else
          LblApGr.Caption := 'Guia de Recebimento GR - GERAL';
      End
      Else
        LblApGr.Caption := 'Guia De Devolução - GERAL';
      CdsAp.Filtered := False;
      CdsAp.Filter := '';
    End;
    CdsContab3.open;
    CdsContabLanc.open;
  Except
    on e: Exception do //pendência 26807 - 14/11/2007
    begin
      MsgDlg(e.message, 'Erro', mtWarning, [mbOk], 0);
    end;
//    MsgDlg('Para visualizar o relatório, favor restaurá-lo. ', 'Aviso', mtWarning, [mbOk], 0);
//    Exit;
  End;
End;

procedure TRptApGr.RptApGrDBText10Print(Sender: TObject);
begin
  inherited;
    //Marcus Oliveira P.25941 15/08/2007 Inicio
    sqlCalBordero.Prepare;
    sqlCalBordero.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa  ;
    sqlCalBordero.ParamByName('NUMAPGR').AsInteger   := StrToInt(CmpRptCM.ParamValues[0].AsString);
    sqlCalBordero.ParamByName('NUMCHQB').AsInteger   := CdsAp.fieldByName('NUMCHQBORDERO').AsInteger;
    sqlCalBordero.Open;
    //Marcus Oliveira P.25941 15/08/2007 Fim

end;

End.

