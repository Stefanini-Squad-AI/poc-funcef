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

Unit rPosiSaldosForn;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, uSistema, TXRB;

Type
  TRptPosiSaldosForn = Class(TFrmCmReport)
    PpAging: TppBDEPipeline;
    DsAging: TwwDataSource;
    RptAging: TppReport;
    ppHeaderBand15: TppHeaderBand;
    LblEmpresa: TppLabel;
    LblPosSaldos: TppLabel;
    LblFornecedor: TppLabel;
    RptAgingLabel1: TppLabel;
    Lbl120: TppLabel;
    Lbl30: TppLabel;
    Lbl60: TppLabel;
    Lbl90: TppLabel;
    Lbl150: TppLabel;
    Lbl180: TppLabel;
    LblMais180: TppLabel;
    LblTotalForn: TppLabel;
    RptAgingLine2: TppLine;
    RptAgingLine3: TppLine;
    RptAgingLine5: TppLine;
    RptAgingLabel2: TppLabel;
    LblTipoCli: TppLabel;
    ppDetailBand15: TppDetailBand;
    RptAgingLine4: TppLine;
    RptAgingDBText1: TppDBText;
    LAVENC: TppDBText;
    L30: TppDBText;
    L90: TppDBText;
    L60: TppDBText;
    L120: TppDBText;
    LM180: TppDBText;
    L180: TppDBText;
    LTOTFORN: TppDBText;
    L150: TppDBText;
    ppFooterBand15: TppFooterBand;
    NomeSistema: TppLabel;
    RptAgingLine1: TppLine;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    RptAgingSummaryBand1: TppSummaryBand;
    ppLine25: TppLine;
    LTOTAVENC: TppDBCalc;
    LTOT30: TppDBCalc;
    LTOT60: TppDBCalc;
    LTOT90: TppDBCalc;
    LTOT120: TppDBCalc;
    LTOT150: TppDBCalc;
    LTOT180: TppDBCalc;
    LTOTM180: TppDBCalc;
    LTOTGER: TppDBCalc;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    CdsAging: TCMClientDataSet;
    SqlAging: TCMSqlParams;
    SqlTitulo: TCMSqlParams;
    CdsTitulo: TCMClientDataSet;
    Procedure RptAgingBeforePrint(Sender: TObject);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
    iTotais: Array[0..8] Of Double;
    iDatasSaldo: Array[0..5] Of Integer;
  public
    { Public declarations }
  End;

Var
  RptPosiSaldosForn: TRptPosiSaldosForn;

Implementation

{$R *.DFM}

Procedure TRptPosiSaldosForn.RptAgingBeforePrint(Sender: TObject);
Var
  x: Integer;
Begin
  Inherited;
  For X := 0 To 8 Do
    iTotais[x] := 0;
End;

Procedure TRptPosiSaldosForn.CrmRptCMBeforePrint(Sender: TObject);
Var
  sDataPagto, sIdTipoCliente: String;
