Unit rPosiForn;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, uCtrlParamIntegra, CMProcuraSubTipo;

Type
  TRptPosiForn = Class(TFrmCmReport)
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
    SqlPosiFornCli: TCMSqlParams;
    CdsPosiFornCli: TCMClientDataSet;
    DsPosiFornCli: TwwDataSource;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptPosiForn: TRptPosiForn;

Implementation

Uses uString;

{$R *.DFM}

Procedure TRptPosiForn.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    LblTitulo.Caption := 'Posição por Clientes';
    lblDescricao.Caption := 'Cliente:';
  End
  Else
  Begin
    LblTitulo.Caption := 'Posição por Fornecedores';
    LblTipoPosCli.Caption := '';
    lblDescricao.Caption := 'Fornecedor:';
  End;
  LblTitulo.Caption := LblTitulo.Caption + ' em ' + CmpRptCM.ParamValues[7].AsString;
  If CmpRptCM.ParamValues[5].AsBoolean Then
    LblTitulo.Caption := LblTitulo.Caption + ' - Sem Inclusão de Adiantamentos';
  If Not CmpRptCM.ParamValues[3].IsNull Then
    LblTitulo.Caption := LblTitulo.Caption + ' Somente ' + CmpRptCM.ParamValues[3].AsString;
  With SqlPosiFornCli Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT /*+ RULE */ D.IDFORCLI,D.NOME,                                                  ');
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
    SQL.Add('       (0) AS IDTIPOCLIENTE                                                ');
    SQL.Add('FROM                                                                       ');
    SQL.Add('   DOCUMENTO D,                                                            ');
    SQL.Add('   LANCTODOCUM L,                                                          ');
    SQL.Add('   PESSOA P                                                                ');
    SQL.Add('WHERE (D.IDFORCLI = P.IDPESSOA)                                            ');
    SQL.Add('  AND (D.RECPAG = :RECPAG)                                                 ');
    SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                             ');
    SQL.Add('  AND (D.CODDOCUMENTO = L.CODDOCUMENTO)                                    ');
    SQL.Add('  AND (D.OPERACAO     = L.OPERACAO)                                        ');
    If Not CmpRptCM.ParamValues[3].IsNull Then
      SQL.Add('  AND (D.CODTIPDOC = :CODTIPDOC)                                           ');
    SQL.Add('GROUP BY D.IDFORCLI,P.RAZAOSOCIAL, D.CODTIPDOC,                            ');
    SQL.Add('         D.CODDOCUMENTO, P.NUMDOCUMENTO,                                   ');
    SQL.Add('         D.NODOCUMENTO, D.COMPLDOCUMENTO,                                  ');
    SQL.Add('         D.DATAPROGRAMADA,                                                 ');
    SQL.Add('         D.DATAVENCTO,                                                     ');
    SQL.Add('         D.INDICECORRECAO,                                                 ');
    SQL.Add('         D.VLRMULTA,                                                       ');
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

    If Not CmpRptCM.ParamValues[2].IsNull Then
      SQL.Add('  AND (D.PLACONTA = :PLACONTA)                                             ');

    If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
      SQL.Add('  AND (D.IDFORCLI = :IDFORCLI)                                             ');
    SQL.Add('  AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))                   ');
    SQL.Add('  AND ((D.OPERACAO = ''2 '') OR                                            ');
    If Not CmpRptCM.ParamValues[5].AsBoolean Then
      SQL.Add('      (D.OPERACAO = ''15'') OR                                             ');
    SQL.Add('      ((D.OPERACAO = ''1 '') AND (D.NUMFATURA IS NULL ) ) )                ');
    SQL.Add('GROUP BY                                                                   ');
    SQL.Add('       D.CODDOCUMENTO                                                      ');
    SQL.Add(')                                                                          ');
    SQL.Add('UNION ALL                                                                  ');
    SQL.Add('(                                                                          ');
    SQL.Add('SELECT D.CODDOCUMENTO,                                                   ');
    SQL.Add('       (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))))*S1.SALDOOM1/DECODE(S3.SALDOOM3,0,NULL,S3.SALDOOM3) AS SALDOOM, ');
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
    If Not CmpRptCM.ParamValues[2].IsNull Then
      SQL.Add('        AND (D.PLACONTA = :PLACONTA)                                             ');
    If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
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
    If Not CmpRptCM.ParamValues[2].IsNull Then
      SQL.Add('        AND (D.PLACONTA = :PLACONTA)                                             ');
    If CmpRptCM.ParamValues[0].Asinteger <> 0 Then
      SQL.Add('        AND (D.IDFORCLI = :IDFORCLI)                                             ');
    SQL.Add('        AND (D.NUMFATURA IS NOT NULL)                                      ');
    SQL.Add('      GROUP BY D.NUMFATURA) S3                                             ');
    SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                                    ');
    SQL.Add('  AND (D.OPERACAO = L.OPERACAO)                                            ');
    SQL.Add('  AND (D.NUMFATURA = S1.NUMFATURA)                                         ');
    SQL.Add('  AND (D.NUMFATURA = S3.NUMFATURA)                                         ');
    SQL.Add('  AND (D.RECPAG = :RECPAG)                                                 ');
    SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                             ');
    If Not CmpRptCM.ParamValues[2].IsNull Then
      SQL.Add('  AND (D.PLACONTA = :PLACONTA)                                             ');
    If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
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
    If Not CmpRptCM.ParamValues[2].IsNull Then
      SQL.Add('  AND (D.PLACONTA = :PLACONTA)                                             ');
    If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
      SQL.Add('  AND (D.IDFORCLI = :IDFORCLI)                                             ');
    SQL.Add('  AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))                ');
    SQL.Add('  AND (D.OPERACAO =''3 '')                                              ');
    SQL.Add('  AND (L.OPERACAO <> ''3 '')                                            ');
    SQL.Add('GROUP BY                                                                   ');
    SQL.Add('       D.CODDOCUMENTO)                                                     ');
    SQL.Add(') U                                                                        ');
    SQL.Add('WHERE                                                                      ');
    SQL.Add('      (U.CODDOCUMENTO = D.CODDOCUMENTO)                                    ');
    If Not CmpRptCM.ParamValues[3].IsNull Then
      SQL.Add('  AND (D.CODTIPDOC = :CODTIPDOC)                                           ');
    If CmpRptCM.ParamValues[4].AsBoolean Then
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
    SQL.Add('HAVING ROUND(SUM(U.SALDO),2) <> 0                                          ');
    SQL.Add('ORDER BY D.NOME, D.IDFORCLI,                                               ');
    If CmpRptCM.ParamValues[6].RadioGroupSettings.ItemIndex = 0 Then
      SQL.Add('         D.DATAPROGRAMADA                                                  ')
    Else
      SQL.Add('         D.NODOCUMENTO                                                     ');
    Prepare;
    ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
    ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    ParamByName('DATAREF').AsString := CmpRptCM.ParamValues[7].AsString;
    If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
      ParamByName('IDFORCLI').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
    If Not CmpRptCM.ParamValues[2].IsNull Then
      ParamByName('PLACONTA').AsString := Espaco(CmpRptCM.ParamValues[2].AsString, 18);
    If Not CmpRptCM.ParamValues[3].IsNull Then
      ParamByName('CODTIPDOC').AsInteger := StrToInt(CmpRptCM.ParamValues[3].AsString);
    LblTipoPosCli.Text := '';
    If LblTipoPosCli.Caption <> '' Then
      LblTipoPosCli.Caption := LblTipoPosCli.Caption + ' - ';
    LblTipoPosCli.Caption := LblTipoPosCli.Caption + ' Conta Contábil: ' +
      Trim(CmpRptCM.ParamValues[2].AsString) + ' / ' + Trim(CmpRptCM.ParamValues[2].AsString);

    Open;
    LblJuros.Visible := False;
    LblDbJuros.Visible := False;
    LblDbSumJuros.Visible := False;
    LblSumJuros.Visible := False;
  End;
