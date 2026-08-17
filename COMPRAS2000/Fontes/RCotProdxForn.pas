unit RCotProdxForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBTables, ppCtrls,
  ppBands, ppVar, ppRegion, ppMemo, ppStrtch, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, TXRB;
Const
     MaxForn = 6;
type
  TRptCotProdxForn = class(TFrmCmReport)
    pplCotProdxForn: TppBDEPipeline;
    dsCotProdxForn: TwwDataSource;
    qryCotProdxForn: TwwQuery;
    qryCotProdxFornIDPROCXART: TFloatField;
    qryCotProdxFornCODARTIGO: TStringField;
    qryCotProdxFornQTDEPEDIDA: TFloatField;
    qryCotProdxFornCODMEDIDA: TStringField;
    qryCotProdxFornDESCRICAO: TStringField;
    qryCotProdxFornSALDOQTDE: TFloatField;
    qryCotProdxFornCODMEDCUSTO: TStringField;
    qryCotProdxFornFORN1: TFloatField;
    qryCotProdxFornFORN2: TFloatField;
    qryCotProdxFornFORN3: TFloatField;
    qryCotProdxFornFORN4: TFloatField;
    qryCotProdxFornFORN5: TFloatField;
    qryCotProdxFornFORN6: TFloatField;
    qryCotProdxFornVLRMENOR: TFloatField;
    qryCotProdxFornNUNVENC: TFloatField;
    qryCotProdxFornTELEFONE1: TStringField;
    qryCotProdxFornTELEFONE2: TStringField;
    qryCotProdxFornTELEFONE3: TStringField;
    qryCotProdxFornTELEFONE4: TStringField;
    qryCotProdxFornTELEFONE5: TStringField;
    qryCotProdxFornTELEFONE6: TStringField;
    qryCotProdxFornCONDPAG1: TStringField;
    qryCotProdxFornCONDPAG2: TStringField;
    qryCotProdxFornCONDPAG3: TStringField;
    qryCotProdxFornCONDPAG4: TStringField;
    qryCotProdxFornCONDPAG5: TStringField;
    qryCotProdxFornCONDPAG6: TStringField;
    qryCotProdxFornPRAZOENT1: TStringField;
    qryCotProdxFornPRAZOENT2: TStringField;
    qryCotProdxFornPRAZOENT3: TStringField;
    qryCotProdxFornPRAZOENT4: TStringField;
    qryCotProdxFornPRAZOENT5: TStringField;
    qryCotProdxFornPRAZOENT6: TStringField;
    qryCotProdxFornJUSTIFICATIVA: TStringField;
    ppCotProdxForn: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppCotProdxFornLabel1: TppLabel;
    ppCotProdxFornLine1: TppLine;
    LbCodProc: TppLabel;
    ppCotProdxFornLabel2: TppLabel;
    ppCotProdxFornLabel3: TppLabel;
    ppCotProdxFornLabel4: TppLabel;
    memForn: TppMemo;
    ppCotProdxFornLine2: TppLine;
    LbForn1: TppLabel;
    LbForn2: TppLabel;
    LbForn3: TppLabel;
    LbForn4: TppLabel;
    LbForn5: TppLabel;
    LbForn6: TppLabel;
    ppCotProdxFornLabel11: TppLabel;
    lnCol2: TppLine;
    lnCol3: TppLine;
    lnCol4: TppLine;
    lnCol5: TppLine;
    lnCol6: TppLine;
    ppCotProdxFornLine9: TppLine;
    DetCot: TppDetailBand;
    LbCodArtigo: TppDBText;
    ppCotProdxFornDBText2: TppDBText;
    ppCotProdxFornDBText3: TppDBText;
    ppCotProdxFornDBText4: TppDBText;
    ppCotProdxFornDBText5: TppDBText;
    ppCotProdxFornDBText6: TppDBText;
    LbValForn1: TppDBText;
    LbValForn2: TppDBText;
    LbValForn3: TppDBText;
    LbValForn4: TppDBText;
    LbValForn5: TppDBText;
    LbValForn6: TppDBText;
    ppCotProdxFornDBText13: TppDBText;
    ppCotProdxFornDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppCotacaoCTabLabel2: TppLabel;
    RgCotPxF1: TppRegion;
    LbCarimbo1: TppLabel;
    rpResumoColetaLabel25: TppLabel;
    rpResumoColetaLabel26: TppLabel;
    rpResumoColetaLabel27: TppLabel;
    RgCotPxF2: TppRegion;
    LbCarimbo2: TppLabel;
    ppCotProdxFornLabel10: TppLabel;
    ppCotProdxFornLabel12: TppLabel;
    ppCotProdxFornLabel13: TppLabel;
    RgCotPxF3: TppRegion;
    LbCarimbo3: TppLabel;
    ppCotProdxFornLabel15: TppLabel;
    ppCotProdxFornLabel16: TppLabel;
    ppCotProdxFornLabel17: TppLabel;
    RgCotPxF4: TppRegion;
    LbCarimbo4: TppLabel;
    ppCotProdxFornLabel19: TppLabel;
    ppCotProdxFornLabel20: TppLabel;
    ppCotProdxFornLabel21: TppLabel;
    RgCotPxF5: TppRegion;
    LbCarimbo5: TppLabel;
    ppCotProdxFornLabel23: TppLabel;
    ppCotProdxFornLabel24: TppLabel;
    ppCotProdxFornLabel25: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCotProdxFornSummaryBand1: TppSummaryBand;
    ppCotProdxFornDBCalc1: TppDBCalc;
    ppCotProdxFornDBCalc2: TppDBCalc;
    ppCotProdxFornDBCalc3: TppDBCalc;
    ppCotProdxFornDBCalc4: TppDBCalc;
    ppCotProdxFornDBCalc5: TppDBCalc;
    ppCotProdxFornDBCalc6: TppDBCalc;
    ppCotProdxFornDBCalc7: TppDBCalc;
    ppCotProdxFornLine3: TppLine;
    ppCotProdxFornLabel6: TppLabel;
    ppCotProdxFornLabel5: TppLabel;
    ppCotProdxFornLabel7: TppLabel;
    ppCotProdxFornLabel8: TppLabel;
    ppCotProdxFornLine4: TppLine;
    LbSumCol1: TppLine;
    LnSumCol2: TppLine;
    LnSumCol3: TppLine;
    LnSumCol4: TppLine;
    LnSumCol5: TppLine;
    LnSumCol6: TppLine;
    ppCotProdxFornLine12: TppLine;
    ppCotProdxFornDBText1: TppDBText;
    ppCotProdxFornDBText7: TppDBText;
    ppCotProdxFornDBText8: TppDBText;
    ppCotProdxFornDBText9: TppDBText;
    ppCotProdxFornDBText10: TppDBText;
    ppCotProdxFornDBText11: TppDBText;
    ppCotProdxFornDBText12: TppDBText;
    ppCotProdxFornDBText14: TppDBText;
    ppCotProdxFornDBText15: TppDBText;
    ppCotProdxFornDBText16: TppDBText;
    ppCotProdxFornDBText17: TppDBText;
    ppCotProdxFornDBText18: TppDBText;
    ppCotProdxFornDBText19: TppDBText;
    ppCotProdxFornDBText20: TppDBText;
    ppCotProdxFornDBText21: TppDBText;
    ppCotProdxFornDBText22: TppDBText;
    ppCotProdxFornDBText23: TppDBText;
    ppCotProdxFornDBText24: TppDBText;
    updCotProdxForn: TUpdateSQL;
    qryCotacao: TwwQuery;
    qryCotacaoIDPROCXART: TFloatField;
    qryCotacaoIDFORCLI: TFloatField;
    qryCotacaoPROPOSTA: TFloatField;
    qryCotacaoVALTOTPRE: TFloatField;
    qryCotacaoSTATUS: TStringField;
    qryCotacaoMENORVALOR: TFloatField;
    qryCotacaoMENORVALORF: TFloatField;
    qryCotacaoVALTOTPREF: TFloatField;
    qryCotacaoPERCMIXIDEAL: TFloatField;
    qryCotacaoPOS: TFloatField;
    qryCotacaoPRECOAVALORPRES: TFloatField;
    qryCotacaoTELEFONE: TStringField;
    qryCotacaoCONDPAG: TStringField;
    qryCotacaoPRAZOENT: TStringField;
    updCotacao: TUpdateSQL;
    qryFornCot: TwwQuery;
    qryFornCotIDFORCLI: TFloatField;
    qryFornCotPROPOSTA: TFloatField;
    qryFornCotRAZAOSOCIAL: TStringField;
    qryFornCotVALOR: TFloatField;
    qryFornCotTELEFONE: TStringField;
    qryPrazo: TwwQuery;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
    iNumForn : LongInt;
    Function  CalcPrazo(Tipo : char; IdForCli, CodProcesso, Proposta : LongInt ) : String;
    Procedure SetValor;
  public
    { Public declarations }
  end;

