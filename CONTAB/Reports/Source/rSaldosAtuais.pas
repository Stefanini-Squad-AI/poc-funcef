{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TrptSaldosAtuais.CrmRptCMBeforePrint(
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 02/06/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado
--------------------------------------------------------------------------------}


unit rSaldosAtuais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, uCtrlRptBalancete,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, TXRB, uCtrlContab;

type
  TrptSaldosAtuais = class(TFrmCmReport)
    rptBalSaldoAtual: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLblTituloBalSalAtu: TppLabel;
    ppLine12: TppLine;
    LblEmpresa: TppLabel;
    ppLabel47: TppLabel;
    ppLine16: TppLine;
    ppLabel48: TppLabel;
    txtSaldoBal: TppLabel;
    ppLblTituloBalSalAtu2: TppLabel;
    bndDetBalancete: TppDetailBand;
    dbtxtContaBal: TppDBText;
    dbtxtCorrespBal: TppDBText;
    dbtxtNomeContaBal: TppDBText;
    dbtxtSaldoBal: TppDBText;
    dbtxtSaldoDCBal: TppDBText;
    rptBalanceteDBText3: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine20: TppLine;
    lblsistema: TppLabel;
    lblContador: TppLabel;
    rptBalanceteLabel1: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    pplBalSaldoAtual: TppBDEPipeline;
    pplBalSaldoAtualppField1: TppField;
    pplBalSaldoAtualppField2: TppField;
    pplBalSaldoAtualppField3: TppField;
    pplBalSaldoAtualppField4: TppField;
    pplBalSaldoAtualppField5: TppField;
    pplBalSaldoAtualppField6: TppField;
    pplBalSaldoAtualppField7: TppField;
    pplBalSaldoAtualppField8: TppField;
    pplBalSaldoAtualppField9: TppField;
    pplBalSaldoAtualppField10: TppField;
    pplBalSaldoAtualppField11: TppField;
    pplBalSaldoAtualppField12: TppField;
    pplBalSaldoAtualppField13: TppField;
    dsBalSaldoAtual: TwwDataSource;
    cdsBalSaldoAtual: TCMClientDataSet;
    sqlBalSaldoAtual: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    procedure bndDetBalanceteBeforePrint(Sender: TObject);
    procedure ppFooterBand8BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    sTitulo,sMascara,sEspacos,sNomeExerc,sPeriodoInicial :string;
    sSintAnal : String;
    iNumero,iPagIni:Integer;
    bEspaco :Boolean;
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlContab: TCtrlContab;
  public
    { Public declarations }
  end;

var
  rptSaldosAtuais: TrptSaldosAtuais;

implementation

uses UMensErro, uDatabase, DBaseDados, uCtrlParamIntegra,uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TrptSaldosAtuais.bndDetBalanceteBeforePrint(Sender: TObject);
begin
  inherited;
   //Controla a altura da banda
   if bEspaco then begin
      if (sSintAnal = 'S') or (cdsBalSaldoAtual.FieldByName('PLATIPO').asString = 'S') then begin
         bndDetBalancete.Height := 23;
         dbtxtContaBal.top      := 9;
         dbtxtCorrespBal.top    := 9;
         dbtxtNomeContaBal.top  := 9;
         dbtxtSaldoBal.Top      := 9;
         dbtxtSaldoDCBal.Top    := 9;
      end else begin
         bndDetBalancete.Height := 16;
         dbtxtContaBal.top      := 2;
         dbtxtCorrespBal.top    := 2;
         dbtxtNomeContaBal.top  := 2;
         dbtxtSaldoBal.Top      := 2;
         dbtxtSaldoDCBal.Top    := 2;
      end;
      sSintAnal := cdsBalSaldoAtual.FieldByName('PLATIPO').asString;
   end else begin
      bndDetBalancete.Height := 16;
      dbtxtContaBal.top      := 2;
      dbtxtCorrespBal.top    := 2;
      dbtxtNomeContaBal.top  := 2;
      dbtxtSaldoBal.Top      := 2;
      dbtxtSaldoDCBal.Top    := 2;
   end;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalSaldoAtual.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalSaldoAtual.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBal.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptSaldosAtuais.ppFooterBand8BeforePrint(Sender: TObject);
begin
  inherited;
   lblContador.Caption := IntToStr((iPagIni + StrToInt(ppCalc15.text)) - 1);

end;

procedure TrptSaldosAtuais.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[16].SpinEditSettings.Value := 1;

   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '   (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
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


   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[7].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[7].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;

procedure TrptSaldosAtuais.CrmRptCMBeforePrint(Sender: TObject);
var i:integer;
begin
  inherited;
   sPeriodoInicial := '';
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
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

   //====================================

   CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime));  //Everson Cunha - SIG102043

   //=====================================================================

   sMascara := '';
   if CmpRptCM.ParamValues[8].asBoolean then begin
     sMascara := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
     //sMascara := modulo.sMascaraContas;     //Everson Cunha - SIG102043
   end;

   bEspaco := CmpRptCM.ParamValues[13].asBoolean;

   if CmpRptCM.ParamValues[17].asString = '' then
   begin
      with sqlAux do
      begin
         Prepare;
         ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat := StrToFloat(CmpRptCM.ParamValues[0].asString);
         ParamByName('PERNUMERO').asInteger  := StrToInt(CmpRptCM.ParamValues[1].asString);
         Open;

         if cdsAux.isEmpty then
            sTitulo := 'Balancete de Saldos Atuais - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString
         else
            sTitulo := 'Balancete Provisório de Saldos Atuais - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
      end;

      //Imprime os títulos
      pplblTituloBalSalAtu.caption := sTitulo;

      sTitulo := '';
      if CmpRptCM.ParamValues[14].asBoolean then begin
         sTitulo := sTitulo +  '     SOMENTE Contas Contra sua Natureza';
      end;
      if trim(CmpRptCM.ParamValues[2].asString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Inicial : ' + CmpRptCM.ParamValues[2].asString;
      end;
      if trim(CmpRptCM.ParamValues[3].asString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Final : ' + CmpRptCM.ParamValues[3].asString;
      end;
      if trim(CmpRptCM.ParamValues[4].asString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + CmpRptCM.ParamValues[4].asString;
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + CmpRptCM.ParamValues[5].asString;
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + CmpRptCM.ParamValues[6].asString;
      end;

      pplblTituloBalSalAtu2.caption := sTitulo;
   end else begin
      pplblTituloBalSalAtu.caption  := CmpRptCM.ParamValues[17].asString;
      pplblTituloBalSalAtu2.caption := CmpRptCM.ParamValues[18].asString;
   end;

   //Configura a exibiçao da Conta Correspondente
   if CmpRptCM.ParamValues[11].asBoolean then begin
      dbtxtCorrespBal.visible := true;
      dbtxtContaBal.visible   := false;
   end else begin
      dbtxtCorrespBal.visible := false;
      dbtxtContaBal.visible   := true;
   end;

   //Configura a quebra de página
   if CmpRptCM.ParamValues[9].asBoolean then begin
      rptBalSaldoAtual.Groups[0].NewPage := true;
   end else begin
      rptBalSaldoAtual.Groups[0].NewPage := false;
   end;

   iPagIni := CmpRptCM.ParamValues[16].asInteger;
   iNumero := FuncaoGeral.CalcNumEleGrau(modulo.sMascaraContas, 1);

   with sqlBalSaldoAtual do begin
      SQL.Clear;
      SQL.Add('SELECT                                                           ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   ('' '') AS DEBCRESALDO, (0) AS SALDOABS,                    ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[10].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING, ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end;

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)             ');
      //SQL.Add('               - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');

      if CmpRptCM.ParamValues[19].AsBoolean then
      begin
          SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)      ');
          SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)              ');
          SQL.Add('     - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)             ');
        SQL.Add('               - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('FROM                                                                         ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C, CENTCUST CC,        ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD ');

      SQL.Add('WHERE                                                            ');
      SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (CC.IDEMPRESA(+) = S.IDEMPRESA) AND                          ');
      SQL.Add('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND                ');
      SQL.ADD('    (CC.IDEMPRESA(+)      = S.IDEMPRESA) AND                     ');
      if trim(CmpRptCM.ParamValues[4].asString) <> '' then begin
         SQL.Add(' (CC.CODEXTERNO(+) >= (:CCUSTOINI) AND         ');
         SQL.Add(' (CC.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;

      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add(' (CC.CODEXTERNO(+) <= (:CCUSTOFIM) AND         ');
         SQL.Add(' (CC.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODO) OR (S.PERNUMERO IS NULL)) AND      ');
      SQL.Add('    (C.PLAGRAU <=:GRAU) AND                                      ');
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add(' ((S.UNIDNEGOC(+) =:UNIDNEGOC) AND                            ');
         SQL.Add(' (S.IDPESSOA(+) =:PESSOA)) AND                                ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM))                      ');

      SQL.Add('GROUP BY                                                         ');
      SQL.Add('    C.PLACONTA,                                                  ');
      SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
      SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP                 ');

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      if not CmpRptCM.ParamValues[15].asBoolean then
      begin
         if CmpRptCM.ParamValues[19].asBoolean then
         begin
           SQL.Add('HAVING                                                            ');
           SQL.Add('   (SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)     ');
           SQL.Add('      - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)             ');
           SQL.Add('      - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0))) <> 0   ');
         end
         else
         begin
           SQL.Add('HAVING                                                           ');
           SQL.Add('   (SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)');
           SQL.Add('      - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))) <> 0 ');
         end;

       //  if CmpRptCM.ParamValues[14].asBoolean then
       //  begin
       //     SQL.Add('                                                                                                ');
       //     SQL.Add('  AND (SUM(DECODE(C.PLANATUREZA,''D'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
       //     SQL.Add('       - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))) < 0  OR                            ');
       //     SQL.Add('      SUM(DECODE(C.PLANATUREZA,''C'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
       //     SQL.Add('       - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))) >= 0)                              ');
       //  end;

        if CmpRptCM.ParamValues[14].asBoolean then
        begin
           if CmpRptCM.ParamValues[19].asBoolean then
           begin
             SQL.Add('HAVING                                                           ');
             SQL.Add('  (SUM(DECODE(C.PLANATUREZA,''D'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) < 0   OR                      ');
             SQL.Add('   SUM(DECODE(C.PLANATUREZA,''C'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) >= 0)                           ');
           end
           else
           begin
             SQL.Add('HAVING                                                           ');
             SQL.Add('  (SUM(DECODE(C.PLANATUREZA,''D'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) ) < 0   OR                      ');
             SQL.Add('   SUM(DECODE(C.PLANATUREZA,''C'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))) >= 0)                           ');
           end;
        end;
      end
      else
        if CmpRptCM.ParamValues[14].asBoolean then
        begin
           if CmpRptCM.ParamValues[19].asBoolean then
           begin
             SQL.Add('HAVING                                                           ');
             SQL.Add('  (SUM(DECODE(C.PLANATUREZA,''D'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) < 0   OR                      ');
             SQL.Add('   SUM(DECODE(C.PLANATUREZA,''C'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) >= 0)                           ');
           end
           else
           begin
             SQL.Add('HAVING                                                           ');
             SQL.Add('  (SUM(DECODE(C.PLANATUREZA,''D'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) ) < 0   OR                      ');
             SQL.Add('   SUM(DECODE(C.PLANATUREZA,''C'',DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
             SQL.Add('        - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))) >= 0)                           ');
           end;
        end;
         //Marilza Colpani - Fim
         
      SQL.Add('ORDER BY                                                         ');
      if CmpRptCM.ParamValues[11].asBoolean then begin
         SQL.Add(' C.PLACONCORRESP                                              ');
      end else begin
         SQL.Add(' C.PLACONTA                                                   ');
      end;

      Prepare;

      ParamByName('GRAU').asInteger       := CmpRptCM.ParamValues[7].asInteger;
      ParamByName('PLANO').asInteger      := Modulo.iPlano;
      ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asFloat    := StrToFloat(CmpRptCM.ParamValues[0].asString);
      ParamByName('PERIODO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].asString);
      //
      if trim(CmpRptCM.ParamValues[2].asString) <> '' then begin
         ParamByName('CONTAINI').asString := CmpRptCM.ParamValues[2].asString;
      end else begin
         ParamByName('CONTAINI').asString := '0';
      end;
      //
      if trim(CmpRptCM.ParamValues[3].asString) <> '' then begin
         ParamByName('CONTAFIM').asString := CmpRptCM.ParamValues[3].asString;
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;

      if trim(CmpRptCM.ParamValues[4].asString) <> '' then begin
         ParamByName('CCUSTOINI').asString   := CmpRptCM.ParamValues[4].asString;
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         ParamByName('CCUSTOFIM').asString   := CmpRptCM.ParamValues[5].asString;
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[6].asString);
         ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      Open;

      cdsBalSaldoAtual.First;

      while not cdsBalSaldoAtual.Eof do
      begin
        cdsBalSaldoAtual.Edit;

        if cdsBalSaldoAtual.FieldByName('SALDO').asFloat = 0 then begin
           cdsBalSaldoAtual.FieldByName('DEBCRESALDO').asString := ' ';
        end;

        if cdsBalSaldoAtual.FieldByName('SALDO').asFloat < 0 then begin
           cdsBalSaldoAtual.FieldByName('DEBCRESALDO').asString := 'C';
        end else begin
           cdsBalSaldoAtual.FieldByName('DEBCRESALDO').asString := 'D';
        end;

        //Tira o sinal dos saldos
        cdsBalSaldoAtual.FieldByName('SALDOABS').asFloat    := ABS(cdsBalSaldoAtual.FieldByName('SALDO').asFloat);

        //Indenta o Nome da Conta Contábil de acordo com o grau
        sEspacos := '';

        if CmpRptCM.ParamValues[12].asBoolean then begin
           for i := 1 to ((cdsBalSaldoAtual.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
              sEspacos := sEspacos + ' ';
           end;
        end;

        cdsBalSaldoAtual.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalSaldoAtual.FieldByName('CONTA').asString);

        cdsBalSaldoAtual.Post;
        cdsBalSaldoAtual.Next;
      end;
   end;
   //sqlBalSaldoAtual.SQL.SaveToFile('C:\sqlBalSaldoAtual.txt');
end;

procedure TrptSaldosAtuais.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;

end;

procedure TrptSaldosAtuais.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptSaldosAtuais.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  //Everson Cunha - SIG102043 - ini
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados, False, Sistema.ConnectionType, Sistema.ConnectionSide,
      Sistema.AppRemoteServer, True, Nil, Nil, False);
  //Everson Cunha - SIG102043 - Fim
end;

procedure TrptSaldosAtuais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlContab.Free; //Everson Cunha - SIG102043
end;

end.