End;

Procedure TRptPosiForn.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
  sSql: String;
Begin
  Inherited;
  //Cliente / Fornecedor
  If ParamIntegra.recpag = 'R' Then
  Begin
    CmpRptCM.Caption := 'Posição Por Cliente';
    CmpRptCM.ParamValues[0].Caption := 'Cliente';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcCliente;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;

    CmpRptCM.ParamValues[1].Caption := 'Cliente Final';
    CmpRptCM.ParamValues[1].ProcuraFCSettings.ForCli := fcCliente;
    CmpRptCM.ParamValues[1].ProcuraFCSettings.CampoEdit := ceRazaoSocial;

  End
  Else
  Begin
    CmpRptCM.Caption := 'Posição Por Fornecedor';
    CmpRptCM.ParamValues[0].Caption := 'Fornecedor';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcFornecedor;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;

    CmpRptCM.ParamValues[1].Caption := 'Fornecedor Final';
    CmpRptCM.ParamValues[1].ProcuraFCSettings.ForCli := fcFornecedor;
    CmpRptCM.ParamValues[1].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End;

  // Conta Contabil
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Mascara := ParamIntegra.MascaraCC;
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Plano := ParamIntegra.plano;

  sSql := 'SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG a ' + #13 +
    '  WHERE a.RECPAG = ''' + ParamIntegra.RecPag + '''' + #13 +
    ' and not exists (select 1 from UsuarioxTpdocto b ' + #13 +
    '  where b.idusuario=' + Floattostr(CrmRptCM.IdUsuario) + ' and RECPAG= '''
    + ParamIntegra.RecPag + '''' + ') ' + #13 +
    ' union SELECT CODTIPDOC,DESCRICAO                    ' + #13 +
    '  FROM TIPODOCRECPAG a                               ' + #13 +
    ' WHERE a.RECPAG = ''' + ParamIntegra.RecPag + '''' +
    ' and  exists                   ' + #13 +
    ' (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc  ' + #13 +
    ' and b.idusuario=' + Floattostr(CrmRptCM.IdUsuario) + ' and RECPAG= ''' +
    ParamIntegra.RecPag + '''' + ')  ' + #13 +
    '  ORDER BY DESCRICAO  ';
  CmpRptCM.ParamValues[3].LookupSettings.SQL.text := sSql;
  CmpRptCM.ParamValues[7].TextDefault := DateToStr(Date);
End;

End.

