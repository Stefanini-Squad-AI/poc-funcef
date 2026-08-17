unit rOrcadoRealizado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, DBClient, uCMClientDataSet, DBTables, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, Wwquery,
  uCmRptManager, TXComp, CmParamReport,uCtrlContab, TXRB;

type
  TrptOrcadoRealizado = class(TFrmCmReport)
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
    LblEmpresa: TppLabel;
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
    LBLSISTEMA: TppLabel;
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
    sqlSaldoOrc: TCMSqlParams;
    cdsSaldoOrc: TCMClientDataSet;
    sqlSaldoRea: TCMSqlParams;
    cdsSaldoRea: TCMClientDataSet;
    sqlSaldoEncer: TCMSqlParams;
    cdsSaldoEncer: TCMClientDataSet;
    sqlTotais: TCMSqlParams;
    cdsTotais: TCMClientDataSet;
    sqlOrcamento: TCMSqlParams;
    cdsOrcamento: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppHeaderBand10BeforePrint(Sender: TObject);
    procedure bndDetOrcamentoBeforeGenerate(Sender: TObject);
    procedure bndDetOrcamentoBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    sTitulo,sMascara,sPacTipoPerResult :string;
    dtPeriodoFinal : TdateTime;
    sNomeOutLing, sNomePeriodo,
    iNumero :Integer;
    bIndenta,bEspaco,bValores,bCodigo,bIngles :Boolean;
    CtrlContab :TCtrlContab;
  public
    { Public declarations }
  end;

var
  rptOrcadoRealizado: TrptOrcadoRealizado;

implementation

uses uCtrlPadroes, uCtrlParamIntegra, uFuncaoGeral,
     uDatabase, DBaseDados, uString;

{$R *.DFM}