var
  RptCotProdxForn: TRptCotProdxForn;

implementation

{$R *.DFM}

{ TRptCotProdxForn }

function TRptCotProdxForn.CalcPrazo(Tipo: char; IdForCli, CodProcesso,
  Proposta: Integer): String;
Var
   sSql : String;
   sAux : String;
Begin
   Result := '';
   sSql   := '';
   sSql := sSql + ' SELECT ';
   Case upCase(Tipo) Of
      'P': sSql := sSql + '     PRAZOPGTO AS PRAZO';
      'E': sSql := sSql + '     PRAZOENT  AS PRAZO';
   End;
   sSql := sSql + ' FROM ';
   Case upCase(Tipo) Of
      'P': sSql := sSql + '     PRAZOPGTO ';
      'E': sSql := sSql + '     PRAZOENTREGA ';
   End;
   sSql := sSql + ' WHERE ';
   sSql := sSql + '       (IDFORCLI = '+IntToStr(IdForCli)+') ';
   sSql := sSql + '   AND (CODPROCESSO = '+IntToStr(CodProcesso)+') ';
   sSql := sSql + '   AND (PROPOSTA   = '+IntToStr(Proposta)+') ';
   sSql := sSql + ' ORDER BY 1 ';
   qryPrazo.Close;
   qryPrazo.Sql.Text := sSql;
   qryPrazo.Open;
   If Not qryPrazo.IsEmpty Then
      Begin
         sAux := IntToStr(qryPrazo.FieldByName('PRAZO').AsInteger);
         Repeat
            qryPrazo.Next;
            If ( Not qryPrazo.EOF) And (Pos( IntToStr(qryPrazo.FieldByName('PRAZO').AsInteger),sAux) = 0) Then
               sAux := sAux +'/'+IntToStr(qryPrazo.FieldByName('PRAZO').AsInteger);
         Until qryPrazo.EOF;
         Result := sAux;
      End;
