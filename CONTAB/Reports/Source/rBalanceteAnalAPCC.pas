{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteAnalAPCC.CrmRptCMBeforePrint
 N. Sol's........: 134710
 N. Kintana's....: 796664
 Data............: 28/04/2010
 Responsável.....: Fábio Henrique Beccaria Sampaio
 Descrição.......: Correção para obter o Plano correspondente a data inicial
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteAnalAPCC.CrmRptCMBeforePrint
 N. Sol's........: 108683 - 117858
 N. Kintana's....: 495605 - 563464
 Data............: 16/06/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado e
                  acerto deste relatório.
--------------------------------------------------------------------------------}

unit rBalanceteAnalAPCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, TXRB, uCtrlContab;

type
  TrptBalanceteAnalAPCC = class(TFrmCmReport)
    dsBalAnalAPCC: TwwDataSource;
    pplBalAnalAPCC: TppBDEPipeline;
    rptBalAnalAPCC: TppReport;
    ppHeaderBand12: TppHeaderBand;
    pplblTituloBalAnalAPCC: TppLabel;
    rptBalAnalAPCCLine1: TppLine;
    rptBalAnalAPCCLine2: TppLine;
    rptBalAnalAPCCLabel2: TppLabel;
    pplblTituloBalAnalAPCC2: TppLabel;
    rptBalAnalAPCCLabel4: TppLabel;
    rptBalAnalAPCCLabel5: TppLabel;
    rptBalAnalAPCCLabel6: TppLabel;
    rptBalAnalAPCCLabel7: TppLabel;
    rptBalAnalAPCCLabel8: TppLabel;
    rptBalAnalAPCCLabel9: TppLabel;
    LblEmpresa: TppLabel;
    ppDetailBand7: TppDetailBand;
    rptBalAnalAPCCDBText12: TppDBText;
    dbtxtContaBalAPCC: TppDBText;
    dbtxtNomeContaBalAPCC: TppDBText;
    dbtxtCCBalAPCC: TppDBText;
    dbtxtNomeCCBalAPCC: TppDBText;
    rptBalAnalAPCCDBText5: TppDBText;
    rptBalAnalAPCCDBText6: TppDBText;
    rptBalAnalAPCCDBText7: TppDBText;
    rptBalAnalAPCCDBText8: TppDBText;
    rptBalAnalAPCCDBText9: TppDBText;
    rptBalAnalAPCCDBText10: TppDBText;
    dbtxtAPBalAPCC: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine31: TppLine;
    rptBalAnalAPCCLabel10: TppLabel;
    lblContBalAPCC: TppLabel;
    lblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    lblCalcBalAPCC: TppSystemVariable;
    rptBalAnalAPCCGroup1: TppGroup;
    rptBalAnalAPCCGroupHeaderBand1: TppGroupHeaderBand;
    rptBalAnalAPCCGroupFooterBand1: TppGroupFooterBand;
    rptBalAnalAPCCLine3: TppLine;
    cdsBalAnalAPCC: TCMClientDataSet;
    sqlBalAnalAPCC: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure ppDetailBand7BeforeGenerate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlContab       : TCtrlContab; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010

    iPlano :integer;
    iPagIni :Integer;
    sMascaraPlano,sMascaraCCusto :string;
    sMascaraUnidNegoc :string;
    sMascara :string;
    sNomeExerc : String;
    sPeriodoInicial :string;
    sPeriodoFinal   :string;


  public
    { Public declarations }
  end;

var
  rptBalanceteAnalAPCC: TrptBalanceteAnalAPCC;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,
     uModulo, uData, uFuncaoGeral,uCtrlParamIntegra;

{$R *.DFM}

procedure TrptBalanceteAnalAPCC.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[14].SpinEditSettings.Value := 1;

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
                                                    '   CODEXTERNO AS CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODEXTERNO AS CODCENTROCUSTO, '+
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

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

end;

