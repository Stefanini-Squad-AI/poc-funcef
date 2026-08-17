unit rDiarioResumido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwquery,uSistema, ppStrtch, ppMemo,
  uCtrlRptBalancete, uCtrlPeriodo, uGImp,uString, uCMFileUtils,jclStrings,
  TXRB;

type
  TrptDiarioResumido = class(TFrmCmReport)
    sqlDiario: TCMSqlParams;
    cdsDiario: TCMClientDataSet;
    dsDiario: TwwDataSource;
    pplDiario: TppBDEPipeline;
    rptDiario: TppReport;
    ppHeaderBand15: TppHeaderBand;
    pplblTituloDiario: TppLabel;
    ppLine41: TppLine;
    LblEmpresa: TppLabel;
    ppLabel95: TppLabel;
    ppLine42: TppLine;
    ppLabel97: TppLabel;
    ppLabel100: TppLabel;
    ppLabel103: TppLabel;
    txtLabelTotHead: TppLabel;
    txtTotTransportadoD: TppLabel;
    txtTotTransportadoC: TppLabel;
    lblSomaCreCab: TppDBCalc;
    lblSomaDebCab: TppDBCalc;
    rptDiarioLine3: TppLine;
    rptDiarioLabel4: TppLabel;
    ppDetailBand7: TppDetailBand;
    dbtxtContaDiario: TppDBText;
    ppDBText39: TppDBText;
    ppDBText43: TppDBText;
    rptDiarioDBText4: TppDBText;
    ppFooterBand15: TppFooterBand;
    lblContadorDia: TppLabel;
    rptDiarioLabel3: TppLabel;
    txtLabelTot: TppLabel;
    rptDiarioLine2: TppLine;
    lblSomaDebFot: TppDBCalc;
    lblSomaCreFot: TppDBCalc;
    rptDiarioLine1: TppLine;
    lblCalcContadorDia: TppSystemVariable;
    lblCalcMaxPagDia: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine43: TppLine;
    lblData: TppDBText;
    ppLabel108: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel111: TppLabel;
    ppLine45: TppLine;
    rptDiarioDBCalc1: TppDBCalc;
    rptDiarioDBCalc2: TppDBCalc;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    pplDiarioppField22: TppField;
    ppDBMemo1: TppDBMemo;
    txtTotATransportarD: TppLabel;
    txtTotATransportarC: TppLabel;
    giDiario: TGImp;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlDiarioFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure ppDetailBand7BeforeGenerate(Sender: TObject);
    procedure ppHeaderBand15BeforePrint(Sender: TObject);
    procedure txtTotTransportadoDPrint(Sender: TObject);
    procedure txtTotTransportadoCPrint(Sender: TObject);
    procedure ppFooterBand15BeforePrint(Sender: TObject);
    procedure txtTotATransportarDPrint(Sender: TObject);
    procedure txtTotATransportarCPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlPeriodo : TCtrlPeriodo;
  public
    { Public declarations }
  end;

var
  rptDiarioResumido: TrptDiarioResumido;

implementation

{$R *.DFM}

Uses uFuncaoGeral, dBaseDados;

procedure TrptDiarioResumido.CrmRptCMBeforePrint(Sender: TObject);
var lstRelatorio : TStrings;
    iContador,iPag,iLinha : Integer;
    sArquivo,sLinha,sDataAnt : String;
    rTotDeb,rTotCre,rTotDiaDeb,rTotDiaCre : Double;

  procedure FazCabecalho;
  begin
     if ( iContador = 49) or (iLinha = 0) then begin
        if (iLinha > 0) and((rTotDeb <> 0) or (rTotCre <> 0)) then begin
          iLinha := lstRelatorio.Add(StrRepeat('-',130));
          sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+
                    AD('Total a Transportar:',40)+' '+
                    AD(FormatFloat('#########,###,###,##0.00',rTotDeb),20)+' '+
                    AD(FormatFloat('#########,###,###,##0.00',rTotCre),20);
          iLinha := lstRelatorio.Add(sLinha);
          iLinha := lstRelatorio.Add(StrRepeat('-',130));
        end;
        iLinha := lstRelatorio.Add('');
        iContador := 0;
        iLinha := lstRelatorio.Add(StrCenter(Sistema.RazaoSocial,130,' '));
        iLinha := lstRelatorio.Add(StrCenter('D I Á R I O',130,' '));
        iLinha := lstRelatorio.Add('');
        iLinha := lstRelatorio.Add('Folha: '+IntToStr(iPag));
        iLinha := lstRelatorio.Add('');
        iLinha := lstRelatorio.Add(StrRepeat('-',130));
        sLinha := '  Planilha  No.Conta               Histórico                                            Débito             Crédito';
        //         xxxxxxxxxx  xxxxxxxxxxxxxxxxxxxxx  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxx
        //         123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+123456789+
        //                      10        20        30         40        50       60        70         80         90     100        110        120      130        140
        iLinha := lstRelatorio.Add(sLinha);
        iLinha := lstRelatorio.Add(StrRepeat('-',130));
        if (rTotDeb <> 0) or (rTotCre <> 0) then begin
          sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+
                    AD('Total Transportado:',40)+' '+
                    AD(FormatFloat('#########,###,###,##0.00',rTotDeb),20)+' '+
                    AD(FormatFloat('#########,###,###,##0.00',rTotCre),20);
          iLinha := lstRelatorio.Add(sLinha);
        end else begin
          iLinha := lstRelatorio.Add('');
        end;
        iLinha := lstRelatorio.Add(StrRepeat('-',130));
        iPag := iPag + 1;
     end;
  end;
