{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: rptBalConsolid.CrmRptCMBeforePrint(
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 28/05/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado
--------------------------------------------------------------------------------}


unit rBalConsolidado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, DBTables, Wwquery, TXRB, uCtrlContab;

type
  TrptBalConsolid = class(TFrmCmReport)
    cdsEmpresa: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    dsBalConsolid: TwwDataSource;
    pplBalConsolid: TppBDEPipeline;
    pplBalConsolidppField1: TppField;
    pplBalConsolidppField2: TppField;
    pplBalConsolidppField3: TppField;
    pplBalConsolidppField4: TppField;
    pplBalConsolidppField5: TppField;
    pplBalConsolidppField6: TppField;
    pplBalConsolidppField7: TppField;
    pplBalConsolidppField8: TppField;
    pplBalConsolidppField9: TppField;
    pplBalConsolidppField10: TppField;
    pplBalConsolidppField11: TppField;
    pplBalConsolidppField12: TppField;
    pplBalConsolidppField13: TppField;
    pplBalConsolidppField14: TppField;
    pplBalConsolidppField15: TppField;
    pplBalConsolidppField16: TppField;
    pplBalConsolidppField17: TppField;
    pplBalConsolidppField18: TppField;
    pplBalConsolidppField19: TppField;
    rptBalConsolid: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLblTituloBalancete: TppLabel;
    ppLine26: TppLine;
    LblEmpresa: TppLabel;
    ppLabel57: TppLabel;
    ppLine27: TppLine;
    ppLabel58: TppLabel;
    txtDebBalC: TppLabel;
    txtCredBalC: TppLabel;
    ppLabel59: TppLabel;
    ppLblTituloBalancete2: TppLabel;
    txtSaldoAntBalC: TppLabel;
    txtMovBalC: TppLabel;
    ppDetailBand3: TppDetailBand;
    dbtxtContaBalC: TppDBText;
    dbtxtNomeContaBalC: TppDBText;
    dbtxtDebBalC: TppDBText;
    dbtxtCredBalC: TppDBText;
    dbtxtSaldoBalC: TppDBText;
    dbtxtSaldoDCBalC: TppDBText;
    dbtxtSaldoAntBalC: TppDBText;
    dbtxtSaldoAntDCBalC: TppDBText;
    ppDBText21: TppDBText;
    dbtxtMovBalC: TppDBText;
    dbtxtMovDCBalC: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine28: TppLine;
    lblsistema: TppLabel;
    rptBalConsolidLabel1: TppLabel;
    lblContBalConsolid: TppLabel;
    ppCalc20: TppSystemVariable;
    lblCalcBalConsolid: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel62: TppLabel;
    ppLine29: TppLine;
    cdsBalConsolid: TCMClientDataSet;
    sqlBalConsolid: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforeGenerate(Sender: TObject);
    procedure ppFooterBand10BeforePrint(Sender: TObject);
    procedure ppHeaderBand10BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    sTitulo,sMascara,sEspacos :string;
    sSintAnal : String;
    iNumero,iPagIni,iNumColunas:Integer;
    bEspaco :Boolean;
    sPeriodoInicial, sPeriodoFinal :string;
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlContab       : TCtrlContab;

  public
    { Public declarations }
  end;

var
  rptBalConsolid: TrptBalConsolid;

implementation

uses UMensErro, uDatabase, DBaseDados, uCtrlParamIntegra,uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TrptBalConsolid.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[9].SpinEditSettings.Value := 1;

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



   CmpRptCM.ParamValues[3].SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);
   CmpRptCM.ParamValues[3].SpinEditSettings.Value    := FuncaoGeral.CalcGrauMax(ParamIntegra.MascaraPlano);

end;

