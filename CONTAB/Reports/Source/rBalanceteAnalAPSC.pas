{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

unit rBalanceteAnalAPSC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, ppBands,uCtrlRptBalancete,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport,uCtrlContab, TXRB;

type
  TrptBalanceteAnalAPSC = class(TFrmCmReport)
    dsBalAnalAPSC: TwwDataSource;
    pplBalAnalAPSC: TppBDEPipeline;
    rptBalAnalAPSC: TppReport;
    ppHeaderBand6: TppHeaderBand;
    pplblTituloBalAnalAPSC: TppLabel;
    ppLine18: TppLine;
    LblEmpresa: TppLabel;
    ppLine19: TppLine;
    ppLabel37: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    pplblTituloBalAnalAPSC2: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    rptBalAnalAPSCLabel1: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    rptBalAnalAPSCDBText3: TppDBText;
    rptBalAnalAPSCDBText4: TppDBText;
    dbtxtNomeAPBalAPSC: TppDBText;
    dbtxtAPBalAPSC: TppDBText;
    dbtxtContaBalAPSC: TppDBText;
    dbtxtNomeContaBalAPSC: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine21: TppLine;
    LBLSISTEMA: TppLabel;
    rptBalAnalAPSCLabel2: TppLabel;
    lblContBalAPSC: TppLabel;
    ppCalc12: TppSystemVariable;
    lblCalcBalAPSC: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    sqlBalAnalAPSC: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    ppDBText1: TppDBText;
    cdsBalAnalAPSC: TClientDataSet;
    sqlAux1: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    procedure ppDetailBand4BeforeGenerate(Sender: TObject);
    procedure ppFooterBand6BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sMascara,sMascaraUnidNegoc :string;
    sNomePer1,sNomePer2,sNomeExerc,  sMascaraPlano,sPeriodoFinal,sPeriodoInicial : String;
    iPagIni :Integer;
    CtrlContab       : TCtrlContab;
    CtrlRptBalancete :TCtrlRptBalancete;

  public
    { Public declarations }
  end;

var
  rptBalanceteAnalAPSC: TrptBalanceteAnalAPSC;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra,FSM_FxLib;

{$R *.DFM}

procedure TrptBalanceteAnalAPSC.ppDetailBand4BeforeGenerate(Sender: TObject);
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalAnalAPSC.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalAnalAPSC.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBalAPSC.DisplayFormat := sMascara + ';0; ';
   end;

   if sMascaraUnidNegoc <> '' then begin
      sMascaraUnidNegoc := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraUnidNegoc, FuncaoGeral.CalcGrau(modulo.sMascaraUnidNegoc, cdsBalAnalAPSC.FieldByName('UNECODIGO').asString));
      dbtxtAPBalAPSC.DisplayFormat := sMascaraUnidNegoc + ';0; ';
   end;

end;

procedure TrptBalanceteAnalAPSC.ppFooterBand6BeforePrint(Sender: TObject);
begin
  inherited;
   lblContBalAPSC.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalAPSC.text)) - 1);

end;

procedure TrptBalanceteAnalAPSC.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo,sPacTipoPerResult,sEspacos : string;
    iNumero,iGrau,iNumDig,i,iPlano,iPlanoAnt : Integer;