end;

procedure TRptCotProdxForn.SetValor;
begin
   qryCotacao.Close;
   qryCotacao.Sql.Clear;
   qryCotacao.Sql.Add('SELECT                ');
   qryCotacao.Sql.Add('     PXA.IDPROCXART,  ');
   qryCotacao.Sql.Add('     C.IDFORCLI,      ');
   qryCotacao.Sql.Add('     C.PROPOSTA,      ');
   Case CmpRptCM.ParamValues[6].AsInteger Of
      0 : qryCotacao.Sql.Add('     (C.PRECOAVALORPRES*C.QTDEFORNECIDA) AS VALTOTPRE,   ');
      1 : qryCotacao.Sql.Add('     (C.PRECO*C.QTDEFORNECIDA) AS VALTOTPRE,   ');
   End;
   qryCotacao.Sql.Add('     C.STATUS,                                           ');
   qryCotacao.Sql.Add('     C.PRECOAVALORPRES,                                  ');
   qryCotacao.Sql.Add('     MV.MENORVALOR,                                      ');
   qryCotacao.Sql.Add('     TF.MENORVALORF,                                     ');
   qryCotacao.Sql.Add('     TF.VALTOTPREF,                                      ');
   qryCotacao.Sql.Add('     TF.PERCMIXIDEAL,                                    ');
   qryCotacao.Sql.Add('     (0) AS POS,                                         ');
   qryCotacao.Sql.Add('     (''                    '') AS TELEFONE,             ');
   qryCotacao.Sql.Add('     (''                    '') AS CONDPAG,              ');
   qryCotacao.Sql.Add('     (''                    '') AS PRAZOENT              ');
   qryCotacao.Sql.Add('FROM                                                     ');
   qryCotacao.Sql.Add('    COTACOES C,                                          ');
   qryCotacao.Sql.Add('    PROCXART PXA,                                        ');
   qryCotacao.Sql.Add('   (SELECT                                               ');
   qryCotacao.Sql.Add('        C.CODPROCESSO,                                   ');
   qryCotacao.Sql.Add('        C.IDFORCLI,                                      ');
   qryCotacao.Sql.Add('        C.PROPOSTA,                                      ');
   qryCotacao.Sql.Add('        SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)) AS MENORVALORF,   ');
   Case CmpRptCM.ParamValues[6].AsInteger Of
      0 : qryCotacao.Sql.Add('        SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C.QTDEFORNECIDA) AS VALTOTPREF, ');
      1 : qryCotacao.Sql.Add('        SUM(DECODE(C.PRECO,NULL,0,C.PRECO)*C.QTDEFORNECIDA) AS VALTOTPREF, ');
   End;
   Case CmpRptCM.ParamValues[6].AsInteger Of
      0 : qryCotacao.Sql.Add('        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR))),0,0,(((SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))-1)*100)) AS PERCMIXIDEAL ');
      1 : qryCotacao.Sql.Add('        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR))),0,0,(((SUM(DECODE(C.PRECO,NULL,0,C.PRECO)*C.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))-1)*100)) AS PERCMIXIDEAL ');
   End;
   qryCotacao.Sql.Add('    FROM                          ');
   qryCotacao.Sql.Add('        COTACOES C,               ');
   qryCotacao.Sql.Add('       (SELECT C.IDPROCXART,      ');
   Case CmpRptCM.ParamValues[6].AsInteger Of
      0 : qryCotacao.Sql.Add('               SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
      1 : qryCotacao.Sql.Add('               SUM((C.PRECO*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
   End;
   qryCotacao.Sql.Add('        FROM ');
   qryCotacao.Sql.Add('               COTACOES C, ');
   qryCotacao.Sql.Add('              (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN ');
   qryCotacao.Sql.Add('               FROM                                    ');
   qryCotacao.Sql.Add('                    COTACOES C                         ');
   qryCotacao.Sql.Add('               WHERE                                   ');
   qryCotacao.Sql.Add('                  (C.CODPROCESSO  = :pCODPROCESSO) AND ');
   qryCotacao.Sql.Add('                  ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) ');
   qryCotacao.Sql.Add('               GROUP BY IDPROCXART) N                        ');
   qryCotacao.Sql.Add('        WHERE                                                ');
   qryCotacao.Sql.Add('              (C.CODPROCESSO  = :pCODPROCESSO) AND           ');
   qryCotacao.Sql.Add('              ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) AND ');
   qryCotacao.Sql.Add('              (C.IDPROCXART = N.IDPROCXART)                  ');
   qryCotacao.Sql.Add('        GROUP BY C.IDPROCXART, N.NUMVEN) MV                  ');
   qryCotacao.Sql.Add('    WHERE                                                    ');
   qryCotacao.Sql.Add('           (C.CODPROCESSO  = :pCODPROCESSO)                  ');
   qryCotacao.Sql.Add('       AND (C.IDPROCXART = MV.IDPROCXART)                    ');
   qryCotacao.Sql.Add('    GROUP BY C.CODPROCESSO, C.IDFORCLI, C.PROPOSTA) TF,      ');
   qryCotacao.Sql.Add('   (SELECT C.IDPROCXART,                                     ');
   Case CmpRptCM.ParamValues[6].AsInteger Of
      0 : qryCotacao.Sql.Add('           SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
      1 : qryCotacao.Sql.Add('           SUM((C.PRECO*C.QTDEFORNECIDA))/N.NUMVEN AS MENORVALOR ');
   End;
   qryCotacao.Sql.Add('    FROM                         ');
   qryCotacao.Sql.Add('           COTACOES C,           ');
   qryCotacao.Sql.Add('           (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN ');
   qryCotacao.Sql.Add('            FROM                                    ');
   qryCotacao.Sql.Add('                 COTACOES C                         ');
   qryCotacao.Sql.Add('            WHERE                                   ');
   qryCotacao.Sql.Add('               (C.CODPROCESSO  = :pCODPROCESSO) AND ');
   qryCotacao.Sql.Add('               ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) ');
   qryCotacao.Sql.Add('            GROUP BY IDPROCXART) N                        ');
   qryCotacao.Sql.Add('    WHERE                                                 ');
   qryCotacao.Sql.Add('         (C.CODPROCESSO  = :pCODPROCESSO) AND             ');
   qryCotacao.Sql.Add('         ((C.STATUS = ''S'') OR (C.STATUS = ''C'')) AND   ');
   qryCotacao.Sql.Add('         (C.IDPROCXART = N.IDPROCXART)                    ');
   qryCotacao.Sql.Add('    GROUP BY C.IDPROCXART, N.NUMVEN                       ');
   qryCotacao.Sql.Add('    ) MV                                                  ');
   qryCotacao.Sql.Add('WHERE                                                     ');
   qryCotacao.Sql.Add('      (C.CODPROCESSO  = :pCODPROCESSO)                    ');
   qryCotacao.Sql.Add('  AND (PXA.CODPROCESSO = C.CODPROCESSO)                   ');
   qryCotacao.Sql.Add('  AND (PXA.IDPROCXART = C.IDPROCXART)                     ');
   qryCotacao.Sql.Add('  AND (C.IDPROCXART = MV.IDPROCXART)                      ');
   qryCotacao.Sql.Add('  AND (C.CODPROCESSO = TF.CODPROCESSO)                    ');
   qryCotacao.Sql.Add('  AND (C.IDFORCLI = TF.IDFORCLI)                          ');
   qryCotacao.Sql.Add('  AND (C.PROPOSTA = TF.PROPOSTA)                          ');
   qryCotacao.Sql.Add('ORDER BY PXA.IDPROCXART, C.IDFORCLI, C.PROPOSTA           ');
end;

procedure TRptCotProdxForn.CrmRptCMBeforePrint(Sender: TObject);
Var
   x : Byte;
Begin
  Inherited;
  x := 0;
  SetValor;
  qryFornCot.Close;
  qryFornCot.Params[0].AsInteger := CmpRptCM.ParamValues[0].AsInteger;
  qryFornCot.Open;
  qryFornCot.First;
  //
  qryCotacao.Close;
  qryCotacao.Params[0].AsInteger := CmpRptCM.ParamValues[0].AsInteger;
  qryCotacao.Open;
  memForn.Lines.Clear;
  While (Not qryFornCot.EOF ) And ( x <= MaxForn ) Do
     Begin
        Inc(x);
         memForn.Lines.Add( IntToStr( x )+'  - Prop. Nº '+ IntToStr(qryFornCotPROPOSTA.AsInteger) +'  '+qryFornCotRAZAOSOCIAL.AsString);
        // Marca na query quem são os fornecedores selecionados
        qryCotacao.Filtered := False;
        qryCotacao.Filter   := 'IDFORCLI = '+IntToStr(qryFornCotIDFORCLI.AsInteger);
        qryCotacao.Filtered := True;
        qryCotacao.First;
        While Not qryCotacao.EOF Do
           Begin
              qryCotacao.Edit;
              qryCotacaoPOS.AsInteger     := x;
              qryCotacaoTELEFONE.AsString := qryFornCotTELEFONE.AsString;
              qryCotacaoCONDPAG.AsString  := CalcPrazo('P',qryFornCotIDFORCLI.AsInteger,CmpRptCM.ParamValues[0].AsInteger,qryFornCotPROPOSTA.AsInteger);
              qryCotacaoPRAZOENT.AsString := CalcPrazo('E',qryFornCotIDFORCLI.AsInteger,CmpRptCM.ParamValues[0].AsInteger,qryFornCotPROPOSTA.AsInteger);
              qryCotacao.Post;
              qryCotacao.Next;
           End;
        qryFornCot.Next;
     End;
     iNumForn := x;
     // Atualizando a qurey do Relatório
     qryCotacao.Filtered := False;
     qryCotacao.Filter   := '';
     qryCotacao.First;
     qryCotProdxForn.Close;
     qryCotProdxForn.ParamByName('CODPROCESSO').AsInteger     := CmpRptCM.ParamValues[0].AsInteger;
     qryCotProdxForn.ParamByName('CODALMOXARIFADO').AsInteger := CmpRptCM.ParamValues[7].AsInteger;
     qryCotProdxForn.Open;
     qryCotProdxForn.First;
     While Not qryCotProdxForn.EOF Do
        Begin
           qryCotacao.Filtered := False;
           qryCotacao.Filter   := 'IDPROCXART = '+IntToStr(qryCotProdxFornIDPROCXART.AsInteger);
           qryCotacao.Filtered := True;
           qryCotacao.First;
           While Not qryCotacao.EOF Do
              Begin
                 Case qryCotacaoPOS.AsInteger Of
                     1 : Begin
                            qryCotProdxForn.Edit;
                            qryCotProdxFornFORN1.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                            qryCotProdxFornTELEFONE1.AsString := qryCotacaoTELEFONE.asString;
                            qryCotProdxFornCONDPAG1.AsString  := qryCotacaoCONDPAG.AsString;
                            qryCotProdxFornPRAZOENT1.AsString := qryCotacaoPRAZOENT.AsString;
                            qryCotProdxForn.Post;
                         End;
                     2 : Begin
                            qryCotProdxForn.Edit;
                            qryCotProdxFornFORN2.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                            qryCotProdxFornTELEFONE2.AsString := qryCotacaoTELEFONE.asString;
                            qryCotProdxFornCONDPAG2.AsString  := qryCotacaoCONDPAG.AsString;
                            qryCotProdxFornPRAZOENT2.AsString := qryCotacaoPRAZOENT.AsString;
                            qryCotProdxForn.Post;
                         End;
                     3 : Begin
                            qryCotProdxForn.Edit;
                            qryCotProdxFornFORN3.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                            qryCotProdxFornTELEFONE3.AsString := qryCotacaoTELEFONE.asString;
                            qryCotProdxFornCONDPAG3.AsString  := qryCotacaoCONDPAG.AsString;
                            qryCotProdxFornPRAZOENT3.AsString := qryCotacaoPRAZOENT.AsString;
                            qryCotProdxForn.Post;
                         End;
                     4 : Begin
                            qryCotProdxForn.Edit;
                            qryCotProdxFornFORN4.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                            qryCotProdxFornTELEFONE4.AsString := qryCotacaoTELEFONE.asString;
                            qryCotProdxFornCONDPAG4.AsString  := qryCotacaoCONDPAG.AsString;
                            qryCotProdxFornPRAZOENT4.AsString := qryCotacaoPRAZOENT.AsString;
                            qryCotProdxForn.Post;
                         End;
                     5 : Begin
                            qryCotProdxForn.Edit;
                            qryCotProdxFornFORN5.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                            qryCotProdxFornTELEFONE5.AsString := qryCotacaoTELEFONE.asString;
                            qryCotProdxFornCONDPAG5.AsString  := qryCotacaoCONDPAG.AsString;
                            qryCotProdxFornPRAZOENT5.AsString := qryCotacaoPRAZOENT.AsString;
                            qryCotProdxForn.Post;
                         End;
                     6 : Begin
                            qryCotProdxForn.Edit;
                            qryCotProdxFornFORN6.AsFloat      := qryCotacaoVALTOTPRE.AsFloat;
                            qryCotProdxFornTELEFONE6.AsString := qryCotacaoTELEFONE.asString;
                            qryCotProdxFornCONDPAG6.AsString  := qryCotacaoCONDPAG.AsString;
                            qryCotProdxFornPRAZOENT6.AsString := qryCotacaoPRAZOENT.AsString;
                            qryCotProdxForn.Post;
                         End;
                 End;
                 If (qryCotacaoSTATUS.AsString = 'C') or (qryCotacaoSTATUS.AsString = 'U') Then
                     Begin
                        qryCotProdxForn.Edit;
                        qryCotProdxFornNUNVENC.AsInteger := qryCotacaoPOS.AsInteger;
                        qryCotProdxForn.Post;
                     End;
                 qryCotProdxForn.Edit;
                 qryCotProdxFornVLRMENOR.AsFloat := qryCotacaoMENORVALOR.AsFloat;
                 qryCotProdxForn.Post;
                 qryCotacao.Next;
              End;
           qryCotProdxForn.Next;
        End;
     qryCotProdxForn.First;
     
   qryCotProdxForn.Open;
   //        
   Lbforn1.Visible   := False;
   Lbforn2.Visible   := False;
   Lbforn3.Visible   := False;
   Lbforn4.Visible   := False;
   Lbforn5.Visible   := False;
   Lbforn6.Visible   := False;
  //
   lnCol2.Visible    := False;
   lnCol3.Visible    := False;
   lnCol4.Visible    := False;
   lnCol5.Visible    := False;
   lnCol6.Visible    := False;
  //
   LnSumCol2.Visible := False;
   LnSumCol3.Visible := False;
   LnSumCol4.Visible := False;
   LnSumCol5.Visible := False;
   LnSumCol6.Visible := False;

  For x := 1 To iNumForn Do
    Begin
        Case x Of
           1 : Begin
                   LbForn1.Visible := True;
               End;
           2 : Begin
                   LbForn2.Visible   := True;
                   lnCol2.Visible    := True;
                   LnSumCol2.Visible := True;
               End;
           3 : Begin
                   LbForn3.Visible   := True;
                   lnCol3.Visible    := True;
                   LnSumCol3.Visible := True;
               End;
           4 : Begin
                   LbForn4.Visible   := True;
                   lnCol4.Visible    := True;
                   LnSumCol4.Visible := True;
               End;
           5 : Begin
                   LbForn5.Visible   := True;
                   lnCol5.Visible    := True;
                   LnSumCol5.Visible := True;
               End;
           6 : Begin
                   LbForn6.Visible   := True;
                   lnCol6.Visible    := True;
                   LnSumCol6.Visible := True;
               End;
        End;
    End;

   LbCodProc.Caption  := CmpRptCM.ParamValues[0].asString;
   RgCotPxF1.Visible  := False;
   RgCotPxF2.Visible  := False;
   RgCotPxF3.Visible  := False;
   RgCotPxF4.Visible  := False;
   RgCotPxF5.Visible  := False;
  //
  If Not CmpRptCM.ParamValues[1].IsNull Then
     Begin
         RgCotPxF1.Visible  := True;
         LbCarimbo1.Caption := CmpRptCM.ParamValues[1].asString;
     End;
  If Not CmpRptCM.ParamValues[2].IsNull Then
     Begin
         RgCotPxF2.Visible  := True;
         LbCarimbo2.Caption := CmpRptCM.ParamValues[2].asString;
     End;
  If Not CmpRptCM.ParamValues[3].IsNull Then
     Begin
         RgCotPxF3.Visible  := True;
         LbCarimbo3.Caption := CmpRptCM.ParamValues[3].asString;
     End;
  If Not CmpRptCM.ParamValues[4].IsNull Then
     Begin
         RgCotPxF4.Visible  := True;
         LbCarimbo4.Caption := CmpRptCM.ParamValues[4].asString;
     End;
  If Not CmpRptCM.ParamValues[5].IsNull Then
     Begin
         RgCotPxF5.Visible  := True;
         LbCarimbo5.Caption := CmpRptCM.ParamValues[5].asString;
     End;
end;

procedure TRptCotProdxForn.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  If qryCotProdxForn.Active Then
     qryCotProdxForn.Close;
  qryCotProdxForn.DataBaseName := sDataBaseName;
  //
  If qryFornCot.Active Then
     qryFornCot.Close;
  qryFornCot.DataBaseName := sDataBaseName;
  //
  If qryCotacao.Active Then
     qryCotacao.Close;
  qryCotacao.DataBaseName := sDataBaseName;
  //
  If qryPrazo.Active Then
     qryPrazo.Close;
  qryPrazo.DataBaseName := sDataBaseName;
end;

end.