procedure TrptBalConsolid.CrmRptCMBeforePrint(Sender: TObject);
var i :Integer;
begin
  inherited;
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
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
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
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlTitulos.Open;

   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;

   //=====================================================================


   If CmpRptCM.ParamValues[11].asString = '' then begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
         ParamByName('PERNUMEROINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
         ParamByName('PERNUMEROFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Consolidado - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete Consolidado - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Consolidado Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete Consolidado Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      End;

      //Imprime os títulos
      pplblTituloBalancete.caption := sTitulo;

      sTitulo := '';
      pplblTituloBalancete2.caption := sTitulo;
   end else begin
      pplblTituloBalancete.caption  := CmpRptCM.ParamValues[11].asString;
      pplblTituloBalancete2.caption := CmpRptCM.ParamValues[12].asString;
   end;

   iNumColunas := CmpRptCM.ParamValues[8].asInteger + 3;
   iPagIni     := CmpRptCM.ParamValues[9].asInteger;
   iNumero     := FuncaoGeral.CalcNumEleGrau(modulo.sMascaraContas, 1);
   sSintAnal   := 'A';


   //Configura a quebra de página
   if CmpRptCM.ParamValues[5].asBoolean then begin
      rptBalConsolid.Groups[0].NewPage := true;
   end else begin
      rptBalConsolid.Groups[0].NewPage := false;
   end;

   //Faz a query
   with sqlBalConsolid do begin
      SQL.Clear;
      SQL.Add('SELECT  /*+ RULE */                                                  ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,      ');
      SQL.Add('   S.DEB,                                                        ');
      SQL.Add('   S.CRED,                                                       ');
      SQL.Add('   S.DEBA,                                                       ');
      SQL.Add('   S.CREDA,                                                      ');
      SQL.Add('   S.MOV,                                                        ');
      SQL.Add('   SA.SALDOANT, SS.SALDO,                                        ');
      SQL.Add('   DECODE(S.MOV, 0, '' '', DECODE(SIGN(S.MOV),                   ');
      SQL.Add('   -1, ''C'', ''D'' )) AS MOVDC,                                 ');
      SQL.Add('   DECODE(SS.SALDO, 0, '' '', DECODE(SIGN(SS.SALDO),             ');
      SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                           ');
      SQL.Add('   DECODE(SA.SALDOANT, 0, '' '', DECODE(SIGN(SA.SALDOANT),       ');
      SQL.Add('   -1, ''C'', ''D'' )) AS DEBCREANT,                             ');
      SQL.Add('   ABS(SA.SALDOANT) as SALDOANTABS, ABS(SS.SALDO) as SALDOABS,   ');
      SQL.Add('   ABS(S.MOV) AS MOVABS');
      SQL.Add('FROM                                                             ');
      SQL.Add('    PLANOCONTA C,                                                ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD, ');

      SQL.Add('   (SELECT PLACONTA,                                             ');
      SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
      SQL.Add('    FROM PLANOSALDO                                           ');
      SQL.Add('    WHERE                                                     ');
      SQL.Add('       (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].asFloat) + ') AND         ');
      SQL.Add('       ((PERNUMERO <' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])+ ') OR (PERNUMERO IS NULL)) AND  ');
      SQL.Add('       (IDPESSOA IN (' + trim(CmpRptCM.ParamValues[10].asString) + '))            ');
      SQL.Add('    GROUP BY PLACONTA ) SA,                                              ');
      SQL.Add('   (SELECT PLACONTA,                                                     ');

      //Marilza Colpani 28/05/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
      //SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
      //SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
      //SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
      if CmpRptCM.ParamValues[13].AsBoolean then
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
        SQL.Add('       SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR,0), 0)) AS DEBA, ');
        SQL.Add('       SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR-NVL(PLSCREDITOENCERR,0),    0)) AS CREDA, ');
      end
      else
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');
        SQL.Add('       SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
        SQL.Add('       SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');
      SQL.Add('    FROM PLANOSALDO                                           ');
      SQL.Add('    WHERE                                                     ');
      SQL.Add('       (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].asFloat) + ') AND         ');
      SQL.Add('       (PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])
              + ' AND ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])+ ') AND  ');
      SQL.Add('       (IDPESSOA IN (' + trim(CmpRptCM.ParamValues[10].asString) + '))                ');
      SQL.Add('    GROUP BY PLACONTA ) S,                                    ');
      SQL.Add('   (SELECT PLACONTA,                                          ');

      //Marilza Colpani 28/05/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)  ');
      //SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
      if CmpRptCM.ParamValues[13].AsBoolean then
      begin
        SQL.Add('    SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('      - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR) ');
        SQL.Add('      - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('     SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)  ');
        SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('    FROM PLANOSALDO                                           ');
      SQL.Add('    WHERE                                                     ');
      SQL.Add('          (PEREXERCICIO =' + FloatToStr(CmpRptCM.ParamValues[0].asFloat) + ') AND      ');
      SQL.Add('          ((PERNUMERO <=' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])
              + ') OR (PERNUMERO IS NULL)) AND ');
      SQL.Add('       (IDPESSOA IN (' + trim(CmpRptCM.ParamValues[10].asString) + '))                ');
      SQL.Add('    GROUP BY PLACONTA ) SS                                    ');
      SQL.Add('                                                              ');
      SQL.Add('WHERE                                                         ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
      SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
      SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
      SQL.Add('    (C.PLAGRAU <= ' + IntToStr(CmpRptCM.ParamValues[3].asInteger) + ') AND        ');
      SQL.Add('    (C.PLANO =' + IntToStr(Modulo.iPlano) + ')            ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
      SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
      SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
      SQL.Add('    S.DEB,                                                       ');
      SQL.Add('    S.CRED,                                                      ');
      SQL.Add('    S.DEBA,                                                      ');
      SQL.Add('    S.CREDA,                                                     ');
      SQL.Add('    S.MOV                                                        ');
      SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
      SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
      SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
      SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
      SQL.Add('ORDER BY                                                         ');
      SQL.Add(' C.PLACONTA                                                      ');

      CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime));  //Everson Cunha - SIG102043

      //
      sMascara := '';
      if CmpRptCM.ParamValues[4].asBoolean then begin
         //sMascara := modulo.sMascaraContas;     //Everson Cunha - SIG102043
         sMascara := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
      end;

      Open;

      cdsBalConsolid.First;
      while not cdsBalConsolid.Eof do
      begin

         cdsBalConsolid.Edit;
         if cdsBalConsolid.FieldByName('MOV').asFloat = 0 then begin
            cdsBalConsolid.FieldByName('MOVDC').asString := ' ';
         end;
         if cdsBalConsolid.FieldByName('MOV').asFloat < 0 then begin
            cdsBalConsolid.FieldByName('MOVDC').asString := 'C';
         end else begin
            cdsBalConsolid.FieldByName('MOVDC').asString := 'D';
         end;

         if cdsBalConsolid.FieldByName('SALDO').asFloat = 0 then begin
            cdsBalConsolid.FieldByName('DEBCRESALDO').asString := ' ';
         end;
         if cdsBalConsolid.FieldByName('SALDO').asFloat < 0 then begin
            cdsBalConsolid.FieldByName('DEBCRESALDO').asString := 'C';
         end else begin
            cdsBalConsolid.FieldByName('DEBCRESALDO').asString := 'D';
         end;

         if cdsBalConsolid.FieldByName('SALDOANT').asFloat = 0 then begin
            cdsBalConsolid.FieldByName('DEBCREANT').asString := ' ';
         end;
         if cdsBalConsolid.FieldByName('SALDOANT').asFloat < 0 then begin
            cdsBalConsolid.FieldByName('DEBCREANT').asString := 'C';
         end else begin
            cdsBalConsolid.FieldByName('DEBCREANT').asString := 'D';
         end;

         //Tira o sinal dos saldos
         cdsBalConsolid.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalConsolid.FieldByName('SALDOANT').asFloat);
         cdsBalConsolid.FieldByName('SALDOABS').asFloat    := ABS(cdsBalConsolid.FieldByName('SALDO').asFloat);
         cdsBalConsolid.FieldByName('MOVABS').asFloat      := ABS(cdsBalConsolid.FieldByName('MOV').asFloat);

         //Indenta o Nome da Conta Contábil de acordo com o grau
         sEspacos := '';

         if CmpRptCM.ParamValues[7].asBoolean then begin
            for i := 1 to ((cdsBalConsolid.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
               sEspacos := sEspacos + ' ';
            end;
         end;

         cdsBalConsolid.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalConsolid.FieldByName('PLANOME').asString);

         cdsBalConsolid.Post;
         cdsBalConsolid.Next;

      end;
   end;
   //sqlBalConsolid.SQL.SaveToFile ('C:\BalanceteConsolidado');//Marilza
end;

procedure TrptBalConsolid.ppDetailBand3BeforeGenerate(Sender: TObject);
begin
  inherited;
   //Controla a altura da banda
   if bEspaco then begin
      if (sSintAnal = 'S') or (cdsBalConsolid.FieldByName('PLATIPO').asString = 'S') then begin
         ppDetailBand3.Height   := 23;
         dbtxtContaBalC.top      := 9;
         dbtxtNomeContaBalC.top  := 9;
         dbtxtSaldoAntBalC.top   := 9;
         dbtxtSaldoAntDCBalC.top := 9;
         dbtxtDebBalC.Top        := 9;
         dbtxtCredBalC.Top       := 9;
         dbtxtMovBalC.Top        := 9;
         dbtxtMovDCBalC.Top      := 9;
         dbtxtSaldoBalC.Top      := 9;
         dbtxtSaldoDCBalC.Top    := 9;
      end else begin
         ppDetailBand3.Height   := 16;
         dbtxtContaBalC.top      := 2;
         dbtxtNomeContaBalC.top  := 2;
         dbtxtSaldoAntBalC.top   := 2;
         dbtxtSaldoAntDCBalC.top := 2;
         dbtxtDebBalC.Top        := 2;
         dbtxtCredBalC.Top       := 2;
         dbtxtMovBalC.Top        := 2;
         dbtxtMovDCBalC.Top      := 2;
         dbtxtSaldoBalC.Top      := 2;
         dbtxtSaldoDCBalC.Top    := 2;
      end;
      sSintAnal := cdsBalConsolid.FieldByName('PLATIPO').asString;
   end else begin
      ppDetailBand3.Height   := 16;
      dbtxtContaBalC.top      := 2;
      dbtxtNomeContaBalc.top  := 2;
      dbtxtSaldoAntBalC.top   := 2;
      dbtxtSaldoAntDCBalC.top := 2;
      dbtxtDebBalC.Top        := 2;
      dbtxtCredBalC.Top       := 2;
      dbtxtMovBalC.Top        := 2;
      dbtxtMovDCBalC.Top      := 2;
      dbtxtSaldoBalC.Top      := 2;
      dbtxtSaldoDCBalC.Top    := 2;
   end;

   //Configura a máscara das contas contábeis
   if sMascara <> '' then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalConsolid.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalConsolid.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBalC.DisplayFormat := sMascara + ';0; ';
   end;


end;

procedure TrptBalConsolid.ppFooterBand10BeforePrint(Sender: TObject);
begin
  inherited;
   lblContBalConsolid.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalConsolid.text)) - 1);

