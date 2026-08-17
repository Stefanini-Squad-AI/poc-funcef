Unit rOrcamento;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, uCtrlRptBalancete,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCtrlContab, uCmSqlParams, uCMClientDataSet, UCMFILEUTILS,
  TXRB;

type
  TrptOrcamento = class(TFrmCmReport)
    dsOrcamento: TwwDataSource;
    pplOrcamento: TppBDEPipeline;
    pplOrcamentoppField1: TppField;
    pplOrcamentoppField2: TppField;
    pplOrcamentoppField3: TppField;
    pplOrcamentoppField4: TppField;
    pplOrcamentoppField5: TppField;
    pplOrcamentoppField6: TppField;
    pplOrcamentoppField7: TppField;
    pplOrcamentoppField8: TppField;
    pplOrcamentoppField9: TppField;
    pplOrcamentoppField10: TppField;
    pplOrcamentoppField11: TppField;
    pplOrcamentoppField12: TppField;
    pplOrcamentoppField13: TppField;
    pplOrcamentoppField14: TppField;
    pplOrcamentoppField15: TppField;
    pplOrcamentoppField16: TppField;
    pplOrcamentoppField17: TppField;
    pplOrcamentoppField18: TppField;
    pplOrcamentoppField19: TppField;
    pplOrcamentoppField20: TppField;
    pplOrcamentoppField21: TppField;
    pplOrcamentoppField22: TppField;
    pplOrcamentoppField23: TppField;
    rptOrcamento: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLblTituloOrcamento: TppLabel;
    ppLine27: TppLine;
    lblempresa: TppLabel;
    txtContaOrc: TppLabel;
    ppLine28: TppLine;
    txtNomeContaOrc: TppLabel;
    ppLblTituloOrcamento2: TppLabel;
    txtReal: TppLabel;
    txtPeriodo: TppLabel;
    txtAcumulado: TppLabel;
    txtOrc: TppLabel;
    txtVar: TppLabel;
    txtRealAcu: TppLabel;
    txtOrcAcu: TppLabel;
    txtVarAcu: TppLabel;
    rptOrcamentoLine1: TppLine;
    rptOrcamentoLine2: TppLine;
    rptOrcamentoLine3: TppLine;
    rptOrcamentoLine4: TppLine;
    bndDetOrcamento: TppDetailBand;
    dbtxtContaOrc: TppDBText;
    dbtxtCorrespOrc: TppDBText;
    dbtxtNomeContaOrc: TppDBText;
    dbtxtVarPer: TppDBText;
    dbtxtRealPerOrc: TppDBText;
    dbtxtDCRealPerOrc: TppDBText;
    ppDBText20: TppDBText;
    dbtxtOrcPerOrc: TppDBText;
    dbtxtDCOrcPerOrc: TppDBText;
    txtVarPer: TppLabel;
    txtVarAcum: TppLabel;
    dbtxtVarAcum: TppDBText;
    dbtxtDCOrcAcumOrc: TppDBText;
    dbtxtOrcAcumOrc: TppDBText;
    dbtxtReaLAcumOrc: TppDBText;
    dbtxtDCRealAcumOrc: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine29: TppLine;
    lblsistema: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    rptOrcamentoSummaryBand1: TppSummaryBand;
    rptOrcamentoLabel8: TppLabel;
    rptOrcamentoLine5: TppLine;
    rptOrcamentoLabel9: TppLabel;
    rptOrcamentoLabel10: TppLabel;
    rptOrcamentoLabel11: TppLabel;
    rptOrcamentoLabel12: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsOrcamento: TCMClientDataSet;
    sqlOrcamento: TCMSqlParams;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsSaldoOrc: TCMClientDataSet;
    sqlSaldoOrc: TCMSqlParams;
    sqlSaldoRea: TCMSqlParams;
    cdsSaldoRea: TCMClientDataSet;
    sqlSaldoEncer: TCMSqlParams;
    cdsSaldoEncer: TCMClientDataSet;
    sqlTotais: TCMSqlParams;
    cdsTotais: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppHeaderBand10BeforePrint(Sender: TObject);
    procedure bndDetOrcamentoBeforeGenerate(Sender: TObject);
    procedure bndDetOrcamentoBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    CtrlContab       :TCtrlContab;
    CtrlRptBalancete :TCtrlRptBalancete;
    
    sTitulo,sMascara,sTipoOperResult,sSintAnal,sGrau,sPeriodoInicial,sPeriodoInicialIngles :string;
    dtPerDataFim :TDateTime;
    iNumero,iPlano :Integer;
    rMovExer, rSalExer: Double;
    bValores,bCodigo,bIngles,bIndenta,bEspaco  : Boolean;
    procedure OnCalcField;
  public
    { Public declarations }
  end;

var
  rptOrcamento: TrptOrcamento;

implementation

uses UMensErro, uDatabase, DBaseDados, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra;

{$R *.DFM}

procedure TrptOrcamento.CrmRptCMBeforePrint(Sender: TObject);
var
   iGrau : Integer;
