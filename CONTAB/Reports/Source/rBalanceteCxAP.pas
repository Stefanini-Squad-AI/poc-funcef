{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Analista  : Marcus Oliveira
 Pendência : 15340
 Descrição : Subtituir o codcentrocusto para codExterno no relatório mantendo
             o join pelo centrodecusto
--------------------------------------------------------------------------------}

unit rBalanceteCxAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport,uCtrlContab, TXRB;

type
  TrptBalanceteCxAP = class(TFrmCmReport)
    rptBalCxAP: TppReport;
    ppHeaderBand5: TppHeaderBand;
    pplblTituloBalCxAP: TppLabel;
    ppLine14: TppLine;
    LblEmpresa: TppLabel;
    ppLine15: TppLine;
    ppLabel29: TppLabel;
    pplblTituloBalCxAP2: TppLabel;
    ppLabel36: TppLabel;
    txtSaldoAntBal: TppLabel;
    txtDebBal: TppLabel;
    txtCredBal: TppLabel;
    txtMovBal: TppLabel;
    rptBalCxAPLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    rptBalCxAPDBText2: TppDBText;
    dbtxtUnidNegocBalCxAP: TppDBText;
    rptBalCxAPDBText1: TppDBText;
    rptBalCxAPDBText3: TppDBText;
    dbtxtMovDCBal: TppDBText;
    dbtxtMovBal: TppDBText;
    dbtxtCredBal: TppDBText;
    dbtxtDebBal: TppDBText;
    dbtxtSaldoAntDCBal: TppDBText;
    dbtxtSaldoAntBal: TppDBText;
    rptBalCxAPDBText5: TppDBText;
    dbtxtNomeContaBalCxAP: TppDBText;
    dbtxtContaBalCxAP: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine17: TppLine;
    lblsistema: TppLabel;
    rptBalCxAPLabel1: TppLabel;
    lblContBalCxAP: TppLabel;
    ppCalc10: TppSystemVariable;
    lblCalcBalCxAP: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    pplBalCxAP: TppBDEPipeline;
    pplBalCxAPppField1: TppField;
    pplBalCxAPppField2: TppField;
    pplBalCxAPppField3: TppField;
    pplBalCxAPppField4: TppField;
    pplBalCxAPppField5: TppField;
    pplBalCxAPppField6: TppField;
    pplBalCxAPppField7: TppField;
    pplBalCxAPppField8: TppField;
    pplBalCxAPppField9: TppField;
    pplBalCxAPppField10: TppField;
    pplBalCxAPppField11: TppField;
    pplBalCxAPppField12: TppField;
    pplBalCxAPppField13: TppField;
    pplBalCxAPppField14: TppField;
    pplBalCxAPppField15: TppField;
    pplBalCxAPppField16: TppField;
    pplBalCxAPppField17: TppField;
    pplBalCxAPppField18: TppField;
    pplBalCxAPppField19: TppField;
    pplBalCxAPppField20: TppField;
    pplBalCxAPppField21: TppField;
    pplBalCxAPppField22: TppField;
    pplBalCxAPppField23: TppField;
    pplBalCxAPppField24: TppField;
    dsBalCxAP: TwwDataSource;
    cdsBalCxAP: TCMClientDataSet;
    sqlBalCxAP: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppFooterBand5BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ppHeaderBand5BeforePrint(Sender: TObject);
  private
    sTitulo,sMascara,sMascaraUnidNegoc,sTipoCodigo,sEspacos :string;
    sMascaraPlano : String;
    iNumero,iGrau,iNumDig,iPagIni,iPlano,iNumColunas,iPlanoAtu :Integer;
    sPeriodoInicial  : String;
    sPeriodoFinal    : String;

    CtrlContab       : TCtrlContab;
    CtrlRptBalancete :TCtrlRptBalancete;

  public
    { Public declarations }
  end;

var
  rptBalanceteCxAP: TrptBalanceteCxAP;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, uCtrlParamIntegra, FSM_FxLib;

{$R *.DFM}