procedure TrptOrcadoRealizado.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
    //**** Seleciona parametro ******
    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
       sPacTipoPerResult := CtrlContab.TipoOpEncer
    else
       sPacTipoPerResult := '';


    //***********  Tratamento de titulos  **********
    with sqlTitulos do begin
      SQL.Clear;
      SQL.Add('SELECT  PERNUMERO, PERNOME, PERNOMEOUTLING PERDATFIM ');
      SQL.Add('FROM PERIODO                                         ');
      SQL.Add('WHERE IDPESSOA  =:IDPESSOA                           ');
      SQL.Add('  AND PERNUMERO =:PERNUMERO                          ');
      SQL.Add('ORDER BY PERNUMERO                                   ');

      Prepare;
      ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
      ParamByName('PERNUMERO').asInteger := StrToInt(CmpRptCM.ParamValues[1].AsString);
      Open;

      dtPeriodoFinal := cdsTitulos.fieldByname('PERDATFIM').AsdateTime;
      sNomeOutLing   := cdsTitulos.fieldByname('PERNOMEOUTLING').AsString;
      sNomePeriodo   := cdsTitulos.fieldByname('PERNOME').AsString;
    end;
    //-----------------------------------------------------------------------
    with sqlTitulos do begin
      SQL.Clear;
      SQL.Add('SELECT CODCENTROCUSTO, NOME            ');
      SQL.Add('FROM CENTCUST                          ');
      SQL.Add(' WHERE CODCENTROCUSTO =:CODCENTROCUSTO ');

      Prepare;
      ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[5].AsString;
      Open;

      sNomeCentoCustoIni := cdsTitulos.FieldByname('NOME').Asstring;
    end;
    //-----------------------------------------------------------------------
    with sqlTitulos do begin
      SQL.Clear;
      SQL.Add('SELECT CODCENTROCUSTO, NOME            ');
      SQL.Add('FROM CENTCUST                          ');
      SQL.Add(' WHERE CODCENTROCUSTO =:CODCENTROCUSTO ');

      Prepare;
      ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[6].AsString;
      Open;

      sNomeCentoCustoFim := cdsTitulos.FieldByname('NOME').Asstring;
    end;
    //-----------------------------------------------------------------------
    if CmpRptCM.ParamValues[18].AsString := '' then begin

       with sqlTitulos do begin
          SQL.Clear;
          SQL.Add('SELECT PERNUMERO                                 ');
          SQL.Add('FROM  PERIODO                                    ');
          SQL.Add('WHERE (IDPESSOA     =:IDPESSOA)                  ');
          SQL.Add('  AND (PEREXERCICIO =:PEREXERCICIO)              ');
          SQL.Add('  AND (PERNUMERO   <=:PERNUMERO)                 ');
          SQL.Add('  AND ((PERBLOQUE IS NULL) OR (PERBLOQUE = 'N')) ');

          Prepare;
          ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
          ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
          ParamByName('PERNUMERO').asInteger := StrToInt(CmpRptCM.ParamValues[1].AsString);
          Open;

          if cdsTitulos.isEmpty then begin
             if CmpRptCM.ParamValues[11].AsBoolean then begin
                sTitulo := 'Budgeted x Actual - '   + sNomeOutLing + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
             end else begin
                 sTitulo := 'Orçado x Realizado - ' + sNomePeriodo + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
             end;
          end else begin
             if CmpRptCM.ParamValues[11].AsBoolean then begin
                  sTitulo := 'Budgeted x Actual Partial - ' + sNomeOutLing+ '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
              end else begin
                  sTitulo := 'Orçado x Realizado Provisório - ' + sNomePeriodo + '/' + CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[2].AsString;
              end;
          end;
       end;

       pplblTituloOrcamento.caption := sTitulo;

       sTitulo := '';
       if trim(CmpRptCM.ParamValues[5].Astring) <> '' then begin
          with sqlTitulos do begin
            SQL.Clear;
            SQL.Add('SELECT CODCENTROCUSTO, NOME            ');
            SQL.Add('FROM CENTCUST                          ');
            SQL.Add(' WHERE CODCENTROCUSTO =:CODCENTROCUSTO ');

            Prepare;
            ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[5].AsString;
            Open;
          end;
          sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + cdsTitulos.FieldByName('NOME').asString;
       end;

       if trim(CmpRptCM.ParamValues[6].Astring) <> '' then begin
          with sqlTitulos do begin
            SQL.Clear;
            SQL.Add('SELECT CODCENTROCUSTO, NOME            ');
            SQL.Add('FROM CENTCUST                          ');
            SQL.Add(' WHERE CODCENTROCUSTO =:CODCENTROCUSTO ');

            Prepare;
            ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[6].AsString;
            Open;
          end;
          sTitulo := sTitulo +  '     Centro de Custo Final : ' + cdsTitulos.FieldByName('NOME').asString;
       end;

       if trim(CmpRptCM.ParamValues[7].Astring) <> '' then begin
          with sqlTitulos do begin
            SQL.Clear;
            SQL.Add('SELECT  UNIDNEGOC, NOME      ');
            SQL.Add('FROM UNIDNEGOCIO             ');
            SQL.Add('WHERE ( IDPESSOA =:IDPESSOA) ');

            Prepare;
            ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
            Open;

          end;
          sTitulo := sTitulo +  '     Atividade/Projeto : ' + cdsTitulos.FieldByName('NOME').asString;
      end;
       pplblTituloOrcamento2.caption := sTitulo;
    end else begin
      pplblTituloOrcamento.caption  := CmpRptCM.ParamValues[18].Astring;
      pplblTituloOrcamento2.caption := CmpRptCM.ParamValues[19].Astring;
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

    //****************** Fim Titulos  ****************************
    bValores := chkValores.checked;
    bCodigo  := chkCodigo.checked;
    bIngles  := chkLingua.checked;

    sMascara := '';
    if CmpRptCM.ParamValues[8].AsBoolean then begin
       sMascara := modulo.sMascaraContas;
    end;

    bIndenta := CmpRptCM.ParamValues[14].AsBoolean;
    bEspaco  := CmpRptCM.ParamValues[15].AsBoolean;

    iNumero := FuncaoGeral.CalcNumEleGrau(modulo.sMascaraContas, 1);
    //*********************************************************

    if (CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal) or (CmpRptCM.ParamValues[17].AsBoolean) then begin
       with sqlSaldoOrc do begin
          SQL.Clear;
          SQL.Add('SELECT            ');
          SQL.Add('   SUM(DECODE(P.PLSORCADODEBITO,NULL,0,P.PLSORCADODEBITO)-DECODE(P.PLSORCADOCREDITO,NULL,0,P.PLSORCADOCREDITO)) AS SALDOORC, ');
          SQL.Add('   M.SALDOORCMES  ');
          SQL.Add('FROM              ');
          SQL.Add('   PLANOSALDO P,  ');
          SQL.Add('   (SELECT        ');
          SQL.Add('       SUM(DECODE(PLSORCADODEBITO,NULL,0,PLSORCADODEBITO)-DECODE(PLSORCADOCREDITO,NULL,0,PLSORCADOCREDITO)) AS SALDOORCMES ');
          SQL.Add('    FROM          ');
          SQL.Add('       PLANOSALDO ');
          SQL.Add('    WHERE         ');
          SQL.Add('      (IDPESSOA    =:IDPESSOA) AND     ');
          SQL.Add('      (PEREXERCICIO=:PEREXERCICIO) AND ');
          SQL.Add('      (PERNUMERO   =:PERNUMERO) AND    ');
          SQL.Add('      (PLACONTA    =:PLACONTA) AND     ');
          if CmpRptCM.ParamValues[7].Astring <> '' then begin
             SQL.Add('       (UNIDNEGOC =:UNIDNEGOC) AND                           ');
          end;
          if CmpRptCM.ParamValues[5].Astring <> '' then begin
             SQL.Add('       ((CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
             SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].Astring <> '' then begin
             SQL.Add('       ((CODCENTROCUSTO <= :CCUSTOFIM) AND                    ');
             SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('      (PLANO       =:PLANO)) M         ');
          SQL.Add('WHERE                                  ');
          SQL.Add('   (P.IDPESSOA    =:IDPESSOA) AND      ');
          SQL.Add('   (P.PEREXERCICIO=:PEREXERCICIO) AND  ');
          SQL.Add('   ((P.PERNUMERO  <=:PERNUMERO) OR (P.PERNUMERO IS NULL)) AND ');
          if CmpRptCM.ParamValues[7].Astring <> '' then begin
             SQL.Add('       (P.UNIDNEGOC =:UNIDNEGOC) AND                       ');
          end;
          if CmpRptCM.ParamValues[5].Astring <> '' then begin
             SQL.Add('       ((P.CODCENTROCUSTO >= :CCUSTOINI) AND               ');
             SQL.Add('       (P.IDEMPRESA =:EMPRESA)) AND                        ');
          end;
          if CmpRptCM.ParamValues[6].Astring <> '' then begin
             SQL.Add('       ((P.CODCENTROCUSTO <= :CCUSTOFIM) AND                ');
             SQL.Add('       (P.IDEMPRESA =:EMPRESA)) AND                         ');
          end;
          SQL.Add('   (P.PLACONTA    =:PLACONTA) AND                              ');
          SQL.Add('   (P.PLANO       =:PLANO)                                     ');
          SQL.Add('GROUP BY M.SALDOORCMES                                         ');
          Prepare;
       end;

       with sqlSaldoRea do begin
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
          if  CmpRptCM.ParamValues[7].Astring  <> '' then begin
             SQL.Add('       (L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
          end;
          if  CmpRptCM.ParamValues[5].Astring  <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if  CmpRptCM.ParamValues[6].Astring  <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('      (P.PLNCODIGO   = L.PLNCODIGO)) M                                         ');
          SQL.Add('WHERE                                                                          ');
          SQL.Add('   (P.IDPESSOA    =:IDPESSOA) AND                                              ');
          SQL.Add('   (P.PEREXERCICIO=:PEREXERCICIO) AND                                          ');
          SQL.Add('   ((P.PERNUMERO  <:PERNUMERO) OR (P.PERNUMERO IS NULL)) AND                   ');
          if  CmpRptCM.ParamValues[7].Astring  <> '' then begin
             SQL.Add('       (P.UNIDNEGOC =:UNIDNEGOC) AND                           ');
          end;
          if  CmpRptCM.ParamValues[5].Astring ) <> '' then begin
             SQL.Add('       ((P.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (P.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].Astring  <> '' then begin
             SQL.Add('       ((P.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
             SQL.Add('       (P.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('   (P.PLACONTA    =:PLACONTA) AND                                              ');
          SQL.Add('   (P.PLANO       =:PLANO) ');
          SQL.Add('GROUP BY M.SALDOREAMES ');
          Prepare;
       end;

       with sqlSaldoEncer do begin
          SQL.Clear;
          SQL.Add('SELECT            ');
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
          SQL.Add('      (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
          if CmpRptCM.ParamValues[7].Astring <> '' then begin
             SQL.Add('       (L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
          end;
          if CmpRptCM.ParamValues[5].Astring <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].Astring <> '' then begin
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
          SQL.Add('   (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
          if CmpRptCM.ParamValues[7].Astring <> '' then begin
             SQL.Add('    (L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
          end;
          if CmpRptCM.ParamValues[5].Astring <> '' then begin
             SQL.Add('    ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('    (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].Astring <> '' then begin
             SQL.Add('    ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
             SQL.Add('    (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('   (P.PLNCODIGO   = L.PLNCODIGO)                                ');
          SQL.Add('GROUP BY M.SALDOREAMES ');
          Prepare;
       end;
    end;

    with sqlTotais do begin
       SQL.Clear;
       SQL.Add('SELECT                                                           ');
       if CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal then begin
          SQL.Add('   (NVL(MA.MOVDATA,0)+NVL(EM.MOVDATA,0)) AS REAL, ');
       end else begin
          SQL.Add('   SUM(NVL(S.PLSDEBITOCORRENTE,0)-NVL(S.PLSCREDITOCOR,0))+NVL(EM.MOVDATA,0) AS REAL,  ');
       end;
       SQL.Add('   SUM(NVL(S.PLSORCADODEBITO,0)- NVL(S.PLSORCADOCREDITO, 0)) AS ORC,    ');
       SQL.Add('   (NVL(SA.SALDOREAL,0)+NVL(ES.REAL,0)) AS SALDOREAL, SA.SALDOORC       ');
       SQL.Add('FROM                                                                    ');
       SQL.Add('   PLANOSALDO S,PLANOCONTA C,                                           ');
       if CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal then begin
          SQL.Add('   (SELECT                                                           ');
          SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''D'',L.LACVALOR, (L.LACVALOR*-1))) AS MOVDATA ');
          SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
          SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                  ');
          SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
          SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
          SQL.Add('          (P.PERNUMERO =:PERIODO) AND                            ');
          SQL.Add('          (P.PLNDATDIA <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND   ');
          if CmpRptCM.ParamValues[7].AsString <> '' then begin
             SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
             SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
          end;
          if CmpRptCM.ParamValues[5].AsString <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].AsString <> '' then begin
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
          SQL.Add('          (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
          SQL.Add('          (P.PLNDATDIA <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND   ');
          if CmpRptCM.ParamValues[7].asString <> '' then begin
             SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
             SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
          end;
          if CmpRptCM.ParamValues[5].asString <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].asString <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('          (L.IDPESSOA =:IDPESSOA) AND                              ');
          SQL.Add('          (L.PLACONTA >= :CONTAINI) AND              ');
          SQL.Add('          (L.PLACONTA <= :CONTAFIM)) EM,             ');
          SQL.Add('                                                                   ');
          SQL.Add('   (SELECT                                                       ');
          SQL.Add('       SUM(DECODE(L.LACDEBCRE, ''C'',L.LACVALOR, (L.LACVALOR*-1))) AS REAL ');
          SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
          SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                  ');
          SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
          SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
          SQL.Add('          (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
          SQL.Add('          (P.PLNDATDIA <=TO_DATE(:DATALIM,''DD/MM/YYYY'')) AND   ');
          if CmpRptCM.ParamValues[7].asString <> '' then begin
             SQL.Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                           ');
             SQL.Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
          end;
          if CmpRptCM.ParamValues[5].asString <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].asString <> '' then begin
             SQL.Add('       ((L.CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
             SQL.Add('       (L.IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('          (L.IDPESSOA =:IDPESSOA) AND                              ');
          SQL.Add('          (L.PLACONTA >= :CONTAINI) AND              ');
          SQL.Add('          (L.PLACONTA <= :CONTAFIM)) ES,             ');
          SQL.Add('                                                                   ');
       end else begin
          SQL.Add('   (SELECT                                         ');
          SQL.Add('       (0) AS MOVDATA                              ');
          SQL.Add('    FROM PARAMCONTAB                               ');
          SQL.Add('    WHERE (IDPESSOA =:IDPESSOA)) EM,               ');
          SQL.Add('   (SELECT                                         ');
          SQL.Add('       (0) AS REAL                                 ');
          SQL.Add('    FROM PARAMCONTAB                               ');
          SQL.Add('    WHERE (IDPESSOA =:IDPESSOA)) ES,               ');
       end;
       SQL.Add('   (SELECT                                                       ');
       SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
       SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL,  ');
       SQL.Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO) ');
       SQL.Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC    ');
       SQL.Add('    FROM PLANOSALDO                                              ');
       SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
       SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
       SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
       if CmpRptCM.ParamValues[7].asString <> '' then begin
          SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
          SQL.Add('       (IDPESSOA =:PESSOA)) AND                               ');
       end;
       if CmpRptCM.ParamValues[5].asString <> '' then begin
          SQL.Add('       ((CODCENTROCUSTO >= :CCUSTOINI) AND                    ');
          SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
       end;
       if CmpRptCM.ParamValues[6].asString <> '' then begin
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
       SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
       SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
       SQL.Add('    (S.PERNUMERO(+) =:PERIODO) AND                               ');
       SQL.Add('    (C.PLATIPO = ''A'') AND                                      ');
       if CmpRptCM.ParamValues[7].asString <> '' then begin
          SQL.Add(' ((S.UNIDNEGOC(+) =:UNIDNEGOC) AND                            ');
          SQL.Add(' (S.IDPESSOA(+) =:PESSOA)) AND                                ');
       end;
       if CmpRptCM.ParamValues[5].asString <> '' then begin
          SQL.Add(' ((S.CODCENTROCUSTO(+) >= :CCUSTOINI) AND                     ');
          SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
       end;
       if CmpRptCM.ParamValues[6].asString <> '' then begin
          SQL.Add(' ((S.CODCENTROCUSTO(+) <= :CCUSTOFIM) AND                     ');
          SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
       end;
       SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
       SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                                ');
       SQL.Add('    (C.PLACONTA <= :CONTAFIM)                                    ');
       SQL.Add('GROUP BY                                                         ');
       SQL.Add('    SA.SALDOREAL, SA.SALDOORC, EM.MOVDATA, ES.REAL               ');
       if CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal then
          SQL.Add('   ,MA.MOVDATA    ');

       Prepare;
       ParamByName('PLANO').asInteger     := CtrlContab.PlanoParam;
       ParamByName('IDPESSOA').asInteger  := CrmRptCM.IdEmpresa;
       ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
       ParamByName('PERIODO').asInteger   := StrToInt(CmpRptCM.ParamValues[1].AsString);

       if (CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal) or (CmpRptCM.ParamValues[17].AsBoolean) then
          ParamByName('DATALIM').asString   := DateToStr(CmpRptCM.ParamValues[2].AsDate);

       if CmpRptCM.ParamValues[3].AsString <> '' then begin
          ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
       end else begin
          ParamByName('CONTAINI').asString := Espaco('0',18);
       end;
       //
       if CmpRptCM.ParamValues[4].AsString <> '' then begin
          ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
       end else begin
          ParamByName('CONTAFIM').asString := '999999999999999999';
       end;

       if CmpRptCM.ParamValues[5].AsString <> '' then begin
          ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
          ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
       end;

       if CmpRptCM.ParamValues[6].AsString <> '' then begin
          ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
          ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
       end;

       if CmpRptCM.ParamValues[7].AsString <> '' then begin
          ParamByName('UNIDNEGOC').asInteger := StrToInt(mskAtivProj.text);
          ParamByName('PESSOA').asInteger    := CrmRptCM.IdEmpresa;
       end;

       //Abre a query e soma os valores
       Open;

       if cdsTotais.FieldByName('REAL').AsFloat > 0  then begin
          rptOrcamentoLabel9.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('REAL').AsFloat))+' D';
       end else begin
          rptOrcamentoLabel9.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('REAL').AsFloat))+' C';
       end;

       if cdsTotais.FieldByName('ORC').AsFloat > 0  then begin
          rptOrcamentoLabel10.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('ORC').AsFloat))+' D';
       end else begin
          rptOrcamentoLabel10.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('ORC').AsFloat))+' C';
       end;

       if cdsTotais.FieldByName('SALDOREAL').AsFloat > 0  then begin
          rptOrcamentoLabel11.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOREAL').AsFloat))+' D';
       end else begin
          rptOrcamentoLabel11.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOREAL').AsFloat))+' C';
       end;

       if cdsTotais.FieldByName('SALDOORC').AsFloat > 0  then begin
          rptOrcamentoLabel12.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOORC').AsFloat))+' D';
       end else begin
          rptOrcamentoLabel12.Caption :=FormatFloat('#,##0.00', ABS(cdsTotais.FieldByName('SALDOORC').AsFloat))+' C';
       end;
    end;

    //******** Faz a query principal do Relatório ***********
    with sqlOrcamento do begin
       SQL.Clear;
       if (CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal) or (CmpRptCM.ParamValues[17].AsBoolean) then begin
          SQL.Add('SELECT                                                           ');
          SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
          SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
          if CmpRptCM.ParamValues[11].AsBoolean then begin
             SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOME, C.PLANOMEOUTLING,    ');
          end else begin
             SQL.Add('   C.PLANOME AS CONTA, C.PLANOMEOUTLING, C.PLANOME,           ');
          end;
          SQL.Add('   (0) AS REAL,      (0) AS ORC,                                 ');
          SQL.Add('   (0) AS SALDOREAL, (0) AS  SALDOORC                            ');

          //*** campos calculados
          SQL.Add('   (0) AS SORCABS, (0) AS SREALABS, (0) AS ORCABS, (0) AS REALABS,  ');
          SQL.Add('   (0) AS VARPER, (0) AS VARACUM, ('' '') AS DEBCREORC, ('' '') AS DEBCREREAL, ');
          SQL.Add('   ('' '') AS DEBCRESORC, ('' '') AS DEBCRESREAL, ('' '') AS NOMEINDENTADO ');
          //***
          SQL.Add('FROM                                                             ');
          SQL.Add('   PLANOCONTA C                                                  ');
          SQL.Add('WHERE                                                            ');
          SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
          SQL.Add('    (C.PLAGRAU <=:GRAU) AND                                      ');
          SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                                ');
          SQL.Add('    (C.PLACONTA <= :CONTAFIM)                                    ');
          SQL.Add('ORDER BY                                                         ');
          if CmpRptCM.ParamValues[13].AsBoolean then begin
             SQL.Add(' C.PLACONCORRESP                                              ');
          end else begin
             SQL.Add(' C.PLACONTA                                                   ');
          end;
       end else begin
          SQL.Add('SELECT                                                           ');
          SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
          SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
          if CmpRptCM.ParamValues[11].AsBoolean then begin
             SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOME, C.PLANOMEOUTLING,    ');
          end else begin
             SQL.Add('   C.PLANOME AS CONTA, C.PLANOMEOUTLING, C.PLANOME,           ');
          end;
          SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
          SQL.Add('     - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS REAL,  ');
          SQL.Add('   SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) ');
          SQL.Add('     - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)) AS ORC,    ');

          SQL.Add('   SA.SALDOREAL, SA.SALDOORC                                     ');
          SQL.Add('FROM                                                             ');
          SQL.Add('   PLANOSALDO S, PLANOCONTA C,                                   ');
          SQL.Add('                                                                 ');
          SQL.Add('   (SELECT                                                       ');
          SQL.Add('       PLACONTA,                                                 ');

          SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
          SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOREAL,  ');

          SQL.Add('   SUM(DECODE(PLSORCADODEBITO, NULL, 0, PLSORCADODEBITO) ');
          SQL.Add('     - DECODE(PLSORCADOCREDITO, NULL, 0, PLSORCADOCREDITO)) AS SALDOORC    ');

          SQL.Add('    FROM PLANOSALDO                                              ');
          SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
          SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
          SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
          if CmpRptCM.ParamValues[7].AsString <> '' then begin
             SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
             SQL.Add('       (IDPESSOA =:PESSOA)) AND                               ');
          end;
          if CmpRptCM.ParamValues[5].AsString <> '' then begin
             SQL.Add('       ((CODCENTROCUSTO >= :CCUSTOINI) AND        ');
             SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          if CmpRptCM.ParamValues[6].AsString <> '' then begin
             SQL.Add('       ((CODCENTROCUSTO <= :CCUSTOFIM) AND        ');
             SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
          end;
          SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');
          SQL.Add('          (PLACONTA >= :CONTAINI) AND              ');
          SQL.Add('          (PLACONTA <= :CONTAFIM)                  ');
          SQL.Add('    GROUP BY PLACONTA ) SA                                       ');
          SQL.Add('                                                                 ');
          SQL.Add('WHERE                                                            ');
          SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
          SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');
          SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                            ');
          SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
          SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
          SQL.Add('    (S.PERNUMERO(+) =:PERIODO) AND                               ');
          SQL.Add('    (C.PLAGRAU <=:GRAU) AND                                      ');
          if CmpRptCM.ParamValues[7].AsString <> '' then begin
             SQL.Add(' ((S.UNIDNEGOC(+) =:UNIDNEGOC) AND                            ');
             SQL.Add(' (S.IDPESSOA(+) =:PESSOA)) AND                                ');
          end;
          if CmpRptCM.ParamValues[5].AsString <> '' then begin
             SQL.Add(' ((S.CODCENTROCUSTO(+) >= :CCUSTOINI) AND         ');
             SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
          end;
          if CmpRptCM.ParamValues[6].AsString <> '' then begin
             SQL.Add(' ((S.CODCENTROCUSTO(+) <= :CCUSTOFIM) AND         ');
             SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
          end;
          SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
          SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                  ');
          SQL.Add('    (C.PLACONTA <= :CONTAFIM)                      ');
          SQL.Add('GROUP BY                                                         ');
          SQL.Add('    C.PLACONTA, SA.SALDOREAL, SA.SALDOORC,                       ');
          SQL.Add('    C.PLAGRAU, C.PLATIPO,                                        ');
          SQL.Add('    C.PLANOMEOUTLING, C.PLANOME, C.PLACONCORRESP                 ');
          SQL.Add('HAVING                                                           ');
          SQL.Add('   (DECODE(SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
          SQL.Add('             - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)), 0,');
          SQL.Add('   (DECODE(SUM(DECODE(S.PLSORCADODEBITO, NULL, 0, S.PLSORCADODEBITO) ');
          SQL.Add('             - DECODE(S.PLSORCADOCREDITO, NULL, 0, S.PLSORCADOCREDITO)), 0,    ');
          SQL.Add('   (DECODE(SA.SALDOREAL,NULL,                                    ');
          SQL.Add('   (DECODE(SA.SALDOORC,NULL,''0'',''1'')),                       ');
          SQL.Add('   ''1'')),''1'')),''1'')) = ''1''                               ');
          SQL.Add('ORDER BY                                                         ');
          if  CmpRptCM.ParamValues[13].AsBoolean <> '' then begin
             SQL.Add(' C.PLACONCORRESP                                              ');
          end else begin
             SQL.Add(' C.PLACONTA                                                   ');
          end;
       end;

       Prepare;
       ParamByName('GRAU').asInteger      := CmpRptCM.ParamValues[12].AsInteger;
       ParamByName('PLANO').asInteger     := Modulo.iPlano;

       if (CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal) or (CmpRptCM.ParamValues[17].AsBoolean) then begin
          ParamByName('IDPESSOA').asInteger  := CrmRptCM.IdEmpresa;
          ParamByName('EXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
          ParamByName('PERIODO').asInteger   := StrToInt(CmpRptCM.ParamValues[1].AsString);
          //
          if CmpRptCM.ParamValues[5].AsString <> '' then begin
             ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
             ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
          end;

          if CmpRptCM.ParamValues[6].AsString <> '' then begin
             ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
             ParamByName('EMPRESA').asInteger    := sCrmRptCM.IdEmpresa;
          end;

          if CmpRptCM.ParamValues[7].AsString <> '' then begin
             ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
             ParamByName('PESSOA').asInteger    := CrmRptCM.IdEmpresa;
          end;
       end;

       if CmpRptCM.ParamValues[3].AsString <> '' then begin
          ParamByName('CONTAINI').asString := Espaco(CmpRptCM.ParamValues[3].AsString,18);
       end else begin
          ParamByName('CONTAINI').asString := Espaco('0',18);
       end;

       if CmpRptCM.ParamValues[4].AsString <> '' then begin
          ParamByName('CONTAFIM').asString := Espaco(CmpRptCM.ParamValues[4].AsString,18);
       end else begin
          ParamByName('CONTAFIM').asString := '999999999999999999';
       end;

       if (CmpRptCM.ParamValues[2].AsDate <> dtPeriodoFinal) or (CmpRptCM.ParamValues[17].AsBoolean) then begin

          Open;
          bSair  := False;
          cdsOrcamento.First;

          While (not cdsOrcamento.EOF) and (not bSair) do begin

             sqlSaldoOrc.ParamByName('PLACONTA').AsString      := Espaco(cdsOrcamento.FieldByName('PLACONTA').AsString,18);
             sqlSaldoOrc.ParamByName('PLANO').asInteger        := Modulo.iPlano;
             sqlSaldoOrc.ParamByName('IDPESSOA').asInteger     := CrmRptCM.IdEmpresa;
             sqlSaldoOrc.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
             sqlSaldoOrc.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);

             if CmpRptCM.ParamValues[5].AsString <> '' then begin
                sqlSaldoOrc.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
                sqlSaldoOrc.ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
             end;
             if CmpRptCM.ParamValues[6].AsString <> '' then begin
                sqlSaldoOrc.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
                sqlSaldoOrc.ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
             end;
             if CmpRptCM.ParamValues[7].AsString <> '' then begin
                sqlSaldoOrc.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
             end;

             sqlSaldoOrc.Open;

             //
             sqlSaldoRea.ParamByName('PLACONTASIN').AsString   := trim(cdsOrcamento.FieldByName('PLACONTA').AsString)+'%';
             sqlSaldoRea.ParamByName('DATALIM').AsString       := DateToStr(CmpRptCM.ParamValues[2].AsString);
             sqlSaldoRea.ParamByName('PLACONTA').AsString      := Espaco(cdsOrcamento.FieldByName('PLACONTA').AsString,18);
             sqlSaldoRea.ParamByName('PLANO').asInteger        := Modulo.iPlano;
             sqlSaldoRea.ParamByName('IDPESSOA').asInteger     := CrmRptCM.IdEmpresa;
             sqlSaldoRea.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
             sqlSaldoRea.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);

             if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
                sqlSaldoRea.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
                sqlSaldoRea.ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
             end;

             if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
                sqlSaldoRea.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
                sqlSaldoRea.ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
             end;

             if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
                sqlSaldoRea.ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
             end;

             sqlSaldoRea.Open;

             rMovExer := 0;
             rSalExer := 0;

             if CmpRptCM.ParamValues[17].AsBoolean then begin
                //
                sqlSaldoEncer.Close;
                sqlSaldoEncer.ParamByName('PLACONTASIN').AsString   := trim(cdsOrcamento.FieldByName('PLACONTA').AsString)+'%';
                sqlSaldoEncer.ParamByName('DATALIM').AsString       := DateToStr(CmpRptCM.ParamValues[2].Asdate);
                sqlSaldoEncer.ParamByName('PLANO').asInteger        := Modulo.iPlano;
                sqlSaldoEncer.ParamByName('IDPESSOA').asInteger     := CrmRptCM.IdEmpresa;
                sqlSaldoEncer.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
                sqlSaldoEncer.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);

                if CmpRptCM.ParamValues[5].AsString <> '' then begin
                   sqlSaldoEncer.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[5].AsString,10);
                   sqlSaldoEncer.ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
                end;

                if CmpRptCM.ParamValues[6].AsString <> '' then begin
                   sqlSaldoEncer.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);
                   sqlSaldoEncer.ParamByName('EMPRESA').asInteger    := CrmRptCM.IdEmpresa;
                end;

                if CmpRptCM.ParamValues[7].AsString <> '' then begin
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
                cdsOrcamento.Next;
                if cdsOrcamento.Eof then
                   bSair := True
                else
                   cdsOrcamento.Prior;
                cdsOrcamento.Delete;
             end else begin
                cdsOrcamento.Edit;
                cdsOrcamento.FieldByName('REAL').AsFloat      := cdsSaldoRea.FieldByName('SALDOREAMES').AsFloat+rMovExer;
                cdsOrcamento.FieldByName('ORC').AsFloat       := cdsSaldoOrc.FieldByName('SALDOORCMES').AsFloat;
                cdsOrcamento.FieldByName('SALDOREAL').AsFloat := cdsSaldoRea.FieldByName('SALDOREA').AsFloat+rSalExer;
                cdsOrcamento.FieldByName('SALDOORC').AsFloat  := cdsSaldoOrc.FieldByName('SALDOORC').AsFloat;
                cdsOrcamento.Next;
             end;
          end;
       end;

       cdsOrcamento.Open;

    end;

