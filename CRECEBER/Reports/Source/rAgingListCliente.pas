unit rAgingListCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, DBTables, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlParamIntegra, TXRB;

type
  TRptAgingListCliente = class(TFrmCmReport)
    PpAgingTipoCli: TppBDEPipeline;
    DsAgingTipoCli: TwwDataSource;
    RptAginTipoCli: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel16: TppLabel;
    LblPosSaldosTipo: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    Lblt120: TppLabel;
    Lblt30: TppLabel;
    Lblt60: TppLabel;
    Lblt90: TppLabel;
    Lblt150: TppLabel;
    Lblt180: TppLabel;
    Lbltm180: TppLabel;
    ppLabel45: TppLabel;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel46: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppLine31: TppLine;
    RptAginTipoCliDBText1: TppDBText;
    RptAginTipoCliDBText2: TppDBText;
    Lt30: TppDBText;
    Lt90: TppDBText;
    Lt60: TppDBText;
    Lt120: TppDBText;
    Lt150: TppDBText;
    Ltm180: TppDBText;
    Lt180: TppDBText;
    RptAginTipoCliDBText10: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLabel47: TppLabel;
    ppLine29: TppLine;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine30: TppLine;
    RptAginTipoCliDBCalc1: TppDBCalc;
    Ltt30: TppDBCalc;
    Ltt60: TppDBCalc;
    Ltt90: TppDBCalc;
    Ltt120: TppDBCalc;
    Ltt150: TppDBCalc;
    Ltt180: TppDBCalc;
    Lttm180: TppDBCalc;
    RptAginTipoCliDBCalc9: TppDBCalc;
    CdsAgingTipoCli: TCMClientDataSet;
    SqlAgingTipoCli: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    iSumSaldo: array[0..7] of Double;
    iDatasSaldo: array[0..5] of Integer;
  public
    { Public declarations }
  end;

var
  RptAgingListCliente: TRptAgingListCliente;

implementation

{$R *.DFM}

procedure TRptAgingListCliente.CrmRptCMBeforePrint(Sender: TObject);
var
  X: Integer;
