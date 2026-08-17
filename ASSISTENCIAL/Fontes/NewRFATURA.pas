unit RFATURA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  ppStrtch, ppSubRpt,{$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptFatura = class(TFrmCmReport)
    PpRptCM: TppBDEPipeline;
    DsRptCM: TwwDataSource;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    QryRptCM: TwwQuery;
    AQryFundacao: TADOQuery;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    DspFundacao: TDataSetProvider;
    CdsFundacao: TClientDataSet;
    aQryRptCm: TADOQuery;
    RpFatura: TppReport;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMMESREF: TStringField;
    QryRptCMMESCOBRANCA: TStringField;
    QryRptCMPRODUTO: TStringField;
    QryRptCMPERCIOF: TFloatField;
    QryRptCMPERCPROLABORE: TFloatField;
    QryRptCMTOTALEXCLUIDO: TFloatField;
    QryRptCMVALOREXCLUIDO: TFloatField;
    QryRptCMTOTALINCLUIDO: TFloatField;
    QryRptCMVALORINCLUIDO: TFloatField;
    QryRptCMVIDASANTERIOR: TFloatField;
    QryRptCMTOTALAANTERIOR: TFloatField;
    QryRptCMVIDASATUAL: TFloatField;
    QryRptCMTOTALATUAL: TFloatField;
    ppHeaderBand12: TppHeaderBand;
    ppDBImage10: TppDBImage;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppLabel96: TppLabel;
    ppDBText117: TppDBText;
    ppLine2: TppLine;
    ppDetailBand12: TppDetailBand;
    rpdivergerecebimentoDBText10: TppDBText;
    DBTextPAnt: TppDBText;
    ppDBVAnt: TppDBText;
    ppDBTextVInc: TppDBText;
    ppDBTextPInc: TppDBText;
    ppDBTextVExc: TppDBText;
    ppDBTextPEsc: TppDBText;
    ppDBTextVAtual: TppDBText;
    ppDBTextPAtual: TppDBText;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine13: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine20: TppLine;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLine6: TppLine;
    ppLine22: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine3: TppLine;
    ppLine7: TppLine;
    ppLabel17: TppLabel;
    ppLine9: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppVarIOF: TppVariable;
    ppVarPTotal: TppVariable;
    ppVarProLabore: TppVariable;
    ppDBCalcIOF: TppDBCalc;
    ppDBCalcProLabore: TppDBCalc;
    ppVarTotLiquido: TppVariable;
    ppVariable1: TppVariable;
    ppFooterBand12: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppLine14: TppLine;
    rpdivergerecebimentoSummaryBand1: TppSummaryBand;
    ppVarTotalLiquido: TppVariable;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppVarTotalBruto: TppVariable;
    ppLabel16: TppLabel;
    ppVarTotalIOF: TppVariable;
    ppLabel23: TppLabel;
    ppVarTotalProLabore: TppVariable;
    ppLabel25: TppLabel;
    ppLine17: TppLine;
    ppDBCalc1: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpdivergerecebimentoDBText14: TppDBText;
    rpdivergerecebimentoLabel6: TppLabel;
    rpdivergerecebimentoLabel13: TppLabel;
    rpdivergerecebimentoDBText6: TppDBText;
    rpdivergerecebimentoDBText13: TppDBText;
    rpLabelTitulo: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDBTextVExcGetText(Sender: TObject; var Text: String);
    procedure ppDBTextPEscGetText(Sender: TObject; var Text: String);
    procedure ppDBTextVIncGetText(Sender: TObject; var Text: String);
    procedure ppDBTextPIncGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

Type Str8 = String[8];  

Var
  RptFatura: TRptFatura;

implementation
 
Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Function MesAnterior(Mes:Str8): Str8;
Var MM,AA,Erro: Integer;
    sSt       : Str8;
begin
  MM:=0;
  Val(Copy(Mes,1,4),AA,Erro);
  If Erro=0 then Val(Copy(Mes,6,2),MM,Erro);
  If Erro=0 then
  Case MM Of
    2..12: Dec(MM,1);
    1    : begin
             MM:=12;
             Dec(AA,1);
           end;
    else Erro:=1;
   end; {Case}
   Str(AA,sSt);
   Mes:=sSt+'/';
   Str(MM,sSt);
   If MM In [1..9] then sSt:='0'+sSt;
   Mes:=Mes+sSt;
   Result:=Mes;
end;

Procedure TRptFatura.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptFatura.CrmRptCMBeforePrint(Sender: TObject);
Var sSql: String;
    sMesAnt,
    sMesCob : String[8];
begin
  inherited;
  If Not CmpRptCM.ParamValues[0].IsNull Then
  begin
    sMesCob:=CmpRptCM.ParamValues[0].AsString;
    sMesAnt:=MesAnterior(sMesCob);
  end else Exit;

  If CmpRptCM.ParamValues[1].IsNull Then Exit;

    {**
    Evento utilizado para montagem do(s) sql(´s) do relatório de acordo com
    os parâmetros do ParamReports CmpRptCM.
    Os parêmetros podem ser acessados pelo índice (PARAMVALUES) ou pelo nome (PARAMBYNAME).
    É interessante observar o tipo de conexão em uso oque implica que o(s) SQL(´s) montados
    sejam atribuidos ao DATASET correto ou a todos os DATASET´S
  **}
  //sSql := '';

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:=
       'SELECT DISTINCT'+
       ' PJ.NOME AS PATROCINADORA,'+
       ' H.MES AS MESREF,'+
       ' H.MESCOBRANCA,'+
       ' PD.NOME AS PRODUTO,'+
       ' PD.PERCIOF, PD. PERCPROLABORE,';

     If StrToIntDef(CmpRptCM.ParamValues[1].AsString,0)=1 then
     begin
       rpLabelTitulo.Text:='FATURA MENSAL DO CÁLCULO - PREVISÃO';
       sSql:=sSql+
         '((SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT '+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         (* 'N' - Rubrica Normal - FlgAtrasoDevol da Provdesc *)
         '  AND (HST.IDTIPO = ''N'') '+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  ) - '+
         ' (SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+

         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  )) TOTALEXCLUIDO,'+

         '((SELECT SUM(VALORESPERADO)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  ) - '+
         ' (SELECT SUM(VALORESPERADO)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  )) VALOREXCLUIDO,'+

         '((SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  ) - '+
         ' (SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  )) TOTALINCLUIDO,'+

         '((SELECT SUM(HST.VALORESPERADO)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)) - '+
         ' (SELECT SUM(HST.VALORESPERADO)'+
         '  FROM HSTCONTRIBASS HST, PARTASS PT'+
         '  WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (HST.MES = H.MES)'+
         '  AND (HST.IDTIPO = ''N'')'+
         '  AND (HST.IDPESSJUR   = H.IDPESSJUR) '+
         '  AND  (HST.IDPLANOPREV = H.IDPLANOPREV) '+
         '  AND PT.IDPLANASS = HST.IDPLANASS '+
         '  AND PT.IDPLANOPREV = HST.IDPLANOPREV '+
         '  AND PT.IDPESSJUR = HST.IDPESSJUR '+
         '  AND PT.IDPESSOA  = HST.IDTITULAR '+
         '  AND (HST.VALORESPERADO>0)  )) VALORINCLUIDO,'+

         ' (SELECT COUNT(*)'+
         ' FROM HSTCONTRIBASS HST, PARTASS PT'+
         ' WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+') AND'+
         ' (HST.MES = H.MES) AND'+

         ' (HST.IDTIPO = ''N'') AND'+
         ' (HST.IDPESSJUR   = H.IDPESSJUR)    AND '+
         '  (HST.IDPLANOPREV = H.IDPLANOPREV) AND '+
         ' PT.IDPLANASS = HST.IDPLANASS       AND '+
         ' PT.IDPLANOPREV = HST.IDPLANOPREV   AND '+
         ' PT.IDPESSJUR = HST.IDPESSJUR       AND '+
         ' PT.IDPESSOA  = HST.IDTITULAR       AND '+
         ' (HST.VALORESPERADO>0)    ) VIDASANTERIOR,'+

         ' (SELECT SUM(HST.VALORESPERADO)'+
         ' FROM HSTCONTRIBASS HST, PARTASS PT'+
         ' WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+') AND'+
         ' (HST.MES = H.MES) AND'+

         ' (HST.IDTIPO = ''N'') AND'+
         ' (HST.IDPESSJUR   = H.IDPESSJUR)    AND '+
         '  (HST.IDPLANOPREV = H.IDPLANOPREV) AND '+
         ' PT.IDPLANASS = HST.IDPLANASS       AND '+
         ' PT.IDPLANOPREV = HST.IDPLANOPREV   AND '+
         ' PT.IDPESSJUR = HST.IDPESSJUR       AND '+
         ' PT.IDPESSOA  = HST.IDTITULAR       AND '+
         ' (HST.VALORESPERADO>0)    ) TOTALAANTERIOR,'+

         ' (SELECT COUNT(*)'+
         ' FROM HSTCONTRIBASS HST, PARTASS PT'+
         ' WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         ' (HST.MES = H.MES) AND'+

         ' (HST.IDPESSJUR   = H.IDPESSJUR)    AND '+
         '  (HST.IDPLANOPREV = H.IDPLANOPREV) AND '+
         ' PT.IDPLANASS = HST.IDPLANASS       AND '+
         ' PT.IDPLANOPREV = HST.IDPLANOPREV   AND '+
         ' PT.IDPESSJUR = HST.IDPESSJUR       AND '+
         ' PT.IDPESSOA  = HST.IDTITULAR       AND '+
         ' (HST.VALORESPERADO>0)  ) VIDASATUAL,'+

         ' (SELECT SUM(HST.VALORESPERADO)'+
         ' FROM HSTCONTRIBASS HST, PARTASS PT'+
         ' WHERE (HST.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         ' (HST.MES = H.MES) AND'+
         ' (HST.IDPESSJUR   = H.IDPESSJUR)   AND '+
         ' (HST.IDPLANOPREV = H.IDPLANOPREV) AND '+
         '  PT.IDPLANASS = HST.IDPLANASS     AND '+
         '  PT.IDPLANOPREV = HST.IDPLANOPREV AND '+
         '  PT.IDPESSJUR = HST.IDPESSJUR     AND '+
         '  PT.IDPESSOA  = HST.IDTITULAR     AND '+
         '  (HST.VALORESPERADO>0)  )  TOTALATUAL'+

         ' FROM'+
         ' HSTCONTRIBASS H,'+
         ' PARTASS P,'+
         ' PESSOA PJ,'+
         ' PLANASS PL,'+
         ' PRODASS PD'+

         ' WHERE'+
         ' (H.VALORESPERADO>0) AND'+
         ' (H.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         '      PJ.IDPESSOA  = H.IDPESSJUR     AND '+
         '      H.IDPLANASS  = PL.IDPLANASS    AND '+
         '      PL.IDPRODASS = PD.IDPRODASS    AND '+
         '      P.IDPESSOA  = H.IDTITULAR      AND '+
         '      P.IDPESSJUR = H.IDPESSJUR      AND '+
         '      P.IDPLANOPREV = H.IDPLANOPREV  AND '+
         '      P.IDPLANASS   = H.IDPLANASS        '+