begin
  inherited;
  LblEmpresa.caption := Sistema.RazaoSocial;
  CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[0].AsString);
  if CmpRptCM.ParamValues[8].AsBoolean then
     CmpRptCM.ParamValues[6].AsBoolean := True;

  with sqlDiario.sql do
  begin
   Clear;
   Add(' SELECT U.IDPESSOA,                                                                 ');
   Add('   U.PLNPLANIL,U.LANC,U.PLACONTA, U.IDMODULO, U.PLAGRAU, U.PLACONCORRESP, U.PLANOME,');
   if CmpRptCM.ParamValues[6].AsBoolean then
      Add('   U.LACHIST1,U.LACHIST2,U.LACHIST3,U.LACHIST4,U.LACHIST5,                                        ');
   Add('   U.PLNDATDIA, U.LACNUMDOC, U.HISTORICO, U.ORDEMHISTORICO, U.CONTA,                 ');
   Add('   U.DEB, U.CRED, U.CODCENTROCUSTO, U.CODSUBCONTA, U.LACDEBCRE, U.PLNCODIGO, U.LACNUMLAN,');
   Add('   U.UNIDNEGOC, U.DOCUMENTO, U.MASCARA                                                   ');
   Add('FROM (                                                                                        ');
   Add('(SELECT P.IDPESSOA,                                                                                 ');
   Add('   P.PLNPLANIL,TO_CHAR(P.PLNPLANIL)||''/''||TO_CHAR(L.LACNUMLAN) AS LANC,                ');
   Add('   L.PLACONTA AS CONTA, L.PLACONTA, L.IDMODULO, C.PLAGRAU, C.PLACONCORRESP, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,P.PLNDATDIA,');
   Add('   L.LACNUMDOC, L.LACNUMDOC AS DOCUMENTO, L.UNIDNEGOC, PN.MASCARA,                                ');
   if CmpRptCM.ParamValues[6].AsBoolean then begin
      Add('   L.LACHIST1,L.LACHIST2,L.LACHIST3,L.LACHIST4,L.LACHIST5,                                        ');
      Add('   RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''||RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5) AS HISTORICO, (1) AS ORDEMHISTORICO,                               ');
   end else begin
      Add('   L.LACHIST1||'' ''||L.LACHIST2 AS HISTORICO, (1) AS ORDEMHISTORICO,                               ');
   end;
   Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS DEB,                                            ');
   Add('   (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS CRED,                                           ');
   Add('   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, P.PLNCODIGO, L.LACNUMLAN                         ');
   Add('FROM                                                                                              ');
   Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, PLANO PN,                                               ');
   Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');
   Add('WHERE (P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY'')) ');
   Add('  AND (C.PLAGRUPO <> ''E'')                                                                       ');
   Add('  AND (:CONDICAO3)                                                                                ');
   Add('  AND (:CONDICAO1)                                                                                ');
   Add('  AND (L.PLANO = C.PLANO(+))                                                                      ');
   Add('  AND (L.PLACONTA = C.PLACONTA(+))                                                                ');
   Add('  AND (PD.PLANO(+) = C.PLANO)                                                                      ');
   Add('  AND (PD.PLACONTA(+) = C.PLACONTA)                                                                ');
   Add('  AND (PN.PLANO(+) = C.PLANO)                                                                     ');
   Add('  AND (:CONDICAO2))                                                                               ');
   if not CmpRptCM.ParamValues[6].AsBoolean then begin
         Add('UNION ALL                                                                                         ');
         Add('(SELECT P.IDPESSOA,                                                                                          ');
         Add('   P.PLNPLANIL,('' '') AS LANC,                                                                   ');
         Add('   ('' '') AS CONTA, L.PLACONTA, L.IDMODULO, (0) AS PLAGRAU,                                      ');
         Add('   ('' '') AS PLACONCORRESP, ('' '') AS PLANOME,P.PLNDATDIA,                                      ');
         Add('   L.LACNUMDOC, ('' '') AS DOCUMENTO, L.UNIDNEGOC, ('' '') AS MASCARA,                            ');
         Add('   L.LACHIST3||'' ''||L.LACHIST4 AS HISTORICO, (2) AS ORDEMHISTORICO,                             ');
         Add('   (0) AS DEB, (0) AS CRED,                                                                       ');
         Add('   ('' '') AS CODCENTROCUSTO, (0) AS CODSUBCONTA,                                                 ');
         Add('   L.LACDEBCRE, P.PLNCODIGO, L.LACNUMLAN                                                          ');
         Add('FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C                                                       ');
         Add('WHERE (P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY'')) ');
         Add('  AND ((L.LACHIST3 IS NOT NULL) OR (L.LACHIST4 IS NOT NULL))                                      ');
         Add('  AND (C.PLAGRUPO <> ''E'')                                                                       ');
         Add('  AND (:CONDICAO3)                                                                                ');
         Add('  AND (:CONDICAO1)                                                                                ');
         Add('  AND (L.PLANO = C.PLANO)                                                                         ');
         Add('  AND (L.PLACONTA = C.PLACONTA)                                                                   ');
         Add('  AND (P.PLNCODIGO = L.PLNCODIGO))                                                                ');
         Add('UNION ALL                                                                                         ');
         Add('(SELECT P.IDPESSOA,                                                                                          ');
         Add('   P.PLNPLANIL,('' '') AS LANC,                                                                   ');
         Add('   ('' '') AS CONTA, L.PLACONTA, L.IDMODULO, (0) AS PLAGRAU,                                      ');
         Add('   ('' '') AS PLACONCORRESP, ('' '') AS PLANOME, P.PLNDATDIA,                                     ');
         Add('   L.LACNUMDOC, ('' '') AS DOCUMENTO, L.UNIDNEGOC, ('' '') AS MASCARA,                            ');
         Add('   L.LACHIST5 AS HISTORICO, (3) AS ORDEMHISTORICO,                                                ');
         Add('   (0) AS DEB, (0) AS CRED,                                                                       ');
         Add('   ('' '') AS CODCENTROCUSTO, (0) AS CODSUBCONTA,                                                 ');
         Add('   L.LACDEBCRE, P.PLNCODIGO, L.LACNUMLAN                                                          ');
         Add('FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C                                                       ');
         Add('WHERE (P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,''DD/MM/YYYY'') AND TO_DATE(:DATAFIM,''DD/MM/YYYY'')) ');
         Add('  AND (L.LACHIST5 IS NOT NULL)                                                                    ');
         Add('  AND (C.PLAGRUPO <> ''E'')                                                                       ');
         Add('  AND (:CONDICAO3)                                                                                ');
         Add('  AND (:CONDICAO1)                                                                                ');
         Add('  AND (L.PLANO = C.PLANO)                                                                         ');
         Add('  AND (L.PLACONTA = C.PLACONTA)                                                                   ');
         Add('  AND (P.PLNCODIGO = L.PLNCODIGO) )                                                               ');
   end;
   Add(' ) U                                                                                              ');
   Add('ORDER BY U.PLNDATDIA, U.IDPESSOA, U.PLNPLANIL, U.LACNUMLAN, U.LACDEBCRE, U.ORDEMHISTORICO         ');
  end;

  sqlDiario.Prepare;

  sqlDiario.ParamByName('DATAINI').AsString := CmpRptCM.ParamValues[0].AsString;
  sqlDiario.ParamByName('DATAFIM').AsString := CmpRptCM.ParamValues[1].AsString;

  if CmpRptCM.ParamValues[4].AsBoolean then
     sqlDiario.ParamByName('CONDICAO3').AsString := ' P.IDPESSOA IN (' + trim(CmpRptCM.ParamValues[7].asString) + ')'
  else
     sqlDiario.ParamByName('CONDICAO3').AsString := ' P.IDPESSOA = '+ FloatToStr(CrmRptCM.IdEmpresa);

  if CmpRptCM.ParamValues[2].AsBoolean = True then
     sqlDiario.ParamByName('CONDICAO2').AsString := ' P.PLNCODIGO = L.PLNCODIGO(+) '
  else
     sqlDiario.ParamByName('CONDICAO2').AsString := ' P.PLNCODIGO = L.PLNCODIGO    ';
  if CmpRptCM.ParamValues[3].AsInteger = 1 then
     sqlDiario.ParamByName('CONDICAO1').AsString := ' P.PLNEFETIVADO = ''S'' '
  else
     if CmpRptCM.ParamValues[3].AsInteger = 2 then
        sqlDiario.ParamByName('CONDICAO1').AsString := ' (P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL) '
     else
        sqlDiario.ParamByName('CONDICAO1').AsString := ' (1 = 1) ';

  sqlDiario.Open;
  //Para Impressão na matricial
  if CmpRptCM.ParamValues[8].AsBoolean then begin
     lstRelatorio := TStringList.Create;
     try
        iLinha :=0;
        rTotDeb:=0;
        rTotCre:=0;
        iContador:=0;
        rTotDiaDeb := 0;
        rTotDiaCre := 0;
        iPag     := CmpRptCM.ParamValues[5].AsInteger;
        sDataAnt := '@@@@@@@@@@';
        cdsDiario.First;
        while not cdsDiario.Eof do begin
           if sDataAnt <> cdsDiario.FieldByName('PLNDATDIA').AsString then begin
              FazCabecalho;
              sLinha := '       Data : '+cdsDiario.FieldByName('PLNDATDIA').AsString;
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
              //
              FazCabecalho;
              iLinha := lstRelatorio.Add('');
              inc(iContador);
              //
              sDataAnt := cdsDiario.FieldByName('PLNDATDIA').AsString;
              rTotDiaDeb := 0;
              rTotDiaCre := 0;
           end;
           FazCabecalho;
           sLinha := AD(cdsDiario.FieldByName('LANC').AsString,10)+'  '+
                     AE(cdsDiario.FieldByName('CONTA').AsString,21)+'  '+
                     AE(cdsDiario.FieldByName('LACHIST1').AsString,40)+' '+
                     AD(FormatFloat('#########,###,###,##0.00',cdsDiario.FieldByName('DEB').AsFloat),20)+' '+
                     AD(FormatFloat('#########,###,###,##0.00',cdsDiario.FieldByName('CRED').AsFloat),20);
           iLinha := lstRelatorio.Add(sLinha);
           inc(iContador);
           rTotDeb:=rTotDeb + cdsDiario.FieldByName('DEB').AsFloat;
           rTotCre:=rTotCre + cdsDiario.FieldByName('CRED').AsFloat;
           rTotDiaDeb := rTotDiaDeb + cdsDiario.FieldByName('DEB').AsFloat;
           rTotDiaCre := rTotDiaCre + cdsDiario.FieldByName('CRED').AsFloat;
           if not cdsDiario.FieldByName('LACHIST2').IsNull then begin
              FazCabecalho;
              sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+AE(cdsDiario.FieldByName('LACHIST2').AsString,40);
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
           end;
           if not cdsDiario.FieldByName('LACHIST3').IsNull then begin
              FazCabecalho;
              sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+AE(cdsDiario.FieldByName('LACHIST3').AsString,40);
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
           end;
           if not cdsDiario.FieldByName('LACHIST4').IsNull then begin
              FazCabecalho;
              sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+AE(cdsDiario.FieldByName('LACHIST4').AsString,40);
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
           end;
           if not cdsDiario.FieldByName('LACHIST5').IsNull then begin
              FazCabecalho;
              sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+AE(cdsDiario.FieldByName('LACHIST5').AsString,40);
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
           end;
           cdsDiario.Next;
           if (sDataAnt <> cdsDiario.FieldByName('PLNDATDIA').AsString) or (cdsDiario.Eof) then begin
              FazCabecalho;
              iLinha := lstRelatorio.Add('');
              inc(iContador);
              //
              FazCabecalho;
              sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+
                        AD('Totais do Dia:',40)+' '+
                        AD(FormatFloat('#########,###,###,##0.00',rTotDiaDeb),20)+' '+
                        AD(FormatFloat('#########,###,###,##0.00',rTotDiaCre),20);
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
              //
              FazCabecalho;
              iLinha := lstRelatorio.Add(StrRepeat('-',130));
              inc(iContador);
           end;
        end;
        if (iLinha > 0) and((rTotDeb <> 0) or (rTotCre <> 0)) then begin
          FazCabecalho;
          sLinha := AD(' ',10)+'  '+AE(' ',21)+'  '+
                    AD('Total do Período:',40)+' '+
                    AD(FormatFloat('#########,###,###,##0.00',rTotDeb),20)+' '+
                    AD(FormatFloat('#########,###,###,##0.00',rTotCre),20);
          iLinha := lstRelatorio.Add(sLinha);
          iLinha := lstRelatorio.Add(StrRepeat('-',130));
        end;
        sArquivo:=cmGetTempPath+'DIARIO.TMP';
        lstRelatorio.SaveToFile(sArquivo);
        giDiario.Inicializar;
        giDiario.ImprimirArquivo(sArquivo);
        giDiario.Finalizar;
     Finally
        lstRelatorio.Free;
     end;
  end;
