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
// Atualizado por: andre tavares - pendência 14794 - 27/01/2004

Unit rPosiFornCli;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlParamIntegra,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DBTables, Db,
  uCmSqlParams, DBClient, uCMClientDataSet, TXRB;

Type
  TRptPosiFornCli = Class(TFrmCmReport)
    PpPosiFornCli: TppBDEPipeline;
    RptPosiFornCli: TppReport;
    ppHeaderBand2: TppHeaderBand;
    LblTitulo: TppLabel;
    ppLabel4: TppLabel;
    RptPosiFornCliLabel1: TppLabel;
    RptPosiFornCliLabel2: TppLabel;
    RptPosiFornCliLabel3: TppLabel;
    RptPosiFornCliLabel4: TppLabel;
    RptPosiFornCliLabel5: TppLabel;
    RptPosiFornCliLabel6: TppLabel;
    RptPosiFornCliLabel7: TppLabel;
    LblTipoPosCli: TppLabel;
    LblJuros: TppLabel;
    ppDetailBand2: TppDetailBand;
    RptPosiFornCliDBText9: TppDBText;
    RptPosiFornCliDBText2: TppDBText;
    RptPosiFornCliDBText3: TppDBText;
    RptPosiFornCliDBText5: TppDBText;
    RptPosiFornCliDBText6: TppDBText;
    RptPosiFornCliDBText7: TppDBText;
    RptPosiFornCliDBText8: TppDBText;
    LblDbJuros: TppDBText;
    RptPosiFornCliDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    RptPosiFornCliSummaryBand1: TppSummaryBand;
    RptPosiFornCliDBCalc3: TppDBCalc;
    RptPosiFornCliDBCalc4: TppDBCalc;
    RptPosiFornCliLabel10: TppLabel;
    RptPosiFornCliLine2: TppLine;
    RptPosiFornCliLine1: TppLine;
    LblDbSumJuros: TppDBCalc;
    RptPosiFornCliGroup1: TppGroup;
    RptPosiFornCliGroupHeaderBand1: TppGroupHeaderBand;
    RptPosiFornCliDBText1: TppDBText;
    ppLine3: TppLine;
    RptPosiFornCliLine3: TppLine;
    lblDescricao: TppLabel;
    RptPosiFornCliGroupFooterBand1: TppGroupFooterBand;
    RptPosiFornCliDBCalc1: TppDBCalc;
    RptPosiFornCliDBCalc2: TppDBCalc;
    RptPosiFornCliLabel9: TppLabel;
    LblSumJuros: TppDBCalc;
    CdsPosiFornCli: TCMClientDataSet;
    SqlPosiFornCli: TCMSqlParams;
    DsPosiFornCli: TDataSource;
    CdsPosiFornCliIDFORCLI: TFloatField;
    CdsPosiFornCliNOME: TStringField;
    CdsPosiFornCliSALDO: TFloatField;
    CdsPosiFornCliCODDOCUMENTO: TFloatField;
    CdsPosiFornCliNUMDOCUMENTO: TStringField;
    CdsPosiFornCliNODOCUMENTO: TFloatField;
    CdsPosiFornCliCOMPLDOCUMENTO: TStringField;
    CdsPosiFornCliSALDOOM: TFloatField;
    CdsPosiFornCliDATAPROGRAMADA: TDateTimeField;
    CdsPosiFornCliHISTORICOCOMPL: TStringField;
    CdsPosiFornCliDATALANCTO: TDateTimeField;
    CdsPosiFornCliDATAVENCTO: TDateTimeField;
    CdsPosiFornCliINDICECORRECAO: TFloatField;
    CdsPosiFornCliVLRMULTA: TFloatField;
    CdsPosiFornCliVALORJUROS: TFloatField;
    CdsPosiFornCliIDTIPOCLIENTE: TFloatField;
    CdsPosiFornCliUSUARIO: TStringField;
    CdsPosiFornCliNOMEUSUARIO: TStringField;
    CdsPosiFornCliIDUSUARIOINCLUSAO: TFloatField;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptPosiFornCli: TRptPosiFornCli;

Implementation

Uses uString, uSistema;

{$R *.DFM}

