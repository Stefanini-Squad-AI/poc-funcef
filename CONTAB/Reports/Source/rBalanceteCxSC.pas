{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteCxSC.CrmRptCMBeforePrint
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 01/06/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado
--------------------------------------------------------------------------------}

unit rBalanceteCxSC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, uCtrlContab,ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, TXRB;

type
  TrptBalanceteCxSC = class(TFrmCmReport)
    dsBalCxSC: TwwDataSource;
    pplBalCxSC: TppBDEPipeline;
    pplBalCxSCppField1: TppField;
    pplBalCxSCppField2: TppField;
    pplBalCxSCppField3: TppField;
    pplBalCxSCppField4: TppField;
    pplBalCxSCppField5: TppField;
    pplBalCxSCppField6: TppField;
    pplBalCxSCppField7: TppField;
    pplBalCxSCppField8: TppField;
    pplBalCxSCppField9: TppField;
    pplBalCxSCppField10: TppField;
    pplBalCxSCppField11: TppField;
    pplBalCxSCppField12: TppField;
    pplBalCxSCppField14: TppField;
    pplBalCxSCppField15: TppField;
    pplBalCxSCppField16: TppField;
    pplBalCxSCppField17: TppField;
    pplBalCxSCppField18: TppField;
    pplBalCxSCppField19: TppField;
    pplBalCxSCppField20: TppField;
    pplBalCxSCppField21: TppField;
    pplBalCxSCppField22: TppField;
    pplBalCxSCppField23: TppField;
    rptBalCxSC: TppReport;
    ppHeaderBand4: TppHeaderBand;
    pplblTituloBalCxSC: TppLabel;
    ppLine9: TppLine;
    LblEmpresa: TppLabel;
    ppLine11: TppLine;
    ppLabel20: TppLabel;
    pplblTituloBalCxSC2: TppLabel;
    ppLabel28: TppLabel;
    rptBalCxSCLabel2: TppLabel;
    txtMovBalCxSC: TppLabel;
    txtCredBalCxSC: TppLabel;
    txtDebBalCxSC: TppLabel;
    txtSaldoAntBalCxSC: TppLabel;
    bndDetBalCxSC: TppDetailBand;
    rptBalCxSCDBText2: TppDBText;
    dbtxtContaBalCxSC: TppDBText;
    ppDBText32: TppDBText;
    dbtxtNomeContaBalCxSC: TppDBText;
    rptBalCxSCDBText1: TppDBText;
    rptBalCxSCDBText3: TppDBText;
    rptBalCxSCDBText4: TppDBText;
    dbtxtMovDCBalCxSC: TppDBText;
    dbtxtMovBalCxSC: TppDBText;
    dbtxtCredBalCxSC: TppDBText;
    dbtxtDebBalCxSC: TppDBText;
    dbtxtSaldoAntBalCxSC: TppDBText;
    dbtxtSaldoAntDCBalCxSC: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine13: TppLine;
    lblsistema: TppLabel;
    rptBalCxSCLabel1: TppLabel;
    lblContBalCxSC: TppLabel;
    ppCalc4: TppSystemVariable;
    lblCalcBalCxSC: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    cdsBalCxSC: TCMClientDataSet;
    sqlBalCxSC: TCMSqlParams;
    sqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    pplBalCxSCppField13: TppField;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure bndDetBalCxSCBeforeGenerate(Sender: TObject);
    procedure ppFooterBand4BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppHeaderBand4BeforePrint(Sender: TObject);
  private
    sTitulo, sMascaraPlano,sMascaraCCusto,sMascara,sEspacos,sOrdenacao :string;
    iPagIni,iNumColunas,iPlano,iNumero:Integer;
    CtrlContab       : TCtrlContab;

    sPeriodoInicial, sPeriodoFinal   :string;
    CtrlRptBalancete :TCtrlRptBalancete;

  public
    { Public declarations }
  end;