begin
  inherited;
  for X := 0 to 7 do
    iSumSaldo[X] := 0;

  SqlAux.SQL.Clear;
  SqlAux.SQL.Add('SELECT DD30,DD60,DD90,DD120,DD150,DD180 FROM PARAMCAP WHERE RECPAG = ''' +
    ParamIntegra.RecPag + ''' AND IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
  SqlAux.Open;

  iDatasSaldo[0] := CdsAux.FieldByName('DD30').AsInteger;
  iDatasSaldo[1] := CdsAux.FieldByName('DD60').AsInteger;
  iDatasSaldo[2] := CdsAux.FieldByName('DD90').AsInteger;
  iDatasSaldo[3] := CdsAux.FieldByName('DD120').AsInteger;
  iDatasSaldo[4] := CdsAux.FieldByName('DD150').AsInteger;
  iDatasSaldo[5] := CdsAux.FieldByName('DD180').AsInteger;

  Lblt30.Caption := IntToStr(iDatasSaldo[0]);
  Lblt60.Caption := IntToStr(iDatasSaldo[1]);
  Lblt90.Caption := IntToStr(iDatasSaldo[2]);
  Lblt120.Caption := IntToStr(iDatasSaldo[3]);
  Lblt150.Caption := IntToStr(iDatasSaldo[4]);
  Lblt180.Caption := IntToStr(iDatasSaldo[5]);
  LbltM180.Caption := '+ ' + IntToStr(iDatasSaldo[5]);

  Lblt30.Visible := true;
  Lblt60.Visible := ((not (iDatasSaldo[1] = 0)) or (not (iDatasSaldo[0] = 0)));
  Lblt90.Visible := ((not (iDatasSaldo[2] = 0)) or (not (iDatasSaldo[1] = 0)));
  Lblt120.Visible := ((not (iDatasSaldo[3] = 0)) or (not (iDatasSaldo[2] = 0)));
  Lblt150.Visible := ((not (iDatasSaldo[4] = 0)) or (not (iDatasSaldo[3] = 0)));
  Lblt180.Visible := ((not (iDatasSaldo[5] = 0)) or (not (iDatasSaldo[4] = 0)));
  LbltM180.Visible := not (iDatasSaldo[5] = 0);

  Ltt30.Visible := Lblt30.Visible;
  Ltt60.Visible := Lblt60.Visible;
  Ltt90.Visible := Lblt90.Visible;
  Ltt120.Visible := Lblt120.Visible;
  Ltt150.Visible := Lblt150.Visible;
  Ltt180.Visible := Lblt180.Visible;
  LttM180.Visible := LbltM180.Visible;

  with SqlAgingTipoCli do
  begin
    SQL.Clear;
    SQL.Add('  SELECT  /*+ RULE */ SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,U.SALDO,0)) AS SALDOAV,   ');
    if (iDatasSaldo[0] = 0) then
    begin
      Lblt30.Caption := '+ ' + Lblt30.Caption;
      SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,U.SALDO)) AS SALDO30,        ');
      SQL.Add('             SUM(0) AS SALDO60,       ');
      SQL.Add('             SUM(0) AS SALDO90,       ');
      SQL.Add('             SUM(0) AS SALDO120,      ');
      SQL.Add('             SUM(0) AS SALDO150,      ');
      SQL.Add('             SUM(0) AS SALDO180,      ');
      SQL.Add('             SUM(0) AS SALDOM180,     ');
    end
    else
    begin
      SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                      ');
      SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,U.SALDO,0))) AS SALDO30,        ');

      if (iDatasSaldo[1] = 0) then
      begin
        Lblt60.Caption := '+ ' + Lblt30.Caption;
        SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
        SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,U.SALDO))) AS SALDO60,        ');
        SQL.Add('             SUM(0) AS SALDO90,       ');
        SQL.Add('             SUM(0) AS SALDO120,      ');
        SQL.Add('             SUM(0) AS SALDO150,      ');
        SQL.Add('             SUM(0) AS SALDO180,      ');
        SQL.Add('             SUM(0) AS SALDOM180,     ');
      end
      else
      begin
        SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
        SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
        SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,U.SALDO,0)))) AS SALDO60,       ');

        if (iDatasSaldo[2] = 0) then
        begin
          Lblt90.Caption := '+ ' + Lblt60.Caption;
          SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,U.SALDO))) AS SALDO90,        ');
          SQL.Add('             SUM(0) AS SALDO120,      ');
          SQL.Add('             SUM(0) AS SALDO150,      ');
          SQL.Add('             SUM(0) AS SALDO180,      ');
          SQL.Add('             SUM(0) AS SALDOM180,     ');
        end
        else
        begin
          SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
          SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,U.SALDO,0))))) AS SALDO90,      ');

          if (iDatasSaldo[3] = 0) then
          begin
            Lblt120.Caption := '+ ' + Lblt90.Caption;
            SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,U.SALDO))) AS SALDO120,        ');
            SQL.Add('             SUM(0) AS SALDO150,      ');
            SQL.Add('             SUM(0) AS SALDO180,      ');
            SQL.Add('             SUM(0) AS SALDOM180,     ');
          end
          else
          begin
            SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,                              ');
            SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,U.SALDO,0)))))) AS SALDO120,   ');

            if (iDatasSaldo[4] = 0) then
            begin
              Lblt150.Caption := '+ ' + Lblt120.Caption;
              SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,0,U.SALDO))) AS SALDO150,        ');
              SQL.Add('             SUM(0) AS SALDO180,      ');
              SQL.Add('             SUM(0) AS SALDOM180,     ');
            end
            else
            begin
              SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,                              ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,0,                             ');
              SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD150),1,U.SALDO,0))))))) AS SALDO150,  ');

              if (iDatasSaldo[5] = 0) then
              begin
                Lblt180.Caption := '+ ' + Lblt150.Caption;
                SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD150),1,0,U.SALDO))) AS SALDO180,        ');
                SQL.Add('             SUM(0) AS SALDOM180,     ');
              end
              else
              begin
                SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD30),1,0,                              ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD60),1,0,                              ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD90),1,0,                              ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD120),1,0,                             ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD150),1,0,                             ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD180),1,U.SALDO,0)))))))) AS SALDO180, ');
                SQL.Add('       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')),1,0,                                       ');
                SQL.Add('             DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,''DD/MM/YYYY'')+P.DD180),1,0,U.SALDO))) AS SALDOM180,     ');
              end;
            end;
          end;
        end;
      end;
    end;
    SQL.Add('       SUM(U.SALDO) AS SALDOTOT,                                                                                  ');
    SQL.Add('       T.IDTIPOCLIENTE, T.DESCRICAO                                                                               ');
    SQL.Add('FROM                                                                                                              ');
    SQL.Add('(                                                                                                                 ');
    SQL.Add('(SELECT D.CODDOCUMENTO,                                                                                           ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM, ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO        ');
    SQL.Add('FROM DOCUMENTO D,                                                                                                                 ');
    SQL.Add('     LANCTODOCUM L                                                                                                                ');
    SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                                                                                           ');
    SQL.Add('  AND (D.RECPAG = ''R'')                                                                                                            ');
    SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                                                                                    ');
    SQL.Add('  AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))                                                                            ');
    SQL.Add('  AND ((D.OPERACAO = ''2 '') OR                                                                                                     ');
    SQL.Add('       (D.OPERACAO = ''15'') OR                                                                                                     ');
    SQL.Add('       ((D.OPERACAO = ''1 '') AND (D.NUMFATURA IS NULL ) ) )                                                                        ');
    SQL.Add(' GROUP BY                                                                                                                          ');
    SQL.Add('        D.CODDOCUMENTO                                                                                                             ');
    SQL.Add(' HAVING (ROUND(SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))),2) <> 0)  ');
    SQL.Add(' )                                                              ');
    SQL.Add(' UNION ALL                                                      ');
    SQL.Add(' (                                                              ');
    SQL.Add(' SELECT D.CODDOCUMENTO,                                         ');
    SQL.Add('        (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))))*S1.SALDOOM1/DECODE(S3.SALDOOM3,0,NULL,S3.SALDOOM3) AS SALDOOM, ');
    SQL.Add('        (SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))))*S1.SALDO1/DECODE(S3.SALDO3,0,NULL,S3.SALDO3) AS SALDO  ');
    SQL.Add(' FROM DOCUMENTO D,                                              ');
    SQL.Add('      LANCTODOCUM L,                                            ');
    SQL.Add('      (SELECT D.NUMFATURA,                                      ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM1,  ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO1  ');
    SQL.Add('       FROM DOCUMENTO D,                                        ');
    SQL.Add('            LANCTODOCUM L                                       ');
    SQL.Add('       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                  ');
    SQL.Add('         AND (D.OPERACAO = ''1 '')                              ');
    SQL.Add('         AND (D.RECPAG = ''R'')                                 ');
    SQL.Add('         AND (D.IDPESSOA = :IDPESSOA)                           ');
    SQL.Add('         AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) ');
    SQL.Add('         AND (D.NUMFATURA IS NOT NULL)                          ');
    SQL.Add('       GROUP BY D.NUMFATURA) S1,                                ');
    SQL.Add('      (SELECT D.NUMFATURA,                                      ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM3, ');
    SQL.Add('              SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO3 ');
    SQL.Add('       FROM DOCUMENTO D,                                        ');
    SQL.Add('            LANCTODOCUM L                                       ');
    SQL.Add('       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                  ');
    SQL.Add('         AND (D.OPERACAO = L.OPERACAO)                          ');
    SQL.Add('         AND (D.OPERACAO = ''3 '')                              ');
    SQL.Add('         AND (D.RECPAG = ''R'')                                 ');
    SQL.Add('         AND (D.IDPESSOA = :IDPESSOA)                           ');
    SQL.Add('         AND (D.NUMFATURA IS NOT NULL)                          ');
    SQL.Add('       GROUP BY D.NUMFATURA) S3                                 ');
    SQL.Add(' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                        ');
    SQL.Add('   AND (D.OPERACAO = L.OPERACAO)                                ');
    SQL.Add('   AND (D.NUMFATURA = S1.NUMFATURA)                             ');
    SQL.Add('   AND (D.NUMFATURA = S3.NUMFATURA)                             ');
    SQL.Add('   AND (D.RECPAG = ''R'')                                       ');
    SQL.Add('   AND (D.IDPESSOA = :IDPESSOA)                                 ');
    SQL.Add('   AND (D.OPERACAO =''3 '')                                     ');
    SQL.Add(' GROUP BY                                                       ');
    SQL.Add('        D.CODDOCUMENTO,                                         ');
    SQL.Add('        S1.SALDOOM1,                                            ');
    SQL.Add('        S3.SALDOOM3,                                            ');
    SQL.Add('        S1.SALDO1,                                              ');
    SQL.Add('        S3.SALDO3                                               ');
    SQL.Add(' HAVING (ROUND((SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))))*S1.SALDO1/DECODE(S3.SALDO3,0,NULL,S3.SALDO3) ,2) <> 0) ');
    SQL.Add('        )                                                       ');
    SQL.Add(' UNION ALL                                                      ');
    SQL.Add(' (                                                              ');
    SQL.Add(' SELECT D.CODDOCUMENTO,                                         ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM, ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))) AS SALDO  ');
    SQL.Add(' FROM DOCUMENTO D,                                               ');
    SQL.Add('      LANCTODOCUM L                                              ');
    SQL.Add(' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                         ');
    SQL.Add('   AND (D.RECPAG = ''R'')                                        ');
    SQL.Add('   AND (D.IDPESSOA = :IDPESSOA)                                  ');
    SQL.Add('   AND (L.DATALANCTO <= TO_DATE(:DATAREF,''DD/MM/YYYY''))        ');
    SQL.Add('   AND (D.OPERACAO =''3 '')                                      ');
    SQL.Add('   AND (L.OPERACAO <> ''3 '')                                    ');
    SQL.Add(' GROUP BY                                                        ');
    SQL.Add('        D.CODDOCUMENTO                                           ');
    SQL.Add(' HAVING (ROUND(SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))),2) <> 0) ');
    SQL.Add('  )                                                              ');
    SQL.Add(' ) U,                                                            ');
    SQL.Add('   DOCUMENTO D,                                                  ');
    SQL.Add('   CLIENTEPESS C,                                                ');
    SQL.Add('   TIPOCLIENTE T,                                                ');
    SQL.Add('   PARAMCAP P                                                    ');
    SQL.Add('WHERE (U.CODDOCUMENTO = D.CODDOCUMENTO)                          ');
    SQL.Add('  AND (D.RECPAG = P.RECPAG)                                      ');
    SQL.Add('  AND (D.IDPESSOA = P.IDPESSOA)                                  ');
    SQL.Add('  AND (D.RECPAG = ''R'')                                         ');
    SQL.Add('  AND (D.IDPESSOA = :IDPESSOA)                                   ');
    SQL.Add('  AND (D.IDFORCLI = C.IDPESSOA(+))                               ');
    SQL.Add('  AND (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+))                     ');
    SQL.Add('GROUP BY T.IDTIPOCLIENTE, T.DESCRICAO                            ');
    SQL.Add('ORDER BY T.DESCRICAO                                             ');
    Prepare;
    ParamByName('DATAREF').AsString := CmpRptCM.ParamValues[0].AsString;
    ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Open;
  end;
end;

end.

