{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteCxCC.CrmRptCMBeforePrint
 N. Sol's........: 134710
 N. Kintana's....: 796664
 Data............: 28/04/2010
 Responsável.....: Fábio Henrique Beccaria Sampaio
 Descrição.......: Correção para obter o Plano correspondente a data inicial
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteCxCC.ppFooterBand2BeforePrint
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 01/06/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado
--------------------------------------------------------------------------------
 Analista  : Marcus Oliveira
 Pendência : 15341
 Descrição : Subtituir o codcentrocusto para codExterno no relatório mantendo
             o join pelo centrodecusto
--------------------------------------------------------------------------------}

unit rBalanceteCxCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, TXRB, uCtrlContab;

type
  TrptBalanceteCxCC = class(TFrmCmReport)
    dsBalCxCC: TwwDataSource;
    pplBalCxCC: TppBDEPipeline;
    rptBalCxCC: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLblTituloBalCxCC: TppLabel;
    ppLine5: TppLine;
    LblEmpresa: TppLabel;
    ppLine6: TppLine;
    ppLabel11: TppLabel;
    ppLblTituloBalCxCC2: TppLabel;
    rptBalCxCCLabel2: TppLabel;
    rptBalCxCCLabel1: TppLabel;
    txtMovBalCxCC: TppLabel;
    txtCredBalCxCC: TppLabel;
    txtDebBalCxCC: TppLabel;
    txtSaldoAntBalCxCC: TppLabel;
    bndDetBalCxCC: TppDetailBand;
    dbtxtContaBalCxCC: TppDBText;
    rptBalCxCCDBText2: TppDBText;
    dbtxtNomeContaBalCxCC: TppDBText;
    dbtxtCCustBalCxCC: TppDBText;
    rptBalCxCCDBText5: TppDBText;
    dbtxtSaldoAntBalCxCC: TppDBText;
    dbtxtSaldoAntDCBalCxCC: TppDBText;
    dbtxtDebBalCxCC: TppDBText;
    dbtxtCredBalCxCC: TppDBText;
    dbtxtMovBalCxCC: TppDBText;
    dbtxtMovDCBalCxCC: TppDBText;
    rptBalCxCCDBText9: TppDBText;
    rptBalCxCCDBText10: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine7: TppLine;
    lblSistema: TppLabel;
    rptRazaoAnalLabel17: TppLabel;
    lblContBalCxCC: TppLabel;
    ppCalc6: TppSystemVariable;
    lblCalcBalCxCC: TppSystemVariable;
    rptBalCxCCGroup1: TppGroup;
    rptBalCxCCGroupHeaderBand1: TppGroupHeaderBand;
    rptBalCxCCGroupFooterBand1: TppGroupFooterBand;
    cdsBalCxCC: TCMClientDataSet;
    sqlBalCxCC: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    procedure ppFooterBand2BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure bndDetBalCxCCBeforePrint(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    sTitulo, sMascaraPlano,sMascaraCCusto,sMascara,sEspacos,sNomeExerc :string;
    iPagIni,iNumColunas,iPlano,iNumero:Integer;
    sPeriodoInicial, sPeriodoFinal   :string;
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlContab       : TCtrlContab; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  public
    { Public declarations }
  end;

var
  rptBalanceteCxCC: TrptBalanceteCxCC;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra,FSM_FxLib;

{$R *.DFM}

procedure TrptBalanceteCxCC.ppFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
   lblContBalCxCC.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalCxCC.text)) - 1);

end;

procedure TrptBalanceteCxCC.CrmRptCMBeforePrint(Sender: TObject);
var i :integer;
begin
  inherited;
  // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