end;

procedure TrptOrcadoRealizado.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptOrcadoRealizado.ppHeaderBand10BeforePrint(Sender: TObject);
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

procedure TrptOrcadoRealizado.bndDetOrcamentoBeforeGenerate(Sender: TObject);
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

procedure TrptOrcadoRealizado.bndDetOrcamentoBeforePrint(Sender: TObject);
begin
  inherited;
   if not bCodigo then begin
      dbtxtContaOrc.visible   := false;
      dbtxtCorrespOrc.visible := false;
      dbtxtNomeContaOrc.left  := 5;
   end;

end;

procedure TrptOrcadoRealizado.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:= 'SELECT Distinct '+
                                                     '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEXERNOME, ' +
                                                     '       PERNUMERO, '+
                                                     '       PERNOME, PERNOMEOUTLING, ' +
                                                     '       PERDATFIM '+
                                                     '  FROM PERIODO '+
                                                     ' WHERE (IDPESSOA = '+ FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     ' ORDER BY PEXERNOME';

  CmpRptCM.ParamValues[7].LookupSettings.SQL.Text := ' SELECT UNIDNEGOC, NOME, CONCAT(CONCAT(TO_CHAR(UNIDNEGOC,'+#39+'999'+#39+'),'+#39+' '+#39+ '),NOME) AS DESCRICAO '+
                                                  ' FROM UNIDNEGOCIO '+
                                                  ' WHERE IDPESSOA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                  ' ORDER BY NOME ';

  CmpRptCM.ParamValues[5].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO,NOME,CONCAT(CONCAT(CODCENTROCUSTO,'+#39+' '+#39+'),NOME) AS DESCRICAO ' +
                                                ' FROM CENTCUST ' +
                                                ' WHERE IDEMPRESA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                ' ORDER BY CODCENTROCUSTO ';

  CmpRptCM.ParamValues[6].LookupSettings.SQL.Text := ' SELECT CODCENTROCUSTO,NOME,CONCAT(CONCAT(CODCENTROCUSTO,'+#39+' '+#39+'),NOME) AS DESCRICAO ' +
                                                ' FROM CENTCUST ' +
                                                ' WHERE IDEMPRESA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                ' ORDER BY CODCENTROCUSTO ';

end;

end.