begin
  inherited;
    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sTipoOperResult := CtrlContab.TipoOpEncer;
    end else
    begin
       sTipoOperResult := '';
    end;

    iPlano      := Modulo.iPlano;
    sSintAnal   := 'A';

    //=======================================================================
    Try
      iGrau:=CmpRptCM.ParamValues[12].AsInteger;
    Except
       iGrau:=0;
    End;

    if (iGrau=0) then
       sGrau:=IntToStr(FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano))
    else
      sGrau:=IntToStr(iGrau);
    //=======================================================================



    //*******************  Tratamento de titulos  *********************
    if CmpRptCM.ParamValues[19].AsString = '' then
    begin
      sPeriodoInicial       := '';
      sPeriodoInicialIngles := '';
      //=========================================================
      // Pega nome do mes
      //=========================================================
      sqlTitulos.SQL.Clear;
      sqlTitulos.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING, PERDATINI, PERDATFIM ');
      sqlTitulos.Sql.Add('FROM PERIODO                                                   ');
      sqlTitulos.Sql.Add('WHERE                                                          ');
      sqlTitulos.Sql.Add('   (IDPESSOA =:IDPESSOA) AND                                   ');
      sqlTitulos.Sql.Add('   (PEREXERCICIO=:PEREXERCICIO) AND                            ');
      sqlTitulos.Sql.Add('   (PERNUMERO=:PERNUMERO)                                      ');
      sqlTitulos.Sql.Add('ORDER BY PERNUMERO                                             ');

      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].asString);
      sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].asString);
      sqlTitulos.Open;
      sPeriodoInicial       := cdsTitulos.FieldByName('PERNOME').asString;
      sPeriodoInicialIngles := cdsTitulos.FieldByName('PERNOMEOUTLING').asString;
      dtPerDataFim          := cdsTitulos.FieldByName('PERDATFIM').asDateTime;
      //=====================================================================

      with sqlPerAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].asString);
         ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].asString);
         Open;

         if cdsPerAux.isEmpty then begin
            if CmpRptCM.ParamValues[11].asBoolean then begin
               sTitulo := 'Budgeted x Actual - ' + sPeriodoInicialIngles + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end else begin
               sTitulo := 'Orçado x Realizado - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[11].asBoolean then begin
               sTitulo := 'Budgeted x Actual Partial - ' + sPeriodoInicialIngles + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end else begin
               sTitulo := 'Orçado x Realizado Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString+ ' - ' + CmpRptCM.ParamValues[2].asString;
            end;
         end;
      end;

      pplblTituloOrcamento.caption := sTitulo;

      sTitulo := '';
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                            'FROM  CENTCUST '+
                            'WHERE '+
                            '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                            '   (RTRIM(CODCENTROCUSTO) = ''' + trim(CmpRptCM.ParamValues[5].AsString) + ''') ' +
                            'ORDER BY CODCENTROCUSTO');
         sqlTitulos.Open;

         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + cdsTitulos.FieldByName('NOME').asString;
      end;

      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                            'FROM  CENTCUST '+
                            'WHERE '+
                            '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                            '   (RTRIM(CODCENTROCUSTO) = ''' + trim(CmpRptCM.ParamValues[6].AsString) + ''') ' +
                            'ORDER BY CODCENTROCUSTO');
         sqlTitulos.Open;

         sTitulo := sTitulo +  '     Centro de Custo Final : ' + cdsTitulos.FieldByName('NOME').asString;
      end;

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                            'FROM  UNIDNEGOCIO '+
                            'WHERE '+
                            '   (IDPESSOA    = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                            '   (UNIDNEGOC   = '+CmpRptCM.ParamValues[7].AsString + ') ' +
                            'ORDER BY UNIDNEGOC');
         sqlTitulos.Open;
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + cdsTitulos.FieldByName('NOME').asString;
      end;
      pplblTituloOrcamento2.caption := sTitulo;
   end else begin
      pplblTituloOrcamento.caption  := CmpRptCM.ParamValues[19].AsString;
      pplblTituloOrcamento2.caption := CmpRptCM.ParamValues[20].AsString;
   end;

   //Configura a exibiçao da Conta Correspondente
   if CmpRptCM.ParamValues[13].AsBoolean then begin
      dbtxtCorrespOrc.visible := true;
      dbtxtContaOrc.visible   := false;
   end else begin
      dbtxtCorrespOrc.visible := false;
      dbtxtContaOrc.visible   := true;
   end;

   //Configura a quebra de página
   if CmpRptCM.ParamValues[10].AsBoolean then begin
      rptOrcamento.Groups[0].NewPage := true;
   end else begin
      rptOrcamento.Groups[0].NewPage := false;
   end;

   //========================================================================
   if (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or (CmpRptCM.ParamValues[17].AsBoolean) then
   begin
      with sqlSaldoOrc do
      begin
         SQL.Clear;
         SQL.Add('SELECT                                                          ');
         SQL.Add('   SUM(DECODE(P.PLSORCADODEBITO,NULL,0,P.PLSORCADODEBITO)-DECODE(P.PLSORCADOCREDITO,NULL,0,P.PLSORCADOCREDITO)) AS SALDOORC, ');
         SQL.Add('   M.SALDOORCMES                                                ');
         SQL.Add('FROM                                                            ');
         SQL.Add('   PLANOSALDO P,                                                ');
         SQL.Add('   (SELECT                                                      ');
         SQL.Add('       SUM(DECODE(PLSORCADODEBITO,NULL,0,PLSORCADODEBITO)-DECODE(PLSORCADOCREDITO,NULL,0,PLSORCADOCREDITO)) AS SALDOORCMES ');
         SQL.Add('    FROM                                                        ');
         SQL.Add('       PLANOSALDO                                               ');
         SQL.Add('    WHERE                                                       ');
         SQL.Add('      (IDPESSOA    =:IDPESSOA) AND                              ');
         SQL.Add('      (PEREXERCICIO=:PEREXERCICIO) AND                          ');
         SQL.Add('      (PERNUMERO   =:PERNUMERO) AND                             ');
         SQL.Add('      (PLACONTA    =:PLACONTA) AND                              ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       (UNIDNEGOC =:UNIDNEGOC) AND                           ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
            SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((CODCENTROCUSTO <= :CCUSTOFIM) AND                    ');
            SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('      (PLANO       =:PLANO)) M                                   ');
         SQL.Add('WHERE                                                            ');
         SQL.Add('   (P.IDPESSOA    =:IDPESSOA) AND                                ');
         SQL.Add('   (P.PEREXERCICIO=:PEREXERCICIO) AND                            ');
         SQL.Add('   ((P.PERNUMERO  <=:PERNUMERO) OR (P.PERNUMERO IS NULL)) AND    ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       (P.UNIDNEGOC =:UNIDNEGOC) AND                          ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((P.CODCENTROCUSTO >= :CCUSTOINI) AND                  ');
            SQL.Add('       (P.IDEMPRESA =:EMPRESA)) AND                           ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((P.CODCENTROCUSTO <= :CCUSTOFIM) AND                  ');
            SQL.Add('       (P.IDEMPRESA =:EMPRESA)) AND                           ');
         end;
         SQL.Add('   (P.PLACONTA    =:PLACONTA) AND                                ');
         SQL.Add('   (P.PLANO       =:PLANO)                                       ');
         SQL.Add('GROUP BY M.SALDOORCMES                                           ');
         Prepare;
      end;

      //========================================================================
      with sqlSaldoRea do
      begin
         SQL.Clear;
         SQL.Add('SELECT            ');
         SQL.Add('   (SUM(DECODE(P.PLSDEBITOCORRENTE,NULL,0,P.PLSDEBITOCORRENTE)-DECODE(P.PLSCREDITOCOR,NULL,0,P.PLSCREDITOCOR))+SALDOREAMES) AS SALDOREA, ');
         SQL.Add('   M.SALDOREAMES  ');
         SQL.Add('FROM              ');
         SQL.Add('   PLANOSALDO P,  ');
         SQL.Add('   (SELECT        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREAMES  ');
         SQL.Add('    FROM                                                                       ');
         SQL.Add('       PLANILHA P, LANCAMENTO L                                                ');
         SQL.Add('    WHERE                                                                      ');
         SQL.Add('      (P.IDPESSOA    =:IDPESSOA) AND                                           ');
         SQL.Add('      (P.PEREXERCICIO=:PEREXERCICIO) AND                                       ');
         SQL.Add('      (P.PERNUMERO   =:PERNUMERO) AND                                          ');
         SQL.Add('      (P.PLNDATDIA   <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND                   ');
         SQL.Add('      (L.PLACONTA    LIKE :PLACONTASIN) AND                                    ');
         SQL.Add('      (L.PLANO       =:PLANO) AND                                              ');
         SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                               ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       (L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('      (P.PLNCODIGO   = L.PLNCODIGO)) M                                         ');
         SQL.Add('WHERE                                                                          ');
         SQL.Add('   (P.IDPESSOA    =:IDPESSOA) AND                                              ');
         SQL.Add('   (P.PEREXERCICIO=:PEREXERCICIO) AND                                          ');
         SQL.Add('   ((P.PERNUMERO  <:PERNUMERO) OR (P.PERNUMERO IS NULL)) AND                   ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('(P.UNIDNEGOC =:UNIDNEGOC) AND                           ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('((P.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            SQL.Add('(P.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('((P.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            SQL.Add('(P.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('   (P.PLACONTA    =:PLACONTA) AND                                              ');
         SQL.Add('   (P.PLANO       =:PLANO) ');
         SQL.Add('GROUP BY M.SALDOREAMES ');
         Prepare;
      end;
      //========================================================================
      with sqlSaldoEncer do
      begin
         SQL.Clear;
         SQL.Add('SELECT         ');
         SQL.Add('   SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREA,  ');
         SQL.Add('   M.SALDOREAMES  ');
         SQL.Add('FROM PLANILHA P, LANCAMENTO L,  ');
         SQL.Add('   (SELECT        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOREAMES  ');
         SQL.Add('    FROM                                                                       ');
         SQL.Add('       PLANILHA P, LANCAMENTO L                                                ');
         SQL.Add('    WHERE                                                                      ');
         SQL.Add('      (P.IDPESSOA    =:IDPESSOA) AND                                           ');
         SQL.Add('      (P.PEREXERCICIO=:PEREXERCICIO) AND                                       ');
         SQL.Add('      (P.PERNUMERO   =:PERNUMERO) AND                                          ');
         SQL.Add('      (P.PLNDATDIA   <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND                   ');
         SQL.Add('      (L.PLACONTA    LIKE :PLACONTASIN) AND                                    ');
         SQL.Add('      (L.PLANO       =:PLANO) AND                                              ');
         SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                               ');
         SQL.Add('      (L.TIPCODIGO = '''+sTipoOperResult+''') AND ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       (L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('      (P.PLNCODIGO   = L.PLNCODIGO)) M                                         ');
         SQL.Add('WHERE                                                                          ');
         SQL.Add('   (P.IDPESSOA    =:IDPESSOA) AND                                           ');
         SQL.Add('   (P.PEREXERCICIO=:PEREXERCICIO) AND                                       ');
         SQL.Add('   (P.PLNDATDIA   <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND                   ');
         SQL.Add('   (L.PLACONTA    LIKE :PLACONTASIN) AND                                    ');
         SQL.Add('   (L.PLANO       =:PLANO) AND                                              ');
         SQL.Add('   (P.PLNEFETIVADO = ''S'') AND                                               ');
         SQL.Add('   (L.TIPCODIGO = '''+sTipoOperResult+''') AND ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('    (L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('    ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            SQL.Add('    (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('    ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            SQL.Add('    (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('   (P.PLNCODIGO   = L.PLNCODIGO)                                ');
         SQL.Add('GROUP BY M.SALDOREAMES ');
         Prepare;
      end;
   end;
   //========================================================================

   bValores := CmpRptCM.ParamValues[9].AsBoolean;
   bCodigo  := CmpRptCM.ParamValues[16].AsBoolean;
   bIngles  := CmpRptCM.ParamValues[11].AsBoolean;

   iNumero := FuncaoGeral.CalcNumEleGrau(modulo.sMascaraContas, 1);

   //=========================================================================
   with sqlTotais do
   begin
      SQL.Clear;
      SQL.Add('SELECT                                                           ');
      if CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim then begin
         SQL.Add('   (NVL(MA.MOVDATA,0)+NVL(EM.MOVDATA,0)) AS REAL, ');
      end else begin
         SQL.Add('   SUM(NVL(S.PLSDEBITOCORRENTE,0)-NVL(S.PLSCREDITOCOR,0))+NVL(EM.MOVDATA,0) AS REAL,  ');
      end;
      SQL.Add('   SUM(NVL(S.PLSORCADODEBITO,0)- NVL(S.PLSORCADOCREDITO, 0)) AS ORC,    ');
      SQL.Add('   (NVL(SA.SALDOREAL,0)+NVL(ES.REAL,0)) AS SALDOREAL, SA.SALDOORC       ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S,PLANOCONTA C,                                    ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

      if CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim then begin
         SQL.Add('   (SELECT                                                       ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''D'',L.LACVALOR, (L.LACVALOR*-1))) AS MOVDATA ');
         SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
         SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                  ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
         SQL.Add('          (P.PERNUMERO =:PERIODO) AND                            ');
         SQL.Add('          (P.PLNDATDIA <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND   ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('          (L.IDPESSOA =:IDPESSOA) AND                              ');
         SQL.Add('          (L.PLACONTA >= :CONTAINI) AND              ');
         SQL.Add('          (L.PLACONTA <= :CONTAFIM)) MA,             ');
         SQL.Add('                                                                   ');
      end;
      if CmpRptCM.ParamValues[17].AsBoolean then begin
         SQL.Add('   (SELECT                                                       ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''C'',L.LACVALOR, (L.LACVALOR*-1))) AS MOVDATA ');
         SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
         SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                  ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
         SQL.Add('          (P.PERNUMERO =:PERIODO) AND                            ');
         SQL.Add('          (L.TIPCODIGO = '''+sTipoOperResult+''') AND ');
         SQL.Add('          (P.PLNDATDIA <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND   ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND               ');
            SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                   ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                 ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                 ');
         end;
         SQL.Add('          (L.IDPESSOA =:IDPESSOA) AND                  ');
         SQL.Add('          (L.PLACONTA >= :CONTAINI) AND                ');
         SQL.Add('          (L.PLACONTA <= :CONTAFIM)) EM,               ');
         SQL.Add('                                                       ');
         SQL.Add('   (SELECT                                             ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''C'',L.LACVALOR, (L.LACVALOR*-1))) AS REAL ');
         SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
         SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                  ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
         SQL.Add('          (L.TIPCODIGO = '''+sTipoOperResult+''') AND ');
         SQL.Add('          (P.PLNDATDIA <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND   ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
            SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND                    ');
            SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('          (L.IDPESSOA =:IDPESSOA) AND                              ');
         SQL.Add('          (L.PLACONTA >= :CONTAINI) AND                            ');
         SQL.Add('          (L.PLACONTA <= :CONTAFIM)) ES,                           ');
         SQL.Add('                                                                   ');
      end else begin
         SQL.Add('   (SELECT                                                         ');
         SQL.Add('       (0) AS MOVDATA                                              ');
         SQL.Add('    FROM PARAMCONTAB                                               ');
         SQL.Add('    WHERE (IDPESSOA =:IDPESSOA)) EM,                               ');
         SQL.Add('   (SELECT                                                         ');
         SQL.Add('       (0) AS REAL                                                 ');
         SQL.Add('    FROM PARAMCONTAB                                               ');
         SQL.Add('    WHERE (IDPESSOA =:IDPESSOA)) ES,                               ');
      end;
      SQL.Add('   (SELECT                                                                 ');
      SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)               ');
      SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL,        ');
      SQL.Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO)                   ');
      SQL.Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC    ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:PESSOA)) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       ((CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       ((CODCENTROCUSTO <= :CCUSTOFIM) AND                    ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');
      SQL.Add('          (PLACONTA >= :CONTAINI) AND                            ');
      SQL.Add('          (PLACONTA <= :CONTAFIM) AND                            ');
      SQL.Add('          (PLSTIPO = ''A'') ) SA                                 ');
      SQL.Add('                                                                 ');
      SQL.Add('WHERE                                                            ');
      SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA)  AND                           ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');

      SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
      SQL.Add('    (S.PERNUMERO(+) =:PERIODO) AND                               ');
      SQL.Add('    (C.PLATIPO = ''A'') AND                                      ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' ((S.UNIDNEGOC(+) =:UNIDNEGOC) AND                            ');
         SQL.Add(' (S.IDPESSOA(+) =:PESSOA)) AND                                ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add(' ((S.CODCENTROCUSTO(+) >= :CCUSTOINI) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add(' ((S.CODCENTROCUSTO(+) <= :CCUSTOFIM) AND                     ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                                ');
      SQL.Add('    (C.PLACONTA <= :CONTAFIM)                                    ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('    SA.SALDOREAL, SA.SALDOORC, EM.MOVDATA, ES.REAL               ');

      if CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim then
         SQL.Add('   ,MA.MOVDATA    ');

      Prepare;
      ParamByName('PLANO').asInteger     := iPlano;
      ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
      ParamByName('PERIODO').asInteger   := StrToInt(CmpRptCM.ParamValues[1].AsString);

      if (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or (CmpRptCM.ParamValues[17].AsBoolean) then
         ParamByName('DATALIM').asString   := DateToStr(CmpRptCM.ParamValues[2].AsDateTime);
      //
      if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
      begin
         ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
      end else begin
         ParamByName('CONTAINI').asString := Espaco('0',18);
      end;
      //
      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
         ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18);
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;

      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
         ParamByName('EMPRESA').asFloat    := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
         ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      //Abre a cds e soma os valores
      Open;

      if cdsTotais.FieldByName('REAL').AsFloat > 0  then begin
        rptOrcamentoLabel9.Caption := FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('REAL').AsFloat))+' D';
      end else begin
         rptOrcamentoLabel9.Caption := FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('REAL').AsFloat))+' C';
      end;
      //
      if cdsTotais.FieldByName('ORC').AsFloat > 0  then begin
         rptOrcamentoLabel10.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('ORC').AsFloat))+' D';
      end else begin
         rptOrcamentoLabel10.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('ORC').AsFloat))+' C';
      end;
      //
      if cdsTotais.FieldByName('SALDOREAL').AsFloat > 0  then begin
         rptOrcamentoLabel11.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOREAL').AsFloat))+' D';
      end else begin
         rptOrcamentoLabel11.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOREAL').AsFloat))+' C';
      end;
      //
      if cdsTotais.FieldByName('SALDOORC').AsFloat > 0  then begin
         rptOrcamentoLabel12.Caption := FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOORC').AsFloat))+' D';
      end else begin
         rptOrcamentoLabel12.Caption := FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOORC').AsFloat))+' C';
      end;
   end;

   //===========================================================================
   //Faz a query principal do Relatório
   //===========================================================================
   with sqlOrcamento do
   begin
      SQL.Clear;
      if (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or (CmpRptCM.ParamValues[17].AsBoolean) then
      begin
         SQL.Add('SELECT                                                            ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLAGRUPO, ');
         SQL.Add('   (0) AS ORCABS,      (0) AS SORCABS,     (0) AS VARPER,         ');
         SQL.Add('   (0) AS REALABS,     (0) AS SREALABS,    (0) AS VARACUM,        ');
         SQL.Add('   ('' '') AS DEBCREORC,    ('' '') AS DEBCRESORC,                ');
         SQL.Add('   ('' '') AS  DEBCREREAL,  ('' '') AS DEBCRESREAL,               ');
         SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
         if CmpRptCM.ParamValues[11].AsBoolean then begin
            SQL.Add('   C.PLANOMEOUTLING AS CONTA,  DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,    ');
         end else begin
            SQL.Add('    DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING,  DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
         end;
         SQL.Add('   (0) AS REAL,      (0) AS ORC,                                 ');
         SQL.Add('   (0) AS SALDOREAL, (0) AS  SALDOORC                            ');
         SQL.Add('FROM                                                             ');
         SQL.Add('   PLANOCONTA C,                                                 ');

         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD ');

         SQL.Add('WHERE                                                            ');
         SQL.Add('       (C.PLANO    =:PLANO)                                      ');
         SQL.Add('  AND  (C.PLAGRAU  <=:GRAU)                                      ');
         SQL.Add('  AND  (C.PLACONTA >= :CONTAINI)                                 ');
         SQL.Add('  AND  (C.PLACONTA <= :CONTAFIM)                                 ');
         If CmpRptCM.ParamValues[18].AsBoolean then
         Begin
             SQL.Add(' AND (C.PLAGRUPO <> ''E'')                                   ');
         End;
         SQL.Add('  AND  (PD.PLACONTA(+) = C.PLACONTA)                             ');
         SQL.Add('  AND  (PD.PLANO(+) = C.PLANO)                                   ');
         SQL.Add('ORDER BY                                                         ');
         if CmpRptCM.ParamValues[13].AsBoolean then begin
            SQL.Add(' C.PLACONCORRESP                                              ');
         end else begin
            SQL.Add(' C.PLACONTA                                                   ');
         end;
      end else begin
         SQL.Add('SELECT                                                            ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLAGRUPO, ');
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,      ');

         //Adicionei no logar dos CalcFields
         SQL.Add('   (0) AS SORCABS, (0) AS SREALABS, (0) AS ORCABS, (0) AS REALABS,  ');
         SQL.Add('   (0) AS VARPER, (0) AS VARACUM, ('' '') AS DEBCREORC, ('' '') AS DEBCREREAL, ');
         SQL.Add('   ('' '') AS DEBCRESORC, ('' '') AS DEBCRESREAL,                              ');
         SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+
                          '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
         if CmpRptCM.ParamValues[11].AsBoolean then begin
            SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,      ');
         end else begin
            SQL.Add('    DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING,  DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,             ');
         end;
         SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)   ');
         SQL.Add('     - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS REAL,  ');
         SQL.Add('   SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO)        ');
         SQL.Add('     - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)) AS ORC,    ');

         SQL.Add('   SA.SALDOREAL, SA.SALDOORC                                     ');
         SQL.Add('FROM                                                             ');
         SQL.Add('   PLANOSALDO S, PLANOCONTA C,                                   ');

         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

         SQL.Add('                                                                 ');
         SQL.Add('   (SELECT                                                       ');
         SQL.Add('       PLACONTA,                                                 ');

         SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)     ');
         SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL,  ');

         SQL.Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO) ');
         SQL.Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC    ');

         SQL.Add('    FROM PLANOSALDO                                              ');
         SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
         SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
         SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
            SQL.Add('       (IDPESSOA =:PESSOA)) AND                               ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add('       ((CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
            SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add('       ((CODCENTROCUSTO <= :CCUSTOFIM) AND                    ');
            SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
         end;
         SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');
         SQL.Add('          (PLACONTA >= :CONTAINI) AND                            ');
         SQL.Add('          (PLACONTA <= :CONTAFIM)                                ');
         SQL.Add('    GROUP BY PLACONTA ) SA                                       ');
         SQL.Add('                                                                 ');
         SQL.Add('WHERE                                                            ');
         SQL.Add('       ((S.PLANO(+)    = C.PLANO)                                ');
         SQL.Add('  AND  (S.PLACONTA(+)  = C.PLACONTA))                            ');
         SQL.Add('  AND  (SA.PLACONTA(+) = C.PLACONTA)                             ');
         SQL.Add('  AND  (PD.PLACONTA(+) = C.PLACONTA)                             ');
         SQL.Add('  AND  (PD.PLANO(+) = C.PLANO)                                   ');
         SQL.Add('  AND  (C.PLANO        =:PLANO)                                  ');
         SQL.Add('  AND  (S.PEREXERCICIO(+) =:EXERCICIO)                           ');
         SQL.Add('  AND  (S.PERNUMERO(+)    =:PERIODO)                             ');
         SQL.Add('  AND  (C.PLAGRAU <=:GRAU)                                       ');
         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            SQL.Add(' AND ((S.UNIDNEGOC(+) =:UNIDNEGOC)                             ');
            SQL.Add(' AND (S.IDPESSOA(+) =:PESSOA))                                 ');
         end;
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            SQL.Add(' AND ((S.CODCENTROCUSTO(+) >= :CCUSTOINI)                      ');
            SQL.Add(' AND (S.IDEMPRESA(+) =:EMPRESA))                               ');
         end;
         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            SQL.Add(' AND ((S.CODCENTROCUSTO(+) <= :CCUSTOFIM)                     ');
            SQL.Add(' AND (S.IDEMPRESA(+) =:EMPRESA))                              ');
         end;
         SQL.Add('  AND  (S.IDPESSOA(+) =:IDPESSOA)                                ');
         SQL.Add('  AND  (C.PLACONTA >= :CONTAINI)                                 ');
         SQL.Add('  AND  (C.PLACONTA <= :CONTAFIM)                                 ');
         If CmpRptCM.ParamValues[18].AsBoolean then
         Begin
             SQL.Add(' AND (C.PLAGRUPO <> ''E'')                                   ');
         End;
         SQL.Add('GROUP BY                                                         ');
         SQL.Add('    C.PLACONTA, SA.SALDOREAL, SA.SALDOORC,                       ');
         SQL.Add('    C.PLAGRAU, C.PLATIPO,                                        ');
         SQL.Add('    C.PLANOMEOUTLING,  DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP, C.PLAGRUPO     ');
         SQL.Add('HAVING                                                           ');
         SQL.Add('   (DECODE(SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
         SQL.Add('             - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)), 0,');
         SQL.Add('   (DECODE(SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) ');
         SQL.Add('             - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)), 0,    ');
         SQL.Add('   (DECODE(SA.SALDOREAL,NULL,                                    ');
         SQL.Add('   (DECODE(SA.SALDOORC,NULL,''0'',''1'')),                       ');
         SQL.Add('   ''1'')),''1'')),''1'')) = ''1''                               ');
         SQL.Add('ORDER BY                                                         ');
         if CmpRptCM.ParamValues[13].AsBoolean then begin
            SQL.Add(' C.PLACONCORRESP                                              ');
         end else begin
            SQL.Add(' C.PLACONTA                                                   ');
         end;
      end;

      Prepare;

      ParamByName('GRAU').asInteger   := CmpRptCM.ParamValues[12].AsInteger;
      ParamByName('PLANO').asInteger  := iPlano;

      if (CmpRptCM.ParamValues[2].AsDateTime = dtPerDataFim) and (not CmpRptCM.ParamValues[17].AsBoolean) then
      begin
         ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
         ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
         ParamByName('PERIODO').asInteger   := StrToInt(CmpRptCM.ParamValues[1].AsString);
         //
         if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
            ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
            ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
            ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
            ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         end;

         if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
            ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
         end;
      end;

      if trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
         ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
      end else begin
         ParamByName('CONTAINI').asString := Espaco('0',18);
      end;

      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
         ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18);
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;

      If (CmpRptCM.ParamValues[2].AsDateTime <> dtPerDataFim) or (CmpRptCM.ParamValues[17].AsBoolean) then
      Begin

         Open;

         //bSair := False;

         cdsOrcamento.First;
         While (not cdsOrcamento.EOF) do //and (not bSair) do
         begin
            sqlSaldoOrc.ParamByName('PLACONTA').AsString      := Espaco(cdsOrcamento.FieldByName('PLACONTA').AsString,18);
            sqlSaldoOrc.ParamByName('PLANO').asInteger        := iPlano;
            sqlSaldoOrc.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
            sqlSaldoOrc.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
            sqlSaldoOrc.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);

            if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
               sqlSaldoOrc.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;
            if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
               sqlSaldoOrc.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;
            if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
            begin
               sqlSaldoOrc.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            end;

            sqlSaldoOrc.Open;

            sqlSaldoRea.ParamByName('PLACONTASIN').AsString   := trim(cdsOrcamento.FieldByName('PLACONTA').AsString)+'%';
            sqlSaldoRea.ParamByName('DATALIM').AsString       := CmpRptCM.ParamValues[2].AsString;
            sqlSaldoRea.ParamByName('PLACONTA').AsString      := Espaco(cdsOrcamento.FieldByName('PLACONTA').AsString,18);
            sqlSaldoRea.ParamByName('PLANO').asInteger        := iPlano;
            sqlSaldoRea.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
            sqlSaldoRea.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
            sqlSaldoRea.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);

            if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
               sqlSaldoRea.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
               sqlSaldoRea.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;
            if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
               sqlSaldoRea.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
               sqlSaldoRea.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;
            if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
               sqlSaldoRea.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
            end;
            sqlSaldoRea.Open;

            rMovExer:=0;
            rSalExer:=0;

            if CmpRptCM.ParamValues[17].AsBoolean then begin

               sqlSaldoEncer.ParamByName('PLACONTASIN').AsString   := trim(cdsOrcamento.FieldByName('PLACONTA').AsString)+'%';
               sqlSaldoEncer.ParamByName('DATALIM').AsString       := CmpRptCM.ParamValues[2].AsString;
               sqlSaldoEncer.ParamByName('PLANO').asInteger        := iPlano;
               sqlSaldoEncer.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
               sqlSaldoEncer.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
               sqlSaldoEncer.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);

               if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
               begin
                  sqlSaldoEncer.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
                  sqlSaldoEncer.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
               end;
               if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
                  sqlSaldoEncer.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
                  sqlSaldoEncer.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
               end;
               if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
                  sqlSaldoEncer.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
               end;
               sqlSaldoEncer.Open;

               if not cdsSaldoEncer.isEmpty then begin
                  rMovExer := cdsSaldoEncer.FieldByName('SALDOREAMES').AsFloat;
                  rSalExer := cdsSaldoEncer.FieldByName('SALDOREA').AsFloat;
               end;
            end;
            if (cdsSaldoOrc.FieldByName('SALDOORC').AsFloat = 0) and (cdsSaldoOrc.FieldByName('SALDOORCMES').AsFloat = 0) and
               ((cdsSaldoRea.FieldByName('SALDOREA').AsFloat+rSalExer) = 0) and ((cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat+rMovExer) = 0) then begin
               //cdsOrcamento.Next;
               //i/f cdsOrcamento.Eof then
              //    bSair := True
              // else
              //    cdsOrcamento.Prior;
               cdsOrcamento.Delete;
            end else
            begin
               cdsOrcamento.Edit;
               cdsOrcamento.FieldByName('REAL').AsFloat      := cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat +rMovExer;
               cdsOrcamento.FieldByName('ORC').AsFloat       := cdsSaldoOrc.FieldByName('SALDOORCMES').AsFloat;
               cdsOrcamento.FieldByName('SALDOREAL').AsFloat := cdsSaldoRea.FieldByName('SALDOREA').AsFloat +rSalExer;
               cdsOrcamento.FieldByName('SALDOORC').AsFloat  := cdsSaldoOrc.FieldByName('SALDOORC').AsFloat;
               cdsOrcamento.Next;
            end;
         end;
      End Else
      Begin
        //CMDEBUGTOFILE(SQLCHANGED);
        Open;
      End;

      sMascara := '';
      if CmpRptCM.ParamValues[8].AsBoolean then begin
         sMascara := modulo.sMascaraContas;
      end;

      bIndenta := CmpRptCM.ParamValues[14].AsBoolean;
      bEspaco  := CmpRptCM.ParamValues[15].AsBoolean;

      OnCalcField;

   End;

end;

procedure TrptOrcamento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlRptBalancete.free;
end;

procedure TrptOrcamento.OnCalcField;
var sEspacos : string;
    i : integer;
begin

   cdsOrcamento.First;
   while not cdsOrcamento.eof do
   begin

      //Gera a label de débito/crédito

      cdsOrcamento.Edit;

      if not bValores then
      begin
         if cdsOrcamento.FieldByName('ORC').asFloat = 0 then begin
            cdsOrcamento.FieldByName('DEBCREORC').asString := ' ';
         end;
         if cdsOrcamento.FieldByName('ORC').asFloat < 0 then begin
            cdsOrcamento.FieldByName('DEBCREORC').asString := 'C';
         end else begin
            cdsOrcamento.FieldByName('DEBCREORC').asString := 'D';
         end;

         if cdsOrcamento.FieldByName('REAL').asFloat = 0 then begin
            cdsOrcamento.FieldByName('DEBCREREAL').asString := ' ';
         end;
         if cdsOrcamento.FieldByName('REAL').asFloat < 0 then begin
            cdsOrcamento.FieldByName('DEBCREREAL').asString := 'C';
         end else begin
            cdsOrcamento.FieldByName('DEBCREREAL').asString := 'D';
         end;

         if cdsOrcamento.FieldByName('SALDOORC').asFloat = 0 then begin
            cdsOrcamento.FieldByName('DEBCRESORC').asString := ' ';
         end;
         if cdsOrcamento.FieldByName('SALDOORC').asFloat < 0 then begin
            cdsOrcamento.FieldByName('DEBCRESORC').asString := 'C';
         end else begin
            cdsOrcamento.FieldByName('DEBCRESORC').asString := 'D';
         end;

         if cdsOrcamento.FieldByName('SALDOREAL').asFloat = 0 then begin
            cdsOrcamento.FieldByName('DEBCRESREAL').asString := ' ';
         end;
         if cdsOrcamento.FieldByName('SALDOREAL').asFloat < 0 then begin
            cdsOrcamento.FieldByName('DEBCRESREAL').asString := 'C';
         end else begin
            cdsOrcamento.FieldByName('DEBCRESREAL').asString := 'D';
         end;

         //Tira o sinal dos saldos
         cdsOrcamento.FieldByName('SORCABS').asFloat  := ABS(cdsOrcamento.FieldByName('SALDOORC').asFloat);
         cdsOrcamento.FieldByName('SREALABS').asFloat := ABS(cdsOrcamento.FieldByName('SALDOREAL').asFloat);
         cdsOrcamento.FieldByName('ORCABS').asFloat   := ABS(cdsOrcamento.FieldByName('ORC').asFloat);
         cdsOrcamento.FieldByName('REALABS').asFloat  := ABS(cdsOrcamento.FieldByName('REAL').asFloat);

      end else
      begin
         cdsOrcamento.FieldByName('DEBCREORC').asString   := ' ';
         cdsOrcamento.FieldByName('DEBCREREAL').asString  := ' ';
         cdsOrcamento.FieldByName('DEBCRESORC').asString  := ' ';
         cdsOrcamento.FieldByName('DEBCRESREAL').asString := ' ';

         //Tira o sinal dos saldos
         cdsOrcamento.FieldByName('SORCABS').asFloat  := cdsOrcamento.FieldByName('SALDOORC').asFloat;
         cdsOrcamento.FieldByName('SREALABS').asFloat := cdsOrcamento.FieldByName('SALDOREAL').asFloat;
         cdsOrcamento.FieldByName('ORCABS').asFloat   := cdsOrcamento.FieldByName('ORC').asFloat;
         cdsOrcamento.FieldByName('REALABS').asFloat  := cdsOrcamento.FieldByName('REAL').asFloat;

      end;


      //Indenta o Nome da Conta Contábil de acordo com o grau
      sEspacos := '';

      if bIndenta then begin
         for i := 1 to ((cdsOrcamento.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
            sEspacos := sEspacos + ' ';
         end;
      end;

      cdsOrcamento.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsOrcamento.FieldByName('CONTA').asString);

      if cdsOrcamento.FieldByName('ORC').asFloat = 0 then
      begin
         cdsOrcamento.FieldByName('VARPER').asFloat := 0;
      end else
      begin
         cdsOrcamento.FieldByName('VARPER').asFloat := (((cdsOrcamento.FieldByName('REAL').asFloat - cdsOrcamento.FieldByName('ORC').asFloat) /
                                           cdsOrcamento.FieldByName('ORC').asFloat)*100);
      end;

      if cdsOrcamento.FieldByName('SALDOORC').asFloat = 0 then
      begin
         cdsOrcamento.FieldByName('VARACUM').asFloat := 0;
      end else
      begin
         cdsOrcamento.FieldByName('VARACUM').asFloat := (((cdsOrcamento.FieldByName('SALDOREAL').asFloat - cdsOrcamento.FieldByName('SALDOORC').asFloat) /
                                            cdsOrcamento.FieldByName('SALDOORC').asFloat)*100);
      end;

      cdsOrcamento.Post;
      cdsOrcamento.Next;


   end;

end;

procedure TrptOrcamento.ppHeaderBand10BeforePrint(Sender: TObject);
begin
  inherited;
   if not bCodigo then begin
      txtContaOrc.visible   := false;
      txtNomeContaOrc.left  := 5;
   end;

   if bIngles then begin
      txtContaOrc.caption     := 'Code';
      txtNomeContaOrc.caption := 'Name';
      txtPeriodo.caption      := 'Current Month';
      txtOrc.caption          := 'Budget';
      txtReal.caption         := 'Actual';
      txtVar.caption          := 'Ratio';
      txtAcumulado.caption    := 'Year to Date';
      txtOrcAcu.caption       := 'Budget';
      txtRealAcu.caption      := 'Actual';
      txtVarAcu.caption       := 'Ratio';
   end else begin
      txtContaOrc.caption     := 'Código';
      txtNomeContaOrc.caption := 'Nome';
      txtPeriodo.caption      := 'Período';
      txtOrc.caption          := 'Orçado';
      txtReal.caption         := 'Realizado';
      txtVar.caption          := 'Variação';
      txtAcumulado.caption    := 'Acumulado no Exercício';
      txtOrcAcu.caption       := 'Orçado';
      txtRealAcu.caption      := 'Realizado';
      txtVarAcu.caption       := 'Variação';
   end;

end;

procedure TrptOrcamento.bndDetOrcamentoBeforeGenerate(Sender: TObject);
begin
  inherited;
   //Controla a altura da banda
   if bEspaco then begin
      if (sSintAnal = 'S') or (cdsOrcamento.FieldByName('PLATIPO').asString = 'S') then begin
         bndDetOrcamento.Height := 23;
         dbtxtContaOrc.top      := 9;
         dbtxtCorrespOrc.top    := 9;
         dbtxtNomeContaOrc.top  := 9;
         dbtxtRealPerOrc.top    := 9;
         dbtxtDCRealPerOrc.top  := 9;
         dbtxtOrcPerOrc.top     := 9;
         dbtxtDCOrcPerOrc.top   := 9;
         dbtxtVarPer.top        := 9;
         txtVarPer.top          := 9;
         dbtxtOrcAcumOrc.top    := 9;
         dbtxtDCOrcAcumOrc.top  := 9;
         dbtxtReaLAcumOrc.top   := 9;
         dbtxtDCRealAcumOrc.top := 9;
         dbtxtVarAcum.top       := 9;
         txtVarAcum.top         := 9;
      end else begin
         bndDetOrcamento.Height := 16;
         dbtxtContaOrc.top      := 2;
         dbtxtCorrespOrc.top    := 2;
         dbtxtNomeContaOrc.top  := 2;
         dbtxtRealPerOrc.top    := 2;
         dbtxtDCRealPerOrc.top  := 2;
         dbtxtOrcPerOrc.top     := 2;
         dbtxtDCOrcPerOrc.top   := 2;
         dbtxtVarPer.top        := 2;
         txtVarPer.top          := 2;
         dbtxtOrcAcumOrc.top    := 2;
         dbtxtDCOrcAcumOrc.top  := 2;
         dbtxtReaLAcumOrc.top   := 2;
         dbtxtDCRealAcumOrc.top := 2;
         dbtxtVarAcum.top       := 2;
         txtVarAcum.top         := 2;
      end;
      sSintAnal := cdsOrcamento.FieldByName('PLATIPO').asString;
   end else begin
      bndDetOrcamento.Height := 16;
      dbtxtContaOrc.top      := 2;
      dbtxtCorrespOrc.top    := 2;
      dbtxtNomeContaOrc.top  := 2;
      dbtxtRealPerOrc.top    := 2;
      dbtxtDCRealPerOrc.top  := 2;
      dbtxtOrcPerOrc.top     := 2;
      dbtxtDCOrcPerOrc.top   := 2;
      dbtxtVarPer.top        := 2;
      txtVarPer.top          := 2;
      dbtxtOrcAcumOrc.top    := 2;
      dbtxtDCOrcAcumOrc.top  := 2;
      dbtxtReaLAcumOrc.top   := 2;
      dbtxtDCRealAcumOrc.top := 2;
      dbtxtVarAcum.top       := 2;
      txtVarAcum.top         := 2;
   end;

   if bValores then begin
      dbtxtRealPerOrc.DisplayFormat  := '#,0.00;(#,0.00)';
      dbtxtOrcPerOrc.DisplayFormat   := '#,0.00;(#,0.00)';
      dbtxtVarPer.DisplayFormat      := '#,0.00;(#,0.00)';
      dbtxtOrcAcumOrc.DisplayFormat  := '#,0.00;(#,0.00)';
      dbtxtReaLAcumOrc.DisplayFormat := '#,0.00;(#,0.00)';
      dbtxtVarAcum.DisplayFormat     := '#,0.00;(#,0.00)';
   end else begin
      dbtxtRealPerOrc.DisplayFormat  := '#,0.00;-#,0.00';
      dbtxtOrcPerOrc.DisplayFormat   := '#,0.00;-#,0.00';
      dbtxtVarPer.DisplayFormat      := '#,0.00;-#,0.00';
      dbtxtOrcAcumOrc.DisplayFormat  := '#,0.00;-#,0.00';
      dbtxtReaLAcumOrc.DisplayFormat := '#,0.00;-#,0.00';
      dbtxtVarAcum.DisplayFormat     := '#,0.00;-#,0.00';
   end;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsOrcamento.FieldByName('PLAGRAU').asInteger);
      dbtxtContaOrc.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptOrcamento.bndDetOrcamentoBeforePrint(Sender: TObject);
begin
  inherited;
   if not bCodigo then begin
      dbtxtContaOrc.visible   := false;
      dbtxtCorrespOrc.visible := false;
      dbtxtNomeContaOrc.left  := 5;
   end;

end;

procedure TrptOrcamento.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
                                                    '   PERNUMERO, '+
                                                    '   PERNOME, '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY '+
                                                    '   PEREXERCICIO, '+
                                                    '   PERNUMERO ';


   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';



   CmpRptCM.ParamValues[12].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[12].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;

end.