{         ' (H.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         ' (H.IDTITULAR = P.IDPESSOA) AND'+
         ' (P.FLGINSCRICAOCANC = ''0'') AND'+
         ' (PJ.IDPESSOA=H.IDPESSJUR) AND'+
         ' (H.IDPLANASS=PL.IDPLANASS) AND'+
         ' (PL.IDPRODASS=PD.IDPRODASS)'+

         '  and h.idpessjur = p.idpessjur '+
         '  and h.idplanoprev = p.idplanoprev '+

}
         ' ORDER BY PJ.NOME, H.MES '
     end
     else
     begin
       rpLabelTitulo.Text:='FATURA MENSAL DO RECEBIMENTO';
       sSql:=sSql+
         '((SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0)) - '+
         ' (SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0))) TOTALEXCLUIDO,'+

         '((SELECT SUM(VALORRECEBIDO)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0)) - '+
         ' (SELECT SUM(VALORRECEBIDO)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0))) VALOREXCLUIDO,'+

         '((SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0)) - '+
         ' (SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0))) TOTALINCLUIDO,'+

         '((SELECT SUM(VALORRECEBIDO)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0)) - '+
         ' (SELECT SUM(VALORRECEBIDO)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+')'+
         '  AND (MES = H.MES)'+
         '  AND (IDTIPO = ''N'')'+
         '  AND (IDPESSJUR=H.IDPESSJUR)'+
         '  AND (VALORRECEBIDO>0))) VALORINCLUIDO,'+

         ' (SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+') AND'+
         '        (MES = H.MES) AND'+
         '        (IDTIPO = ''N'') AND'+
         '        (IDPESSJUR=H.IDPESSJUR) AND'+
         '        (VALORRECEBIDO>0)) VIDASANTERIOR,'+

         ' (SELECT SUM(VALORRECEBIDO)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesAnt+Chr(39)+') AND'+
         '        (MES = H.MES) AND'+
         '        (IDTIPO = ''N'') AND'+
         '  (IDPESSJUR=H.IDPESSJUR) AND'+
         '  (VALORRECEBIDO>0)) TOTALAANTERIOR,'+

         ' (SELECT COUNT(*)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         '        (MES = H.MES) AND'+
         '  (IDPESSJUR=H.IDPESSJUR) AND'+
         '  (VALORRECEBIDO>0)) VIDASATUAL,'+

         ' (SELECT SUM(VALORRECEBIDO)'+
         '  FROM HSTCONTRIBASS'+
         '  WHERE (MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         '        (MES = H.MES) AND'+
         '  (IDPESSJUR=H.IDPESSJUR) AND'+
         '  (VALORRECEBIDO>0))  TOTALATUAL'+

         ' FROM'+
         ' HSTCONTRIBASS H,'+
         ' PESSOA PJ,'+
         ' PLANASS PL,'+
         ' PRODASS PD'+

         ' WHERE'+
         ' (H.VALORRECEBIDO>0) AND'+
         ' (H.MESCOBRANCA = '+Chr(39)+sMesCob+Chr(39)+') AND'+
         ' (PJ.IDPESSOA=H.IDPESSJUR) AND'+
         ' (H.IDPLANASS=PL.IDPLANASS) AND'+
         ' (PL.IDPRODASS=PD.IDPRODASS)'+

         ' ORDER BY PJ.NOME, H.MES';
     end;
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptFatura.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  {**
    Ente evento é disparado quando é atribuído o DataBaseName a ser utilizado
    pelos BDEDATASETS do relatório.
    A função ChangeDataBaseName auxilia na atribuição do mesmo pois tem como
    parâmetro um ARRAY de DATASETS onde podemos atrbuir a todos os datasets do form
    a alteração do DATABSENAME. Esta função esta na uDataBase
  **}
  ChangeDataBaseName([QryRptCM,QryFundacao],sDataBaseName);