end;

procedure TrptBalConsolid.ppHeaderBand10BeforePrint(Sender: TObject);
begin
  inherited;
   case iNumColunas of
      3: begin
            dbtxtSaldoAntBalC.left   := 556;
            dbtxtSaldoAntDCBalC.left := 659;
            dbtxtMovBalC.left        := 770;
            dbtxtMovDCBalC.left      := 868;
            dbtxtDebBalC.visible     := false;
            dbtxtCredBalC.visible    := false;
            dbtxtMovBalC.visible     := true;
            dbtxtMovDCBalC.visible   := true;

            txtSaldoAntBalC.left   := 577;
            txtMovBalC.left        := 800;
            txtDebBalC.visible     := false;
            txtCredBalC.visible    := false;
            txtMovBalC.visible     := true;
         end;
      4: begin
            dbtxtSaldoAntBalC.left   := 556;
            dbtxtSaldoAntDCBalC.left := 659;
            dbtxtDebBalC.left        := 687;
            dbtxtCredBalC.left       := 813;
            dbtxtDebBalC.visible     := true;
            dbtxtCredBalC.visible    := true;
            dbtxtMovBalC.visible     := false;
            dbtxtMovDCBalC.visible   := false;

            txtSaldoAntBalC.left   := 579;
            txtDebBalC.left        := 750;
            txtCredBalC.left       := 868;
            txtDebBalC.visible     := true;
            txtCredBalC.visible    := true;
            txtMovBalC.visible     := false;
         end;
      5: begin
            dbtxtSaldoAntBalC.left   := 500;
            dbtxtSaldoAntDCBalC.left := 603;
            dbtxtMovBalC.left        := 833;
            dbtxtMovDCBalC.left      := 928;
            dbtxtDebBalC.left        := 612;
            dbtxtCredBalC.left       := 714;
            dbtxtDebBalC.visible     := true;
            dbtxtCredBalC.visible    := true;
            dbtxtMovBalC.visible     := true;
            dbtxtMovDCBalC.visible   := true;

            txtSaldoAntBalC.left   := 521;
            txtMovBalC.left        := 864;
            txtDebBalC.left        := 675;
            txtCredBalC.left       := 770;
            txtDebBalC.visible     := true;
            txtCredBalC.visible    := true;
            txtMovBalC.visible     := true;
         end;
   end;

end;

procedure TrptBalConsolid.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  //Everson Cunha - SIG102043 - Ini
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
  //Everson Cunha - SIG102043 - Fim

end;

procedure TrptBalConsolid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptBalancete.free;
  CtrlContab.Free; //Everson Cunha - SIG102043
end;

end.