var
  rptBalanceteCxSC: TrptBalanceteCxSC;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra,FSM_FxLib;

{$R *.DFM}

procedure TrptBalanceteCxSC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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

   CmpRptCM.ParamValues[9].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODSUBCONTA, '+
                                                    '   NOMESUBCONTA '+
                                                    'FROM '+
                                                    '   SUBCONTA '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOMESUBCONTA';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODSUBCONTA, '+
                                                    '   NOMESUBCONTA '+
                                                    'FROM '+
                                                    '   SUBCONTA '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOMESUBCONTA';

end;

procedure TrptBalanceteCxSC.CrmRptCMBeforePrint(Sender: TObject);
var i:integer;
begin
  inherited;
   iPlano := 0;

    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sOrdenacao := CtrlContab.OrdenaSubconta;
    end else
    begin
       sOrdenacao := '';
    end;

   sPeriodoInicial := '';
   sPeriodoFinal   := '';
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
   sqlTitulos.ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[1].AsInteger;
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;

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
   sqlTitulos.ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := CmpRptCM.ParamValues[2].AsInteger;
   sqlTitulos.Open;

   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;
   //==================================================================
   // Pega o Plano vigente
   //==================================================================
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := CtrlContab.PlanoParam;

   sMascaraPlano := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
   //==================================================================


   If CmpRptCM.ParamValues[18].asString = '' then begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
         ParamByName('PERNUMEROINI').asInteger := CmpRptCM.ParamValues[1].asInteger;
         ParamByName('PERNUMEROFIM').asInteger := CmpRptCM.ParamValues[2].asInteger;
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete de Contas x Sub-Contas - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete de Contas x Sub-Contas - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete de Contas x Sub-Contas Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete de Contas x Sub-Contas Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      End;

      //Imprime os títulos
      pplblTituloBalCxSC.caption := sTitulo;
      iNumColunas := CmpRptCM.ParamValues[10].AsInteger + 3;

      sTitulo := '';
      if trim(CmpRptCM.ParamValues[3].asString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Inicial : ' + CmpRptCM.ParamValues[3].asString;
      end;
      if trim(CmpRptCM.ParamValues[4].asString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Final : ' + CmpRptCM.ParamValues[4].asString;
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + CmpRptCM.ParamValues[5].AsString;
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + CmpRptCM.ParamValues[6].AsString;
      end;
      if trim(CmpRptCM.ParamValues[9].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + CmpRptCM.ParamValues[7].AsString;
      end;

      pplblTituloBalCxSC2.caption := sTitulo;
   end else begin
      pplblTituloBalCxSC.caption  := CmpRptCM.ParamValues[18].AsString;
      pplblTituloBalCxSC2.caption := CmpRptCM.ParamValues[19].AsString;
   end;


   //Configura a quebra de página
   if CmpRptCM.ParamValues[11].AsBoolean then begin
      rptBalCxSC.Groups[0].NewPage := true;
   end else begin
      rptBalCxSC.Groups[0].NewPage := false;
   end;

   iNumero := FuncaoGeral.CalcNumEleGrau(CtrlContab.MascaraContaParam, 1);

   iPagIni := StrToInt(CmpRptCM.ParamValues[17].AsString);

   with sqlBalCxSC do begin
      SQL.Clear;
      SQL.Add('SELECT /*+ RULE */                                               ');
      SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP,            ');
      SQL.Add('   U.PLANATUREZA, U.CODSUBCONTA, U.NOMESUBCONTA,                 ');
      SQL.Add('   U.GRAU, U.CONTA, U.PLANOMEOUTLING, U.PLANOME,                 ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   ('' '') AS DEBCREANT, ('' '') AS DEBCRESALDO, (0) AS SALDOABS, (0) AS SALDOANTABS,  ');
      SQL.Add('   (0) AS MOVABS, ('' '') AS MOVDC,                              ');
      //Iferreira p 27309
      SQL.Add('   NVL(U.DEB,0) AS DEB, NVL(U.CRED,0) AS CRED, NVL(U.MOV,0) AS MOV,  ');
      SQL.Add('   NVL(U.SALDOANT,0) AS SALDOANT, NVL(U.SALDO,0) AS SALDO FROM ( ');
      SQL.Add('SELECT                                                           ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   C.PLANATUREZA, (0) AS CODSUBCONTA,                            ');
      SQL.Add('   ('' '') AS NOMESUBCONTA,                                      ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[13].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      end;

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('   SUM(S.PLSDEBITOCORRENTE) AS DEB,                              ');
      //SQL.Add('   SUM(S.PLSCREDITOCOR) AS CRED,                                 ');
      if CmpRptCM.ParamValues[21].AsBoolean then
      begin
        SQL.Add('   SUM(S.PLSDEBITOCORRENTE-NVL(S.PLSDEBITOENCERR, 0)) AS DEB,     ');
        SQL.Add('   SUM(S.PLSCREDITOCOR-NVL(S.PLSCREDITOENCERR, 0)) AS CRED,       ');
      end
      else
      begin
        SQL.Add('   SUM(S.PLSDEBITOCORRENTE) AS DEB,                           ');
        SQL.Add('   SUM(S.PLSCREDITOCOR) AS CRED,                              ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('   (SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)) AS MOV,     ');
      SQL.Add('   SA.SALDOANT, SS.SALDO                                         ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C,                                   ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD, ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)      ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA >=:SCONTAINI) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA <=:SCONTAFIM) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA ) SA,                                      ');
      SQL.Add('                                                                 ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('        PLACONTA,                                                ');

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)   ');
      //SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO ');
      if CmpRptCM.ParamValues[21].AsBoolean then
      begin
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)  ');
        SQL.Add('         - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)          ');
        SQL.Add('         - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDO  ');
      end
      else
      begin
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)   ');
        SQL.Add('         - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim
      
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <=:PERIODOFIM) OR (PERNUMERO IS NULL)) AND ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA >=:SCONTAINI) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA <=:SCONTAFIM) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA ) SS                                       ');
      SQL.Add('WHERE                                                            ');

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) =:UNIDNEGOC) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.CODSUBCONTA(+) >=:SCONTAINI) AND                          ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.CODSUBCONTA(+) <=:SCONTAFIM) AND                          ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                  ');
      SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');
      SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                            ');

      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                            ');

      SQL.Add('    (C.PLANO        = :PLANO) AND                                ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
      SQL.Add('    (S.PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND     ');
      //Iferreira 27312
      if CmpRptCM.ParamValues[20].AsBoolean then
        SQL.Add('    (C.PLASECRETARIA = ''S'') AND                              ');

      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA)                                   ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANATUREZA, C.PLANOMEOUTLING,                   ');
      SQL.Add('   SA.SALDOANT, SS.SALDO                                         ');
      SQL.Add('HAVING ((DECODE(SUM(S.PLSDEBITOCORRENTE),NULL,                       ');
      SQL.Add('(DECODE(SUM(S.PLSCREDITOCOR),NULL,                                  ');
      SQL.Add('(DECODE(SS.SALDO,NULL,                                                 ');
      SQL.Add('(DECODE(SA.SALDOANT,NULL,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') AND   ');
      SQL.Add('       ((DECODE(SUM(S.PLSDEBITOCORRENTE),0, ');
      SQL.Add('       (DECODE(SUM(S.PLSCREDITOCOR),0,      ');
      SQL.Add('       (DECODE(SS.SALDO,0,                  ');
      SQL.Add('       (DECODE(SA.SALDOANT,0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
      SQL.Add('UNION ALL                                                        ');

      SQL.Add('SELECT                                                           ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   C.PLANATUREZA, S.CODSUBCONTA, SC.NOMESUBCONTA,                ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[13].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      end;
      //Iferreira p 27309
      SQL.Add('   NVL(M.DEB,0) AS DEB, NVL(M.CRED,0) AS CRED, NVL(M.MOV,0) AS MOV, ');
      SQL.Add('   NVL(SA.SALDOANT,0) AS SALDOANT,                               ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
      SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, SUBCONTA SC, PLANOCONTA C,                      ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD, ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('    PLACONTA,                                                     ');
      SQL.Add('    CODSUBCONTA,SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)    ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA >=:SCONTAINI) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA <=:SCONTAFIM) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA,CODSUBCONTA ) SA,                          ');
      SQL.Add('   (SELECT PLACONTA,CODSUBCONTA,                                 ');

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                            ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                               ');
      if CmpRptCM.ParamValues[21].AsBoolean then
      begin
        SQL.Add('      SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('      SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED,   ');
      end
      else
      begin
       SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                         ');
       SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                            ');
      end;
      //Marilza Colpani - Fim
      
      SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV      ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA >=:SCONTAINI) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       ((CODSUBCONTA <=:SCONTAFIM) AND                        ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA ) M                           ');
      SQL.Add('WHERE                                                            ');

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) =:UNIDNEGOC) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.CODSUBCONTA(+) >=:SCONTAINI) AND                          ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.CODSUBCONTA(+) <=:SCONTAFIM) AND                          ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                  ');
      if CmpRptCM.ParamValues[16].asBoolean  then begin
         SQL.Add('    (C.PLATIPO  = ''A'') AND                                  ');
      end;
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                            ');

      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND                         ');
      SQL.Add('    (SA.CODSUBCONTA(+) = S.CODSUBCONTA) AND                      ');
      SQL.Add('    (M.PLACONTA(+)     = S.PLACONTA) AND                         ');
      SQL.Add('    (M.CODSUBCONTA(+)  = S.CODSUBCONTA) AND                      ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND   ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    (SC.CODSUBCONTA = S.CODSUBCONTA) AND                         ');
      SQL.Add('    (SC.IDPESSOA = S.IDPESSOA) AND                               ');
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                                ');
      //Iferreira 27312
      if CmpRptCM.ParamValues[20].AsBoolean then
        SQL.Add('    (C.PLASECRETARIA = ''S'') AND                              ');
      SQL.Add('    (S.PLANO = C.PLANO)                                          ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   S.CODSUBCONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), SC.NOMESUBCONTA, C.PLANATUREZA,     ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,                         ');
      SQL.Add('   SA.SALDOANT                                                   ');
      SQL.Add('HAVING ((DECODE(M.DEB,NULL,                                                        ');
      SQL.Add('       (DECODE(M.CRED,NULL,                                                        ');
      SQL.Add('       (DECODE(SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)       ');
      SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)),NULL,                      ');
      SQL.Add('       (DECODE(SA.SALDOANT,NULL,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') AND ');
      SQL.Add('       ((DECODE(M.DEB,0,                                                           ');
      SQL.Add('       (DECODE(M.CRED,0,                                                           ');
      SQL.Add('       (DECODE(SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)       ');
      SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)),0,                         ');
      SQL.Add('       (DECODE(SA.SALDOANT,0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'')) U     ');

      SQL.Add('WHERE ((U.DEB <> 0) OR (U.CRED <> 0) OR (U.SALDOANT <> 0))       ');
      if CmpRptCM.ParamValues[15].AsBoolean then begin
         SQL.Add(' AND (((U.PLANATUREZA = ''D'') AND (U.SALDO < 0)) OR          ');
         SQL.Add('      ((U.PLANATUREZA = ''C'') AND (U.SALDO >= 0)))           ');
      end;
      SQL.Add('ORDER BY U.PLACONTA,                                             ');
      if sOrdenacao = 'C' then begin
         SQL.Add('U.CODSUBCONTA');
      end else begin
         SQL.Add('U.NOMESUBCONTA');
      end;

      Prepare;

      ParamByName('PLANO').asInteger      := iPlano;
      ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asFloat    := CmpRptCM.ParamValues[0].AsFloat;
      ParamByName('PERIODOINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
      ParamByName('PERIODOFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
      //
      if trim(CmpRptCM.ParamValues[3].asString) <> '' then begin
         ParamByName('CONTAINI').asString := trim(CmpRptCM.ParamValues[3].asString);
      end else begin
         ParamByName('CONTAINI').asString := '0';
      end;
      //
      if trim(CmpRptCM.ParamValues[4].asString) <> '' then begin
         ParamByName('CONTAFIM').asString := trim(CmpRptCM.ParamValues[4].asString);
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;


      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         ParamByName('SCONTAINI').asInteger := StrToInt(CmpRptCM.ParamValues[7].asString);
      end;

      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         ParamByName('SCONTAFIM').asInteger := StrToInt(CmpRptCM.ParamValues[8].asString);
      end;

      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         ParamByName('CCUSTOINI').asString   := trim(CmpRptCM.ParamValues[5].asString);
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         ParamByName('CCUSTOFIM').asString   := trim(CmpRptCM.ParamValues[6].asString);
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[9].asString) <> '' then begin
         ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[9].asString);
      end;

      sMascara       := '';
      sMascaraCCusto := '';
      if CmpRptCM.ParamValues[14].AsBoolean then begin
         sMascara       := sMascaraPlano;
         sMascaraCCusto := modulo.sMascaraCCusto;
      end;
     //sql.SaveToFile('c:\temp\balcsc.sql');
     // sqlBalCxSC.SQL.SaveToFile('C:\BalanceteContasSubContas.txt');
     Open;

     cdsBalCxSC.First;
     while not cdsBalCxSC.Eof do
     begin
        cdsBalCxSC.Edit;

        if cdsBalCxSC.FieldByName('MOV').asFloat = 0 then begin
           cdsBalCxSC.FieldByName('MOVDC').asString := ' ';
        end;
        if cdsBalCxSC.FieldByName('MOV').asFloat < 0 then begin
           cdsBalCxSC.FieldByName('MOVDC').asString := 'C';
        end else begin
           cdsBalCxSC.FieldByName('MOVDC').asString := 'D';
        end;

        //Gera a label de débito/crédito
        if cdsBalCxSC.FieldByName('SALDO').asFloat = 0 then begin
           cdsBalCxSC.FieldByName('DEBCRESALDO').asString := ' ';
        end;
        if cdsBalCxSC.FieldByName('SALDO').asFloat < 0 then begin
           cdsBalCxSC.FieldByName('DEBCRESALDO').asString := 'C';
        end else begin
           cdsBalCxSC.FieldByName('DEBCRESALDO').asString := 'D';
        end;

        if cdsBalCxSC.FieldByName('SALDOANT').asFloat = 0 then begin
           cdsBalCxSC.FieldByName('DEBCREANT').asString := ' ';
        end;
        if cdsBalCxSC.FieldByName('SALDOANT').asFloat < 0 then begin
           cdsBalCxSC.FieldByName('DEBCREANT').asString := 'C';
        end else begin
           cdsBalCxSC.FieldByName('DEBCREANT').asString := 'D';
        end;

        //Tira o sinal dos saldos
        cdsBalCxSC.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalCxSC.FieldByName('SALDOANT').asFloat);
        cdsBalCxSC.FieldByName('SALDOABS').asFloat    := ABS(cdsBalCxSC.FieldByName('SALDO').asFloat);
        cdsBalCxSC.FieldByName('MOVABS').asFloat      := ABS(cdsBalCxSC.FieldByName('MOV').asFloat);

        //Indenta o Nome da Conta Contábil de acordo com o grau
        sEspacos := '';

        if CmpRptCM.ParamValues[12].AsBoolean then begin
           for i := 1 to ((cdsBalCxSC.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
              sEspacos := sEspacos + ' ';
           end;
        end;

        cdsBalCxSC.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalCxSC.FieldByName('CONTA').asString);

        cdsBalCxSC.Post;
        cdsBalCxSC.Next;
     End;

   End;
   //sqlBalCxSC.SQL.SaveToFile('C:\BalanceteContasSubContas.txt');


end;

procedure TrptBalanceteCxSC.bndDetBalCxSCBeforeGenerate(Sender: TObject);
begin
  inherited;

   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalCxSC.FieldByName('PLAGRAU').asInteger);      //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalCxSC.FieldByName('PLAGRAU').asInteger);  //Everson Cunha - SIG102043
      dbtxtContaBalCxSC.DisplayFormat := sMascara + ';0; ';
   end;