procedure TrptBalanceteCxAP.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalCxAP.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalCxAP.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBalCxAP.DisplayFormat := sMascara + ';0; ';
   end;

   if sMascaraUnidNegoc <> '' then begin
      sMascaraUnidNegoc := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraUnidNegoc, FuncaoGeral.CalcGrau(modulo.sMascaraUnidNegoc, cdsBalCxAP.FieldByName('UNECODIGO').asString));
      dbtxtUnidNegocBalCxAP.DisplayFormat := sMascaraUnidNegoc + ';0; ';
   end;

end;

procedure TrptBalanceteCxAP.ppFooterBand5BeforePrint(Sender: TObject);
begin
  inherited;
   lblContBalCxAP.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalCxAP.text)) - 1);

end;

procedure TrptBalanceteCxAP.CrmRptCMBeforePrint(Sender: TObject);
var i:integer;
begin
  inherited;

    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sTipoCodigo := CtrlContab.TipoOpEncer;
       iPlanoAtu   := CtrlContab.PlanoParam;
     end else
    begin
       sTipoCodigo := '';
    end;

   iNumDig := 0;
   if CmpRptCM.ParamValues[19].asBoolean then begin
      iGrau := FuncaoGeral.CalcGrauMax(Modulo.sMascaraUnidNegoc);
      iNumDig :=FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraUnidNegoc,(iGrau-1));
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
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlTitulos.Open;
   sPeriodoInicial := cdsTitulos.FieldByName('PERNOME').asString;
   //==================================================================
   // Pega o Plano vigente
   //==================================================================
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := iPlanoAtu;

   sMascaraPlano := CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
    //sMascaraPlano := ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043
   //=====================================================================
   sqlTitulos.Prepare;
   sqlTitulos.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlTitulos.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlTitulos.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlTitulos.Open;
   sPeriodoFinal := cdsTitulos.FieldByName('PERNOME').asString;
   //=====================================================================

   if CmpRptCM.ParamValues[21].asString = '' then
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
               sTitulo := 'Balancete de Contas x Ativ./Projeto - ' +  sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete de Contas x Ativ./Projeto - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete de Contas x  Ativ./Projeto Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete de Contas x Ativ./Projeto Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      end;

      //Imprime os títulos
      pplblTituloBalCxAP.caption := sTitulo;

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

      pplblTituloBalCxAP2.caption := sTitulo;
   end else
   begin
      pplblTituloBalCxAP.caption  := CmpRptCM.ParamValues[21].asString;
      pplblTituloBalCxAP2.caption := CmpRptCM.ParamValues[22].asString;
   end;

   if CmpRptCM.ParamValues[11].asBoolean then
   begin
      rptBalCxAP.Groups[0].NewPage := true;
   end else
   begin
      rptBalCxAP.Groups[0].NewPage := false;
   end;

   iNumero := FuncaoGeral.CalcNumEleGrau(sMascaraPlano, 1);
   iPagIni := CmpRptCM.ParamValues[20].asInteger;
   iNumColunas := CmpRptCM.ParamValues[9].asInteger + 3;

   with sqlBalCxAP do
   begin
      SQL.Clear;
      SQL.Add('SELECT  /*+ RULE */                                              ');
      SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP,            ');
      SQL.Add('   U.PLANATUREZA, U.UNIDNEGOC,                                   ');
      SQL.Add('   U.NOME, U.UNECODIGO,                                          ');
      SQL.Add('   U.GRAU, U.CONTA, U.PLANOMEOUTLING, U.PLANOME,          ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   ('' '') AS DEBCREANT, ('' '') AS DEBCRESALDO, (0) AS SALDOABS, (0) AS SALDOANTABS,  ');
      SQL.Add('   (0) AS MOVABS, ('' '') AS MOVDC,                                 ');
      SQL.Add('   SUM(NVL(U.DEB,0)) AS DEB,SUM(NVL(U.CRED,0)) AS CRED, SUM(NVL(U.MOV,0)) AS MOV,     ');
      SQL.Add('   SUM(NVL(U.SALDOANT,0)) AS SALDOANT, SUM(NVL(U.SALDO,0)) AS SALDO FROM (     ');
      if CmpRptCM.ParamValues[17].asBoolean then begin
         SQL.Add('(SELECT                                                          ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
         SQL.Add('   C.PLANATUREZA, (0) AS UNIDNEGOC,                              ');
         SQL.Add('   ('' '') AS NOME, ('' '') AS UNECODIGO,                        ');
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
         if CmpRptCM.ParamValues[12].asBoolean then begin
            SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ');
         end else begin
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS  CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
         end;
         SQL.Add('   S.DEB,                                  ');
         SQL.Add('   S.CRED,                                 ');
         SQL.Add('   S.MOV,                                  ');
         SQL.Add('   SA.SALDOANT,                            ');
         SQL.Add('   SS.SALDO                                ');
         SQL.Add('FROM                                                             ');
         SQL.Add('    PLANOCONTA C,                                                ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToIntDef(CmpRptCM.ParamValues[0].AsString,0),CrmRptCM.IdEmpresa)+' PD, ');
         SQL.Add('   (SELECT C.PLACONTA,                                           ');
         SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sTipoCodigo+''') AND                ');
         SQL.Add('          (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].asString + ') AND       ');
         SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
//         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
//         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
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
         SQL.Add('       (L.TIPCODIGO = '''+sTipoCodigo+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].asString + ') AND       ');
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
//         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
//         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
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
         SQL.Add('       (L.TIPCODIGO = '''+sTipoCodigo+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].asString + ') AND       ');
         SQL.Add('       (P.PERNUMERO <=' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
 //        if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
//         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')           ');
         SQL.Add('    GROUP BY C.PLACONTA ) SS                                  ');
         SQL.Add('                                                              ');
         SQL.Add('WHERE                                                         ');
         SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');

         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                 ');
         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                           ');

         if CmpRptCM.ParamValues[18].asBoolean then begin
            SQL.Add('  (C.PLAGRUPO <> ''E'') AND                                ');
         end;
         SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND                  ');
         SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                      ');
         if CmpRptCM.ParamValues[16].asBoolean then begin
            SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
            SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
         end;
         SQL.Add('GROUP BY                                                         ');
         SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
         SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
         SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
         SQL.Add('    S.DEB,                                                       ');
         SQL.Add('    S.CRED,                                                      ');
         SQL.Add('    S.MOV )                                                      ');
         SQL.Add('UNION ALL                                                        ');
         SQL.Add('(SELECT                                                          ');
         SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
         SQL.Add('   C.PLANATUREZA, ');
         if CmpRptCM.ParamValues[19].asBoolean then begin
            SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,                       ');
         end else begin
            SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,                          ');
         end;
         SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
         if CmpRptCM.ParamValues[12].asBoolean then
            SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ')
         else
            SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
         SQL.Add('   S.DEB, S.CRED, S.MOV,                                         ');
         SQL.Add('   SA.SALDOANT,                                                  ');
         SQL.Add('   SS.SALDO                                                      ');
         SQL.Add('FROM                                                             ');
         SQL.Add('   UNIDNEGOCIO U, PLANOCONTA C,                                  ');
         SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToIntDef(CmpRptCM.ParamValues[0].AsString,0),CrmRptCM.IdEmpresa)+' PD, ');
         if CmpRptCM.ParamValues[19].asBoolean then begin
            SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
            SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
            SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
         end;
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC,                              ');
         SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sTipoCodigo+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].asString + ') AND       ');
         SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[1].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