Begin
  Inherited;
  LblTipoCli.Visible := False;
  sIdTipoCliente := ' ';
  LblTipoCli.Text := '';
  LblTipoCli.Visible := False;

  If Not CmpRptCM.ParamValues[1].AsBoolean Then
  Begin
    LblTipoCli.Text := Trim(LblTipoCli.Text + ' - Adiantamentos Não Inclusos');
    LblTipoCli.Visible := True;
  End;
  If CmpRptCM.ParamValues[0].IsNull Then
    sDataPagto := DateToStr(Date)
  Else
    sDataPagto := CmpRptCM.ParamValues[0].AsString;

  LblPosSaldos.Text := 'Posição dos Saldos em ' + sDataPagto;

  SqlAux.Prepare;
  SqlAux.ParamByName('RECPAG').asstring := ParamIntegra.RecPag;
  SqlAux.ParamByName('IDPESSOA').asinteger := Sistema.IdEmpresa;
  SqlAux.open;

  iDatasSaldo[0] := CdsAux.FieldByName('DD30').AsInteger;
  iDatasSaldo[1] := CdsAux.FieldByName('DD60').AsInteger;
  iDatasSaldo[2] := CdsAux.FieldByName('DD90').AsInteger;
  iDatasSaldo[3] := CdsAux.FieldByName('DD120').AsInteger;
  iDatasSaldo[4] := CdsAux.FieldByName('DD150').AsInteger;
  iDatasSaldo[5] := CdsAux.FieldByName('DD180').AsInteger;

  Lbl30.Caption := IntToStr(iDatasSaldo[0]);
  Lbl60.Caption := IntToStr(iDatasSaldo[1]);
  Lbl90.Caption := IntToStr(iDatasSaldo[2]);
  Lbl120.Caption := IntToStr(iDatasSaldo[3]);
  Lbl150.Caption := IntToStr(iDatasSaldo[4]);
  Lbl180.Caption := IntToStr(iDatasSaldo[5]);
  LblMais180.Caption := '+ ' + IntToStr(iDatasSaldo[5]);

  Lbl30.Visible := true;
  Lbl60.Visible := ((Not (iDatasSaldo[1] = 0)) Or (Not (iDatasSaldo[0] = 0)));
  Lbl90.Visible := ((Not (iDatasSaldo[2] = 0)) Or (Not (iDatasSaldo[1] = 0)));
  Lbl120.Visible := ((Not (iDatasSaldo[3] = 0)) Or (Not (iDatasSaldo[2] = 0)));
  Lbl150.Visible := ((Not (iDatasSaldo[4] = 0)) Or (Not (iDatasSaldo[3] = 0)));
  Lbl180.Visible := ((Not (iDatasSaldo[5] = 0)) Or (Not (iDatasSaldo[4] = 0)));
  LblMais180.Visible := Not (iDatasSaldo[5] = 0);

  L30.Visible := Lbl30.Visible;
  L60.Visible := Lbl60.Visible;
  L90.Visible := Lbl90.Visible;
  L120.Visible := Lbl120.Visible;
  L150.Visible := Lbl150.Visible;
  L180.Visible := Lbl180.Visible;
  LM180.Visible := LblMais180.Visible;

  LTOT30.Visible := Lbl30.Visible;
  LTOT60.Visible := Lbl60.Visible;
  LTOT90.Visible := Lbl90.Visible;
  LTOT120.Visible := Lbl120.Visible;
  LTOT150.Visible := Lbl150.Visible;
  LTOT180.Visible := Lbl180.Visible;
  LTOTM180.Visible := LblMais180.Visible;

  With SqlAging Do
  Begin
    Close;
    SQL.Clear;