end;

procedure TrptDiarioResumido.sqlDiarioFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if sParamName = 'CONDICAO1' then sNewValue := sOldValue;
  if sParamName = 'CONDICAO2' then sNewValue := sOldValue;
  if sParamName = 'CONDICAO3' then sNewValue := sOldValue;
end;

procedure TrptDiarioResumido.ppDetailBand7BeforeGenerate(Sender: TObject);
var sMascara : String;
begin
  inherited;
  if cdsDiario.FieldByName('PLAGRAU').asInteger <> 0 then begin
     sMascara := FuncaoGeral.CalcMascaraPorGrau(cdsDiario.FieldByName('MASCARA').asString, cdsDiario.FieldByName('PLAGRAU').asInteger);
     dbtxtContaDiario.DisplayFormat := sMascara + ';0; ';
  end else begin
     dbtxtContaDiario.DisplayFormat := '';
  end;
end;

procedure TrptDiarioResumido.ppHeaderBand15BeforePrint(Sender: TObject);
begin
  inherited;
   if lblCalcContadorDia.text = '1' then begin
      txtTotTransportadoD.visible := false;
      txtTotTransportadoC.visible := false;
      txtlabelTotHead.visible     := false;
   end else begin
      txtTotTransportadoD.visible := true;
      txtTotTransportadoC.visible := true;
      txtlabelTotHead.visible     := true;
   end;