//   iPlano := ParamIntegra.Plano;
//   sMascaraPlano := ParamIntegra.MascaraPlano;
   iPlano := 0;
   sMascaraPlano := '';
   CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa);
   // Fim - Alterado por FHBS

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
   //=====================================================================

   // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsTitulos.FieldByName('PERDATINI').AsDateTime)) Then
      iPlano := CtrlContab.PlanoData;

   if iPlano = 0 then
      iPlano := CtrlContab.PlanoParam;

   sMascaraPlano := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
   //sMascaraPlano := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
   // Fim - Alterado por FHBS

   If CmpRptCM.ParamValues[16].asString = '' then begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
         ParamByName('PERNUMEROINI').asInteger := CmpRptCM.ParamValues[1].asInteger;
         ParamByName('PERNUMEROFIM').asInteger := CmpRptCM.ParamValues[2].asInteger;
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete de Contas x Centro de Custo - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete de Contas x Centro de Custo - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete de Contas x Centro de Custo Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete de Contas x Centro de Custo Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      End;

      //Imprime os títulos
      pplblTituloBalCxCC.caption := sTitulo;
      iNumColunas := CmpRptCM.ParamValues[8].AsInteger + 3;

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
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         sTitulo := sTitulo +  '     Atividade/Projeto : ' + CmpRptCM.ParamValues[7].AsString;
      end;

      pplblTituloBalCxCC2.caption := sTitulo;

   end else begin
      pplblTituloBalCxCC.caption  := CmpRptCM.ParamValues[16].AsString;
      pplblTituloBalCxCC2.caption := CmpRptCM.ParamValues[17].AsString;
   end;

   {dtmRelatoriosContabil2.iExercicio  := StrToInt(dblkExercicio.text);
   dtmRelatoriosContabil2.iPeriodoIni := qryPeriodoIni.FieldByName('PERNUMERO').asInteger;
   dtmRelatoriosContabil2.iPeriodoFim := qryPeriodoFim.FieldByName('PERNUMERO').asInteger;
   dtmRelatoriosContabil2.sCCustoIni  := mskCCustoIni.text;
   dtmRelatoriosContabil2.sCCustoFim  := mskCCustoFim.text; }


   //Configura a quebra de página
   if CmpRptCM.ParamValues[9].AsBoolean then begin
      rptBalCxCC.Groups[0].NewPage := true;
   end else begin
      rptBalCxCC.Groups[0].NewPage := false;
   end;

   iNumero := FuncaoGeral.CalcNumEleGrau(sMascaraPlano, 1);
   iPagIni := CmpRptCM.ParamValues[15].AsInteger;


   //Faz a query
   with sqlBalCxCC do begin
      SQL.Clear;
      SQL.Add('SELECT  /*+ RULE */                                              ');
      //Marcus Oliveira 15341 05/03/2007
      sql.Add('   CODEXTERNO,                                                   ');
      SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP,            ');
      SQL.Add('   U.PLANATUREZA, U.CODCENTROCUSTO, U.NOME,                      ');
      SQL.Add('   ('''+'12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+
                       '12345678901234567890123456789012345678901234567890'+''') AS NOMEINDENTADO,  ');
      SQL.Add('   ('' '') AS DEBCREANT, ('' '') AS DEBCRESALDO, (0) AS SALDOABS, (0) AS SALDOANTABS,  ');
      SQL.Add('   (0) AS MOVABS, ('' '') AS MOVDC,                              ');
      SQL.Add('   U.GRAU, U.CONTA, U.PLANOMEOUTLING, U.PLANOME,                 ');
      SQL.Add('   U.DEB,U.CRED, U.MOV,                                          ');
      SQL.Add('   U.SALDOANT, U.SALDO FROM (                                    ');
      //Marcus Oliveira 15341 05/03/2007
      SQL.Add('SELECT                                                           ');

      // Rodolpho da Silva - P: 24973 - 02/04/2007
      //SQL.Add('   S.CODEXTERNO,                                                  ');
      SQL.Add('   '' '' AS CODEXTERNO,                                          ');

      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   C.PLANATUREZA, ('' '') AS CODCENTROCUSTO,                     ');
      SQL.Add('   ('' '') AS NOME,                                              ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[11].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      end;
      SQL.Add('   S.DEB,                                                        ');
      SQL.Add('   S.CRED,                                                       ');
      SQL.Add('   S.MOV,                                                        ');
      SQL.Add('   SA.SALDOANT, SS.SALDO                                         ');
      SQL.Add('FROM                                                             ');
      SQL.Add('    PLANOCONTA C,                                                ');
      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD, ');
      SQL.Add('   (SELECT PLACONTA,                                             ');
      SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
      SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                                ');
      SQL.Add('    WHERE                                                        ');
      SQL.Add('       (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND         ');
      SQL.Add('       ((PERNUMERO < :PERIODOINI) OR (PERNUMERO IS NULL)) AND ');
      
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
         SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;

      //Marcus Oliveira 15341 18/04/2007 inicio
      if CmpRptCM.ParamValues[5].AsString <> '' then
        SQL.ADD('  (CC.CODEXTERNO >= ' + QuotedStr( CmpRptCM.ParamValues[5].AsString ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
        SQL.ADD('  (CC.CODEXTERNO <= ' + QuotedStr( CmpRptCM.ParamValues[6].AsString ) + ') AND ');

      SQL.ADD('   (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND                         ');
      //Marcus Oliveira 15341 Fim

//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
//      begin
//         SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//         SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
//      begin
//         SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//         SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND        ');
//      end;
      SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND         ');
      SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND                          ');
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND                      ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                          ');
      SQL.Add('    GROUP BY PLACONTA ) SA,                                              ');
      SQL.Add('                                                                         ');

      // Rodolpho da Silva - P: 24973 -02/04/2007
      //SQL.Add('   (SELECT PS.PLACONTA, PS.CODCENTROCUSTO,  CC.CODEXTERNO,               ');


      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
      //SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
      //SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
      //SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
      SQL.Add('   (SELECT PS.PLACONTA,                                                    ');

      if CmpRptCM.ParamValues[18].AsBoolean then
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
      SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                                      ');
      SQL.Add('    WHERE                                                                ');
      SQL.Add('       (PS.PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND   ');
      SQL.Add('       (PS.PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND  ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
      begin
         SQL.Add('    ((PS.UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
         SQL.Add('    (PS.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
      //Marcus Oliveira 05/03/2007 15341
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then
//      begin
//         SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//         SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
//      begin
//         SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//         SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
//      end;
      if CmpRptCM.ParamValues[5].AsString <> '' then
        SQL.ADD('    (CC.CODEXTERNO >= ' + QuotedStr( Espaco(CmpRptCM.ParamValues[5].AsString, 10 ) ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
        SQL.ADD('    (CC.CODEXTERNO <= ' + QuotedStr( Espaco(CmpRptCM.ParamValues[6].AsString, 10 ) ) + ') AND ');

      SQL.ADD('   (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND                         ');
     //Marcus Oliveira Fim

      SQL.Add('          (PS.IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      SQL.Add('          (PS.PLANO =' + IntToStr(iPlano) + ') AND   ');
      SQL.Add('          (RTRIM(PS.PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PS.PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      // Rodolpho da Silva - P: 24973  - 02/04/2007
      //SQL.Add('    GROUP BY PS.PLACONTA, PS.CODCENTROCUSTO, CC.CODEXTERNO ) S,                                       ');
      SQL.Add('    GROUP BY PS.PLACONTA ) S,                                    ');

      SQL.Add('                                                                 ');
      SQL.Add('   (SELECT PLACONTA,                                              ');

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      //SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');

      if CmpRptCM.ParamValues[18].AsBoolean then
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
      SQL.Add('          (PEREXERCICIO =' + CmpRptCM.ParamValues[0].AsString + ') AND      ');
      SQL.Add('          ((PERNUMERO <= :PERIODOFIM) OR (PERNUMERO IS NULL)) AND ');
      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC = ' + trim(CmpRptCM.ParamValues[7].AsString) + ') AND   ');
         SQL.Add('       (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ')) AND ');
      end;
 //     if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[5].asString,10)) + ') AND ');
//         SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND   ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(CmpRptCM.ParamValues[6].asString,10)) + ') AND ');
//         SQL.Add('       (IDEMPRESA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND                           ');
//      end;
      SQL.Add('          (IDPESSOA =' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ');
      SQL.Add('          (PLANO =' + IntToStr(iPlano) + ') AND                  ');
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');
      SQL.Add('    GROUP BY PLACONTA ) SS                                       ');
      SQL.Add('                                                                 ');
      SQL.Add('WHERE                                                            ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                             ');
      SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                            ');

      //Marcus Oliveira 15341 05/03/2007 fim
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');

      SQL.Add('    (C.PLANO =' + IntToStr(iPlano) + ') AND                      ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM))                      ');
      if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
         SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
      end;
      SQL.Add('GROUP BY                                                         ');

      // Rodolpho da Silva - P: 24973  - 02/04/2007
      //SQL.Add('    S.CODEXTERNO, C.PLACONTA, SA.SALDOANT, SS.SALDO,             '); //Adicionado CodExterno Marcus Oliveira
      SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,             '); 

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

      SQL.Add('UNION ALL                                                        ');

      SQL.Add('SELECT                                                           ');
      SQL.Add('   CC.CODEXTERNO, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, '); //Adicionado CodExterno Marcus Oliveira
      SQL.Add('   C.PLANATUREZA, S.CODCENTROCUSTO, CC.NOME, ');
      SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + IntToStr(iNumero) + ') AS GRAU,     ');
      if CmpRptCM.ParamValues[11].asBoolean then begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,    ');
      end else begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
      end;
      SQL.Add('   M.DEB, M.CRED, M.MOV,                                         ');
      SQL.Add('   SA.SALDOANT,                                                  ');

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
      //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');

      if CmpRptCM.ParamValues[18].AsBoolean then
      begin
        SQL.Add('    SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
        SQL.Add('      - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR) ');
        SQL.Add('      - NVL(S.PLSDEBITOENCERR,0) + NVL(S.PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('     SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)  ');
        SQL.Add('       - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
      end;
      //Marilza Colpani - Fim
      
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, CENTCUST CC, PLANOCONTA C,                      ');

      SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CmpRptCM.ParamValues[1].AsInteger,CmpRptCM.ParamValues[0].AsFloat,CrmRptCM.IdEmpresa)+' PD, ');

      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA,                                                 ');
      SQL.Add('       CODCENTROCUSTO,SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)    ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
  //    if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
//         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
//         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA,CODCENTROCUSTO ) SA,                       ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA,CODCENTROCUSTO,                                  ');

      //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                            ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                               ');
      
      if CmpRptCM.ParamValues[18].AsBoolean then
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
      end
      else
      begin
        SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('       SUM(PLSCREDITOCOR) AS CRED, ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV      ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
//      if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
//         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
//         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
//      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA, CODCENTROCUSTO ) M                        ');
      SQL.Add('WHERE                                                            ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC =:UNIDNEGOC) AND                             ');
      end;
 //     if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         SQL.Add(' (RTRIM(S.CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND         ');
//         SQL.Add(' (S.IDEMPRESA =:EMPRESA)) AND                              ');
//      end;
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         SQL.Add(' (RTRIM(S.CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND         ');
//         SQL.Add(' (S.IDEMPRESA =:EMPRESA)) AND                              ');
//      end;
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                               ');
      SQL.Add('    (S.IDEMPRESA =:IDPESSOA) AND                              ');
      if CmpRptCM.ParamValues[14].AsBoolean then begin
         SQL.Add('    (C.PLATIPO = ''A'') AND                                   ');
      end;
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                  ');
      //Marcus Oliveira 15341 05/03/2007 inicio
      if CmpRptCM.ParamValues[5].AsString <> '' then
        SQL.ADD('    (CODEXTERNO >= ' + QuotedStr(Espaco( CmpRptCM.ParamValues[5].AsString, 10 ) ) + ') AND ');
      if CmpRptCM.ParamValues[6].AsString <> '' then
        SQL.ADD('    (CODEXTERNO <= ' + QuotedStr(Espaco( CmpRptCM.ParamValues[6].AsString, 10 ) ) + ') AND ');

      SQL.Add('    (SA.PLACONTA(+)       = S.PLACONTA) AND                      ');
      SQL.Add('    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND                ');
      SQL.Add('    (M.PLACONTA(+)        = S.PLACONTA) AND                      ');
      SQL.Add('    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND                ');
      SQL.Add('    (S.PLANO =:PLANO) AND                                        ');
      SQL.Add('    (S.PEREXERCICIO =:EXERCICIO) AND                             ');
      SQL.Add('    ((S.PERNUMERO <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND   ');
      SQL.Add('    (S.IDPESSOA =:IDPESSOA) AND                                  ');
      //Marcus Oliveira Linha incorreta - gera erro de Operador relacional invalido
      //SQL.Add('    (CC.CODXETERNO AS CODCENTROCUSTO = S.CODCENTROCUSTO) AND                   ');
      SQL.Add('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND                   ');
      SQL.Add('    (CC.IDEMPRESA = S.IDEMPRESA) AND                             ');

      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');

      SQL.Add('    (S.PLACONTA = C.PLACONTA) AND                                ');
      SQL.Add('    (S.PLANO = C.PLANO)                                          ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('   CODEXTERNO,                                                   ');
      SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP,            ');
      SQL.Add('   S.CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), CC.NOME, C.PLANATUREZA,          ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, C.PLANOMEOUTLING,                         ');
      SQL.Add('   SA.SALDOANT  ) U                                              ');
      SQL.Add('WHERE ((U.DEB <> 0) OR (U.CRED <> 0) OR (U.SALDOANT <> 0))       ');
      if CmpRptCM.ParamValues[13].AsBoolean then begin
         SQL.Add(' AND (((U.PLANATUREZA = ''D'') AND (U.SALDO < 0)) OR          ');
         SQL.Add('      ((U.PLANATUREZA = ''C'') AND (U.SALDO >= 0)))           ');
      end;
      SQL.Add('ORDER BY U.PLACONTA, U.CODCENTROCUSTO                            ');

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

      //if trim(CmpRptCM.ParamValues[5].asString) <> '' then begin
//         ParamByName('CCUSTOINI').asString   := trim(CmpRptCM.ParamValues[5].asString);
//         ParamByName('EMPRESA').asFloat     := CrmRptCM.IdEmpresa;
//      end;
//
//      if trim(CmpRptCM.ParamValues[6].asString) <> '' then begin
//         ParamByName('CCUSTOFIM').asString   := trim(CmpRptCM.ParamValues[6].asString);
//         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
//      end;

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
         ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
      end;

      sMascara       := '';
      sMascaraCCusto := '';
      if CmpRptCM.ParamValues[12].AsBoolean then begin
         sMascara       := sMascaraPlano;
         sMascaraCCusto := modulo.sMascaraCCusto;
      end;

      Open;

      //*** simula o onCalcField ***
      cdsBalCxCC.First;
      while not cdsBalCxCC.Eof do
      begin
         cdsBalCxCC.Edit;
         //Gera a label de débito/crédito
         if cdsBalCxCC.FieldByName('MOV').asFloat = 0 then begin
            cdsBalCxCC.FieldByName('MOVDC').asString := ' ';
         end;
         if cdsBalCxCC.FieldByName('MOV').asFloat < 0 then begin
            cdsBalCxCC.FieldByName('MOVDC').asString := 'C';
         end else begin
            cdsBalCxCC.FieldByName('MOVDC').asString := 'D';
         end;

         //Gera a label de débito/crédito
         if cdsBalCxCC.FieldByName('SALDO').asFloat = 0 then begin
            cdsBalCxCC.FieldByName('DEBCRESALDO').asString := ' ';
         end;
         if cdsBalCxCC.FieldByName('SALDO').asFloat < 0 then begin
            cdsBalCxCC.FieldByName('DEBCRESALDO').asString := 'C';
         end else begin
            cdsBalCxCC.FieldByName('DEBCRESALDO').asString := 'D';
         end;

        if cdsBalCxCC.FieldByName('SALDOANT').asFloat = 0 then begin
           cdsBalCxCC.FieldByName('DEBCREANT').asString := ' ';
        end;
        if cdsBalCxCC.FieldByName('SALDOANT').asFloat < 0 then begin
           cdsBalCxCC.FieldByName('DEBCREANT').asString := 'C';
        end else begin
           cdsBalCxCC.FieldByName('DEBCREANT').asString := 'D';
        end;

        //Tira o sinal dos saldos
        cdsBalCxCC.FieldByName('SALDOANTABS').asFloat := ABS(cdsBalCxCC.FieldByName('SALDOANT').asFloat);
        cdsBalCxCC.FieldByName('SALDOABS').asFloat    := ABS(cdsBalCxCC.FieldByName('SALDO').asFloat);
        cdsBalCxCC.FieldByName('MOVABS').asFloat      := ABS(cdsBalCxCC.FieldByName('MOV').asFloat);

        //Indenta o Nome da Conta Contábil de acordo com o grau
        sEspacos := '';

        if CmpRptCM.ParamValues[10].AsBoolean then begin
           for i := 1 to ((cdsBalCxCC.FieldByName('PLAGRAU').asInteger - 1) * 5) do begin
              sEspacos := sEspacos + ' ';
           end;
        end;

        cdsBalCxCC.FieldByName('NOMEINDENTADO').asString := sEspacos + (cdsBalCxCC.FieldByName('CONTA').asString);

        cdsBalCxCC.Post;
        cdsBalCxCC.Next;
      end;


   end;
   //sqlBalCxCC.SQL.SaveToFile('C:\BalanceteContasCC');
end;

procedure TrptBalanceteCxCC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

end;

procedure TrptBalanceteCxCC.CmpRptCMParamControlEnter(
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

procedure TrptBalanceteCxCC.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptBalanceteCxCC.bndDetBalCxCCBeforePrint(Sender: TObject);
begin
  inherited;

   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, cdsBalCxCC.FieldByName('PLAGRAU').asInteger);     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, cdsBalCxCC.FieldByName('PLAGRAU').asInteger); //Everson Cunha - SIG102043
      dbtxtContaBalCxCC.DisplayFormat := sMascara + ';0; ';
   end;

   if sMascaraCCusto <> '' then begin
      sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraCCusto, FuncaoGeral.CalcGrau(modulo.sMascaraCCusto, cdsBalCxCC.FieldByName('CODCENTROCUSTO').asString));
      dbtxtCCustBalCxCC.DisplayFormat := sMascaraCCusto + ';0; ';
   end;

end;

procedure TrptBalanceteCxCC.ppHeaderBand2BeforePrint(Sender: TObject);
begin
  inherited;
   case iNumColunas of
      3: begin
            dbtxtSaldoAntBalCxCC.left   := 556;
            dbtxtSaldoAntDCBalCxCC.left := 659;
            dbtxtMovBalCxCC.left        := 770;
            dbtxtMovDCBalCxCC.left      := 870;
            dbtxtDebBalCxCC.visible     := false;
            dbtxtCredBalCxCC.visible    := false;
            dbtxtMovBalCxCC.visible     := true;
            dbtxtMovDCBalCxCC.visible   := true;

            txtSaldoAntBalCxCC.left   := 577;
            txtMovBalCxCC.left        := 800;
            txtDebBalCxCC.visible     := false;
            txtCredBalCxCC.visible    := false;
            txtMovBalCxCC.visible     := true;
         end;
      4: begin
            dbtxtSaldoAntBalCxCC.left   := 556;
            dbtxtSaldoAntDCBalCxCC.left := 659;
            dbtxtDebBalCxCC.left        := 687;
            dbtxtCredBalCxCC.left       := 813;
            dbtxtDebBalCxCC.visible     := true;
            dbtxtCredBalCxCC.visible    := true;
            dbtxtMovBalCxCC.visible     := false;
            dbtxtMovDCBalCxCC.visible   := false;

            txtSaldoAntBalCxCC.left   := 577;
            txtDebBalCxCC.left        := 734;
            txtCredBalCxCC.left       := 856;
            txtDebBalCxCC.visible     := true;
            txtCredBalCxCC.visible    := true;
            txtMovBalCxCC.visible     := false;
         end;
      5: begin
            dbtxtSaldoAntBalCxCC.left   := 500;
            dbtxtSaldoAntDCBalCxCC.left := 603;
            dbtxtMovBalCxCC.left        := 831;
            dbtxtMovDCBalCxCC.left      := 926;
            dbtxtDebBalCxCC.left        := 624;
            dbtxtCredBalCxCC.left       := 721;
            dbtxtDebBalCxCC.visible     := true;
            dbtxtCredBalCxCC.visible    := true;
            dbtxtMovBalCxCC.visible     := true;
            dbtxtMovDCBalCxCC.visible   := true;

            txtSaldoAntBalCxCC.left   := 521;
            txtMovBalCxCC.left        := 861;
            txtDebBalCxCC.left        := 687;
            txtCredBalCxCC.left       := 779;
            txtDebBalCxCC.visible     := true;
            txtCredBalCxCC.visible    := true;
            txtMovBalCxCC.visible     := true;
         end;
   end;

end;

procedure TrptBalanceteCxCC.FormCreate(Sender: TObject);
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

procedure TrptBalanceteCxCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  CtrlRptBalancete.free;
end;

end.