//         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
//         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
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
         SQL.Add('       (L.TIPCODIGO = '''+sTipoCodigo+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].asString + ') AND       ');
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
//         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
//         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')                  ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC ) S,                            ');
         SQL.Add('                                                                     ');
         SQL.Add('   (SELECT C.PLACONTA, L.UNIDNEGOC,                                  ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('       (L.TIPCODIGO = '''+sTipoCodigo+''') AND ');
         SQL.Add('       (P.PEREXERCICIO =' + CmpRptCM.ParamValues[0].asString + ') AND       ');
         SQL.Add('       (P.PERNUMERO <=' + GetFirstNotEmpty('0', [CmpRptCM.ParamValues[2].asString])+') AND ');
         if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC >= ' + trim(CmpRptCM.ParamValues[7].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
         if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
            SQL.Add('       ((L.UNIDNEGOC <= ' + trim(CmpRptCM.ParamValues[8].asString) + ') AND   ');
            SQL.Add('       (L.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
         end;
//         if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
//         if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//            SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//            SQL.Add('       (L.IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//         end;
         SQL.Add('          (P.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
         SQL.Add('          (L.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND              ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')            ');
         SQL.Add('    GROUP BY C.PLACONTA, L.UNIDNEGOC ) SS                      ');
         SQL.Add('                                                               ');
         SQL.Add('WHERE                                                          ');
         SQL.Add('    (S.PLACONTA(+) = SS.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = SS.PLACONTA) AND                         ');
         SQL.Add('    (S.UNIDNEGOC(+) = SS.UNIDNEGOC) AND                        ');
         SQL.Add('    (SA.UNIDNEGOC(+) = SS.UNIDNEGOC) AND                       ');
         SQL.Add('    (SS.PLACONTA = C.PLACONTA) AND                             ');
         SQL.Add('    (SS.UNIDNEGOC = U.UNIDNEGOC) AND                           ');

         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                 ');
         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                           ');

         if CmpRptCM.ParamValues[19].asBoolean then begin
            SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
         end;
         if CmpRptCM.ParamValues[14].asBoolean then begin
            SQL.Add('    (C.PLATIPO = ''A'') AND                                   ');
         end;
         if CmpRptCM.ParamValues[18].asBoolean then begin
            SQL.Add('  (C.PLAGRUPO <> ''E'') AND                           ');
         end;
         SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND   ');
         SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',
                  [CmpRptCM.ParamValues[3].asString]), ' ', 18)) + ') AND         ');
         SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',
                  [CmpRptCM.ParamValues[4].asString]), ' ', 18)) + ')             ');
         if CmpRptCM.ParamValues[16].asBoolean then begin
            SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR        ');
            SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))        ');
         end;
         SQL.Add('GROUP BY                                                        ');
         SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                          ');
         SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                        ');
         SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,               ');
         if CmpRptCM.ParamValues[19].asBoolean then begin
            SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,                    ');
         end else begin
            SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,                       ');
         end;
         SQL.Add('    S.DEB,                                                    ');
         SQL.Add('    S.CRED,                                                   ');
         SQL.Add('    S.MOV )                                                   ');
         SQL.Add('UNION ALL                                                     ');
      end;
      SQL.Add('(SELECT                                                          ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   C.PLANATUREZA, (0) AS UNIDNEGOC,                              ');
      SQL.Add('   ('' '') AS NOME, ('' '') AS UNECODIGO,                        ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[12].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      end;
      SQL.Add('   M.DEB,                                  ');
      SQL.Add('   M.CRED,                                 ');
      SQL.Add('   M.MOV,                                  ');
      SQL.Add('   SA.SALDOANT,                            ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
      SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, PLANOCONTA C, CENTCUST CC,                           '); //Adicionado o CentCust Marcus 15340
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToIntDef(CmpRptCM.ParamValues[0].AsString,0),CrmRptCM.IdEmpresa)+' PD, ');
      SQL.Add('   (SELECT                                                            ');
      SQL.Add('       S.PLACONTA,                                                    ');
      SQL.Add('       SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
      SQL.Add('                   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT ');
      SQL.Add('    FROM PLANOSALDO S                                   ');
      SQL.Add('    WHERE (S.PLANO =:PLANO) AND                                      ');
      SQL.Add('          (S.PEREXERCICIO =:EXERCICIO) AND                           ');
      SQL.Add('          ((S.PERNUMERO <:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
      SQL.Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC >=:UNIDNEGOCINI) AND                        ');
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC <=:UNIDNEGOCFIM) AND                        ');
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;

      SQL.Add('          (RTRIM(S.PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(S.PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY S.PLACONTA ) SA,                                      ');
      SQL.Add('   (SELECT                                                         ');
      SQL.Add('       S.PLACONTA,                                                 ');
      SQL.Add('       SUM(S.PLSDEBITOCORRENTE) AS DEB,                            ');
      SQL.Add('       SUM(S.PLSCREDITOCOR) AS CRED,                               ');
      SQL.Add('       (SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)) AS MOV    ');
      SQL.Add('    FROM PLANOSALDO S, CENTCUST CC                                 '); //Marcus 15340 08/03/2007
      SQL.Add('    WHERE (S.PLANO =:PLANO) AND                                    ');
      SQL.Add('          (S.PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND    ');
      SQL.Add('          (S.PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC >=:UNIDNEGOCINI) AND                        ');
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC <=:UNIDNEGOCFIM) AND                        ');
        //Marcus Oliveira 15340 - 08/03/2007 Inicio
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
//      begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
//      begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;

      SQL.Add('          (RTRIM(S.PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(S.PLACONTA) <= RTRIM(:CONTAFIM))                  ');
      SQL.Add('    GROUP BY S.PLACONTA ) M                                        ');
      SQL.Add('WHERE                                                              ');
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC >=:UNIDNEGOCINI) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC <=:UNIDNEGOCFIM) AND                              ');
      end;
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add(' (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND         ');
//         SQL.Add(' (S.IDEMPRESA =:EMPRESA)) AND                              ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add(' (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND          ');
//         SQL.Add(' (S.IDEMPRESA =:EMPRESA)) AND                               ');
//      end;
      //Marcus Oliveira 15340 - 08/03/2007
      SQL.ADD('  (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ');
      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
      SQL.Add('  (RTRIM(CC.CODEXTERNO) >= RTRIM('+ QuotedStr( CmpRptCM.ParamValues[5].asString ) + ' ) ) AND   ');
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
      SQL.Add('  (RTRIM(CC.CODEXTERNO) <= RTRIM('+ QuotedStr( CmpRptCM.ParamValues[6].asString ) + ' ) ) AND   ');

      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                ');
      if CmpRptCM.ParamValues[18].asBoolean then begin
         SQL.Add('  (C.PLAGRUPO <> ''E'') AND                                 ');
      end;
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                 ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                           ');
      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND                         ');
      SQL.Add('    (M.PLACONTA(+)     = S.PLACONTA) AND                         ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO =:EXERCICIO) AND                             ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND   ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                  ');
      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                                ');
      SQL.Add('    (S.PLANO = C.PLANO)                                          ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLANATUREZA,  ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,                         ');
      SQL.Add('   SA.SALDOANT )                                                 ');
      SQL.Add('UNION ALL                                                        ');
      SQL.Add('(SELECT                                                          ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   C.PLANATUREZA,                                                ');
      if CmpRptCM.ParamValues[19].asBoolean then begin
         SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,                       ');
      end else begin
         SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,                          ');
      end;
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[12].asBoolean then
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ')
      else
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      SQL.Add('   M.DEB, M.CRED, M.MOV,                                         ');
      SQL.Add('   SA.SALDOANT,                                                  ');
      SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
      SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, UNIDNEGOCIO U, PLANOCONTA C, CENTCUST CC,       ');  //Marcus Oliveira 15340 Adicionado o CentCust
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(StrToIntDef(CmpRptCM.ParamValues[1].AsString,0),StrToIntDef(CmpRptCM.ParamValues[0].AsString,0),CrmRptCM.IdEmpresa)+' PD, ');
      if CmpRptCM.ParamValues[19].asBoolean then begin
         SQL.Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO         ');
         SQL.Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
         SQL.Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                          ');
      end;
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       S.PLACONTA,                                                 ');
      SQL.Add('       S.UNIDNEGOC,SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)    ');
      SQL.Add('                   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT ');
      SQL.Add('    FROM PLANOSALDO S                              '); 
      SQL.Add('    WHERE (S.PLANO =:PLANO) AND                                    ');
      SQL.Add('          (S.PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((S.PERNUMERO <:PERIODOINI) OR (S.PERNUMERO IS NULL)) AND  ');
      SQL.Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC >=:UNIDNEGOCINI) AND                        ');
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC <=:UNIDNEGOCFIM) AND                        ');
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
      SQL.Add('          (RTRIM(S.PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(S.PLACONTA) <= RTRIM(:CONTAFIM))                  ');
      SQL.Add('    GROUP BY S.PLACONTA,S.UNIDNEGOC ) SA,                          ');
      SQL.Add('   (SELECT                                                         ');
      SQL.Add('       S.PLACONTA,S.UNIDNEGOC,                                     ');
      SQL.Add('       SUM(S.PLSDEBITOCORRENTE) AS DEB,                            ');
      SQL.Add('       SUM(S.PLSCREDITOCOR) AS CRED,                               ');
      SQL.Add('       (SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)) AS MOV    ');
      SQL.Add('    FROM PLANOSALDO S                                ');
      SQL.Add('    WHERE (S.PLANO =:PLANO) AND                                    ');
      SQL.Add('          (S.PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND    ');
      SQL.Add('          (S.PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (S.IDPESSOA =:IDPESSOA) AND                              ');
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC >=:UNIDNEGOCINI) AND                        ');
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then
         SQL.Add('       (S.UNIDNEGOC <=:UNIDNEGOCFIM) AND                        ');
         //Marcus Oliveira 15340 - 09/03/2007 iNICIO
         //      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