//    SQL.Add('SELECT /*+ RULE */ SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,U.SALDO,0)) AS SALDOAV, ');   //Everson TIBERO
    SQL.Add('SELECT SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,U.SALDO,0)) AS SALDOAV, ');  //Everson TIBERO
    If (iDatasSaldo[0] = 0) Then
    Begin
      Lbl30.Caption := '+ ' + Lbl30.Caption;
      SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,U.SALDO)) AS SALDO30,        ');
      SQL.Add('             SUM(0) AS SALDO60,       ');
      SQL.Add('             SUM(0) AS SALDO90,       ');
      SQL.Add('             SUM(0) AS SALDO120,      ');
      SQL.Add('             SUM(0) AS SALDO150,      ');
      SQL.Add('             SUM(0) AS SALDO180,      ');
      SQL.Add('             SUM(0) AS SALDOM180,     ');
    End
    Else
    Begin
      SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                      ');
      SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,U.SALDO,0))) AS SALDO30,        ');

      If (iDatasSaldo[1] = 0) Then
      Begin
        Lbl60.Caption := '+ ' + Lbl30.Caption;
        SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
        SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,U.SALDO))) AS SALDO60,        ');
        SQL.Add('             SUM(0) AS SALDO90,       ');
        SQL.Add('             SUM(0) AS SALDO120,      ');
        SQL.Add('             SUM(0) AS SALDO150,      ');
        SQL.Add('             SUM(0) AS SALDO180,      ');
        SQL.Add('             SUM(0) AS SALDOM180,     ');
      End
      Else
      Begin
        SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
        SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
        SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,U.SALDO,0)))) AS SALDO60,       ');

        If (iDatasSaldo[2] = 0) Then
        Begin
          Lbl90.Caption := '+ ' + Lbl60.Caption;
          SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,U.SALDO))) AS SALDO90,        ');
          SQL.Add('             SUM(0) AS SALDO120,      ');
          SQL.Add('             SUM(0) AS SALDO150,      ');
          SQL.Add('             SUM(0) AS SALDO180,      ');
          SQL.Add('             SUM(0) AS SALDOM180,     ');
        End
        Else
        Begin
          SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,U.SALDO,0))))) AS SALDO90,      ');

          If (iDatasSaldo[3] = 0) Then
          Begin
            Lbl120.Caption := '+ ' + Lbl90.Caption;
            SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,U.SALDO))) AS SALDO120,        ');
            SQL.Add('             SUM(0) AS SALDO150,      ');
            SQL.Add('             SUM(0) AS SALDO180,      ');
            SQL.Add('             SUM(0) AS SALDOM180,     ');
          End
          Else
          Begin
            SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,                              ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,U.SALDO,0)))))) AS SALDO120,   ');

            If (iDatasSaldo[4] = 0) Then
            Begin
              Lbl150.Caption := '+ ' + Lbl120.Caption;
              SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,0,U.SALDO))) AS SALDO150,        ');
              SQL.Add('             SUM(0) AS SALDO180,      ');
              SQL.Add('             SUM(0) AS SALDOM180,     ');
            End
            Else
            Begin
              SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,                              ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,0,                             ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD150),1,U.SALDO,0))))))) AS SALDO150,  ');

              If (iDatasSaldo[5] = 0) Then
              Begin
                Lbl180.Caption := '+ ' + Lbl150.Caption;
                SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD150),1,0,U.SALDO))) AS SALDO180,        ');
                SQL.Add('             SUM(0) AS SALDOM180,     ');
              End
              Else
              Begin
                SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,                              ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,0,                             ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD150),1,0,                             ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD180),1,U.SALDO,0)))))))) AS SALDO180, ');
                SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD180),1,0,U.SALDO))) AS SALDOM180,     ');
              End;
            End;
          End;
        End;
      End;
    End;
    SQL.Add('       SUM(U.SALDO) AS SALDOTOT,                                                                                     ');
    SQL.Add('       PE.RAZAOSOCIAL, D.IDFORCLI                                                                                    ');
    SQL.Add('FROM                                                                                                                 ');
    SQL.Add('(                                                                                                                    ');
    SQL.Add('(SELECT D.CODDOCUMENTO,                                                                                              ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM, ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO                                            ');
    SQL.Add('FROM DOCUMENTO D,                                              ');
    SQL.Add('     LANCTODOCUM L                                             ');
    SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                        ');
    SQL.Add('  AND (D.RECPAG = :RECPAG)                                     ');
    SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                 ');
    SQL.Add('  AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))       ');
    SQL.Add('  AND ((D.OPERACAO = ''2 '') OR         ');
    If CmpRptCM.ParamValues[1].AsBoolean Then
      SQL.Add('       (D.OPERACAO = ''15'') OR      ');
    SQL.Add('       ((D.OPERACAO = ''1 '') AND (D.NUMFATURA IS NULL ) ) )   ');
    SQL.Add(' GROUP BY                                                      ');
    SQL.Add('        D.CODDOCUMENTO                                         ');
    SQL.Add(' HAVING (ROUND(SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))),2) <> 0) ');
    SQL.Add(' )                         ');
    SQL.Add(' UNION ALL                 ');
    SQL.Add(' (                         ');
    SQL.Add(' SELECT D.CODDOCUMENTO,    ');
    SQL.Add('        (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))))*S1.SALDOOM1/DECODE(S3.SALDOOM3,0,NULL,S3.SALDOOM3) AS SALDOOM, ');
    SQL.Add('        (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))))*S1.SALDO1/DECODE(S3.SALDO3,0,NULL,S3.SALDO3) AS SALDO                                                ');
    SQL.Add(' FROM DOCUMENTO D,         ');
    SQL.Add('      LANCTODOCUM L,       ');
    SQL.Add('      (SELECT D.NUMFATURA, ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM1, ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO1                                            ');
    SQL.Add('       FROM DOCUMENTO D,   ');
    SQL.Add('            LANCTODOCUM L  ');
    SQL.Add('       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)  ');
    SQL.Add('         AND (D.OPERACAO = ''1 '')              ');
    SQL.Add('         AND (D.RECPAG = :RECPAG)               ');
    SQL.Add('         AND (D.IDPESSOA = :IDPESSOA)           ');
    SQL.Add('         AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) ');
    SQL.Add('         AND (D.NUMFATURA IS NOT NULL)                          ');
    SQL.Add('       GROUP BY D.NUMFATURA) S1,                                ');
    SQL.Add('      (SELECT D.NUMFATURA,                                      ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM3, ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO3                                            ');
    SQL.Add('       FROM DOCUMENTO D,                        ');
    SQL.Add('            LANCTODOCUM L                       ');
    SQL.Add('       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)  ');
    SQL.Add('         AND (D.OPERACAO = L.OPERACAO)          ');
    SQL.Add('         AND (D.OPERACAO = ''3 '')              ');
    SQL.Add('         AND (D.RECPAG = :RECPAG)               ');
    SQL.Add('         AND (D.IDPESSOA = :IDPESSOA)           ');
    SQL.Add('         AND (D.NUMFATURA IS NOT NULL)          ');
    SQL.Add('       GROUP BY D.NUMFATURA) S3                 ');
    SQL.Add(' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)        ');
    SQL.Add('   AND (D.OPERACAO = L.OPERACAO)                ');
    SQL.Add('   AND (D.NUMFATURA = S1.NUMFATURA)             ');
    SQL.Add('   AND (D.NUMFATURA = S3.NUMFATURA)             ');
    SQL.Add('   AND (D.RECPAG = :RECPAG)                     ');
    SQL.Add('   AND (D.IDPESSOA = :IDPESSOA)                 ');
    SQL.Add('   AND (D.OPERACAO =''3 '')                     ');
    SQL.Add(' GROUP BY                                       ');
    SQL.Add('        D.CODDOCUMENTO,                         ');
    SQL.Add('        S1.SALDOOM1,                            ');
    SQL.Add('        S3.SALDOOM3,                            ');
    SQL.Add('        S1.SALDO1,                              ');
    SQL.Add('        S3.SALDO3                               ');
    SQL.Add(' HAVING (ROUND((SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))))*S1.SALDO1/DECODE(S3.SALDO3,0,NULL,S3.SALDO3),2) <> 0) ');
    SQL.Add('        )                ');
    SQL.Add(' UNION ALL               ');
    SQL.Add(' (                       ');
    SQL.Add(' SELECT D.CODDOCUMENTO,  ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM, ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO                                            ');
    SQL.Add(' FROM DOCUMENTO D,                        ');
    SQL.Add('      LANCTODOCUM L                       ');
    SQL.Add(' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)  ');
    SQL.Add('   AND (D.RECPAG = :RECPAG)               ');
    SQL.Add('   AND (D.IDPESSOA = :IDPESSOA)           ');
    SQL.Add('   AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) ');
    SQL.Add('   AND (D.OPERACAO =''3 '')                               ');
    SQL.Add('   AND (L.OPERACAO <> ''3 '')                             ');
    SQL.Add(' GROUP BY                                                 ');
    SQL.Add('        D.CODDOCUMENTO                                    ');
    SQL.Add(' HAVING (ROUND(SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))),2) <> 0) ');
    SQL.Add('  )                                                       ');
    SQL.Add(' ) U,                                                     ');
    SQL.Add('   DOCUMENTO D,                                           ');
    SQL.Add('   PESSOA PE,                                             ');
    SQL.Add('   PARAMCAP P                                             ');
    SQL.Add('WHERE (U.CODDOCUMENTO = D.CODDOCUMENTO)                   ');
    SQL.Add('  AND (D.RECPAG = P.RECPAG)                               ');
    SQL.Add('  AND (D.IDPESSOA = P.IDPESSOA)                           ');
    SQL.Add('  AND (D.RECPAG = :RECPAG)                                ');
    SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                            ');
    SQL.Add('  AND (D.IDFORCLI = PE.IDPESSOA)                          ');
    SQL.Add('GROUP BY PE.RAZAOSOCIAL, D.IDFORCLI                       ');
    SQL.Add('ORDER BY PE.RAZAOSOCIAL                            ');
    prepare;
    ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
    ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
    ParamByName('DATAREF').AsString := CmpRptCM.ParamValues[0].value;
    open;
  End;
End;

Procedure TRptPosiSaldosForn.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  CmpRptCM.ParamValues[0].TextDefault := datetostr(date);
End;

End.