end;

procedure TrptBalanceteCxSC.ppFooterBand4BeforePrint(Sender: TObject);
begin
  inherited;
   lblContBalCxSC.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalCxSC.text)) - 1);

end;

procedure TrptBalanceteCxSC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptBalanceteCxSC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlRptBalancete.free;
end;

procedure TrptBalanceteCxSC.ppHeaderBand4BeforePrint(Sender: TObject);
begin
  inherited;
   case iNumColunas of
      3: begin
            dbtxtSaldoAntBalCxSC.left   := 510;
            dbtxtSaldoAntDCBalCxSC.left := 613;

            dbtxtMovBalCxSC.left        := 770;
            dbtxtMovDCBalCxSC.left      := 865;

            dbtxtDebBalCxSC.visible     := false;
            dbtxtCredBalCxSC.visible    := false;
            dbtxtMovBalCxSC.visible     := true;
            dbtxtMovDCBalCxSC.visible   := true;

            txtSaldoAntBalCxSC.left   := 531;

            txtMovBalCxSC.left        := 800;
            txtDebBalCxSC.visible     := false;
            txtCredBalCxSC.visible    := false;
            txtMovBalCxSC.visible     := true;
         end;
      4: begin
            dbtxtMovBalCxSC.visible     := false;
            dbtxtMovDCBalCxSC.visible   := false;
            txtMovBalCxSC.visible       := false;

            txtSaldoAntBalCxSC.left     := 577;
            dbtxtSaldoAntBalCxSC.left   := 556;
            dbtxtSaldoAntDCBalCxSC.left := 659;

            txtDebBalCxSC.left          := 734;
            dbtxtDebBalCxSC.left        := 673;
            dbtxtDebBalCxSC.visible     := true;
            txtDebBalCxSC.visible       := true;

            dbtxtCredBalCxSC.visible    := true;
            dbtxtCredBalCxSC.left       := 800;
            txtCredBalCxSC.left         := 856;
            txtCredBalCxSC.visible      := true;

         end;
      5: begin
            dbtxtSaldoAntBalCxSC.left   := 500;
            dbtxtSaldoAntDCBalCxSC.left := 603;
            dbtxtMovBalCxSC.left        := 832;
            dbtxtMovDCBalCxSC.left      := 926;
            dbtxtDebBalCxSC.left        := 609;
            dbtxtCredBalCxSC.left       := 715;
            dbtxtDebBalCxSC.visible     := true;
            dbtxtCredBalCxSC.visible    := true;
            dbtxtMovBalCxSC.visible     := true;
            dbtxtMovDCBalCxSC.visible   := true;

            txtSaldoAntBalCxSC.left   := 521;
            txtMovBalCxSC.left        := 861;
            txtDebBalCxSC.left        := 671;
            txtCredBalCxSC.left       := 770;
            txtDebBalCxSC.visible     := true;
            txtCredBalCxSC.visible    := true;
            txtMovBalCxSC.visible     := true;
         end;
   end;

end;

end.