Procedure TRptPosiFornCli.CrmRptCMBeforePrint(Sender: TObject);
Var
  rSaldoValorJuros,
    rValorJuros,
    rCorrecao,
    rIndiceCorrecao,
    rIndiceCorrecaoHoje: Real;
  bImprime, CkbAdiantoChecked, cbAtrasadosChecked, cbCalcJurosChecked, CkbImpValorJurosChecked: Boolean;
  DtFimText, dblcTipoDocText, CbCliText, CContabilContaNumero, CPForCliText,
    CPForCliForCliRegRazaoSocial, dblcTipoDocLookupValue, CbCliLookupValue, CContabilContaNome,
    ReTaxaJurosValue: String;
  RgOrdemItemIndex, CPForCliForCliRegId: Integer;
Begin
  Inherited;
  bImprime := CmpRptCM.ParamValues[0].AsBoolean;
  If bImprime Then
  Begin
    CkbAdiantoChecked := CmpRptCM.ParamValues[1].AsBoolean;
    cbAtrasadosChecked := CmpRptCM.ParamValues[2].AsBoolean;
    cbCalcJurosChecked := CmpRptCM.ParamValues[3].AsBoolean;
    CkbImpValorJurosChecked := CmpRptCM.ParamValues[4].AsBoolean;
    DtFimText := CmpRptCM.ParamValues[5].AsString;
    dblcTipoDocText := CmpRptCM.ParamValues[6].AsString;
    CbCliText := CmpRptCM.ParamValues[7].AsString;
    CContabilContaNumero := CmpRptCM.ParamValues[8].AsString;
    CPForCliText := CmpRptCM.ParamValues[9].AsString;
    CPForCliForCliRegRazaoSocial := CmpRptCM.ParamValues[10].AsString;
    dblcTipoDocLookupValue := CmpRptCM.ParamValues[11].AsString;
    CbCliLookupValue := CmpRptCM.ParamValues[12].AsString;
    CContabilContaNome := CmpRptCM.ParamValues[13].AsString;
    ReTaxaJurosValue := CmpRptCM.ParamValues[14].AsString;
    RgOrdemItemIndex := StrToInt(CmpRptCM.ParamValues[15].AsString);
    CPForCliForCliRegId := StrToInt(CmpRptCM.ParamValues[16].AsString);
    LblTipoPosCli.Caption := '';
    If ParamIntegra.RecPag = 'P' Then
    Begin
      lblDescricao.Caption := 'Fornecedor:';
      LblTitulo.Caption := 'Posição Por Fornecedores em ' + DtFimText;
    End
    Else
    Begin
      LblTitulo.Caption := 'Posição Por Clientes em ' + DtFimText;
      lblDescricao.Caption := 'Cliente:';
    End;
    If CkbAdiantoChecked Then
      LblTitulo.Caption :=
        LblTitulo.Caption + ' - Sem Inclusão de Adiantamentos';
    If Trim(dblcTipoDocText) <> '' Then
      LblTitulo.Caption := LblTitulo.Caption + ' Somente ' + dblcTipoDocText;

    With SqlPosiFornCli Do
    Begin
      Close;
      SQL.Clear;