procedure TrptBalanceteAnalAPCC.ppDetailBand7BeforeGenerate(
  Sender: TObject);
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalAnalAPCC.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalAnalAPCC.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBalAPCC.DisplayFormat := sMascara + ';0; ';
   end;

   if sMascaraUnidNegoc <> '' then begin
      sMascaraUnidNegoc := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraUnidNegoc, FuncaoGeral.CalcGrau(modulo.sMascaraUnidNegoc, cdsBalAnalAPCC.FieldByName('UNECODIGO').asString));
      dbtxtAPBalAPCC.DisplayFormat := sMascaraUnidNegoc + ';0; ';
   end;

   if sMascaraCCusto <> '' then begin
      sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraCCusto, FuncaoGeral.CalcGrau(modulo.sMascaraCCusto, cdsBalAnalAPCC.FieldByName('CODCENTROCUSTO').asString));
      dbtxtCCBalAPCC.DisplayFormat := sMascaraCCusto + ';0; ';
   end;

end;

procedure TrptBalanceteAnalAPCC.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo,sEspacos : string;
    iGrau,iNumDig,i : Integer;
begin
  inherited;
  // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
//   iPlano := ParamIntegra.Plano;
//   sMascaraPlano := ParamIntegra.MascaraPlano;
   iPlano := 0;
   sMascaraPlano := '';
   CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa);
   // Fim - Alterado por FHBS

    sPeriodoInicial:= '';
    sPeriodoFinal  := '';

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
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlTitulos.Open;
   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;

   //=====================================================================

   // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := CtrlContab.PlanoParam;

   sMascaraPlano := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
   //sMascaraPlano := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043

   // Fim - Alterado por FHBS


   iNumDig := 0;
   if CmpRptCM.ParamValues[13].AsBoolean then
   begin
      iGrau := FuncaoGeral.CalcGrauMax(Modulo.sMascaraUnidNegoc);
      iNumDig :=FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraUnidNegoc,(iGrau-1));
   end;


   if CmpRptCM.ParamValues[15].AsString = '' then
   begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := StrToFloat(CmpRptCM.ParamValues[0].AsString);
         ParamByName('PERNUMEROINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
         ParamByName('PERNUMEROFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Analítico de C.Custo por Ativ./Proj. - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete Analítico de C.Custo por Ativ./Proj. - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Analítico de C.Custo por Ativ./Proj. Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete Analítico de C.Custo por Ativ./Proj. Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      end;

      //Imprime os títulos
      pplblTituloBalAnalAPCC.caption := sTitulo;

      sTitulo := '';
      if trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Inicial : ' + CmpRptCM.ParamValues[3].AsString;
      end;
      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Final : ' + CmpRptCM.ParamValues[4].AsString;
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + CmpRptCM.ParamValues[5].AsString;
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + CmpRptCM.ParamValues[6].AsString;
      end;

      pplblTituloBalAnalAPCC2.caption := sTitulo;
   end else begin
      pplblTituloBalAnalAPCC.caption :=  CmpRptCM.ParamValues[15].AsString;
      pplblTituloBalAnalAPCC2.caption:=CmpRptCM.ParamValues[16].AsString;
   end;

   iPagIni := CmpRptCM.ParamValues[14].AsInteger;


   with sqlBalAnalAPCC do begin
      SQL.Clear;
      SQL.Add('SELECT /*+ RULE */                                        ');
      SQL.Add('   CODEXTERNO,                                            ');
      SQL.Add('   PLACONTA, PLAGRAU, PLATIPO, PLACONCORRESP, PLANATUREZA, CODCENTROCUSTO,        ');
      SQL.Add('   ('' '') AS DEBCREANT, ('' '') AS DEBCRESALDO, (0) AS SALDOABS, (0) AS SALDOANTABS,  ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   CONTA, PLANOMEOUTLING, PLANOME, NOMECC, UNECODIGO, UNIDNEGOC, NOME, DEB, CRED, MOV,  ');
      //SQL.Add('   SALDOANT, SALDO FROM (                                   ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('   SALDOANT,                   ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('   DECODE(SIGN(SALDOANT), -1, ABS(NVL(SALDOANT, 0)) - ABS(NVL(DEB,0)) + ABS(NVL(CRED,0)), NVL(SALDOANT, 0) + ABS(NVL(DEB,0)) - ABS(NVL(CRED,0))) AS SALDO '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('FROM (                  '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add(' SELECT ');
      SQL.Add('   TAB.CODEXTERNO, ');
      SQL.Add('   TAB.PLACONTA, ');
      SQL.Add('   TAB.PLAGRAU, ');
      SQL.Add('   TAB.PLATIPO, ');
      SQL.Add('   TAB.PLACONCORRESP, ');
      SQL.Add('   TAB.PLANATUREZA, ');
      SQL.Add('   TAB.CODCENTROCUSTO, ');
      SQL.Add('   TAB.CONTA, ');
      SQL.Add('   TAB.PLANOMEOUTLING, ');
      SQL.Add('   TAB.PLANOME, ');
      SQL.Add('   TAB.NOMECC, ');
      SQL.Add('   TAB.UNECODIGO, ');
      SQL.Add('   TAB.UNIDNEGOC, ');
      SQL.Add('   TAB.NOME, ');
      SQL.Add('   TAB.DEB, ');
      SQL.Add('   TAB.CRED, ');
      SQL.Add('   TAB.MOV, ');
      SQL.Add('   DECODE(TAB.SALDOANT, NULL, 0, TAB.SALDOANT) AS SALDOANT, ');
      SQL.Add('   (TAB.DEB - TAB.CRED) AS SALDO ');

      SQL.Add(' FROM ( ');
      //Bruno Bastos - Teste - 12/06/2009 - Fim

      SQL.Add('SELECT                                                      ');
      SQL.Add('   CC.CODEXTERNO, C.PLACONTA, C.PLAGRAU,                               ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, S.CODCENTROCUSTO,        ');
      if CmpRptCM.ParamValues[10].AsBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end;
      SQL.Add('   CC.NOME AS NOMECC, (''         '') AS UNECODIGO, (0) AS UNIDNEGOC, (''                         '') AS NOME, ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, SA.SALDOANT, ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) ');
        SQL.Add('   - NVL(S.PLSDEBITOENCERR,0) + NVL(S.PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C, CENTCUST CC,                      ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, CODCENTROCUSTO, ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR) ');
        SQL.Add('                   - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDOANT ');
      end
      else
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, CODCENTROCUSTO, ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT          ');
      end;

      SQL.Add('    FROM PLANOSALDO ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND  ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)  ');
      SQL.Add('    GROUP BY PLACONTA,CODCENTROCUSTO ) SA, ');
      SQL.Add('   (SELECT  ');
      SQL.Add('       PLACONTA,CODCENTROCUSTO, ');

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR) - ');
        SQL.Add('       SUM(PLSDEBITOENCERR) + SUM(PLSCREDITOENCERR)) AS MOV ');
      end
      else
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV ');
      end;
     //Marilza Colpani - Fim

      SQL.Add('    FROM PLANOSALDO    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND ');
      SQL.Add('          (PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND  ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA) ');
      SQL.Add('    GROUP BY PLACONTA, CODCENTROCUSTO ) M  ');
      SQL.Add('WHERE  ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND  ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND  ');
      end;
      if CmpRptCM.ParamValues[5].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO >= ' + QuotedStr( CmpRptCM.ParamValues[5].AsString ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO <= ' + QuotedStr( CmpRptCM.ParamValues[6].AsString ) + ') AND ');

      SQL.Add('    (S.PLANO =:PLANO) AND                         ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND           ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                   ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND   ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND   ');
      SQL.Add('    (SA.PLACONTA(+)       = S.PLACONTA) AND       ');
      SQL.Add('    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND  ');
      SQL.Add('    (M.PLACONTA(+)        = S.PLACONTA) AND        ');
      SQL.Add('    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND  ');
      SQL.Add('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND     ');
      SQL.Add('    (CC.IDEMPRESA = S.IDEMPRESA) AND               ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND              ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                    ');

      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                  ');
      SQL.Add('    (S.PLANO = C.PLANO)                            ');
      SQL.Add('GROUP BY                                           ');
      SQL.Add('   CC.CODEXTERNO, ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, S.CODCENTROCUSTO,   ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), CC.NOME, C.PLANOMEOUTLING, SA.SALDOANT, M.DEB, M.CRED, M.MOV               ');

      SQL.Add('   ) TAB '); //Bruno Bastos - Teste - 12/06/2009

      SQL.Add('UNION ALL   ');

      //Bruno Bastos - Teste - 12/06/2009 - Início
      SQL.Add(' SELECT ');
      SQL.Add('   TAB.CODEXTERNO, ');
      SQL.Add('   TAB.PLACONTA, ');
      SQL.Add('   TAB.PLAGRAU, ');
      SQL.Add('   TAB.PLATIPO, ');
      SQL.Add('   TAB.PLACONCORRESP, ');
      SQL.Add('   TAB.PLANATUREZA, ');
      SQL.Add('   TAB.CODCENTROCUSTO, ');
      SQL.Add('   TAB.CONTA, ');
      SQL.Add('   TAB.PLANOMEOUTLING, ');
      SQL.Add('   TAB.PLANOME, ');
      SQL.Add('   TAB.NOMECC, ');
      SQL.Add('   TAB.UNECODIGO, ');
      SQL.Add('   TAB.UNIDNEGOC, ');
      SQL.Add('   TAB.NOME, ');
      SQL.Add('   TAB.DEB, ');
      SQL.Add('   TAB.CRED, ');
      SQL.Add('   TAB.MOV, ');
      SQL.Add('   DECODE(TAB.SALDOANT, NULL, 0, TAB.SALDOANT) AS SALDOANT, ');
      SQL.Add('   (TAB.DEB - TAB.CRED) AS SALDO ');

      SQL.Add(' FROM ( ');
      //Bruno Bastos - Teste - 12/06/2009 - Fim

      SQL.Add('SELECT      ');
      SQL.Add('CC.CODEXTERNO,                        ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU,                                                                ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, S.CODCENTROCUSTO, ');
      if CmpRptCM.ParamValues[10].AsBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,        ');
      end;
      SQL.Add('   CC.NOME AS NOMECC,                                         ');
      if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add('   U1.UNECODIGO, U1.UNIDNEGOC, U1.NOME,       ');
      end else begin
         SQL.Add('   U.UNECODIGO, S.UNIDNEGOC, U.NOME,          ');
      end;
      SQL.Add('   M.DEB,M.CRED,M.MOV,                                        ');
      SQL.Add('   SA.SALDOANT,                                               ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) ');
        SQL.Add('   - NVL(S.PLSDEBITOENCERR,0) + NVL(S.PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('FROM                                                              ');
      SQL.Add('   PLANOSALDO S, CENTCUST CC, PLANOCONTA C, UNIDNEGOCIO U,        ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

       if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
         SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
         SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
      end;

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, UNIDNEGOC, CODCENTROCUSTO, '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR) ');
        SQL.Add('                   - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDOANT ');
      end
      else
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, UNIDNEGOC, CODCENTROCUSTO, ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT          ');
      end;

      SQL.Add('    FROM PLANOSALDO                                             ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                   ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                        ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                  ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                  ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                            ');
      SQL.Add('    GROUP BY PLACONTA,UNIDNEGOC,CODCENTROCUSTO ) SA,       ');
      SQL.Add('   (SELECT                                                 ');
      SQL.Add('       PLACONTA,CODCENTROCUSTO,UNIDNEGOC,                  ');

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                      ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                         ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR) - ');
        SQL.Add('       SUM(PLSDEBITOENCERR) + SUM(PLSCREDITOENCERR)) AS MOV ');
      end
      else
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV ');
      end;
     //Marilza Colpani - Fim

      SQL.Add('    FROM PLANOSALDO                                         ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                               ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                    ');
      SQL.Add('          (PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                  ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                  ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                            ');
      SQL.Add('    GROUP BY PLACONTA, UNIDNEGOC, CODCENTROCUSTO) M        ');
      SQL.Add('WHERE                                                      ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND                   ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND                   ');
      end;
      if CmpRptCM.ParamValues[5].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO >= ' + QuotedStr( CmpRptCM.ParamValues[5].AsString ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO <= ' + QuotedStr( CmpRptCM.ParamValues[6].AsString ) + ') AND ');

      SQL.Add('    ((C.PLARATEIOAP <> ''N'') OR (C.PLARATEIOAP IS NULL)) AND ');
      SQL.Add('    (C.PLATIPO = ''A'') AND                                  ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                    ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                      ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                  ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND               ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND  ');
      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND         ');
      SQL.Add('    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND');
      SQL.Add('    (SA.UNIDNEGOC(+)   = S.UNIDNEGOC) AND        ');
      SQL.Add('    (M.PLACONTA(+)     = S.PLACONTA) AND         ');
      SQL.Add('    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND');
      SQL.Add('    (M.UNIDNEGOC(+)    = S.UNIDNEGOC) AND        ');
      SQL.Add('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND   ');
      SQL.Add('    (CC.IDEMPRESA = S.IDEMPRESA) AND             ');
      SQL.Add('    (U.UNIDNEGOC = S.UNIDNEGOC) AND              ');
      SQL.Add('    (U.IDPESSOA = S.IDPESSOA) AND                ');
      if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
      end;
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND            ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                  ');
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                ');
      SQL.Add('    (S.PLANO = C.PLANO)                          ');
      SQL.Add('GROUP BY                                         ');
      SQL.Add('   CC.CODEXTERNO,                                ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,');
      SQL.Add('   S.CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), CC.NOME,');
      if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add('   U1.UNECODIGO, U1.UNIDNEGOC, U1.NOME,       ');
      end else begin
         SQL.Add('   U.UNECODIGO, S.UNIDNEGOC, U.NOME,          ');
      end;
      SQL.Add('   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,         ');
      SQL.Add('   SA.SALDOANT                                   ');

      Sql.Add(' ) TAB '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      SQL.Add('UNION ALL                                        ');

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('SELECT                                           ');
      SQL.Add('   TAB.CODEXTERNO,                               ');
      SQL.Add('   TAB.PLACONTA,                                 ');
      SQL.Add('   TAB.PLAGRAU,                                  ');
      SQL.Add('   TAB.PLATIPO,                                  ');
      SQL.Add('   TAB.PLACONCORRESP,                            ');
      SQL.Add('   TAB.PLANATUREZA,                              ');
      SQL.Add('   (''         '') AS CODCENTROCUSTO,            ');
      SQL.Add('   TAB.CONTA,                                    ');
      SQL.Add('   TAB.PLANOMEOUTLING,                           ');
      SQL.Add('   TAB.PLANOME,                                  ');
      SQL.Add('   (''                             '') AS NOMECC,');
      SQL.Add('   (''         '') AS UNECODIGO,                 ');
      SQL.Add('   (0) AS UNIDNEGOC,                             ');
      SQL.Add('   (''                         '') AS NOME,      ');
      SQL.Add('   TAB.DEB,                                      ');
      SQL.Add('   TAB.CRED,                                     ');
      SQL.Add('   TAB.MOV,                                      ');
      SQL.Add('   DECODE(TAB.SALDOANT, NULL, 0, TAB.SALDOANT) AS SALDOANT, ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('   (TAB.DEB-TAB.CRED) AS SALDO               '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      SQL.Add('FROM (                                           ');

      //Marilza Colpani - Fim

      SQL.Add('SELECT                                           ');
      SQL.Add('   CC.CODEXTERNO,                                ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU,                        ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, (''         '') AS CODCENTROCUSTO, ');
      if CmpRptCM.ParamValues[10].AsBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end;
      SQL.Add('   (''                             '') AS NOMECC, (''         '') AS UNECODIGO, (0) AS UNIDNEGOC, (''                         '') AS NOME, ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, SA.SALDOANT,                              ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) ');
        SQL.Add('   - NVL(S.PLSDEBITOENCERR,0) + NVL(S.PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C, CENTCUST CC,                      ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)');
        SQL.Add('                   - NVL(PLSDEBITOENCERR, 0)');
        SQL.Add('                   + NVL(PLSCREDITOENCERR, 0)) AS SALDOANT');
      end
      else
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT          ');

      end;

      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                        ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                        ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                         ');
      SQL.Add('          (CODCENTROCUSTO IS NULL)                          '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('    GROUP BY PLACONTA ) SA,                                 ');
      SQL.Add('   (SELECT                                                  ');
      SQL.Add('       PLACONTA,                                            '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                      ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                         ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR) - ');
        SQL.Add('       SUM(PLSDEBITOENCERR) + SUM(PLSCREDITOENCERR)) AS MOV ');
      end
      else
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV ');
      end;


      SQL.Add('    FROM PLANOSALDO                                         ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                               ');
      SQL.Add('          (PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND  ');
      SQL.Add('          (CODCENTROCUSTO IS NULL)  AND  '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA) ');
      SQL.Add('    GROUP BY PLACONTA ) M  ');
      SQL.Add('WHERE  ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND  ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND  ');
      end;
      if CmpRptCM.ParamValues[5].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO >= ' + QuotedStr( CmpRptCM.ParamValues[5].AsString ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO <= ' + QuotedStr( CmpRptCM.ParamValues[6].AsString ) + ') AND ');

      SQL.ADD('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO ) AND    ');

      SQL.Add('    (S.PLANO =:PLANO) AND                          ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND            ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                    ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                 ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND    ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND    ');
      //SQL.Add('    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND  ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('    (SA.PLACONTA(+)       = S.PLACONTA) AND        ');
      //SQL.Add('    (M.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND   '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('    (M.PLACONTA(+)        = S.PLACONTA) AND        ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND              ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                    ');
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                  ');
      SQL.Add('    (S.PLANO = C.PLANO)                            ');
      SQL.Add('GROUP BY                                           ');
      SQL.Add('   CC.CODEXTERNO,                                  ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,  ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANOMEOUTLING, SA.SALDOANT, M.DEB, M.CRED, M.MOV   ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
//      SQL.Add('ORDER BY PLACONTA, NOMECC, UNECODIGO                        ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464   
      SQL.Add('UNION                                            ');
      SQL.Add('SELECT                                           ');
      SQL.Add('   CC.CODEXTERNO,                                ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU,                        ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, (''         '') AS CODCENTROCUSTO, ');
      if CmpRptCM.ParamValues[10].AsBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end;
      SQL.Add('   (''                             '') AS NOMECC, (''         '') AS UNECODIGO, (0) AS UNIDNEGOC, (''                         '') AS NOME, ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, SA.SALDOANT,                              ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) ');
        SQL.Add('   - NVL(S.PLSDEBITOENCERR,0) + NVL(S.PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - FIM

      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C, CENTCUST CC,                      ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToInt(CmpRptCM.ParamValues[0].AsString),CrmRptCM.IdEmpresa)+' PD, ');

      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, CODCENTROCUSTO, ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR) ');
        SQL.Add('                   - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDOANT ');
      end
      else
      begin
        SQL.Add('   (SELECT ');
        SQL.Add('       PLACONTA, CODCENTROCUSTO, '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT          ');
      end;

      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                        ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                        ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                            ');
      SQL.Add('    GROUP BY PLACONTA, CODCENTROCUSTO) SA,                  ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('   (SELECT                                                  ');
      SQL.Add('       PLACONTA, CODCENTROCUSTO,                            ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

      //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                       ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                          ');
      if CmpRptCM.ParamValues[17].AsBoolean then
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR) - ');
        SQL.Add('       SUM(PLSDEBITOENCERR) + SUM(PLSCREDITOENCERR)) AS MOV ');
      end
      else
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');
        SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV ');
      end;

      SQL.Add('    FROM PLANOSALDO                                         ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                               ');
      SQL.Add('          (PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND  ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA) ');
      SQL.Add('    GROUP BY PLACONTA, CODCENTROCUSTO ) M  ');
      SQL.Add('WHERE  ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND  ');
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND  ');
      end;
      if CmpRptCM.ParamValues[5].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO >= ' + QuotedStr( CmpRptCM.ParamValues[5].AsString ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
      SQL.ADD('    (CC.CODEXTERNO <= ' + QuotedStr( CmpRptCM.ParamValues[6].AsString ) + ') AND ');

      SQL.ADD('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO ) AND    ');

      SQL.Add('    (S.PLANO =:PLANO) AND                          ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND            ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                    ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                 ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND    ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND    ');
      SQL.Add('    (SA.PLACONTA(+)       = S.PLACONTA) AND        ');
      SQL.Add('    (M.PLACONTA(+)        = S.PLACONTA) AND        ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND              ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                    ');

      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                  ');
      SQL.Add('    (S.PLANO = C.PLANO) AND                        ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND  ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO)      ');  //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('GROUP BY                                           ');
      SQL.Add('   CC.CODEXTERNO,                                  ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,  ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANOMEOUTLING, SA.SALDOANT, M.DEB, M.CRED, M.MOV )  TAB  '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      //SQL.Add('ORDER BY PLACONTA, NOMECC, UNECODIGO                        '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('WHERE                                                         '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464
      SQL.Add('   (TAB.SALDOANT IS NOT NULL OR TAB.MOV IS NOT NULL))         '); //Marilza Colpani 16/06/2009 N.Sol: 108683/117858 - N.Kintana: 495605/563464

//Fim
//********************************************************************************
      SQL.Add('ORDER BY PLACONTA, NOMECC, UNECODIGO                        ');



      Prepare;

      ParamByName('PLANO').asInteger      := iPlano;
      ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asFloat    := StrToFloat(CmpRptCM.ParamValues[0].asString);
      ParamByName('PERIODOINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
      ParamByName('PERIODOFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
      //
      if trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
         ParamByName('CONTAINI').asString := trim(CmpRptCM.ParamValues[3].AsString);
      end else begin
         ParamByName('CONTAINI').asString := '0';
      end;
      //
      if trim(CmpRptCM.ParamValues[4].AsString) <> '' then begin
         ParamByName('CONTAFIM').asString := trim(CmpRptCM.ParamValues[4].AsString);
      end else begin
         ParamByName('CONTAFIM').asString := '999999999999999999';
      end;


      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         ParamByName('UNIDNEGOCINI').asInteger  := StrToInt(CmpRptCM.ParamValues[7].AsString);
      end;
      if trim(CmpRptCM.ParamValues[8].AsString) <> '' then begin
         ParamByName('UNIDNEGOCFIM').asInteger  := StrToInt(CmpRptCM.ParamValues[8].AsString);
      end;

      sMascara          := '';
      sMascaraCCusto    := '';
      sMascaraUnidNegoc := '';
      if CmpRptCM.ParamValues[9].AsBoolean then begin
         sMascara          := sMascaraPlano;
         sMascaraCCusto    := modulo.sMascaraCCusto;
         sMascaraUnidNegoc := modulo.sMascaraUnidNegoc;
      end;

       Open;

       // Simula o onCalcfield
      cdsBalAnalAPCC.First;
      while not cdsBalAnalAPCC.Eof do
      begin

         //Gera a label de débito/crédito

         cdsBalAnalAPCC.Edit;

         if cdsBalAnalAPCC.FieldByName('SALDO').asFloat = 0 then begin
            cdsBalAnalAPCC.FieldByName('DEBCRESALDO').asString := ' ';
         end;
         if cdsBalAnalAPCC.FieldByName('SALDO').asFloat < 0 then begin
            cdsBalAnalAPCC.FieldByName('DEBCRESALDO').asString := 'C';
         end else begin
            cdsBalAnalAPCC.FieldByName('DEBCRESALDO').asString := 'D';
         end;

         if cdsBalAnalAPCC.FieldByName('SALDOANT').asFloat = 0 then begin
            cdsBalAnalAPCC.FieldByName('DEBCREANT').asString := ' ';
         end;
         if cdsBalAnalAPCC.FieldByName('SALDOANT').asFloat < 0 then begin
            cdsBalAnalAPCC.FieldByName('DEBCREANT').asString := 'C';
         end else begin
            cdsBalAnalAPCC.FieldByName('DEBCREANT').asString := 'D';
         end;

         //Tira o sinal dos saldos
         cdsBalAnalAPCC.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalAnalAPCC.FieldByName('SALDOANT').asFloat);
         cdsBalAnalAPCC.FieldByName('SALDOABS').asFloat    := ABS(cdsBalAnalAPCC.FieldByName('SALDO').asFloat);

         //Indenta o Nome da Conta Contábil de acordo com o grau
         sEspacos := '';

         if CmpRptCM.ParamValues[11].asBoolean then begin
            for i := 1 to ((cdsBalAnalAPCC.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
               sEspacos := sEspacos + ' ';
            end;
         end;

         cdsBalAnalAPCC.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalAnalAPCC.FieldByName('CONTA').asString);

         cdsBalAnalAPCC.Post;
         cdsBalAnalAPCC.Next;
      end;

   end;

   //sqlBalAnalAPCC.sql.savetofile ('C:\QueryBalAnalAPCC.txt');

end;

procedure TrptBalanceteAnalAPCC.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptBalanceteAnalAPCC.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;

end;

procedure TrptBalanceteAnalAPCC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
end;

procedure TrptBalanceteAnalAPCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  CtrlRptBalancete.free;
end;

end.