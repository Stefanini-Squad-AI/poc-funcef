{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TrptBalanceteCCusto.CrmRptCMBeforePrint
 N. Sol's........: 134710
 N. Kintana's....: 796664
 Data............: 28/04/2010
 Responsável.....: Fábio Henrique Beccaria Sampaio
 Descrição.......: Correção para obter o Plano correspondente a data inicial
--------------------------------------------------------------------------------
 Rotina.........: TrptBalanceteAnalAPCC.CrmRptCMBeforePrint
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 29/05/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do campo Desconsiderar Encerramento de Resultado
--------------------------------------------------------------------------------}


unit rBalanceteCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, uCtrlRptBalancete,
  DBClient, uCMClientDataSet, ppDB, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, TXRB, uCtrlContab;

type
  TrptBalanceteCCusto = class(TFrmCmReport)
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    dsBalCCusto: TwwDataSource;
    pplBalCCusto: TppBDEPipeline;
    rptBalCCusto: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLblTituloBalCCusto: TppLabel;
    ppLine1: TppLine;
    LblEmpresa: TppLabel;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLblTituloBalCCusto2: TppLabel;
    ppLabel31: TppLabel;
    txtSaldoAntBalCC: TppLabel;
    txtDebBalCC: TppLabel;
    txtCredBalCC: TppLabel;
    txtMovBalCC: TppLabel;
    rptBalCCustoLabel5: TppLabel;
    ppDetailBand9: TppDetailBand;
    dbtxtContaBalCC: TppDBText;
    ppDBText6: TppDBText;
    dbtxtSaldoAntBalCC: TppDBText;
    dbtxtSaldoAntDCBalCC: TppDBText;
    dbtxtDebBalCC: TppDBText;
    dbtxtCredBalCC: TppDBText;
    dbtxtMovBalCC: TppDBText;
    dbtxtMovDCBalCC: TppDBText;
    rptBalCCustoDBText7: TppDBText;
    rptBalCCustoDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    lblsistema: TppLabel;
    ppLabel61: TppLabel;
    lblContBalCC: TppLabel;
    ppCalc1: TppSystemVariable;
    lblCalcBalCC: TppSystemVariable;
    rptBalCCustoGroup1: TppGroup;
    rptBalCCustoGroupHeaderBand1: TppGroupHeaderBand;
    dbtxtCCustoCC: TppDBText;
    dbtxtNomeCCustoCC: TppDBText;
    rptBalCCustoGroupFooterBand1: TppGroupFooterBand;
    rptBalCCustoLine1: TppLine;
    cdsBalCCusto: TCMClientDataSet;
    sqlBalCCusto: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand9BeforePrint(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlRptBalancete :TCtrlRptBalancete;
    CtrlContab       : TCtrlContab; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010

     sTitulo,sMascaraCCusto,sMascara,sMascaraPlano,sNomeExerc :string;
    iPagIni,iNumColunas,iPlano :Integer;
    sPeriodoInicial,sPeriodoFinal :string;
    bIndenta :boolean;
  public
    { Public declarations }
  end;

var
  rptBalanceteCCusto: TrptBalanceteCCusto;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra,FSM_FxLib;

{$R *.DFM}

procedure TrptBalanceteCCusto.CrmRptCMBeforePrint(Sender: TObject);
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
    bIndenta := CmpRptCM.ParamValues[9].AsBoolean;

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
   

   If CmpRptCM.ParamValues[14].asString = '' then begin
      with sqlAux do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
         ParamByName('PEREXERCICIO').asFloat   := CmpRptCM.ParamValues[0].AsFloat;
         ParamByName('PERNUMEROINI').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
         ParamByName('PERNUMEROFIM').asInteger := StrToInt(CmpRptCM.ParamValues[2].asString);
         Open;

         if cdsAux.isEmpty then begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete por Centro de Custo - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete por Centro de Custo - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end else begin
            if CmpRptCM.ParamValues[1].asString = CmpRptCM.ParamValues[2].asString then begin
               sTitulo := 'Balancete por Centro de Custo Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString;
            end else begin
               sTitulo := 'Balancete por Centro de Custo Provisório - ' + sPeriodoInicial + '/' + CmpRptCM.ParamValues[0].asString + ' a ' + sPeriodoFinal + '/' + CmpRptCM.ParamValues[0].asString;
            end;
         end;
      End;

      //Imprime os títulos
      pplblTituloBalCCusto.caption := sTitulo;

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

      pplblTituloBalCCusto2.caption := sTitulo;
   end else begin
      pplblTituloBalCCusto.caption  := CmpRptCM.ParamValues[14].AsString;
      pplblTituloBalCCusto2.caption := CmpRptCM.ParamValues[15].AsString;
   end;


   iPagIni := StrToInt(CmpRptCM.ParamValues[13].AsString);
   rptBalCCusto.Groups[0].NewPage := CmpRptCM.ParamValues[11].AsBoolean;
   iNumColunas := CmpRptCM.ParamValues[8].AsInteger + 3;

   //Faz a query
   with sqlBalCCusto do begin
      SQL.Clear;
      SQL.Add('SELECT /*+ RULE */                                               ');

      SQL.Add('   PLACONTA, CODCENTROCUSTO, NOME, PLANOME,                      ');
      SQL.Add('   NOMEINDENTADO, CODEXTERNO,                                    ');
      SQL.Add('   PLAGRAU,                                                      ');
      SQL.Add('   DEB, CRED, MOV, SALDOANT, SALDO,                              ');
      SQL.Add('   DECODE(MOV, 0, '' '', DECODE(SIGN(MOV),                       ');
      SQL.Add('   -1, ''C'', ''D'' )) AS MOVDC,                                 ');
      SQL.Add('   DECODE(SALDO, 0, '' '', DECODE(SIGN(SALDO),                   ');
      SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                           ');
      SQL.Add('   DECODE(SALDOANT, 0, '' '', DECODE(SIGN(SALDOANT),             ');
      SQL.Add('   -1, ''C'', ''D'' )) AS DEBCREANT,                             ');
      SQL.Add('   ABS(SALDOANT) as SALDOANTABS, ABS(SALDO) as SALDOABS,         ');
      SQL.Add('   ABS(MOV) AS MOVABS                                            ');
      SQL.Add('FROM (                                                           ');
      SQL.Add('SELECT                                                           ');
      SQL.Add('   CC.CODEXTERNO,                                                ');
      SQL.Add('   ('' '') AS PLACONTA, S.CODCENTROCUSTO, CC.NOME, ('' '') AS PLANOME, ');
      SQL.Add('   ('' '') AS NOMEINDENTADO, 0 AS PLAGRAU,                       ');
      SQL.Add('   SUM(S.PLSDEBITOCORRENTE) AS DEB,                              ');
      SQL.Add('   SUM(S.PLSCREDITOCOR) AS CRED,                                 ');
      SQL.Add('   (SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)) AS MOV,     ');
      SQL.Add('   SA.SALDOANT, SS.SALDO                                         ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOSALDO S, CENTCUST CC,                                    ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       CODCENTROCUSTO, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)      ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <:PERIODOINI) OR (PERNUMERO IS NULL)) AND  ');
      SQL.Add('          (IDEMPRESA =:IDPESSOA) AND                             ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY CODCENTROCUSTO ) SA,                                ');
      SQL.Add('                                                                 ');
      SQL.Add('   (SELECT CODCENTROCUSTO,                                       ');
      
      //Marilza Colpani 29/05/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       CODCENTROCUSTO, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)   ');
      //SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO ');

      if CmpRptCM.ParamValues[16].AsBoolean then
      begin
        SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
        SQL.Add('         - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR) ');
        SQL.Add('         - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDO ');
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
      SQL.Add('          (IDEMPRESA =:IDPESSOA) AND                             ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY CODCENTROCUSTO ) SS                                 ');
      SQL.Add('WHERE                                                            ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) =:UNIDNEGOC) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;

      SQL.Add('    (S.IDPESSOA(+)        =:IDPESSOA) AND                        ');
      SQL.Add('    (S.IDEMPRESA(+)       =:IDPESSOA) AND                        ');
      SQL.Add('    (RTRIM(S.PLACONTA(+)) >= RTRIM(:CONTAINI)) AND               ');
      SQL.Add('    (RTRIM(S.PLACONTA(+)) <= RTRIM(:CONTAFIM)) AND               ');
      SQL.Add('    (S.PEREXERCICIO(+)    =:EXERCICIO) AND                       ');
      SQL.Add('    (S.PERNUMERO(+) BETWEEN :PERIODOINI AND :PERIODOFIM) AND     ');
      SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
      SQL.Add('    ((S.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO) AND               ');
      SQL.Add('    (S.IDEMPRESA(+) = CC.IDEMPRESA)) AND                         ');
      SQL.Add('    (SA.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO) AND               ');
      SQL.Add('    (SS.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO)                   ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('   S.CODCENTROCUSTO, CC.NOME, SA.SALDOANT, SS.SALDO, CC.CODEXTERNO ');

      SQL.Add('UNION ALL                                                        ');

      SQL.Add('SELECT                                                           ');
      SQL.Add('   C.PLACONTA, CC.CODEXTERNO, S.CODCENTROCUSTO, CC.NOME, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,  ');

      If bIndenta then
         SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
      Else
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');

      SQL.Add('   C.PLAGRAU,                                                    ');
      SQL.Add('   M.DEB, M.CRED, M.MOV, SA.SALDOANT,                            ');

      //Marilza Colpani 29/05/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
      //SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');

      if CmpRptCM.ParamValues[16].AsBoolean then
      begin
         SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
         SQL.Add('     - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR) ');
         SQL.Add('     - NVL(PLSDEBITOENCERR,0) + NVL(PLSCREDITOENCERR,0)) AS SALDO ');
      end
      else
      begin
        SQL.Add('   SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) ');
        SQL.Add('   - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO ');
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
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA,CODCENTROCUSTO ) SA,                       ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA,CODCENTROCUSTO,                                  ');

      //Marilza Colpani 29/05/2009 N.Sol: 108683 - N.Kintana: 495605
      //SQL.Add('       SUM(PLSDEBITOCORRENTE) AS DEB,                            ');
      //SQL.Add('       SUM(PLSCREDITOCOR) AS CRED,                               ');

      if CmpRptCM.ParamValues[16].AsBoolean then
      begin
        SQL.Add('      SUM(PLSDEBITOCORRENTE-NVL(PLSDEBITOENCERR, 0)) AS DEB, ');
        SQL.Add('      SUM(PLSCREDITOCOR-NVL(PLSCREDITOENCERR, 0)) AS CRED, ');
      end
      else
      begin
        SQL.Add('      SUM(PLSDEBITOCORRENTE) AS DEB, ');
        SQL.Add('      SUM(PLSCREDITOCOR) AS CRED, ');
      end;
      //Marilza Colpani - Fim

      SQL.Add('       (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV      ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PERNUMERO BETWEEN :PERIODOINI AND :PERIODOFIM) AND    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (IDPESSOA     =:IDPESSOA) AND                          ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add('       ((UNIDNEGOC =:UNIDNEGOC) AND                           ');
         SQL.Add('       (IDPESSOA =:IDPESSOA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) >= RTRIM(:CCUSTOINI) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add('       (RTRIM(CODCENTROCUSTO) <= RTRIM(:CCUSTOFIM) AND        ');
         SQL.Add('       (IDEMPRESA =:EMPRESA)) AND                             ');
      end;
      SQL.Add('          (RTRIM(PLACONTA) >= RTRIM(:CONTAINI)) AND              ');
      SQL.Add('          (RTRIM(PLACONTA) <= RTRIM(:CONTAFIM))                  ');

      SQL.Add('    GROUP BY PLACONTA, CODCENTROCUSTO ) M                        ');
      SQL.Add('WHERE                                                            ');

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         SQL.Add(' (S.UNIDNEGOC(+) =:UNIDNEGOC) AND                             ');
      end;
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) >= RTRIM(:CCUSTOINI) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         SQL.Add(' (RTRIM(S.CODCENTROCUSTO(+)) <= RTRIM(:CCUSTOFIM) AND         ');
         SQL.Add(' (S.IDEMPRESA(+) =:EMPRESA)) AND                              ');
      end;
      SQL.Add('    (S.IDPESSOA(+)     =:IDPESSOA) AND                           ');
      SQL.Add('    (S.IDEMPRESA(+)    =:IDPESSOA) AND                           ');
      SQL.Add('    (RTRIM(C.PLACONTA) >= RTRIM(:CONTAINI)) AND                  ');
      SQL.Add('    (RTRIM(C.PLACONTA) <= RTRIM(:CONTAFIM)) AND                  ');
      SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
      SQL.Add('    ((S.PERNUMERO     <=:PERIODOFIM) OR (S.PERNUMERO IS NULL)) AND   ');
      SQL.Add('    (S.IDPESSOA(+)    =:IDPESSOA) AND                           ');
      SQL.Add('    (S.PLANO          =:PLANO) AND                              ');
      SQL.Add('    (SA.PLACONTA(+)   = S.PLACONTA) AND                         ');
      SQL.Add('    (M.PLACONTA(+)        = S.PLACONTA) AND                      ');

      SQL.Add('    (SA.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND                ');
      SQL.Add('    (M.CODCENTROCUSTO(+)  = S.CODCENTROCUSTO) AND                ');
      SQL.Add('    (CC.CODCENTROCUSTO(+) = S.CODCENTROCUSTO) AND                ');
      SQL.Add('    (CC.IDEMPRESA(+)      = S.IDEMPRESA) AND                     ');
 
      SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                                  ');

      SQL.Add('    (S.PLACONTA           = C.PLACONTA) AND                      ');
      SQL.Add('    (S.PLANO              = C.PLANO)                             ');
      SQL.Add('GROUP BY                                                         ');
      SQL.Add('   C.PLACONTA, S.CODCENTROCUSTO, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), CC.NOME, C.PLAGRAU,  ');
      SQL.Add('   M.DEB,M.CRED,M.MOV, SA.SALDOANT, CC.CODEXTERNO )              ');
      SQL.Add('WHERE (PLACONTA <> '' '')                                        ');
      SQL.Add('  AND ((NVL(DEB,0) <> 0)                                         ');
      SQL.Add('  OR  (NVL(CRED,0) <> 0)                                         ');
      SQL.Add('  OR  (NVL(SALDOANT,0) <> 0))                                    ');
      SQL.Add('ORDER BY CODEXTERNO, CODCENTROCUSTO, PLACONTA                    ');

      Prepare;

      ParamByName('PLANO').asInteger      := iPlano;
      ParamByName('IDPESSOA').asFloat     := CrmRptCM.IdEmpresa;
      ParamByName('EXERCICIO').asFloat    := CmpRptCM.ParamValues[0].asFloat;
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

      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then begin
         ParamByName('CCUSTOINI').asString   := trim(CmpRptCM.ParamValues[5].AsString);
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[6].AsString) <> '' then begin
         ParamByName('CCUSTOFIM').asString   := trim(CmpRptCM.ParamValues[6].AsString);
         ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
         ParamByName('UNIDNEGOC').asInteger := StrToInt(CmpRptCM.ParamValues[7].AsString);
         ParamByName('IDPESSOA').asFloat      := CrmRptCM.IdEmpresa;
      end;

      sMascara       := '';
      sMascaraCCusto := '';
      if CmpRptCM.ParamValues[10].AsBoolean then begin
         sMascara       := sMascaraPlano;
         sMascaraCCusto := modulo.sMascaraCCusto;
      end;

      Open;
   end;

   if CmpRptCM.ParamValues[12].AsBoolean then
   begin
       cdsBalCCusto.First;
       while not cdsBalCCusto.Eof do
       begin
          if (cdsBalCCusto.FieldByName('SALDOANTABS').asFloat +
              cdsBalCCusto.FieldByName('DEB').asFloat +
              cdsBalCCusto.FieldByName('CRED').asFloat) = 0 then
              cdsBalCCusto.Delete
          else
              cdsBalCCusto.Next
       end;
   end;
   //sqlBalCCusto.SQL.SaveToFile('C:\BalCCeContas.txt');
end;

procedure TrptBalanceteCCusto.ppDetailBand9BeforePrint(Sender: TObject);
begin
  inherited;

   //Configura a máscara das contas contábeis
   if (sMascara <> '') then begin
      //sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, FuncaoGeral.CalcGrau(modulo.sMascaraContas, cdsBalCCusto.FieldByName('PLACONTA').asString));     //Everson Cunha - SIG102043
      sMascara := FuncaoGeral.CalcMascaraPorGrau(CtrlContab.MascaraContaData, FuncaoGeral.CalcGrau(modulo.sMascaraContas, cdsBalCCusto.FieldByName('PLACONTA').asString)); //Everson Cunha - SIG102043
      dbtxtContaBalCC.DisplayFormat := sMascara + ';0; ';
   end;

   if sMascaraCCusto <> '' then begin
      sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraCCusto, FuncaoGeral.CalcGrau(modulo.sMascaraCCusto, cdsBalCCusto.FieldByName('CODCENTROCUSTO').asString));
      dbtxtCCustoCC.DisplayFormat := sMascaraCCusto + ';0; ';
   end;

end;

procedure TrptBalanceteCCusto.ppFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  lblContBalCC.Caption := IntToStr((iPagIni + StrToInt(lblCalcBalCC.text)) - 1);

end;

procedure TrptBalanceteCCusto.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
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

procedure TrptBalanceteCCusto.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptBalanceteCCusto.CmpRptCMParamControlEnter(
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

procedure TrptBalanceteCCusto.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
   case iNumColunas of
      3: begin
            dbtxtSaldoAntBalCC.left   := 500;
            dbtxtSaldoAntDCBalCC.left := 603;
            dbtxtMovBalCC.left        := 772;
            dbtxtMovDCBalCC.left      := 866;
            dbtxtDebBalCC.visible     := false;
            dbtxtCredBalCC.visible    := false;
            dbtxtMovBalCC.visible     := true;
            dbtxtMovDCBalCC.visible   := true;

            txtSaldoAntBalCC.left   := 521;
            txtMovBalCC.left        := 800;
            txtDebBalCC.visible     := false;
            txtCredBalCC.visible    := false;
            txtMovBalCC.visible     := true;
         end;
      4: begin
            dbtxtSaldoAntBalCC.left   := 500;
            dbtxtSaldoAntDCBalCC.left := 603;
            dbtxtDebBalCC.left        := 670;
            dbtxtCredBalCC.left       := 800;
            dbtxtDebBalCC.visible     := true;
            dbtxtCredBalCC.visible    := true;
            dbtxtMovBalCC.visible     := false;
            dbtxtMovDCBalCC.visible   := false;

            txtSaldoAntBalCC.left   := 521;
            txtDebBalCC.left        := 734;
            txtCredBalCC.left       := 856;
            txtDebBalCC.visible     := true;
            txtCredBalCC.visible    := true;
            txtMovBalCC.visible     := false;
         end;
      5: begin
            dbtxtSaldoAntBalCC.left   := 500;
            dbtxtSaldoAntDCBalCC.left := 603;
            dbtxtMovBalCC.left        := 831;
            dbtxtMovDCBalCC.left      := 925;
            dbtxtDebBalCC.left        := 610;
            dbtxtCredBalCC.left       := 714;
            dbtxtDebBalCC.visible     := true;
            dbtxtCredBalCC.visible    := true;
            dbtxtMovBalCC.visible     := true;
            dbtxtMovDCBalCC.visible   := true;

            txtSaldoAntBalCC.left   := 521;
            txtMovBalCC.left        := 861;
            txtDebBalCC.left        := 671;
            txtCredBalCC.left       := 770;
            txtDebBalCC.visible     := true;
            txtCredBalCC.visible    := true;
            txtMovBalCC.visible     := true;
         end;
   end;

end;

procedure TrptBalanceteCCusto.FormCreate(Sender: TObject);
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

procedure TrptBalanceteCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free; // Alterado por FHBS - SOL: 134710 KTN: 796664 - 28/04/2010
  CtrlRptBalancete.free;
end;

end.