//      begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add('       (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
//         SQL.Add('       (S.IDEMPRESA =:EMPRESA)) AND                             ');
//      end;

      SQL.Add('          (RTRIM(S.PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(S.PLACONTA) <= RTRIM(:CONTAFIM))                  ');
      SQL.Add('    GROUP BY S.PLACONTA, S.UNIDNEGOC ) M                           ');
      SQL.Add('WHERE                                                              ');
      if trim(CmpRptCM.ParamValues[7].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC >=:UNIDNEGOCINI) AND                         ');
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC <=:UNIDNEGOCFIM) AND                         ');
      end;
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add(' (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND         ');
//         SQL.Add(' (S.IDEMPRESA =:EMPRESA)) AND                              ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add(' (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND         ');
//         SQL.Add(' (S.IDEMPRESA =:EMPRESA)) AND                              ');
//      end;
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                               ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND               ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND               ');
      if CmpRptCM.ParamValues[18].asBoolean then begin
         SQL.Add('  (C.PLAGRUPO <> ''E'') AND                                 ');
      end;
      if CmpRptCM.ParamValues[14].asBoolean then begin
         SQL.Add('    (C.PLATIPO = ''A'') AND                                   ');
      end;
      if not CmpRptCM.ParamValues[15].asBoolean then begin
         SQL.Add(' (C.IDRATEIOAPEXTRA IS NULL) AND  ');
         SQL.Add(' ((C.PLARATEIOAP <> ''N'') OR (C.PLARATEIOAP IS NULL)) AND  ');
      end;
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                 ');
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                           ');
       //Marcus Oliveira 15340 - 08/03/2007 INICIO
      SQL.ADD('  (S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND ');

      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
      SQL.Add('  (RTRIM(CC.CODEXTERNO) >= RTRIM('+ QuotedStr( CmpRptCM.ParamValues[5].asString ) + ' ) ) AND   ');
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
      SQL.Add('  (RTRIM(CC.CODEXTERNO) <= RTRIM('+ QuotedStr( CmpRptCM.ParamValues[6].asString ) + ' ) ) AND   ');

      SQL.Add('    (SA.PLACONTA(+)    = S.PLACONTA) AND                         ');
      SQL.Add('    (SA.UNIDNEGOC(+)   = S.UNIDNEGOC) AND                        ');
      SQL.Add('    (M.PLACONTA(+)     = S.PLACONTA) AND                         ');
      SQL.Add('    (M.UNIDNEGOC(+)    = S.UNIDNEGOC) AND                        ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO =:EXERCICIO) AND                             ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND   ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                   ');
      SQL.Add('    (U.UNIDNEGOC = S.UNIDNEGOC) AND                               ');
      SQL.Add('    (U.IDPESSOA  = S.IDPESSOA) AND                                ');
      if CmpRptCM.ParamValues[19].asBoolean then begin
         SQL.Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO) AND ');
      end;
      SQL.Add('    (S.PLACONTA  = C.PLACONTA) AND                                 ');
      SQL.Add('    (S.PLANO     = C.PLANO)                                        ');
      SQL.Add('GROUP BY                                                           ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,              ');
      SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME),C.PLANATUREZA,     ');
      if CmpRptCM.ParamValues[19].asBoolean then begin
         SQL.Add('   U1.UNIDNEGOC, U1.NOME, U1.UNECODIGO,       ');
      end else begin
         SQL.Add('   U.UNIDNEGOC, U.NOME, U.UNECODIGO,          ');
      end;
      SQL.Add('   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,                         ');
      SQL.Add('   SA.SALDOANT )) U                                              ');
      SQL.Add('WHERE ((NVL(U.DEB,0) <> 0) OR (NVL(U.CRED,0) <> 0) OR (NVL(U.SALDOANT,0) <> 0) OR (U.UNIDNEGOC = 0))       ');
      if CmpRptCM.ParamValues[16].asBoolean then
      begin
         SQL.Add(' AND  (((U.PLANATUREZA = ''D'') AND (U.SALDO < 0)) OR          ');
         SQL.Add('      ((U.PLANATUREZA = ''C'') AND (U.SALDO >= 0)))           ');
      end;
      SQL.Add('GROUP BY            ');
      SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP,            ');
      SQL.Add('   U.PLANATUREZA, U.UNIDNEGOC,                                   ');
      SQL.Add('   U.NOME, U.UNECODIGO,                                          ');
      SQL.Add('   U.GRAU, U.CONTA, U.PLANOMEOUTLING, U.PLANOME                  ');
      SQL.Add('ORDER BY U.PLACONTA, U.UNECODIGO                                 ');

      Prepare;

      ParamByName('PLANO').asInteger      := iPlano;
      ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asFloat    := StrToFloat(CmpRptCM.ParamValues[0].asString);
      ParamByName('PERIODOINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
      ParamByName('PERIODOFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);

      if trim(CmpRptCM.ParamValues[3].asString) <> '' then begin
         ParamByName('CONTAINI').asString := trim(CmpRptCM.ParamValues[3].asString);
      end else begin
         ParamByName('CONTAINI').asString := '0';
      end;

      if trim(CmpRptCM.ParamValues[4].asString) <> '' then
         ParamByName('CONTAFIM').asString := trim(CmpRptCM.ParamValues[4].asString)
      else
         ParamByName('CONTAFIM').asString := '999999999999999999';
//
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
//      begin
//         ParamByName('CCUSTOINI').asString   := trim(CmpRptCM.ParamValues[5].asString);
//         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
//      end;
//
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
//      begin
//         ParamByName('CCUSTOFIM').asString   := trim(CmpRptCM.ParamValues[6].asString);
//         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
//      end;

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then
      begin
         ParamByName('UNIDNEGOCINI').asInteger  := StrToInt(CmpRptCM.ParamValues[7].asString);
      end;
      if trim(CmpRptCM.ParamValues[8].asString) <> '' then
      begin
         ParamByName('UNIDNEGOCFIM').asInteger  := StrToInt(CmpRptCM.ParamValues[8].asString);
      end;

      sMascara          := '';
      sMascaraUnidNegoc := '';
      if CmpRptCM.ParamValues[10].asBoolean then
      begin
         sMascara          := sMascaraPlano;
         sMascaraUnidNegoc := modulo.sMascaraUnidNegoc;
      end;
      Open;
      cdsBalCxAP.First;
      while not cdsBalCxAP.eof do
      begin
         cdsBalCxAP.Edit;

         if cdsBalCxAP.FieldByName('MOV').asFloat = 0 then begin
            cdsBalCxAP.FieldByName('MOVDC').asString := ' ';
         end;
         if cdsBalCxAP.FieldByName('MOV').asFloat < 0 then begin
            cdsBalCxAP.FieldByName('MOVDC').asString := 'C';
         end else begin
            cdsBalCxAP.FieldByName('MOVDC').asString := 'D';
         end;

         //Gera a label de débito/crédito
         if cdsBalCxAP.FieldByName('SALDO').asFloat = 0 then begin
            cdsBalCxAP.FieldByName('DEBCRESALDO').asString := ' ';
         end;
         if cdsBalCxAP.FieldByName('SALDO').asFloat < 0 then begin
            cdsBalCxAP.FieldByName('DEBCRESALDO').asString := 'C';
         end else begin
            cdsBalCxAP.FieldByName('DEBCRESALDO').asString := 'D';
         end;

         if cdsBalCxAP.FieldByName('SALDOANT').asFloat = 0 then begin
            cdsBalCxAP.FieldByName('DEBCREANT').asString := ' ';
         end;
         if cdsBalCxAP.FieldByName('SALDOANT').asFloat < 0 then begin
            cdsBalCxAP.FieldByName('DEBCREANT').asString := 'C';
         end else begin
            cdsBalCxAP.FieldByName('DEBCREANT').asString := 'D';
         end;

         //Tira o sinal dos saldos
         cdsBalCxAP.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalCxAP.FieldByName('SALDOANT').asFloat);
         cdsBalCxAP.FieldByName('SALDOABS').asFloat    := ABS(cdsBalCxAP.FieldByName('SALDO').asFloat);
         cdsBalCxAP.FieldByName('MOVABS').asFloat      := ABS(cdsBalCxAP.FieldByName('MOV').asFloat);

         //Indenta o Nome da Conta Contábil de acordo com o grau
         sEspacos := '';

         if CmpRptCM.ParamValues[13].asBoolean  then begin
            for i := 1 to ((cdsBalCxAP.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
               sEspacos := sEspacos + ' ';
            end;
         end;

         cdsBalCxAP.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalCxAP.FieldByName('CONTA').asString);

         cdsBalCxAP.Post;
         cdsBalCxAP.Next;
      end;

   end;

end;

procedure TrptBalanceteCxAP.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[20].SpinEditSettings.Value := 1;

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

procedure TrptBalanceteCxAP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlRptBalancete.free;

end;

procedure TrptBalanceteCxAP.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptBalanceteCxAP.ppHeaderBand5BeforePrint(Sender: TObject);
begin
  inherited;
   case iNumColunas of
      3: begin
            dbtxtSaldoAntBal.left   := 556;
            dbtxtSaldoAntDCBal.left := 659;
            dbtxtMovBal.left        := 772;
            dbtxtMovDCBal.left      := 867;
            dbtxtDebBal.visible     := false;
            dbtxtCredBal.visible    := false;
            dbtxtMovBal.visible     := true;
            dbtxtMovDCBal.visible   := true;

            txtSaldoAntBal.left   := 577;
            txtMovBal.left        := 800;
            txtDebBal.visible     := false;
            txtCredBal.visible    := false;
            txtMovBal.visible     := true;
         end;
      4: begin
            dbtxtSaldoAntBal.left   := 556;
            dbtxtSaldoAntDCBal.left := 659;
            dbtxtDebBal.left        := 671;
            dbtxtCredBal.left       := 799;

            dbtxtDebBal.visible     := true;
            dbtxtCredBal.visible    := true;

            dbtxtMovBal.visible     := false;
            dbtxtMovDCBal.visible   := false;

            txtSaldoAntBal.left   := 577;
            txtDebBal.left        := 734;
            txtCredBal.left       := 856;
            txtDebBal.visible     := true;
            txtCredBal.visible    := true;
            txtMovBal.visible     := false;
         end;
      5: begin
            dbtxtSaldoAntBal.left   := 508;
            dbtxtSaldoAntDCBal.left := 611;
            dbtxtMovBal.left        := 841;
            dbtxtMovDCBal.left      := 935;
            dbtxtDebBal.left        := 634;
            dbtxtCredBal.left       := 738;
            dbtxtDebBal.visible     := true;
            dbtxtCredBal.visible    := true;
            dbtxtMovBal.visible     := true;
            dbtxtMovDCBal.visible   := true;

            txtSaldoAntBal.left   := 521;
            txtMovBal.left        := 861;
            txtDebBal.left        := 671;
            txtCredBal.left       := 770;
            txtDebBal.visible     := true;
            txtCredBal.visible    := true;
            txtMovBal.visible     := true;
         end;
   end;

end;

end.