begin
   inherited;
   if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
      iPlanoAnt := CtrlContab.PlanoParam
   else
      iPlanoAnt := 0;
      
   iPlano := iPlanoAnt;
   //=====================================================
   // Sql para pegar o plano
   //======================================================
   sqlAux1.SQL.Clear;
   sqlAux1.SQL.Add('SELECT PERDATINI FROM PERIODO        ');
   sqlAux1.SQL.Add('WHERE (PEREXERCICIO = :PEREXERCICIO) ');
   sqlAux1.SQL.Add('  AND (PERNUMERO    = :PERNUMERO)    ');
   sqlAux1.SQL.Add('  AND (IDPESSOA     = :IDPESSOA)     ');

   sqlAux1.Prepare;
   sqlAux1.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlAux1.ParamByName('PERNUMERO').asInteger := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlAux1.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlAux1.Open;

   If CtrlContab.SelecionaPlanoData(CrmRptCM.IdEmpresa, DateToStr(cdsAux1.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then begin
      iPlano := iPlanoAnt;
   end;

   sMascaraPlano := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
   //sMascaraPlano := ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043

  //======================================================

    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sPacTipoPerResult := CtrlContab.TipoOpEncer;
    end else
    begin
       sPacTipoPerResult := '';
    end;

   iNumDig := 0;
   iPagIni := CmpRptCM.ParamValues[16].AsInteger;


   if CmpRptCM.ParamValues[15].AsBoolean then begin
      iGrau   := FuncaoGeral.CalcGrauMax(Modulo.sMascaraUnidNegoc);
      iNumDig :=FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraUnidNegoc,(iGrau-1));
   end;

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
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
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
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlTitulos.Open;
   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;

   //=====================================================================


   if CmpRptCM.ParamValues[17].AsString = '' then begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
         ParamByName('PERNUMEROINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
         ParamByName('PERNUMEROFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Analítico de Ativ./Proj. e Sub-Contas - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].AsString
            end else begin
               sTitulo := 'Balancete Analítico de Ativ./Proj. e Sub-Contas - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].AsString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].AsString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete Analítico de Ativ./Proj. e Sub-Contas Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].AsString;
            end else begin
               sTitulo := 'Balancete Analítico de Ativ./Proj. e Sub-Contas Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].AsString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].AsString;
            end;
         end;
      end;

      //Imprime os títulos
      pplblTituloBalAnalAPSC.caption := sTitulo;

      sTitulo := '';
      if trim(CmpRptCM.ParamValues[3].asString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Inicial : ' + CmpRptCM.ParamValues[3].asString;
      end;
      if trim(CmpRptCM.ParamValues[4].asString) <> '' then begin
         sTitulo := sTitulo +  '     Conta Final : ' + CmpRptCM.ParamValues[4].asString;
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + CmpRptCM.ParamValues[5].asString;
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         sTitulo := sTitulo +  '     Centro de Custo Final : ' + CmpRptCM.ParamValues[6].asString;
      end;

      pplblTituloBalAnalAPSC2.caption := sTitulo;
   end else begin
      pplblTituloBalAnalAPSC.caption  := CmpRptCM.ParamValues[17].asString;
      pplblTituloBalAnalAPSC2.caption := CmpRptCM.ParamValues[18].asString;
   end;


   //Configura a quebra de página
   if CmpRptCM.ParamValues[10].asBoolean then begin
      rptBalAnalAPSC.Groups[0].NewPage := true;
   end else begin
      rptBalAnalAPSC.Groups[0].NewPage := false;
   end;

   iNumero := FuncaoGeral.CalcNumEleGrau(sMascaraPlano, 1);

   with sqlBalAnalAPSC do begin
      SQL.Clear;
      SQL.Add('SELECT /*+ RULE */                                                          ');
      SQL.Add('   U.PLACONTA, U.PLAGRAU, U.GRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, U.CODSUBCONTA,');
      SQL.Add('   U.NOMESUBCONTA, U.CONTA, U.PLANOMEOUTLING, U.PLANOME, U.UNIDNEGOC, U.NOME, U.UNECODIGO, ');
      SQL.Add('   ('' '') AS DEBCREANT, ('' '') AS DEBCRESALDO, (0) AS SALDOABS, (0) AS SALDOANTABS,  ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   SUM(U.DEB) AS DEB, SUM(U.CRED) AS CRED, SUM(U.MOV) AS MOV,          ');
      SQL.Add('   SUM(U.SALDOANT) AS SALDOANT, SUM(U.SALDO) AS SALDO FROM (           ');
      if CmpRptCM.ParamValues[14].asBoolean then begin
         SQL.Add('(SELECT                                                                ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU,                                              ');
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,           ');
         SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,                          ');
         SQL.Add('   (0) AS CODSUBCONTA, ('' '') AS NOMESUBCONTA,                        ');
         if CmpRptCM.ParamValues[11].asBoolean then begin
            SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, C.PLANOME,          ');
         end else begin
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,       ');
         end;
         SQL.Add('   (0) AS UNIDNEGOC, ('' '') AS NOME, ('' '') AS UNECODIGO,            ');
         SQL.Add('   S.DEB, S.CRED, S.MOV, SA.SALDOANT,                                  ');
         SQL.Add('   SS.SALDO                                                            ');
         SQL.Add('FROM                                                             ');
         SQL.Add('    PLANOCONTA C,                                                ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
         SQL.Add('   (SELECT C.PLACONTA,                                           ');
         SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA ) SA,                                              ');
         SQL.Add('                                                                       ');
         SQL.Add('   (SELECT C.PLACONTA,                                                 ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEB,          ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CRED,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0),0)) AS DEBA,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0),0)) AS CREDA,        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('    (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])
                 + ' AND ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])
                 + ') AND  ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA ) S,                               ');
         SQL.Add('                                                           ');
         SQL.Add('   (SELECT C.PLACONTA,                                           ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('       (P.PERNUMERO <=' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) +  ')         ');
         SQL.Add('    GROUP BY C.PLACONTA ) SS                                 ');
         SQL.Add('                                                              ');
         SQL.Add('WHERE                                                         ');
         SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');

         SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND                  ');
         SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                      ');
         SQL.Add('GROUP BY                                                         ');
         SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
         SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
         SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
         SQL.Add('    S.DEB,                                                       ');
         SQL.Add('    S.CRED,                                                      ');
         SQL.Add('    S.MOV )                                                      ');
         SQL.Add('UNION ALL                                                        ');
         SQL.Add('(SELECT                                                                ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU,                                              ');
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,           ');
         SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,                          ');
         SQL.Add('   (0) AS CODSUBCONTA, ('' '') AS NOMESUBCONTA,                        ');
         if CmpRptCM.ParamValues[11].asBoolean then begin
            SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, C.PLANOME,          ');
         end else begin
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,   ');
         end;
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
         end else begin
            SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
         end;
         SQL.Add('   S.DEB, S.CRED, S.MOV, SA.SALDOANT,                                  ');
         SQL.Add('   SS.SALDO                                                            ');
         SQL.Add('FROM                                                             ');
         SQL.Add('   UNIDNEGOCIO U, PLANOCONTA C,                                  ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
            SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
            SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
         end;
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC,                              ');
         SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC ) SA,                                          ');
         SQL.Add('                                                                       ');
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC,                                    ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEB,          ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CRED,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0),0)) AS DEBA,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0),0)) AS CREDA,        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[6].asInteger) + ') AND       ');
         SQL.Add('    (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])
                 + ' AND ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])
                 + ') AND  ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC ) S,                               ');
         SQL.Add('                                                           ');
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC,                                     ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('       (P.PERNUMERO <=' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC ) SS                      ');
         SQL.Add('                                                               ');
         SQL.Add('WHERE                                                          ');
         SQL.Add('    (S.PLACONTA(+) = SS.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = SS.PLACONTA) AND                         ');
         SQL.Add('    (S.UNIDNEGOC(+) = SS.UNIDNEGOC) AND                        ');
         SQL.Add('    (SA.UNIDNEGOC(+) = SS.UNIDNEGOC) AND                       ');
         SQL.Add('    (SS.PLACONTA = C.PLACONTA) AND                             ');
         SQL.Add('    (SS.UNIDNEGOC = U.UNIDNEGOC) AND                           ');
         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                ');
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
         end;
         if CmpRptCM.ParamValues[13].asBoolean then begin
            SQL.Add('    (C.PLATIPO = ''A'') AND                                   ');
         end;
         SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND                  ');
         SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                      ');
         SQL.Add('GROUP BY                                                         ');
         SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
         SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
         SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
         SQL.Add('    S.DEB,                                                       ');
         SQL.Add('    S.CRED,                                                      ');
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
         end else begin
            SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
         end;
         SQL.Add('    S.MOV)                     ');
         SQL.Add('UNION ALL                                                        ');

         SQL.Add('(SELECT                                                                ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU,                                              ');
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,           ');
         SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,                          ');
         SQL.Add('   SC.CODSUBCONTA, SC.NOMESUBCONTA,                                    ');
         if CmpRptCM.ParamValues[11].asBoolean then begin
            SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, C.PLANOME,          ');
         end else begin
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME),  ');
         end;
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
         end else begin
            SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
         end;
         SQL.Add('   S.DEB, S.CRED, S.MOV, SA.SALDOANT,                                  ');
         SQL.Add('   SS.SALDO                                                            ');
         SQL.Add('FROM                                                             ');
         SQL.Add('   UNIDNEGOCIO U, PLANOCONTA C, SUBCONTA SC,                     ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
            SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
            SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
         end;
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC, L.CODSUBCONTA,                             ');
         SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC, L.CODSUBCONTA ) SA,                                          ');
         SQL.Add('                                                                       ');
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC, L.CODSUBCONTA,                     ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEB,          ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CRED,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0),0)) AS DEBA,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0),0)) AS CREDA,        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('    (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])
                 + ' AND ' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])
                 + ') AND  ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC, L.CODSUBCONTA ) S,   ');
         SQL.Add('                                                           ');
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC, L.CODSUBCONTA,                      ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sPacTipoPerResult+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + IntToStr(CmpRptCM.ParamValues[0].asInteger) + ') AND       ');
         SQL.Add('       (P.PERNUMERO <=' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.idEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC, L.CODSUBCONTA ) SS       ');
         SQL.Add('                                                               ');
         SQL.Add('WHERE                                                          ');
         SQL.Add('    (S.PLACONTA(+) = SS.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = SS.PLACONTA) AND                         ');
         SQL.Add('    (S.UNIDNEGOC(+) = SS.UNIDNEGOC) AND                        ');
         SQL.Add('    (SA.UNIDNEGOC(+) = SS.UNIDNEGOC) AND                       ');
         SQL.Add('    (S.CODSUBCONTA(+) = SS.CODSUBCONTA) AND                    ');
         SQL.Add('    (SA.CODSUBCONTA(+) = SS.CODSUBCONTA) AND                   ');
         SQL.Add('    (SS.PLACONTA = C.PLACONTA) AND                             ');
         SQL.Add('    (SS.UNIDNEGOC = U.UNIDNEGOC) AND                           ');
         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                ');

         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
         end;
         SQL.Add('    (SS.CODSUBCONTA = SC.CODSUBCONTA) AND                      ');
         if CmpRptCM.ParamValues[13].asBoolean then begin
            SQL.Add('    (C.PLATIPO = ''A'') AND                                   ');
         end;
         SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND                  ');
         SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                      ');
         SQL.Add('GROUP BY                                                         ');
         SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
         SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
         SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
         SQL.Add('    S.DEB,                                                       ');
         SQL.Add('    S.CRED, SC.CODSUBCONTA, SC.NOMESUBCONTA,                     ');
         if CmpRptCM.ParamValues[15].asBoolean then begin
            SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
         end else begin
            SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
         end;
         SQL.Add('    S.MOV)                     ');
         SQL.Add('UNION ALL                                                        ');
      end;
      SQL.Add('(SELECT                                                                ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU,                                              ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,           ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,                          ');
      SQL.Add('   (0) AS CODSUBCONTA, ('' '') AS NOMESUBCONTA,                        ');
      if CmpRptCM.ParamValues[11].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, C.PLANOME,          ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,                 ');
      end;
      SQL.Add('   (0) AS UNIDNEGOC, ('' '') AS NOME, ('' '') AS UNECODIGO,            ');
      SQL.Add('   M.DEB, M.CRED, M.MOV, SA.SALDOANT,                                  ');
      SQL.Add('   SUM(NVL(S.PLSDEBITOCORRENTE,0)            ');
      SQL.Add('   - NVL(S.PLSCREDITOCOR, 0)) AS SALDO       ');
      SQL.Add('FROM                                                                   ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C,                          ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
      SQL.Add('   (SELECT                                                             ');
      SQL.Add('       PLACONTA, SUM(NVL(PLSDEBITOCORRENTE,0)   ');
      SQL.Add('                 - NVL(PLSCREDITOCOR,0)) AS SALDOANT         ');
      SQL.Add('    FROM PLANOSALDO                                                    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                          ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                               ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND        ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;

      SQL.Add('          (IDPESSOA =:IDPESSOA)                                 ');
      SQL.Add('    GROUP BY PLACONTA ) SA,                                     ');
      SQL.Add('   (SELECT                                                      ');
      SQL.Add('       PLACONTA,                                                ');
      SQL.Add('       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,                                  ');
      SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)) AS CRED,                                     ');
      SQL.Add('       (SUM(NVL(PLSDEBITOCORRENTE,0)) - SUM(NVL(PLSCREDITOCOR,0))) AS MOV     ');
      SQL.Add('    FROM PLANOSALDO                                                    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                          ');
      SQL.Add('          (PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND          ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                               ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                        ');
      SQL.Add('    GROUP BY PLACONTA ) M                                   ');
      SQL.Add('WHERE                                                                  ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND               ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                                    ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND               ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                                    ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                                     ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                        ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                        ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                  ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                        ');

      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND                               ');
      SQL.Add('    (M.PLACONTA(+)    = S.PLACONTA) AND                                ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                              ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                                ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND         ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                        ');
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                                      ');
      SQL.Add('    (S.PLANO = C.PLANO)                                                ');
      SQL.Add('GROUP BY                                                               ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,   ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANOMEOUTLING,     ');
      SQL.Add('   SA.SALDOANT, M.DEB, M.CRED, M.MOV)                                  ');

      SQL.Add('UNION ALL                                                              ');

      SQL.Add('(SELECT                                                                 ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU,                                              ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,           ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,                          ');
      SQL.Add('   (0) AS CODSUBCONTA, ('' '') AS NOMESUBCONTA,                        ');
      if CmpRptCM.ParamValues[11].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, C.PLANOME,          ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
      end;
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
      end else begin
         SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
      end;
      SQL.Add('   M.DEB, M.CRED, M.MOV, SA.SALDOANT,');
      SQL.Add('   SUM(NVL(S.PLSDEBITOCORRENTE,0)           ');
      SQL.Add('   - NVL(S.PLSCREDITOCOR,0)) AS SALDO       ');
      SQL.Add('FROM                                                                   ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C, UNIDNEGOCIO U,                          ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
         SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
         SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
      end;
      SQL.Add('   (SELECT                                                             ');
      SQL.Add('       PLACONTA, UNIDNEGOC, SUM(NVL(PLSDEBITOCORRENTE,0)       ');
      SQL.Add('                   - NVL(PLSCREDITOCOR,0)) AS SALDOANT         ');
      SQL.Add('    FROM PLANOSALDO                                                    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                          ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                               ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND        ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;

      SQL.Add('          (IDPESSOA =:IDPESSOA)                                        ');
      SQL.Add('    GROUP BY PLACONTA,UNIDNEGOC ) SA,                                  ');
      SQL.Add('   (SELECT                                                             ');
      SQL.Add('       PLACONTA,UNIDNEGOC,                                             ');
      SQL.Add('       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,                                  ');
      SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)) AS CRED,                                     ');
      SQL.Add('       (SUM(NVL(PLSDEBITOCORRENTE,0)) - SUM(NVL(PLSCREDITOCOR,0))) AS MOV            ');
      SQL.Add('    FROM PLANOSALDO                                                    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                          ');
      SQL.Add('          (PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND       ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                               ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                        ');
      SQL.Add('    GROUP BY PLACONTA, UNIDNEGOC ) M                                   ');
      SQL.Add('WHERE                                                                  ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND               ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                                    ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND               ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                                    ');
      end;
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                                     ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                        ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                        ');
      if CmpRptCM.ParamValues[13].asBoolean then begin
         SQL.Add('    (C.PLATIPO = ''A'') AND                                         ');
      end;
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                  ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                        ');

      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND                               ');
      SQL.Add('    (SA.UNIDNEGOC(+)   = S.UNIDNEGOC) AND                              ');
      SQL.Add('    (M.PLACONTA(+)     = S.PLACONTA) AND                               ');
      SQL.Add('    (M.UNIDNEGOC(+)    = S.UNIDNEGOC) AND                              ');
      SQL.Add('    (S.PLANO           =:PLANO) AND                                    ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                                ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND         ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                        ');
      SQL.Add('    (U.UNIDNEGOC = S.UNIDNEGOC) AND                                    ');
      SQL.Add('    (U.IDPESSOA = S.IDPESSOA) AND                                      ');
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
      end;
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                                      ');
      SQL.Add('    (S.PLANO = C.PLANO)                                                ');
      SQL.Add('GROUP BY                                                               ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,   ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANOMEOUTLING,   ');
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
      end else begin
         SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
      end;
      SQL.Add('   SA.SALDOANT, M.DEB, M.CRED, M.MOV )                                  ');

      SQL.Add('UNION ALL                                                              ');

      SQL.Add('(SELECT                                                                 ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU,                                              ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,           ');
      SQL.Add('   C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,                          ');
      SQL.Add('   S.CODSUBCONTA, SC.NOMESUBCONTA,                                     ');
      if CmpRptCM.ParamValues[11].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, C.PLANOME,          ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,                 ');
      end;
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
      end else begin
         SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
      end;
      SQL.Add('   M.DEB,M.CRED,M.MOV, SA.SALDOANT,  ');
      SQL.Add('   SUM(NVL(S.PLSDEBITOCORRENTE, 0)           ');
      SQL.Add('   - NVL(S.PLSCREDITOCOR, 0)) AS SALDO       ');
      SQL.Add('FROM                                                                   ');
      SQL.Add('   PLANOSALDO S, SUBCONTA SC, PLANOCONTA C, UNIDNEGOCIO U,             ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),CmpRptCM.ParamValues[0].AsInteger,CrmRptCM.IdEmpresa)+' PD, ');
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
         SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
         SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
      end;
      SQL.Add('   (SELECT                                                             ');
      SQL.Add('       PLACONTA,CODSUBCONTA,UNIDNEGOC,SUM(NVL(PLSDEBITOCORRENTE,0)');
      SQL.Add('                   - NVL(PLSCREDITOCOR,0)) AS SALDOANT         ');
      SQL.Add('    FROM PLANOSALDO                                                    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                          ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                               ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND        ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                        ');
      SQL.Add('    GROUP BY PLACONTA,CODSUBCONTA,UNIDNEGOC ) SA,                      ');
      SQL.Add('   (SELECT                                                             ');
      SQL.Add('       PLACONTA,CODSUBCONTA,UNIDNEGOC,                                 ');
      SQL.Add('       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,                                  ');
      SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)) AS CRED,                                     ');
      SQL.Add('       (SUM(NVL(PLSDEBITOCORRENTE,0)) - SUM(NVL(PLSCREDITOCOR,0))) AS MOV     ');
      SQL.Add('    FROM PLANOSALDO                                                    ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                          ');
      SQL.Add('          (PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND       ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                               ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add('       (UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND              ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                                   ');
      end;
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                        ');
      SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA,UNIDNEGOC ) M                       ');
      SQL.Add('WHERE                                                                  ');

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) >=:UNIDNEGOCINI) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) <=:UNIDNEGOCFIM) AND                               ');
      end;
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND               ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                                    ');
      end;
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND               ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                                    ');
      end;

      if CmpRptCM.ParamValues[13].asBoolean then begin
         SQL.Add('    (C.PLATIPO = ''A'') AND                                   ');
      end;

      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                                     ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                        ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                        ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                  ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                        ');

      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND                               ');
      SQL.Add('    (SA.CODSUBCONTA(+) = S.CODSUBCONTA) AND                            ');
      SQL.Add('    (SA.UNIDNEGOC(+)   = S.UNIDNEGOC) AND                              ');
      SQL.Add('    (M.PLACONTA(+)     = S.PLACONTA) AND                               ');
      SQL.Add('    (M.CODSUBCONTA(+)  = S.CODSUBCONTA) AND                            ');
      SQL.Add('    (M.UNIDNEGOC(+)    = S.UNIDNEGOC) AND                              ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                              ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                                ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND          ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                        ');
      SQL.Add('    (SC.CODSUBCONTA = S.CODSUBCONTA) AND                               ');
      SQL.Add('    (SC.IDPESSOA = S.IDPESSOA) AND                                     ');
      SQL.Add('    (U.UNIDNEGOC = S.UNIDNEGOC) AND                                    ');
      SQL.Add('    (U.IDPESSOA = S.IDPESSOA) AND                                      ');
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
      end;
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                                      ');
      SQL.Add('    (S.PLANO = C.PLANO)                                                ');
      SQL.Add('GROUP BY                                                               ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA,   ');
      SQL.Add('   S.CODSUBCONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), SC.NOMESUBCONTA,      ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,           ');
      if CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
      end else begin
         SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
      end;
      SQL.Add('   SA.SALDOANT)) U                                                     ');
      SQL.Add('WHERE                                                                  ');
      SQL.Add('   (U.DEB <> 0) OR (U.CRED <> 0) OR (U.SALDOANT <> 0) OR (U.UNIDNEGOC = 0) OR (U.CODSUBCONTA = 0) ');
      SQL.Add('GROUP BY                                                               ');
      SQL.Add('   U.PLACONTA, U.PLAGRAU, U.GRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, U.CODSUBCONTA,');
      SQL.Add('   U.NOMESUBCONTA, U.CONTA, U.PLANOMEOUTLING, U.PLANOME, U.UNIDNEGOC, U.NOME, U.UNECODIGO  ');
      SQL.Add(' ORDER BY U.PLACONTA, U.UNECODIGO, U.NOMESUBCONTA                      ');

      Prepare;

      ParamByName('PLANO').asInteger      := iPlano;
      ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asInteger  := CmpRptCM.ParamValues[0].asInteger;
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

      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
         ParamByName('CCUSTOINI').asString   := trim(CmpRptCM.ParamValues[5].asString);
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
         //dtmRelatoriosContabil2.sCCustoIni   := trim(CmpRptCM.ParamValues[5].asString);
      end;

      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
         ParamByName('CCUSTOFIM').asString   := trim(CmpRptCM.ParamValues[6].asString);
         ParamByName('EMPRESA').asFloat     := CrmRptCM.IdEmpresa;
         //dtmRelatoriosContabil2.sCCustoFim   := trim(mskCCustoFim.text);
      end;

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         ParamByName('UNIDNEGOCINI').asInteger  := StrToInt(CmpRptCM.ParamValues[7].asString);
        // dtmRelatoriosContabil2.sAtivProjIni    := trim(mskAtivProjIni.text);
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         ParamByName('UNIDNEGOCFIM').asInteger  := StrToInt(CmpRptCM.ParamValues[8].asString);
         //dtmRelatoriosContabil2.sAtivProjFim    := trim(mskAtivProjFim.text);
      end;

      sMascara          := '';
      sMascaraUnidNegoc := '';
      if CmpRptCM.ParamValues[9].asBoolean then begin
         sMascara          := sMascaraPlano;
         sMascaraUnidNegoc := modulo.sMascaraUnidNegoc;
      end;

      Open;

      // Simula o onCalcfield
      cdsBalAnalAPSC.First;
      while not cdsBalAnalAPSC.Eof do
      begin

         //Gera a label de débito/crédito

         cdsBalAnalAPSC.Edit;

         if cdsBalAnalAPSC.FieldByName('SALDO').asFloat = 0 then begin
            cdsBalAnalAPSC.FieldByName('DEBCRESALDO').asString := ' ';
         end;
         if cdsBalAnalAPSC.FieldByName('SALDO').asFloat < 0 then begin
            cdsBalAnalAPSC.FieldByName('DEBCRESALDO').asString := 'C';
         end else begin
            cdsBalAnalAPSC.FieldByName('DEBCRESALDO').asString := 'D';
         end;

         if cdsBalAnalAPSC.FieldByName('SALDOANT').asFloat = 0 then begin
            cdsBalAnalAPSC.FieldByName('DEBCREANT').asString := ' ';
         end;
         if cdsBalAnalAPSC.FieldByName('SALDOANT').asFloat < 0 then begin
            cdsBalAnalAPSC.FieldByName('DEBCREANT').asString := 'C';
         end else begin
            cdsBalAnalAPSC.FieldByName('DEBCREANT').asString := 'D';
         end;

         //Tira o sinal dos saldos
         cdsBalAnalAPSC.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalAnalAPSC.FieldByName('SALDOANT').asFloat);
         cdsBalAnalAPSC.FieldByName('SALDOABS').asFloat    := ABS(cdsBalAnalAPSC.FieldByName('SALDO').asFloat);

         //Indenta o Nome da Conta Contábil de acordo com o grau
         sEspacos := '';

         if CmpRptCM.ParamValues[12].asBoolean then begin
            for i := 1 to ((cdsBalAnalAPSC.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
               sEspacos := sEspacos + ' ';
            end;
         end;

         cdsBalAnalAPSC.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalAnalAPSC.FieldByName('CONTA').asString);

         cdsBalAnalAPSC.Post;
         cdsBalAnalAPSC.Next;
      end;

   end;


end;

procedure TrptBalanceteAnalAPSC.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
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

procedure TrptBalanceteAnalAPSC.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;

   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      1: sNomePer1  :=Trim(TPainelControles(Sender).CtrlLookup.Text);
      2: sNomePer2  :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;


procedure TrptBalanceteAnalAPSC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptBalanceteAnalAPSC.CmpRptCMParamControlEnter(
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

procedure TrptBalanceteAnalAPSC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlRptBalancete.free;

end;

end.