//      SQL.Add('SELECT  /*+ RULE */ D.IDFORCLI,D.NOME,                                     ');  //Everson TIBERO
      SQL.Add('SELECT D.IDFORCLI,D.NOME,                                     ');  //Everson TIBERO
      SQL.Add('       SUM(U.SALDO) AS SALDO, U.CODDOCUMENTO, D.NUMDOCUMENTO,              ');
      SQL.Add('       D.NODOCUMENTO, D.COMPLDOCUMENTO, SUM(U.SALDOOM) AS SALDOOM,         ');
      SQL.Add('       D.DATAPROGRAMADA,                                                   ');
      SQL.Add('       D.HISTORICOCOMPL,                                                   ');
      SQL.Add('       D.DATALANCTO,                                                       ');
      SQL.Add('       D.DATAVENCTO,                                                       ');
      SQL.Add('       D.INDICECORRECAO,                                                   ');
      SQL.Add('       D.VLRMULTA,                                                         ');
      SQL.Add('       D.VALORJUROS,                                                       ');
      SQL.Add('       D.IDTIPOCLIENTE                                                     ');

      // início - andre tavares - pendência 14794 - 27/01/2004
      SQL.Add(' ,P.NOME AS USUARIO, USU.NOMEUSUARIO, D.IDUSUARIOINCLUSAO                  ');
      // fim - andre tavares - pendência 14794 - 27/01/2004

      SQL.Add('                                                            ');
      SQL.Add('FROM                                                                       ');
      SQL.Add('(SELECT D.IDFORCLI,P.RAZAOSOCIAL AS NOME,                                  ');
      SQL.Add('        D.CODDOCUMENTO, P.NUMDOCUMENTO,                                    ');
      SQL.Add('        D.NODOCUMENTO, D.COMPLDOCUMENTO,                                   ');
      SQL.Add('        D.DATAPROGRAMADA, D.CODTIPDOC,                                     ');
      SQL.Add('        MAX(L.HISTORICOCOMPL) AS HISTORICOCOMPL,                           ');
      SQL.Add('        MIN(L.DATALANCTO) AS DATALANCTO,                                   ');
      SQL.Add('        D.DATAVENCTO,                                                      ');
      SQL.Add('        D.INDICECORRECAO,                                                  ');
      SQL.Add('        D.VLRMULTA,                                                        ');
      SQL.Add('        D.VALORJUROS,                                                      ');
      If ParamIntegra.RecPag = 'R' Then
        SQL.Add('       T.IDTIPOCLIENTE                                                     ')
      Else
        SQL.Add('       (0) AS IDTIPOCLIENTE                                                ');

      // início - andre tavares - pendência 14794 - 27/01/2004
      SQL.Add(', L.IDUSUARIOINCLUSAO                                                      ');
      // fim - andre tavares - pendência 14794 - 27/01/2004

      SQL.Add('FROM                                                                       ');
      SQL.Add('   DOCUMENTO D,                                                            ');
      SQL.Add('   LANCTODOCUM L,                                                          ');
      If ParamIntegra.RecPag = 'R' Then
      Begin
        SQL.Add('   CLIENTEPESS C,                                                          ');
        SQL.Add('   TIPOCLIENTE T,                                                          ');
      End;
      SQL.Add('   PESSOA P                                                                ');
      SQL.Add('WHERE (D.IDFORCLI = P.IDPESSOA)                                            ');
      SQL.Add('  AND (D.RECPAG = :RECPAG)                                                 ');
      SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                             ');
      SQL.Add('  AND (D.CODDOCUMENTO = L.CODDOCUMENTO)                                    ');
      SQL.Add('  AND (D.OPERACAO     = L.OPERACAO)                                        ');
      If trim(dblcTipoDocText) <> '' Then
        SQL.Add('  AND (D.CODTIPDOC = :CODTIPDOC)                                           ');
      If ParamIntegra.RecPag = 'R' Then
      Begin
        SQL.Add('  AND (D.IDFORCLI = C.IDPESSOA(+))                                         ');
        SQL.Add('  AND (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+))                               ');
        If Trim(CbCliText) <> '' Then
          SQL.Add('  AND (T.IDTIPOCLIENTE = :IDTIPOCLIENTE)                                   ');
      End;
      SQL.Add('GROUP BY D.IDFORCLI,P.RAZAOSOCIAL, D.CODTIPDOC,                            ');
      SQL.Add('         D.CODDOCUMENTO, P.NUMDOCUMENTO,                                   ');
      SQL.Add('         D.NODOCUMENTO, D.COMPLDOCUMENTO,                                  ');
      If ParamIntegra.RecPag = 'R' Then
        SQL.Add('         T.IDTIPOCLIENTE,                                                  ');
      SQL.Add('         D.DATAPROGRAMADA,                                                 ');
      SQL.Add('         D.DATAVENCTO,                                                     ');
      SQL.Add('         D.INDICECORRECAO,                                                 ');
      SQL.Add('         D.VLRMULTA,                                                       ');

      // início - andre tavares - pendência 14794 - 27/01/2004
      SQL.Add('         L.IDUSUARIOINCLUSAO,                                              ');
      // fim - andre tavares - pendência 14794 - 27/01/2004

      SQL.Add('         D.VALORJUROS) D,                                                  ');
      SQL.Add('(                                                                          ');
      SQL.Add('(SELECT D.CODDOCUMENTO,                                                    ');
      SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM, ');
      SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO    ');
      SQL.Add('FROM DOCUMENTO D,                                                          ');
      SQL.Add('     LANCTODOCUM L                                                         ');
      SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                                    ');
      SQL.Add('  AND (D.RECPAG = :RECPAG)                                                 ');
      SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                             ');
      If Trim(CContabilContaNumero) <> '' Then
        SQL.Add('  AND (D.PLACONTA = :PLACONTA)                                             ');
      If trim(CPForCliText) <> '' Then
        SQL.Add('  AND (D.IDFORCLI = :IDFORCLI)                                             ');
      SQL.Add('  AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))                   ');
      SQL.Add('  AND ((D.OPERACAO = ''2 '') OR                                            ');
      If Not CkbAdiantoChecked Then
        SQL.Add('      (D.OPERACAO = ''15'') OR                                             ');
      SQL.Add('      ((D.OPERACAO = ''1 '') AND (D.NUMFATURA IS NULL ) ) )                ');
      SQL.Add('GROUP BY                                                                   ');
      SQL.Add('       D.CODDOCUMENTO                                                      ');
      SQL.Add(')                                                                          ');
      SQL.Add('UNION ALL                                                                  ');
      SQL.Add('(                                                                          ');
      SQL.Add('SELECT D.CODDOCUMENTO,                                                   ');
      SQL.Add('       (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))))*S1.SALDOOM1/DECODE(S3.SALDOOM3,0,NULL,S3.SALDOOM3)  AS SALDOOM, ');
      SQL.Add('       (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))))*S1.SALDO1/DECODE(S3.SALDO3,0,NULL,S3.SALDO3) AS SALDO ');
      SQL.Add('FROM DOCUMENTO D,                                                          ');
      SQL.Add('     LANCTODOCUM L,                                                        ');
      SQL.Add('     (SELECT D.NUMFATURA,                                                  ');
      SQL.Add('             SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM1, ');
      SQL.Add('             SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO1 ');
      SQL.Add('      FROM DOCUMENTO D,                                                    ');
      SQL.Add('           LANCTODOCUM L                                                   ');
      SQL.Add('      WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                              ');
      SQL.Add('        AND (D.OPERACAO = ''1 '')                                          ');
      SQL.Add('        AND (D.RECPAG = :RECPAG)                                           ');
      SQL.Add('        AND (D.IDPESSOA = :IDPESSOA)                                             ');
      If Trim(CContabilContaNumero) <> '' Then
        SQL.Add('        AND (D.PLACONTA = :PLACONTA)                                             ');
      If trim(CPForCliText) <> '' Then
        SQL.Add('        AND (D.IDFORCLI = :IDFORCLI)                                             ');
      SQL.Add('        AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))             ');
      SQL.Add('        AND (D.NUMFATURA IS NOT NULL)                                      ');
      SQL.Add('      GROUP BY D.NUMFATURA) S1,                                            ');
      SQL.Add('     (SELECT D.NUMFATURA,                                                  ');
      SQL.Add('            DECODE( NVL(  SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) ,0),0,1,  ');
      SQL.Add('            SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1)))) AS SALDOOM3, ');
      SQL.Add('            DECODE( NVL(  SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))),0),0,1, ');
      SQL.Add('            SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1)))) AS SALDO3 ');
      SQL.Add('      FROM DOCUMENTO D,                                                    ');
      SQL.Add('           LANCTODOCUM L                                                   ');
      SQL.Add('      WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                              ');
      SQL.Add('        AND (D.OPERACAO = L.OPERACAO)                                      ');
      SQL.Add('        AND (D.OPERACAO = ''3 '')                                          ');
      SQL.Add('        AND (D.RECPAG = :RECPAG)                                             ');
      SQL.Add('        AND (D.IDPESSOA = :IDPESSOA)                                             ');
      If Trim(CContabilContaNumero) <> '' Then
        SQL.Add('        AND (D.PLACONTA = :PLACONTA)                                             ');
      If trim(CPForCliText) <> '' Then
        SQL.Add('        AND (D.IDFORCLI = :IDFORCLI)                                             ');
      SQL.Add('        AND (D.NUMFATURA IS NOT NULL)                                      ');
      SQL.Add('      GROUP BY D.NUMFATURA) S3                                             ');
      SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                                    ');
      SQL.Add('  AND (D.OPERACAO = L.OPERACAO)                                            ');
      SQL.Add('  AND (D.NUMFATURA = S1.NUMFATURA)                                         ');
      SQL.Add('  AND (D.NUMFATURA = S3.NUMFATURA)                                         ');
      SQL.Add('  AND (D.RECPAG = :RECPAG)                                                 ');
      SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                             ');
      If Trim(CContabilContaNumero) <> '' Then
        SQL.Add('  AND (D.PLACONTA = :PLACONTA)                                             ');
      If trim(CPForCliText) <> '' Then
        SQL.Add('  AND (D.IDFORCLI = :IDFORCLI)                                             ');
      SQL.Add('  AND (D.OPERACAO =''3 '')                                                 ');
      SQL.Add('GROUP BY                                                                   ');
      SQL.Add('       D.CODDOCUMENTO,                                                     ');
      SQL.Add('       S1.SALDOOM1,                                                        ');
      SQL.Add('       S3.SALDOOM3,                                                        ');
      SQL.Add('       S1.SALDO1,                                                          ');
      SQL.Add('       S3.SALDO3)                                                          ');
      SQL.Add('UNION ALL                                                                  ');
      SQL.Add('(                                                                          ');
      SQL.Add('SELECT D.CODDOCUMENTO,                                                     ');
      SQL.Add('       SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM, ');
      SQL.Add('       SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO ');
      SQL.Add('FROM DOCUMENTO D,                                                          ');
      SQL.Add('     LANCTODOCUM L                                                         ');
      SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                                    ');
      SQL.Add('  AND (D.RECPAG = :RECPAG)                                              ');
      SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                             ');
      If Trim(CContabilContaNumero) <> '' Then
        SQL.Add('  AND (D.PLACONTA = :PLACONTA)                                             ');
      If trim(CPForCliText) <> '' Then
        SQL.Add('  AND (D.IDFORCLI = :IDFORCLI)                                             ');
      SQL.Add('  AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))                ');
      SQL.Add('  AND (D.OPERACAO =''3 '')                                              ');
      SQL.Add('  AND (L.OPERACAO <> ''3 '')                                            ');
      SQL.Add('GROUP BY                                                                   ');
      SQL.Add('       D.CODDOCUMENTO)                                                     ');
      SQL.Add(') U                                                                        ');

      // início - andre tavares - pendência 14794 - 27/01/2004
      SQL.Add(' ,PESSOA P, USUARIOSISTEMA USU                                             ');
      // fim - andre tavares - pendência 14794 - 27/01/2004

      SQL.Add('WHERE                                                                      ');
      SQL.Add('      (U.CODDOCUMENTO = D.CODDOCUMENTO)                                    ');

      // início - andre tavares - pendência 14794 - 27/01/2004
      SQL.Add('      AND   (D.IDUSUARIOINCLUSAO = P.IDPESSOA)          AND                ');
      SQL.Add('      (P.IDPESSOA = USU.IDUSUARIO)                                         ');

      if trim(CmpRptCM.ParamValues[17].AsString) <> '' then
        SQL.Add('    AND (D.IDUSUARIOINCLUSAO = ' + CmpRptCM.ParamValues[17].AsString +') ');
      // fim - andre tavares - pendência 14794 - 27/01/2004

      If trim(dblcTipoDocText) <> '' Then
        SQL.Add('  AND (D.CODTIPDOC = :CODTIPDOC)                                           ');
      If cbAtrasadosChecked Then
        SQL.Add('  AND (D.DATAPROGRAMADA < TO_DATE(:DATAREF,''DD/MM/YYYY''))             ');
      SQL.Add('GROUP BY D.IDFORCLI,D.NOME,                                                ');
      SQL.Add('         U.CODDOCUMENTO, D.NUMDOCUMENTO,                                   ');
      SQL.Add('         D.NODOCUMENTO, D.COMPLDOCUMENTO,                                  ');
      SQL.Add('         D.DATAPROGRAMADA,                                                 ');
      SQL.Add('         D.HISTORICOCOMPL,                                                 ');
      SQL.Add('         D.DATALANCTO,                                                     ');
      SQL.Add('         D.DATAVENCTO,                                                     ');
      SQL.Add('         D.INDICECORRECAO,                                                 ');
      SQL.Add('         D.VLRMULTA,                                                       ');
      SQL.Add('         D.VALORJUROS,                                                     ');
      SQL.Add('         D.IDTIPOCLIENTE                                                   ');

      // início - andre tavares - pendência 14794 - 27/01/2004
      SQL.Add('   ,P.NOME, USU.NOMEUSUARIO,  D.IDUSUARIOINCLUSAO                          ');
      // fim - andre tavares - pendência 14794 - 27/01/2004

      SQL.Add('HAVING ROUND(SUM(U.SALDO),2) <> 0                                          ');
      SQL.Add('ORDER BY D.NOME, D.IDFORCLI,                                               ');

      If RgOrdemItemIndex = 0 Then
        SQL.Add('         D.DATAPROGRAMADA                                                  ')
      Else
        SQL.Add('         D.NODOCUMENTO                                                     ');
      Prepare;
      ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
      ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      ParamByName('DATAREF').AsString := DtFimText;
      If CPForCliForCliRegRazaoSocial <> '' Then
        ParamByName('IDFORCLI').AsInteger := CPForCliForCliRegId;
      If Trim(CContabilContaNumero) <> '' Then
        ParamByName('PLACONTA').AsString := Espaco(CContabilContaNumero, 18);
      If trim(dblcTipoDocText) <> '' Then
        ParamByName('CODTIPDOC').AsInteger := StrToInt(dblcTipoDocLookupValue);
      If (ParamIntegra.RecPag = 'R') And (CbCliText <> '') Then
      Begin
        ParamByName('IDTIPOCLIENTE').AsInteger := StrToInt(CbCliLookupValue);
        LblTipoPosCli.Text := 'Tipo de Cliente: ' + CbCliText;
      End
      Else
      Begin
        LblTipoPosCli.Text := '';
      End;
      If LblTipoPosCli.Caption <> '' Then
        LblTipoPosCli.Caption :=
          LblTipoPosCli.Caption + ' - ';

      LblTipoPosCli.Caption := LblTipoPosCli.Caption +
        ' Conta Contábil: ' + Trim(CContabilContaNumero) + ' / ' + Trim(CContabilContaNome);

      Open;

      LblJuros.Visible := (cbCalcJurosChecked Or CkbImpValorJurosChecked);
      LblDbJuros.Visible := (cbCalcJurosChecked Or CkbImpValorJurosChecked);
      LblDbSumJuros.Visible := (cbCalcJurosChecked Or CkbImpValorJurosChecked);
      LblSumJuros.Visible := (cbCalcJurosChecked Or CkbImpValorJurosChecked);

    End;
    With CdsPosiFornCli Do
    Begin
      If cbCalcJurosChecked Or CkbImpValorJurosChecked Then
      Begin
        First;
        While Not Eof Do
        Begin
          If Date > FieldByName('DataVencto').AsDateTime Then
          Begin
            rValorJuros := 0;
            rSaldoValorJuros := 0;

            If ((Not FieldByName('INDICECORRECAO').IsNull) And
              (FieldByName('INDICECORRECAO').value <> 0)) Or
              ((Not FieldByName('VLRMULTA').IsNull) And
              (FieldByName('VLRMULTA').value <> 0)) Or
              ((Not FieldByName('VALORJUROS').IsNull) And
              (FieldByName('VALORJUROS').value <> 0)) Then
            Begin
              rCorrecao := 0;
              If Not FieldByName('INDICECORRECAO').IsNull Then
              Begin
                rIndiceCorrecao := FuncaoGeral.TestaCotacaoMoeda(FieldByName('INDICECORRECAO').AsInteger,
                  FieldByName('DataVencto').AsString, 'N');
                rIndiceCorrecaoHoje := FuncaoGeral.TestaCotacaoMoeda(
                  FieldByName('INDICECORRECAO').AsInteger,
                  DateToStr(Date), 'N');

                If (rIndiceCorrecaoHoje <> 0) And (rIndiceCorrecao <> 0) Then
                  rCorrecao := (FieldByName('SALDO').AsFloat * rIndiceCorrecaoHoje / rIndiceCorrecao) -
                    FieldByName('SALDO').AsFloat;
              End;

              rValorJuros := FieldByName('VLRMULTA').AsFloat + rCorrecao +
                (FieldByName('VALORJUROS').AsFloat *
                (Date - FieldByName('DataVencto').AsDateTime));
              rSaldoValorJuros := FieldByName('SALDO').AsFloat + rValorJuros;
            End
            Else
            Begin
              If CkbImpValorJurosChecked Then
              Begin
                rValorJuros := ((FieldByName('SALDO').AsFloat * StrToFloat(ReTaxaJurosValue)) / 100) * (Date -
                  FieldByName('DataVencto').AsDateTime);
                rSaldoValorJuros := FieldByName('SALDO').AsFloat + rValorJuros;
              End;
            End;
            If rSaldoValorJuros <> 0 Then
            Begin
              Edit;
              FieldByName('VALORJUROS').AsFloat := rValorJuros;
              FieldByName('SALDO').AsFloat := rSaldoValorJuros;
              Post;
            End;
          End;
          Next;
        End;
      End;
    End;
  End;
End;

End.