end;

procedure TRptFatura.CrmRptCMChangeConnectionType(Sender: TObject;
  ConnectionType: TDbConnectionType);
begin
  inherited;
  {**
    O tipo de conexão pode variar de acordo com o tipo de aplicação
    e isso implica que sejam apontados para os respectivos DATASETPROVIDERS
    as Queryes de acordo com o tipo de Conexão.
    Temos hoje as seguintes conexões previstas:
    cntBDE >> BDE
    cntADO >> ADO
    cntIB  >> Inter Base
    cntDOA >> Direct Oracle Acces
  **}
  Case ConnectionType of
    cntBDE: begin
              Dsp.DataSet := QryRptCM;
              DspFundacao.Dataset := QryFundacao;
            end;
    cntADO: begin
              Dsp.DataSet := aQryRptCM;
              DspFundacao.DataSet :=aQryFundacao;
            end;

    cntIB: ;
    cntDOA: ;
  End;
end;

procedure TRptFatura.CrmRptCMChangeConnection(Sender: TObject;
  Connection: TADOConnection);
begin
  inherited;
  {**
    Assim como no OnChangeDataBaseName, se estamos utilizando a conexão via
    ADO temos que atribuir o ADOCONNECTION do nosso sistema as Queryes ADO do
    form de relatório
   *}
  AQryRptCM.Connection := Connection;
  AQryFundacao.Connection := Connection;
end;

procedure TRptFatura.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptFatura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptFatura.ppDBTextVExcGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  If StrToIntDef(Text,0)<0 then Text:='0';
end;

procedure TRptFatura.ppDBTextPEscGetText(Sender: TObject;
  var Text: String);
Var fResult: Double;
    Erro   : Integer;
begin
  inherited;
  Val(Text,fResult,Erro);
  If fResult<=0 then Text:='0,00';
end;

procedure TRptFatura.ppDBTextVIncGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  If StrToIntDef(Text,0)<0 then Text:='0';
end;

procedure TRptFatura.ppDBTextPIncGetText(Sender: TObject;
  var Text: String);
Var fResult: Double;
    Erro   : Integer;
begin
  inherited;
  Val(Text,fResult,Erro);
  If fResult<=0 then Text:='0,00';
end;

end.