end;

procedure TrptDiarioResumido.txtTotTransportadoDPrint(Sender: TObject);
begin
  inherited;
  if cdsDiario.Eof then
     txtTotTransportadoD.caption  :=  FormatFloat('###,###,###,###,##0.00', lblSomaDebCab.Value)
  else
     txtTotTransportadoD.caption  :=  FormatFloat('###,###,###,###,##0.00', (lblSomaDebCab.Value - cdsDiario.FieldByName('DEB').asFloat));
end;

procedure TrptDiarioResumido.txtTotTransportadoCPrint(Sender: TObject);
begin
  inherited;
   if cdsDiario.Eof then
      txtTotTransportadoC.caption  :=  FormatFloat('###,###,###,###,##0.00', lblSomaCreCab.Value)
   else
      txtTotTransportadoC.caption  :=  FormatFloat('###,###,###,###,##0.00', (lblSomaCreCab.Value - cdsDiario.FieldByName('CRED').asFloat));

end;

procedure TrptDiarioResumido.ppFooterBand15BeforePrint(Sender: TObject);
begin
  inherited;

   lblContadorDia.Caption := IntToStr((CmpRptCM.ParamValues[5].AsInteger + StrToInt(lblCalcContadorDia.text)) - 1);
   lblSomaCreFot.visible := false;
   lblSomaDebFot.visible := false;

   if lblCalcContadorDia.text = lblCalcMaxPagDia.text then begin
      txtTotATransportarD.visible := false;
      txtTotATransportarC.visible := false;
      txtlabelTot.visible   := false;
   end else begin
      txtTotATransportarD.visible := true;
      txtTotATransportarC.visible := true;
      txtlabelTot.visible   := true;
   end;

end;

procedure TrptDiarioResumido.txtTotATransportarDPrint(Sender: TObject);
begin
  inherited;
  if cdsDiario.Eof then begin
     txtTotATransportarD.caption  :=  FormatFloat('###,###,###,###,##0.00', lblSomaDebFot.Value);
  end else begin
     txtTotATransportarD.caption  :=  FormatFloat('###,###,###,###,##0.00', (lblSomaDebFot.Value - cdsDiario.FieldByName('DEB').asFloat));
  end;
end;

procedure TrptDiarioResumido.txtTotATransportarCPrint(Sender: TObject);
begin
  inherited;
  if cdsDiario.Eof then begin
     txtTotATransportarC.caption  :=  FormatFloat('###,###,###,###,##0.00', lblSomaCreFot.Value);
  end else begin
     txtTotATransportarC.caption  :=  FormatFloat('###,###,###,###,##0.00', (lblSomaCreFot.Value - cdsDiario.FieldByName('CRED').asFloat));
  end;
end;

procedure TrptDiarioResumido.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptDiarioResumido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.Free;
  CtrlPeriodo.Free;
end;

end.

