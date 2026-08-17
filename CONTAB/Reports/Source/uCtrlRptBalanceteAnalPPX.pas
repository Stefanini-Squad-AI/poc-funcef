{------------------------------------------------------------------------------
Desenvolvedor: andre tavares
pendência: 23320
data: 03/10/2006
solução refiz algumas subqueries e alterei alguns filtros, pois não esvam saindo as contas
com saldos e sem movimentos.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor:  andre tavares
  pendencia 22614
  data 13/07/2006
  Solução      : Refiz a query que busca o saldo anterior.
------------------------------------------------------------------------------}


unit uCtrlRptBalanceteAnalPPX;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,uSistema,Provider,uCtrlPeriodo,
     uCtrlContab,ComCtrls, uCMTypes, uCMSqlParams, uCMFileUtils, MIdas,
     uCmClientDataSet;


  Type
    TCtrlRptBalanceteAnalPPX = Class(TCmControlObject)
    private
     Periodo   : TCtrlPeriodo;
     Contab    : TCtrlContab;

    protected
       procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;


    public
       Constructor Create; Override;
       Destructor Destroy; Override;

       {Esta funçã tem o objetivo de montar sql principal para o relat. balancete }
       Function SelecionaPlanoContaPer(iPeriodo, iExercicio,idEmpresa : Double) : String;
       Function FazQuery(sDataIni,sDataFim,sExercicio,sPeriodoIni,sPeriodoFim,sContaIni,
                         sContaFim: string; bquebraPorPatro, bQuebraPorPlanoSPC: boolean; sNumero,sAtividade,sPlano,
                         sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                         bContaCorresp,bIndenta, bQuebraPorPlanoPrev, bDescResultado, bDescEstatistica: boolean;
                         bQuebraPlanoPatro: Boolean; bContraNatureza: boolean):OleVariant;

    protected

    End;


implementation

uses UMensErro, uString,uData, uFuncaoGeral,FSM_FxLib;

procedure TCtrlRptBalanceteAnalPPX.AfterInitialize;
begin
  inherited;
  Periodo.initializeas(self);
  Contab.initializeas(self);
end;



constructor TCtrlRptBalanceteAnalPPX.Create;
begin
  inherited;
  Periodo       := TCtrlPeriodo.Create;
  Contab        := TCtrlContab.Create;

end;

destructor TCtrlRptBalanceteAnalPPX.Destroy;
begin

  inherited;
  Periodo.free;
  Contab.Free;
end;



procedure TCtrlRptBalanceteAnalPPX.DoChangeDataBase;
begin
  inherited;

end;


function TCtrlRptBalanceteAnalPPX.FazQuery(sDataIni,sDataFim,sExercicio,sPeriodoIni,sPeriodoFim,sContaIni,
                         sContaFim: string; bquebraPorPatro, bQuebraPorPlanoSPC: boolean; sNumero,sAtividade,sPlano,
                         sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                         bContaCorresp,bIndenta, bQuebraPorPlanoPrev, bDescResultado,bDescEstatistica: boolean;
                         bQuebraPlanoPatro: Boolean; bContraNatureza: boolean):OleVariant;
var ssql: string;
begin
  ssql := '';
     If trim(sDataIni) <> '' then
        Periodo.RetornaPeriodoExercicioData(StrToFloat(sEmpresa),sDataIni);


     With TCMSqlParams.Create(nil) Do
     Try
          SQL.Clear;
          If trim(sDataIni) <> '' then
          Begin
            SQL.Add('SELECT /*+RULE*/                                                     ');
            SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
            SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + sNumero + ') AS GRAU,                   ');
            if bOutroIdioma then
            Begin
               SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,       ');
               If bIndenta then
                  SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
               Else
                  SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO,                         ');
            End Else
            Begin
              SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,               ');
              If bIndenta then
                 SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
              Else
                 SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO,        ');
            End;
            SQL.Add('   ABS(NVL(S.DEB,0)) as DEB,               ');
            SQL.Add('   ABS(NVL(S.CRED,0)) as CRED,             ');
            SQL.Add('   S.DEBA,                                 ');
            SQL.Add('   S.CREDA,                                ');
            SQL.Add('   S.MOV,                                  ');
            SQL.Add('   NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0) AS SALDOANT,                   ');
            SQL.Add('   NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0) AS SALDO,         ');
            SQL.Add('   DECODE(NVL(S.MOV,0), 0, '' '', DECODE(SIGN(S.MOV), -1, ''C'', ''D'' )) AS MOVDC,  ');
            SQL.Add('   DECODE(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0), 0, '' '', ');
            SQL.Add(' DECODE(SIGN(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)),  -1, ''C'', ''D'' )) AS DEBCRESALDO,    ');
            SQL.Add('   DECODE(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0), 0, '' '',              ');
            SQL.Add('DECODE(SIGN(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)), -1, ''C'', ''D'' )) AS DEBCREANT, ');
            SQL.Add('   ABS(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)) as SALDOANTABS,           ');
            SQL.Add('ABS(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) as SALDOABS,    ');
            SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                   ');

            if bQuebraPlanoPatro then
              SQL.Add(' , PPC.NOME AS PLANOPREV, P.NOME AS PATRO ');

            if bquebraPorPatro then
            begin
              SQL.Add(' , P.NOME AS PATRO ');
              SQL.Add(' , P.IDPESSOA AS IDPATRO ');
            end;

            if bQuebraPorPlanoPrev then
              SQL.Add(' , PPC.NOME AS PLANOPREV ');

            if bQuebraPorPlanoSPC then
              SQL.ADD(' , PPC.CODSPC  ');


            SQL.Add('FROM                                             ');
            SQL.Add('  PLANOCONTA C, ');

            if bQuebraPlanoPatro then
              SQL.Add(' PLANPREVCONTABIL PPC, PESSOA P, ');

            if bquebraPorPatro then
              SQL.Add(' PESSOA P, ');

            if bQuebraPorPlanoPrev then
              SQL.Add(' PLANPREVCONTABIL PPC, ');

               if bQuebraPorPlanoSPC then
               begin
                 SQL.ADD(' (SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV ');
                 SQL.ADD('  UNION ');
                 SQL.ADD('  SELECT NOME, ');
                 SQL.ADD('         IDPLANOPREV, ');
                 SQL.ADD('         CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL WHERE IDPLANOPREVPREV IS NULL) PPC, ');
               end;
            SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');


//início - andre tavares 06/10/2006      *SA*
            if bQuebraPlanoPatro then
            begin
              SQL.Add('(  SELECT PPP.*, NVL(SALDO.SALDOANT, 0) AS SALDOANT ');
              SQL.Add('   FROM  (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
              SQL.Add('          FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
              SQL.Add('          WHERE PL.PLANO = ' + sPlano );
              SQL.Add('          GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');

              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT, ');
              SQL.Add('                 L.IDPLANOPREV, L.IDPATRO, C.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO =' + sExercicio + ') AND       ');
              SQL.Add('                (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.PLNDATDIA >= TO_DATE('''+DateToStr(Periodo.DataIniPeriodo)+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO =' + sPlano + ') AND   ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ') ');
              SQL.Add('       GROUP BY L.IDPLANOPREV, L.IDPATRO, C.PLACONTA, C.PLANO ) SALDO ');
              SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('         PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
              SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
              SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
              SQL.Add('   ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bquebraPorPatro then
            begin
              SQL.Add('(  SELECT PPP.*, NVL(SALDO.SALDOANT, 0) AS SALDOANT ');
              SQL.Add('   FROM  (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
              SQL.Add('          FROM PATRO PT, PLANOCONTA PL ');
              SQL.Add('          WHERE PL.PLANO = ' + sPlano );
              SQL.Add('          GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');

              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT, ');
              SQL.Add('                 L.IDPATRO, C.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO =' + sExercicio + ') AND       ');
              SQL.Add('                (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.PLNDATDIA >= TO_DATE('''+DateToStr(Periodo.DataIniPeriodo)+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO =' + sPlano + ') AND   ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ') ');
              SQL.Add('       GROUP BY L.IDPATRO, C.PLACONTA, C.PLANO ) SALDO ');
              SQL.Add('   WHERE ');
              SQL.Add('         PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
              SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
              SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
              SQL.Add('   ORDER BY PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bQuebraPorPlanoPrev then
            begin
              SQL.Add('(  SELECT PPP.*, NVL(SALDO.SALDOANT, 0) AS SALDOANT ');
              SQL.Add('   FROM  (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
              SQL.Add('          FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
              SQL.Add('          WHERE PL.PLANO = ' + sPlano );
              SQL.Add('          GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');

              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT, ');
              SQL.Add('                 L.IDPLANOPREV, C.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO =' + sExercicio + ') AND       ');
              SQL.Add('                (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.PLNDATDIA >= TO_DATE('''+DateToStr(Periodo.DataIniPeriodo)+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO =' + sPlano + ') AND   ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ') ');
              SQL.Add('       GROUP BY L.IDPLANOPREV, C.PLACONTA, C.PLANO ) SALDO ');
              SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
              SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
              SQL.Add('   ORDER BY  PPP.IDPLANOPREV, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bQuebraPorPlanoSPC then
            begin
              SQL.Add('(  SELECT PPP.PLACONTA, PPP.CODSPC, SUM(NVL(SALDO.SALDOANT, 0)) AS SALDOANT ');
              SQL.Add('   FROM  (SELECT PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
              SQL.Add('          FROM PLANOCONTA PL, ');
              SQL.Add('               (SELECT  ');
              SQL.Add('                       PC.IDPLANOPREV, ');
              SQL.Add('                       DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
              SQL.Add('                FROM PLANPREVCONTABIL PC, PLANPREV PP WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV ');
              SQL.Add('                UNION ');
              SQL.Add('                SELECT ');
              SQL.Add('                       IDPLANOPREV, ');
              SQL.Add('                       CODSPC ');
              SQL.Add('                FROM PLANPREVCONTABIL WHERE IDPLANOPREVPREV IS NULL) PPC ');

              SQL.Add('   WHERE PL.PLANO = ' + sPlano );
              SQL.Add('   GROUP BY PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');

              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT, ');
              SQL.Add('                 L.IDPLANOPREV, C.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO =' + sExercicio + ') AND       ');
              SQL.Add('                (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.PLNDATDIA >= TO_DATE('''+DateToStr(Periodo.DataIniPeriodo)+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO =' + sPlano + ') AND   ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ') ');
              SQL.Add('       GROUP BY L.IDPLANOPREV, C.PLACONTA, C.PLANO ) SALDO ');
              SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
              SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
              SQL.Add('   GROUP BY PPP.CODSPC, PPP.PLANO, PPP.PLACONTA ');
            end;

//fim - andre tavares 06/10/2006
            SQL.Add(') SA, ');
            
//início - andre tavares 06/10/2006      *SN*
            if bQuebraPlanoPatro then
            begin
              SQL.Add('(SELECT PPP.*, NVL(SALDO.SALDOAN, 0) AS SALDOAN FROM ');
              SQL.Add('   (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
              SQL.Add('    FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
              SQL.Add(' WHERE PL.PLANO = ' + sPlano );
              SQL.Add('    GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('   (SELECT PLACONTA, ');
              SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
              SQL.Add('           ,IDPLANOPREV, IDPATRO, PLANO ');
              SQL.Add('    FROM PLANOSALDO ');
              SQL.Add('       WHERE ');
              SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
              SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
              SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('          (PLANO =' + sPlano + ') AND   ');
              SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
              SQL.Add('    GROUP BY PLACONTA, IDPLANOPREV, IDPATRO, PLANO ');
              SQL.Add('    ORDER BY  IDPATRO, IDPLANOPREV,  PLACONTA) SALDO ');

              SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('          PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
              SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('    ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bquebraPorPatro then
            begin
              SQL.Add('(SELECT PPP.*, NVL(SALDO.SALDOAN, 0) AS SALDOAN FROM ');
              SQL.Add('   (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
              SQL.Add('    FROM PATRO PT, PLANOCONTA PL ');
              SQL.Add(' WHERE PL.PLANO = ' + sPlano );
              SQL.Add('    GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('   (SELECT PLACONTA, ');
              SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
              SQL.Add('           , IDPATRO, PLANO ');
              SQL.Add('    FROM PLANOSALDO ');
              SQL.Add('       WHERE ');
              SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
              SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
              SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('          (PLANO =' + sPlano + ') AND   ');
              SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
              SQL.Add('    GROUP BY PLACONTA, IDPATRO, PLANO ');
              SQL.Add('    ORDER BY  IDPATRO, PLACONTA) SALDO ');

              SQL.Add('    WHERE ');
              SQL.Add('          PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
              SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('    ORDER BY PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bQuebraPorPlanoPrev then
            begin
              SQL.Add('(SELECT PPP.*, NVL(SALDO.SALDOAN, 0) AS SALDOAN FROM ');
              SQL.Add('   (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
              SQL.Add('    FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
              SQL.Add(' WHERE PL.PLANO = ' + sPlano );
              SQL.Add('    GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('   (SELECT PLACONTA, ');
              SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
              SQL.Add('           ,IDPLANOPREV, PLANO ');
              SQL.Add('    FROM PLANOSALDO ');
              SQL.Add('       WHERE ');
              SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
              SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
              SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('          (PLANO =' + sPlano + ') AND   ');
              SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
              SQL.Add('    GROUP BY PLACONTA, IDPLANOPREV, PLANO ');
              SQL.Add('    ORDER BY  IDPLANOPREV, PLACONTA) SALDO ');

              SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('    ORDER BY  PPP.IDPLANOPREV, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bQuebraPorPlanoSPC then
            begin
              SQL.Add('(SELECT PPP.CODSPC, PPP.PLANO, PPP.PLACONTA, SUM(NVL(SALDO.SALDOAN, 0)) AS SALDOAN FROM ');
              SQL.Add('   (SELECT PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
              SQL.Add('    FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
              SQL.Add('    WHERE PL.PLANO = ' + sPlano );
              SQL.Add('    GROUP BY PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');

              SQL.Add('   (SELECT PLACONTA, ');
              SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
              SQL.Add('           ,IDPLANOPREV, PLANO ');
              SQL.Add('    FROM PLANOSALDO ');
              SQL.Add('       WHERE ');
              SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
              SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
              SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
              SQL.Add('          (PLANO =' + sPlano + ') AND   ');
              SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
              SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
              SQL.Add('    GROUP BY PLACONTA, IDPLANOPREV, PLANO ');

              SQL.Add('  ) SALDO ');

              SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('    GROUP BY  PPP.CODSPC, PPP.PLANO, PPP.PLACONTA ');
            end;
//fim - andre tavares 06/10/2006      *SN*
            SQL.Add(' ) SN, ');

//início - andre tavares 06/10/2006   *S*
            if bQuebraPlanoPatro then
            begin
              SQL.Add(' (SELECT PPP.PLACONTA, PPP.PLANO, PPP.IDPLANOPREV, PPP.IDPATRO, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
              SQL.Add('  FROM (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
              SQL.Add('        FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
              SQL.Add('        WHERE PL.PLANO = ' + sPlano );
              SQL.Add('        GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0),0)) AS DEBA, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0),0)) AS CREDA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV ');
              SQL.Add('                 , L.IDPLANOPREV, L.IDPATRO, L.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO = ' + sExercicio + ') AND ');
              SQL.Add('                (P.PLNDATDIA BETWEEN TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA = ' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO    = ' + sPlano  +  ') AND  ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')');
              SQL.Add('    GROUP BY C.PLACONTA, L.IDPLANOPREV, L.IDPATRO, L.PLANO ');
              SQL.Add('    ORDER BY L.IDPATRO, L.IDPLANOPREV, C.PLACONTA ) SALDO ');
              SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('        PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
              SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('  ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bquebraPorPatro then
            begin
              SQL.Add(' (SELECT PPP.PLACONTA, PPP.PLANO, PPP.IDPATRO, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
              SQL.Add('  FROM (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
              SQL.Add('        FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
              SQL.Add('        WHERE PL.PLANO = ' + sPlano );
              SQL.Add('        GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0),0)) AS DEBA, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0),0)) AS CREDA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV ');
              SQL.Add('                 , L.IDPATRO, L.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO = ' + sExercicio + ') AND ');
              SQL.Add('                (P.PLNDATDIA BETWEEN TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA = ' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO    = ' + sPlano  +  ') AND  ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')');
              SQL.Add('    GROUP BY C.PLACONTA, L.IDPATRO, L.PLANO ');
              SQL.Add('    ORDER BY L.IDPATRO, C.PLACONTA ) SALDO ');
              SQL.Add('  WHERE ');
              SQL.Add('        PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
              SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('  ORDER BY PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bQuebraPorPlanoPrev then
            begin
              SQL.Add(' (SELECT PPP.PLACONTA, PPP.PLANO, PPP.IDPLANOPREV, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
              SQL.Add('  FROM (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
              SQL.Add('        FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
              SQL.Add('        WHERE PL.PLANO = ' + sPlano );
              SQL.Add('        GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('         (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0),0)) AS DEBA, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0),0)) AS CREDA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV ');
              SQL.Add('                 , L.IDPLANOPREV, L.PLANO ');
              SQL.Add('          FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('          WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('                (L.PLANO = C.PLANO) AND ');
              SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('                (P.PEREXERCICIO = ' + sExercicio + ') AND ');
              SQL.Add('                (P.PLNDATDIA BETWEEN TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('                (P.IDPESSOA = ' + sEmpresa + ') AND ');
              SQL.Add('                (L.PLANO    = ' + sPlano  +  ') AND  ');
              SQL.Add('                (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
              SQL.Add('                (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')');
              SQL.Add('    GROUP BY C.PLACONTA, L.IDPLANOPREV, L.PLANO ');
              SQL.Add('    ORDER BY L.IDPLANOPREV, C.PLACONTA ) SALDO ');
              SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('  ORDER BY  PPP.IDPLANOPREV, PPP.PLANO, PPP.PLACONTA ');
            end
            else if bQuebraPorPlanoSPC then
            begin
              SQL.Add(' (SELECT PPP.PLACONTA, PPP.PLANO, PPP.CODSPC, SUM(SALDO.DEB) AS DEB, SUM(SALDO.CRED) AS CRED, SUM(SALDO.DEBA) DEBA, SUM(SALDO.CREDA) AS CREDA, SUM(SALDO.MOV) AS MOV ');
              SQL.Add('  FROM (SELECT PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
              SQL.Add('        FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
              SQL.Add('        WHERE PL.PLANO = ' + sPlano );
              SQL.Add('        GROUP BY PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
              SQL.Add('       (SELECT C.PLACONTA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0),0)) AS DEBA, ');
              SQL.Add('                 SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0),0)) AS CREDA, ');
              SQL.Add('                 SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV ');
              SQL.Add('                 , L.IDPLANOPREV, L.PLANO ');
              SQL.Add('       FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P ');
              SQL.Add('       WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND ');
              SQL.Add('             (L.PLANO = C.PLANO) AND ');
              SQL.Add('             (P.PLNCODIGO = L.PLNCODIGO) AND ');
              SQL.Add('             (P.PLNCODIGO = P.PLNCODIGO) AND ');
              SQL.Add('             (P.PEREXERCICIO = ' + sExercicio + ') AND ');
              SQL.Add('             (P.PLNDATDIA BETWEEN TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND ');
              SQL.Add('             (P.IDPESSOA = ' + sEmpresa + ') AND ');
              SQL.Add('             (L.PLANO    = ' + sPlano  +  ') AND  ');
              SQL.Add('             (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
              SQL.Add('             (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')');
              SQL.Add('    GROUP BY C.PLACONTA, L.IDPLANOPREV, L.PLANO ');
              SQL.Add('    ) SALDO ');
              SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
              SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
              SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
              SQL.Add('  GROUP BY PPP.CODSPC, PPP.PLANO, PPP.PLACONTA ');
            end;


//fim - andre tavares 06/10/2006      *S*


            SQL.Add(' ) S ');

            SQL.Add('                                      ');
            SQL.Add('WHERE                                 ');
            SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND  ');
            SQL.Add('    (S.PLANO(+) = C.PLANO) AND        ');

            SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND ');
            SQL.Add('    (SA.PLANO(+) = C.PLANO) AND ');

            SQL.Add('    (SN.PLACONTA(+) = C.PLACONTA) AND ');
            SQL.Add('    (SN.PLANO(+) = C.PLANO) AND ');

            SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND ');
            SQL.Add('    (PD.PLANO(+) = C.PLANO) AND       ');

            //início - 24/04/2006 - andre tavares - pendência 19623
            if bQuebraPlanoPatro then
            begin
              //início - andre tavares - pendência 23320 - 03/10/2006
              //SQL.Add('    NVL(SA.IDPATRO, NVL(SN.IDPATRO, S.IDPATRO)) = P.IDPESSOA AND ');
              // SQL.Add('    NVL(SA.IDPLANOPREV, NVL(SN.IDPLANOPREV, S.IDPLANOPREV)) = PPC.IDPLANOPREV AND ');
              //tem que ter order by nas subqueries, senão não funciona, pois os joins na query maior não vão casar
              //SQL.Add('    NVL(SA.IDPATRO, NVL(SN.IDPATRO, S.IDPATRO)) = S.IDPATRO  AND ');
              //SQL.Add('    NVL(SA.IDPLANOPREV, NVL(SN.IDPLANOPREV, S.IDPLANOPREV)) = S.IDPLANOPREV  AND ');
              SQL.Add(' (SA.IDPATRO = P.IDPESSOA) AND ');
              SQL.Add(' (S.IDPATRO = P.IDPESSOA)  AND ');
              SQL.Add(' (SN.IDPATRO = P.IDPESSOA) AND ');
              SQL.Add(' (SA.IDPATRO = SN.IDPATRO) AND ');
              SQL.Add(' (SA.IDPATRO = S.IDPATRO)  AND ');
              SQL.Add(' (SA.IDPLANOPREV = SN.IDPLANOPREV)  AND ');
              SQL.Add(' (SA.IDPLANOPREV = S.IDPLANOPREV)   AND ');
              SQL.Add(' (SA.IDPLANOPREV = PPC.IDPLANOPREV) AND ');
              SQL.Add(' (S.IDPLANOPREV = PPC.IDPLANOPREV)  AND ');
              SQL.Add(' (SN.IDPLANOPREV = PPC.IDPLANOPREV) AND ');
              //fim - andre tavares - pendência 23320 - 03/10/2006
            end;


            if bQuebraPorPlanoPrev  then
            begin
              //início -  andre tavares - pendência 23320 - 03/10/2006
              //SQL.Add('    NVL(SA.IDPLANOPREV, NVL(SN.IDPLANOPREV, S.IDPLANOPREV)) = PPC.IDPLANOPREV AND ');
              SQL.Add(' SA.IDPLANOPREV = SN.IDPLANOPREV AND  ');
              SQL.Add(' SA.IDPLANOPREV = S.IDPLANOPREV AND   ');
              SQL.Add(' SA.IDPLANOPREV = PPC.IDPLANOPREV AND ');
              SQL.Add(' S.IDPLANOPREV = PPC.IDPLANOPREV AND  ');
              SQL.Add(' SN.IDPLANOPREV = PPC.IDPLANOPREV AND ');
              //fim - andre tavares - pendência 23320 - 03/10/2006
            end;

            if bQuebraPorPlanoSPC then
            begin
              //início -  andre tavares - pendência 23320 - 03/10/2006
              //SQL.Add('    NVL(SA.CODSPC, NVL(SN.CODSPC, S.CODSPC)) = PPC.CODSPC AND ');
              SQL.Add(' (SA.CODSPC = SN.CODSPC)  AND ');
              SQL.Add(' (SA.CODSPC = S.CODSPC)   AND ');
              SQL.Add(' (SA.CODSPC = PPC.CODSPC) AND ');
              SQL.Add(' (S.CODSPC  = PPC.CODSPC) AND ');
              SQL.Add(' (SN.CODSPC = PPC.CODSPC) AND ');
              //fim - andre tavares - pendência 23320 - 03/10/2006
            end;

            if bquebraPorPatro then
            begin
              //início -  andre tavares - pendência 23320 - 03/10/2006
              SQL.Add(' SA.IDPATRO = P.IDPESSOA AND          ');
              SQL.Add(' S.IDPATRO = P.IDPESSOA AND           ');
              SQL.Add(' SN.IDPATRO = P.IDPESSOA AND          ');
              SQL.Add(' SA.IDPATRO = SN.IDPATRO AND          ');
              SQL.Add(' SA.IDPATRO = S.IDPATRO AND           ');
              //fim - andre tavares - pendência 23320 - 03/10/2006
            end;

            //isto reduz bastante o custo da query
            SQL.Add('    (C.PLACONTA = C.PLACONTA) AND ');
            SQL.Add('    (C.PLANO = C.PLANO) AND ');
            //fim - 24/04/2006 - andre tavares - pendência 19623

            SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND        ');
            SQL.Add('    (C.PLANO =' + sPlano + ') AND   ');
            SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
            SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

            If bDescEstatistica then
            Begin
               SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
            End;

            //início - andre tavares - 23/10/2006 - pendência 23333
            if bContraNatureza then
            begin
              SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) < 0)) OR         ');
              SQL.Add('      ((C.PLANATUREZA = ''C'') AND  ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) >= 0)))         ');
            end;
            //fim - andre tavares - 23/10/2006 - pendência 23333


            SQL.Add('GROUP BY                                                         ');
            SQL.Add('    C.PLACONTA, SA.SALDOANT, SN.SALDOAN,               ');
            SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
            SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
            SQL.Add('    S.DEB,                                                       ');
            SQL.Add('    S.CRED,                                                      ');
            SQL.Add('    S.DEBA,                                                      ');
            SQL.Add('    S.CREDA,                                                     ');
            SQL.Add('    S.MOV                                                        ');

            if bQuebraPlanoPatro then
            begin
              SQL.Add(' , PPC.NOME, P.NOME ');
              SQL.Add(' , P.IDPESSOA ');
            end;


            if bquebraPorPatro then
            begin
              SQL.Add(' , P.NOME ');
              SQL.Add(' , P.IDPESSOA ');
            end;

            if bQuebraPorPlanoPrev then
              SQL.Add(' , PPC.NOME ');

            if  bQuebraPorPlanoSPC then
              SQL.Add(' , PPC.CODSPC ');


            SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
            SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
            SQL.Add('       (DECODE(NVL(SN.SALDOAN,0),0,                              ');
            SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');

            SQL.Add(' ORDER BY ');

            if bQuebraPlanoPatro then
              SQL.Add('PATRO, PLANOPREV, ');

            if bquebraPorPatro then
              SQL.Add('PATRO, ');

            if bQuebraPorPlanoPrev then
              SQL.Add('PLANOPREV, ');

            if  bQuebraPorPlanoSPC then
              SQL.Add(' PPC.CODSPC, ');

            SQL.Add(' C.PLACONTA ');

          End Else
          Begin
            If bDescResultado then
            Begin
               SQL.Add('SELECT  /*+RULE*/                                                    ');
               SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, ');
               SQL.Add('   U.GRAU,                                                           ');
               SQL.Add('   U.CONTA, U.PLANOME, U.PLANOMEOUTLING,                             ');
               SQL.Add('   U.NOMEINDENTADO,                         ');
               SQL.Add('   ABS(SUM(NVL(U.DEB,0))) AS DEB,           '); //v
               SQL.Add('   ABS(SUM(NVL(U.CRED,0))) AS CRED,         '); //v
               SQL.Add('   SUM(U.DEBA) AS DEBA,                     ');
               SQL.Add('   SUM(U.CREDA) AS CREDA,                   ');
               SQL.Add('   SUM(U.MOV) AS MOV,                       ');
               SQL.Add('   SUM(NVL(U.SALDOANT,0)) AS SALDOANT,             ');
               SQL.Add('   SUM(NVL(U.SALDO,0)) AS SALDO,                   ');
               SQL.Add('   DECODE(SUM(NVL(U.MOV,0)), 0, '' '', DECODE(SIGN(SUM(U.MOV)),          ');
               SQL.Add('   -1, ''C'', ''D'' )) AS MOVDC,                                  ');
               SQL.Add('   DECODE(SUM(NVL(U.SALDO,0)), 0, '' '', DECODE(SIGN(SUM(U.SALDO)),      ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                            ');
               SQL.Add('   DECODE(SUM(NVL(U.SALDOANT,0)), 0, '' '', DECODE(SIGN(SUM(U.SALDOANT)),');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCREANT,                              ');
               SQL.Add('   ABS(SUM(NVL(U.SALDOANT,0))) as SALDOANTABS, ABS(SUM(NVL(U.SALDO,0))) as SALDOABS, '); // AQUI
               SQL.Add('   ABS(SUM(NVL(U.MOV,0))) AS MOVABS              ');

               if bQuebraPlanoPatro then
               begin
                 SQL.Add('   ,U.IDPLANOPREV, PPC.NOME AS PLANOPREV, U.IDPATRO, P.NOME AS PATRO ');
               end;
               if bquebraPorPatro then
               begin
                 SQL.Add('   , U.IDPATRO, P.NOME AS PATRO ');
                 SQL.Add(' , P.IDPESSOA AS IDPATRO ');
               end;

              if bQuebraPorPlanoPrev then
                 SQL.Add('   ,U.IDPLANOPREV, PPC.NOME AS PLANOPREV ');

              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');


               SQL.Add('FROM                                             ');

               if bQuebraPlanoPatro then
                 SQL.Add(' PESSOA P, PLANPREVCONTABIL PPC, ');

              if bquebraPorPatro then
                 SQL.Add(' PESSOA P, ');

              if bQuebraPorPlanoPrev then
                 SQL.Add(' PLANPREVCONTABIL PPC, ');


              if bQuebraPorPlanoSPC then
              begin
                SQL.ADD(' ,(SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                SQL.ADD('  UNION ');
                SQL.ADD('  SELECT P.NOME, ');
                SQL.ADD('         P.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         P.CODSPC ');
                SQL.ADD('   FROM PLANPREVCONTABIL P, PLANOCONTA PL  WHERE IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano +') PPC ');
              end;

               SQL.Add('((SELECT                                         ');
               SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
               SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + sNumero + ') AS GRAU,     ');
               If bOutroIdioma  then
               Begin
                  SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,    ');
                  if bIndenta then
                     SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
                  else
                     SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
               End Else
               Begin
                  SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,           ');
                  If bIndenta then
                     SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
                  Else
                     SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO,       ');
               End;

               SQL.Add('   NVL(S.DEB,0)  as DEB,                ');
               SQL.Add('   NVL(S.CRED,0) as CRED,               ');


               SQL.Add('   S.DEBA,                                 ');
               SQL.Add('   S.CREDA,                                ');
               SQL.Add('   S.MOV,                                  ');
               SQL.Add('   SA.SALDOANT, SS.SALDO,                                        ');
               SQL.Add('   DECODE(S.MOV, 0, '' '', DECODE(SIGN(S.MOV),                   ');
               SQL.Add('   -1, ''C'', ''D'' )) AS MOVDC,                                 ');
               SQL.Add('   DECODE(SS.SALDO, 0, '' '', DECODE(SIGN(SS.SALDO),             ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                           ');
               SQL.Add('   DECODE(SA.SALDOANT, 0, '' '', DECODE(SIGN(SA.SALDOANT),       ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCREANT,                             ');
               SQL.Add('   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) as SALDOABS,   ');    //AQUI

               SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                   ');

               if bQuebraPlanoPatro then
                 SQL.Add('   , S.IDPLANOPREV, S.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add('   , S.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add('   , S.IDPLANOPREV ');

              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('FROM ');
               SQL.Add('   PLANOCONTA C, ');

               if bQuebraPorPlanoSPC then
               begin
                 SQL.ADD(' ,(SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                 SQL.ADD('  UNION ');
                 SQL.ADD('  SELECT P.NOME, ');
                 SQL.ADD('         P.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         P.CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL P, PLANOCONTA PL  WHERE IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano +') PPC ');
               end;

               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT C.PLACONTA,                                           ');
               SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');

               if bQuebraPlanoPatro then
                 SQL.Add('          ,L.IDPLANOPREV, L.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add('   L.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add('  ,L.IDPLANOPREV ');


              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');


              SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');

              if bQuebraPorPlanoSPC then
              begin
                SQL.ADD(',(SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = ' + sPlano );
                SQL.ADD('  UNION ');
                SQL.ADD('  SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         PC.CODSPC ');
                SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV IS NULL AND PL.PLANO ' + sPlano + ') PPC ');
              end;


               SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
               SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
               SQL.Add('          (P.PLNCODIGO    = L.PLNCODIGO) AND                     ');

               //início - 02/05/2006 - andre tavares - pendência 19623
               //isto reduz bastante o custo da query
               SQL.Add('          (P.PLNCODIGO = P.PLNCODIGO) AND                        ');
               //fim - 02/05/2006 - andre tavares - pendência 19623

               SQL.Add('          (L.TIPCODIGO    = '''+sTipCodigo+''') AND ');
               SQL.Add('          (P.PEREXERCICIO =' + sExercicio + ') AND       ');
               SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni])+') AND ');
               If trim(sAtividade) <> '' then
               Begin
                 SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND          ');
                 SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (L.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (L.IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (L.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;


               sql.add('PPC.PLACONTA = L.PLACONTA(+)');

               if bQuebraPorPlanoSPC then
                 SQL.Add(' (L.IDPLANOPREV(+) = PPC.IDPLANOPREV) AND ');


               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ');

               if bQuebraPlanoPatro then
                 SQL.Add(', L.IDPLANOPREV, L.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add(', L.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add(', L.IDPLANOPREV ');


              if  bQuebraPorPlanoSPC then
                SQL.Add(' , PPC.CODSPC ');

              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(' ) SA, ');

               SQL.Add('                                                                       ');
///////////////////////////////////////////////////////

               SQL.Add('   (SELECT C.PLACONTA,                                                 ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEB,          ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CRED,         ');
               SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0),0)) AS DEBA,         ');
               SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0),0)) AS CREDA,        ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');

               if bQuebraPlanoPatro then
                 SQL.Add('       ,L.IDPLANOPREV, L.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add('  ,L.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add('  ,L.IDPLANOPREV ');

              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');

               if bQuebraPorPlanoSPC then
               begin
                 SQL.ADD(',(SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = ' + sPlano );
                 SQL.ADD('  UNION ');
                 SQL.ADD('  SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         PC.CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV IS NULL AND PL.PLANO  ' + sPlano +') PPC ');
               end;

               SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
               SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
               SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');

               //início - 02/05/2006 - andre tavares - pendência 19623
               //isto reduz bastante o custo da query
               SQL.Add('          (P.PLNCODIGO = P.PLNCODIGO) AND                        ');
               //fim - 02/05/2006 - andre tavares - pendência 19623

               SQL.Add('       (L.TIPCODIGO = '''+sTipCodigo+''') AND ');
               SQL.Add('       (P.PEREXERCICIO =' + sExercicio + ') AND       ');
               SQL.Add('    (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (L.IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (L.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (L.IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                 SQL.Add('      (L.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;


               sql.add('PPC.PLACONTA = L.PLACONTA(+)');

               if bQuebraPorPlanoSPC then
                 SQL.Add(' (L.IDPLANOPREV(+) = PPC.IDPLANOPREV) AND ');

               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ');

               if bQuebraPlanoPatro then
                 SQL.Add(', L.IDPLANOPREV, L.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add(', L.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add(', L.IDPLANOPREV ');

              if  bQuebraPorPlanoSPC then
                SQL.Add(' , PPC.CODSPC ');

              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(' ) S, ');


///////////////////////////////////////////////////////
               SQL.Add('                                                           ');
               SQL.Add('   (SELECT C.PLACONTA,                                     ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');

               if bQuebraPlanoPatro then
                 SQL.Add('       ,L.IDPLANOPREV, L.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add('  , L.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add('  ,L.IDPLANOPREV ');

              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

              SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');

              SQL.ADD(',(SELECT PC.NOME, ');
              SQL.ADD('         PC.IDPLANOPREV, ');
              SQL.ADD('         PL.PLACONTA, ');
              SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
              SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
              SQL.ADD('  UNION ');
              SQL.ADD('  SELECT PC.NOME, ');
              SQL.ADD('         PC.IDPLANOPREV, ');
              SQL.ADD('         PL.PLACONTA, ');
              SQL.ADD('         PC.CODSPC ');
              SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV IS NULL AND PL.PLANO = ' + sPlano +') PPC ');


              SQL.Add(' WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
              SQL.Add('       (L.PLANO = C.PLANO) AND                                ');
              SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');

               //início - 02/05/2006 - andre tavares - pendência 19623
               //isto reduz bastante o custo da query
               SQL.Add('      (P.PLNCODIGO = P.PLNCODIGO) AND                        ');
               //fim - 02/05/2006 - andre tavares - pendência 19623

               SQL.Add('      (L.TIPCODIGO = '''+sTipCodigo+''') AND ');
               SQL.Add('      (P.PEREXERCICIO =' + sExercicio + ') AND       ');
               SQL.Add('      (P.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])+') AND ');

               If trim(sAtividade) <> '' Then
               Begin
                  SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (L.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (L.IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (L.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;


               SQL.Add(' (L.IDPLANOPREV(+) = PPC.IDPLANOPREV) AND ');
               SQL.Add(' (L.PLANO(+) = PPC.PLANO) AND ');
               SQL.Add(' (L.PLACONTA(+) = PPC.PLACONTA) AND ');


               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ');

               if bQuebraPlanoPatro then
                 SQL.Add(' , PPC.IDPLANOPREV, PPC.IDPATRO ');

              if bquebraPorPatro then
                 SQL.Add(' , PPC.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add(' , PPC.IDPLANOPREV ');


              if  bQuebraPorPlanoSPC then
                SQL.Add(' , PPC.CODSPC ');

              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(') SS ');

               SQL.Add('                                      ');
               SQL.Add(' WHERE                                ');
               SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)  AND ');
               SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND ');
               SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND ');
               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND ');

               if bQuebraPlanoPatro then
               begin
                 SQL.Add('    (S.IDPLANOPREV = SA.IDPLANOPREV) AND ');
                 SQL.Add('    (SS.IDPLANOPREV = S.IDPLANOPREV) AND ');
                 SQL.Add('    (S.IDPATRO = SA.IDPATRO)         AND ');
                 SQL.Add('    (SS.IDPATRO = S.IDPATRO)         AND ');
               end;

               if bquebraPorPatro then
               begin
                 SQL.Add('    (S.IDPATRO = SA.IDPATRO) AND ');
                 SQL.Add('    (SS.IDPATRO = S.IDPATRO) AND ');
               end;

              if bQuebraPorPlanoPrev then
               begin
                 SQL.Add('    (S.IDPLANOPREV = SA.IDPLANOPREV) AND ');
                 SQL.Add('    (SS.IDPLANOPREV = S.IDPLANOPREV) AND ');
               end;

               if bQuebraPorPlanoSPC then
               begin
                 SQL.Add('    (S.CODSPC  = SA.CODSPC) AND ');
                 SQL.Add('    (S.CODSPC  = SA.CODSPC) AND ');
                 SQL.Add('    (SS.CODSPC = SA.CODSPC) AND ');
               end;

               SQL.Add('    (PD.PLANO(+) = C.PLANO)      AND ');
               SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND ');
               SQL.Add('    (C.PLANO =' + sPlano + ')    AND ');
               SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
               SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

               If bDescResultado then
               Begin
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
               End;


               //início - andre tavares - 23/10/2006 - pendência 23333
               if bContraNatureza then
               begin
                 SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                 SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               end;
               //fim - andre tavares - 23/10/2006 - pendência 23333

               SQL.Add('GROUP BY                                                         ');
               SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP, ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');

               if bQuebraPlanoPatro then
                 SQL.Add('    , S.IDPLANOPREV, S.IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add('    , S.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add('    , S.IDPLANOPREV ');

              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');


               SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
               SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
               SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
               SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1''))  ');
               SQL.Add('UNION ALL                                                         ');
               SQL.Add('(SELECT                                                           ');
               SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
               SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + sNumero + ') AS GRAU,     ');
               If bOutroIdioma then
               Begin
                  SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,    ');
                  If bIndenta then
                     SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
                  Else
                     SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
               End Else
               Begin
                  SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,          ');
                  If bIndenta then
                     SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
                  Else
                     SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
               End;
               SQL.Add('   NVL(S.DEB,0) as DEB,                    ');
               SQL.Add('   NVL(S.CRED,0) as CRED,                  ');
               SQL.Add('   S.DEBA,                                 ');
               SQL.Add('   S.CREDA,                                ');
               SQL.Add('   S.MOV,                                  ');
               SQL.Add('   SA.SALDOANT, SS.SALDO,                                        ');
               SQL.Add('   DECODE(S.MOV, 0, '' '', DECODE(SIGN(S.MOV),                   ');
               SQL.Add('   -1, ''C'', ''D'' )) AS MOVDC,                                 ');
               SQL.Add('   DECODE(SS.SALDO, 0, '' '', DECODE(SIGN(SS.SALDO),             ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                           ');
               SQL.Add('   DECODE(SA.SALDOANT, 0, '' '', DECODE(SIGN(SA.SALDOANT),       ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCREANT,                             ');
               SQL.Add('   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) as SALDOABS,   ');      //AQUI
               SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS');

               if bQuebraPlanoPatro then
                 SQL.Add('   ,S.IDPLANOPREV, S.IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add('   , S.IDPATRO ');

              if bQuebraPorPlanoPrev then
                 SQL.Add('   ,S.IDPLANOPREV ');


              if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');

               if bQuebraPorPlanoSPC then
               begin
                 SQL.ADD(',(SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = ' + sPlano);
                 SQL.ADD('  UNION ');
                 SQL.ADD('  SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         PC.CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano+ ') PPC ');
               end;

               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');

///////////////////////////////////////////////////////////////////////////////////////////////
               SQL.Add('   (SELECT PPC.PLACONTA,                                             ');
               SQL.Add('       SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, PS.PLSDEBITOCORRENTE) ');
               SQL.Add('       - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCREDITOCOR)) AS SALDOANT');

               if bQuebraPlanoPatro then
                 SQL.Add('      ,PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add('      ,PT.IDPESSOA AS IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add('      ,PPC.IDPLANOPREV ');

               if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add(' FROM PLANOSALDO PS ');

               if bQuebraPlanoPatro OR bquebraPorPatro then
                 SQL.Add(' ,PATRO PT');


               if bQuebraPorPlanoSPC then
               begin
                 SQL.ADD(',(SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                 SQL.ADD('  UNION ');
                 SQL.ADD('  SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         PC.CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano +') PPC ');
               end;

               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('       ((PS.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PS.PERNUMERO IS NULL)) AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (PS.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (PT.IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (PS.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;


               if bQuebraPorPlanoSPC then
               begin
                 SQL.Add(' (PS.IDPLANOPREV(+) = PPC.IDPLANOPREV) AND ');
                 SQL.Add(' (PS.PLACONTA(+) = PPC.PLACONTA) AND '); //***
               end;

               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PS.PLACONTA ');

               if bQuebraPlanoPatro then
                 SQL.Add(', PPC.IDPLANOPREV, PT.IDPESSOA ');

               if bquebraPorPatro then
                 SQL.Add(', PT.IDPESSOA ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(', PPC.IDPLANOPREV ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(') SA, ');

               SQL.Add('                                                                 ');
///////////////////////////////////////////////////////////////////
{
               SQL.Add('   (SELECT PLACONTA,                                                     ');
               SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
               SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
               SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');

               if bQuebraPlanoPatro then
                 SQL.Add('  ,IDPLANOPREV, IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add('  , IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(' ,IDPLANOPREV ');

               if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('    FROM PLANOSALDO                                           ');
              if bQuebraPorPlanoSPC then
              begin
                SQL.ADD(' ,(SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV ');
                SQL.ADD('  UNION ');
                SQL.ADD('  SELECT NOME, ');
                SQL.ADD('         IDPLANOPREV, ');
                SQL.ADD('         CODSPC ');
                SQL.ADD('   FROM PLANPREVCONTABIL WHERE IDPLANOPREVPREV IS NULL) PPC ');
              end;

               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PEREXERCICIO =' + sExercicio+ ') AND         ');
               SQL.Add('       (PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni]) + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim])+ ') AND  ');

               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;


               if bQuebraPorPlanoSPC then
                 SQL.Add(' (IDPLANOPREV = PPC.IDPLANOPREV(+)) AND ');


               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PLACONTA ');

               if bQuebraPlanoPatro then
                 SQL.Add(', IDPLANOPREV, IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add(', IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(', IDPLANOPREV ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');


              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');


               SQL.Add(' ) S, ');
}

               //início - andre tavares - pendência 23320 - 03/10/2006 - alterei a query para listar também as contas sem movimento
               if bQuebraPlanoPatro then
               begin
                 SQL.Add(' (SELECT SDL.PLACONTA,                  ');
                 SQL.Add('         PPC.IDPLANOPREV,               ');
                 SQL.Add('         PT.IDPESSOA AS IDPATRO,        ');
                 SQL.Add('         NVL(SUM(SDL.DEB), 0)  AS DEB,  ');
                 SQL.Add('         NVL(SUM(SDL.CRED), 0) AS CRED, ');
                 SQL.Add('         NVL(SUM(SDL.CREDA), 0)AS CREDA,');
                 SQL.Add('         NVL(SUM(SDL.DEBA), 0) AS DEBA, ');
                 SQL.Add('         NVL(SUM(SDL.MOV), 0) AS MOV    ');
                 SQL.Add('  FROM PLANPREVCONTABIL PPC, PATRO PT,  ');
                 SQL.Add('      (SELECT P.PLACONTA,               ');
                 SQL.Add('              SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('              SUM(P.PLSCREDITOCOR) AS CRED,    ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA,    ');
                 SQL.Add('              (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV       ');
                 SQL.Add('              , P.IDPLANOPREV, P.IDPATRO ');
                 SQL.Add('       FROM PLANOSALDO P ');
                 SQL.Add('       WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('             (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('             (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('             (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('             (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('             (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('       GROUP BY P.PLACONTA, P.IDPLANOPREV, P.IDPATRO ) SDL ');
                 SQL.Add(' WHERE PPC.IDPLANOPREV = SDL.IDPLANOPREV(+) AND            ');
                 SQL.Add('       ((PT.IDPESSOA = SDL.IDPATRO) OR (SDL.IDPATRO IS NULL)) ');
                 SQL.Add(' GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, SDL.PLACONTA) S, ');
               end
               else if bquebraPorPatro then
               begin
                 SQL.Add(' (SELECT SDL.PLACONTA,                  ');
                 SQL.Add('         PT.IDPESSOA AS IDPATRO,        ');
                 SQL.Add('         NVL(SUM(SDL.DEB), 0)  AS DEB,  ');
                 SQL.Add('         NVL(SUM(SDL.CRED), 0) AS CRED, ');
                 SQL.Add('         NVL(SUM(SDL.CREDA), 0)AS CREDA,');
                 SQL.Add('         NVL(SUM(SDL.DEBA), 0) AS DEBA, ');
                 SQL.Add('         NVL(SUM(SDL.MOV), 0) AS MOV    ');
                 SQL.Add('  FROM PATRO PT,  ');
                 SQL.Add('      (SELECT P.PLACONTA,               ');
                 SQL.Add('              SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('              SUM(P.PLSCREDITOCOR) AS CRED,    ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA,    ');
                 SQL.Add('              (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV       ');
                 SQL.Add('              , P.IDPATRO ');
                 SQL.Add('       FROM PLANOSALDO P ');
                 SQL.Add('       WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('             (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('             (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('             (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('             (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('             (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('       GROUP BY P.PLACONTA, P.IDPATRO ) SDL ');
                 SQL.Add(' WHERE (PT.IDPESSOA = SDL.IDPATRO(+)) ');
                 SQL.Add(' GROUP BY PT.IDPESSOA, SDL.PLACONTA) S, ');
               end
               else if bQuebraPorPlanoPrev then
               begin
                 SQL.Add(' (SELECT SDL.PLACONTA,                  ');
                 SQL.Add('         PPC.IDPLANOPREV,               ');
                 SQL.Add('         NVL(SUM(SDL.DEB), 0)  AS DEB,  ');
                 SQL.Add('         NVL(SUM(SDL.CRED), 0) AS CRED, ');
                 SQL.Add('         NVL(SUM(SDL.CREDA), 0)AS CREDA,');
                 SQL.Add('         NVL(SUM(SDL.DEBA), 0) AS DEBA, ');
                 SQL.Add('         NVL(SUM(SDL.MOV), 0) AS MOV    ');
                 SQL.Add('  FROM PLANPREVCONTABIL PPC,  ');
                 SQL.Add('      (SELECT P.PLACONTA,               ');
                 SQL.Add('              SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('              SUM(P.PLSCREDITOCOR) AS CRED,    ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA,    ');
                 SQL.Add('              (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV       ');
                 SQL.Add('              , P.IDPLANOPREV ');
                 SQL.Add('       FROM PLANOSALDO P ');
                 SQL.Add('       WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('             (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('             (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('             (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('             (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('             (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('       GROUP BY P.PLACONTA, P.IDPLANOPREV ) SDL ');
                 SQL.Add(' WHERE PPC.IDPLANOPREV = SDL.IDPLANOPREV(+)  ');
                 SQL.Add(' GROUP BY PPC.IDPLANOPREV, SDL.PLACONTA) S, ');
               end
               else if  bQuebraPorPlanoSPC then
               begin
                 SQL.Add(' (SELECT PPC.PLACONTA,                  ');
                 SQL.Add('         PPC.CODSPC,                    ');
                 SQL.Add('         NVL(SUM(SDL.DEB), 0)  AS DEB,  ');
                 SQL.Add('         NVL(SUM(SDL.CRED), 0) AS CRED, ');
                 SQL.Add('         NVL(SUM(SDL.CREDA), 0)AS CREDA,');
                 SQL.Add('         NVL(SUM(SDL.DEBA), 0) AS DEBA, ');
                 SQL.Add('         NVL(SUM(SDL.MOV), 0) AS MOV    ');
                 SQL.Add('  FROM  ');
                 SQL.ADD('       (SELECT PC.NOME, ');
                 SQL.ADD('          PC.PLACONTA, ');
                 SQL.ADD('          PC.IDPLANOPREV, ');
                 SQL.ADD('          DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('        FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PC WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PC.PLANO = '+ sPlano);
                 SQL.ADD('        UNION ');
                 SQL.ADD('        SELECT P.NOME, ');
                 SQL.ADD('          P.IDPLANOPREV, ');
                 SQL.ADD('          PC.PLACONTA, ');
                 SQL.ADD('          P.CODSPC ');
                 SQL.ADD('        FROM PLANPREVCONTABIL P, PLANOCONTA PC WHERE IDPLANOPREVPREV IS NULL WHERE PC.PLANO = '+ sPlano +') PPC, ');
                 SQL.Add('      (SELECT P.PLACONTA,               ');
                 SQL.Add('              SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('              SUM(P.PLSCREDITOCOR) AS CRED,    ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA,    ');
                 SQL.Add('              (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV       ');
                 SQL.Add('              , P.IDPLANOPREV ');
                 SQL.Add('       FROM PLANOSALDO P ');
                 SQL.Add('       WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('             (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('             (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('             (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('             (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('             (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('       GROUP BY P.PLACONTA, P.IDPLANOPREV ) SDL ');
                 SQL.Add(' WHERE PPC.IDPLANOPREV = SDL.IDPLANOPREV(+) AND ');
                 SQL.Add('       PPC.PLACONTA = SDL.PLACONTA(+) ');
                 SQL.Add(' GROUP BY PPC.CODSPC, PPC.PLACONTA) S, ');
               end;
               //fim - andre tavares - pendência 23320 - 03/10/2006 - alterei a query para listar também as contas sem movimento

               SQL.Add('                                                                 ');
///////////////////////////////////////////////////////
               SQL.Add('   (SELECT                                                       ');
               SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');

               if bQuebraPlanoPatro then
                 SQL.Add('   ,IDPLANOPREV, IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add('   , IDPATRO ');

               if bQuebraPorPlanoPrev or bQuebraPorPlanoSPC then //andre tavares - pendencia 23320 - 03/10/2006
                 SQL.Add('    , IDPLANOPREV ');

               if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('    FROM PLANOSALDO                                           ');

              if bQuebraPorPlanoSPC then
              begin
                SQL.ADD(' ,(SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         pl.placonta, ');
                SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                SQL.ADD('  UNION ');
                SQL.ADD('  SELECT pc.NOME, ');
                SQL.ADD('         pc.IDPLANOPREV, ');
                SQL.ADD('         pl.placonta, ');
                SQL.ADD('         pc.CODSPC ');
                SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano +') PPC ');
              end;

               SQL.Add('    WHERE                                                     ');
               SQL.Add('          (PEREXERCICIO =' + sExercicio + ') AND              ');
               SQL.Add('          ((PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])  + ') OR (PERNUMERO IS NULL)) AND ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;


               if bQuebraPorPlanoSPC then
               begin
                 SQL.Add(' (IDPLANOPREV(+) = PPC.IDPLANOPREV) AND ');
                 SQL.Add(' (PLACONTA(+) = PPC.PLACONTA) AND ');
               END;

               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');

               SQL.Add('    GROUP BY PPC.PLACONTA '); //***

               if bQuebraPlanoPatro then
                 SQL.Add(', IDPLANOPREV, IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add(', IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(', IDPLANOPREV ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');

              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(')  SS ');

               SQL.Add('                                                              ');
               SQL.Add('WHERE                                                         ');
               SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
               SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');

               if bQuebraPlanoPatro then
               begin
                 SQL.Add('    (S.IDPLANOPREV = SA.IDPLANOPREV)AND   ');
                 SQL.Add('    (SS.IDPLANOPREV = S.IDPLANOPREV) AND  ');
                 SQL.Add('    (S.IDPATRO = SA.IDPATRO) AND          ');
                 SQL.Add('    (SS.IDPATRO = S.IDPATRO) AND          ');
               end;

               if bquebraPorPatro then
               begin
                 SQL.Add('    (S.IDPATRO = SA.IDPATRO) AND          ');
                 SQL.Add('    (SS.IDPATRO = S.IDPATRO) AND          ');
               end;

               if bQuebraPorPlanoPrev then
               begin
                 SQL.Add('    (S.IDPLANOPREV = SA.IDPLANOPREV)AND   ');
                 SQL.Add('    (SS.IDPLANOPREV = S.IDPLANOPREV) AND  ');
               end;

               if bQuebraPorPlanoSPC then
               begin
                 SQL.Add('    (S.CODSPC = SA.CODSPC) AND  ');
                 SQL.Add('    (SS.CODSPC = S.CODSPC) AND  ');
                 SQL.Add('    (P.PLACONTA = S.PLACONTA) AND  ');
                 SQL.Add('    (P.PLACONTA = SA.PLACONTA) AND  ');
                 SQL.Add('    (P.PLACONTA = SA.PLACONTA) AND  ');
                 SQL.Add('    (P.IDPLANOPREV = S.IDPLANOPREV) AND  ');
                 SQL.Add('    (P.IDPLANOPREV = SA.IDPLANOPREV) AND  ');
                 SQL.Add('    (P.IDPLANOPREV = SA.IDPLANOPREV) AND  ');
               end;

               SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
               SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND                          ');
               SQL.Add('    (C.PLANO =' + sPlano + ') AND                             ');
               SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND                  ');
               SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

               If bDescEstatistica then
               Begin
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'')                                   ');
               End;

               //início - andre tavares - 23/10/2006 - pendência 23333
               If bContraNatureza then
               Begin
                 SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                 SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               End;
               //fim - andre tavares - 23/10/2006 - pendência 23333


               SQL.Add('GROUP BY                                                         ');
               SQL.Add('    PPC.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');

               if bQuebraPlanoPatro then
                 SQL.Add('  , S.IDPLANOPREV, S.IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add('  , S.IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add('  , S.IDPLANOPREV ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');


              if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                        ');
               SQL.Add('       (DECODE(NVL(S.CRED,0),0,                        ');
               SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                                      ');
               SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1''))) U ');

               if bQuebraPlanoPatro then
                 SQL.Add(' WHERE P.IDPESSOA = U.IDPATRO AND PPC.IDPLANOPREV = U.IDPLANOPREV ');

               if bquebraPorPatro then
                 SQL.Add(' WHERE P.IDPESSOA = U.IDPATRO  ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(' WHERE PPC.IDPLANOPREV = U.IDPLANOPREV ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' WHERE PPC.CODSPC = U.CODSPC(+) ');

               SQL.Add('GROUP BY ');
               SQL.Add('   PPC.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, '); //***
               SQL.Add('   U.GRAU,                                                           ');
               SQL.Add('   U.CONTA, U.PLANOMEOUTLING, U.PLANOME,                         ');
               SQL.Add('   U.NOMEINDENTADO                                               ');

               if bQuebraPlanoPatro then
                 SQL.Add('   ,U.IDPLANOPREV, U.IDPATRO, P.NOME, PPC.NOME ');

               if bquebraPorPatro then
                 SQL.Add('   , U.IDPATRO, P.NOME ');

               if bQuebraPorPlanoPrev then
                 SQL.Add('   ,U.IDPLANOPREV, PPC.NOME ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');

               ssql := '';
               if bQuebraPlanoPatro then
                 ssql := ' ORDER BY PATRO, PLANOPREV, ';

               if bquebraPorPatro then
                 ssql := ' ORDER BY PATRO, ';

               if bQuebraPorPlanoPrev then
                 ssql := ' ORDER BY PLANOPREV, ';

               if  bQuebraPorPlanoSPC then
                 ssql := ssql + ' , PPC.CODSPC ';

               if ssql = '' then
                 ssql := ' ORDER BY ';

               If bContaCorresp then
               Begin
                 SQL.Add(ssql + ' , U.PLACONCORRESP                                              ');
               End Else
               Begin
                 SQL.Add(ssql + ' , U.PLACONTA                                                   ');
               End;
            End Else
            Begin
               SQL.Add('SELECT                                                           ');
               SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
               SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + sNumero + ') AS GRAU,     ');
               If bOutroIdioma then
               Begin
                  SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,    ');
                  If bIndenta then
                     SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO, ')
                  Else
                     SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO, ');
               End Else
               Begin
                  SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,           ');
                  If bIndenta then
                     SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,   ')
                  Else
                     SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO, ');
               End;
               SQL.Add('   NVL(S.DEB,0) as DEB,                    ');//v
               SQL.Add('   NVL(S.CRED,0) as CRED,                  ');//v
               SQL.Add('   S.DEBA,                                 ');
               SQL.Add('   S.CREDA,                                ');
               SQL.Add('   S.MOV,                                  ');
               SQL.Add('   NVL(SA.SALDOANT,0) as SALDOANT, NVL(SS.SALDO,0) AS SALDO,                                        ');
               SQL.Add('   DECODE(NVL(S.MOV,0), 0, '' '', DECODE(SIGN(S.MOV),                   ');
               SQL.Add('   -1, ''C'', ''D'' )) AS MOVDC,                                 ');
               SQL.Add('   DECODE(NVL(SS.SALDO,0), 0, '' '', DECODE(SIGN(SS.SALDO),             ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCRESALDO,                           ');
               SQL.Add('   DECODE(NVL(SA.SALDOANT,0), 0, '' '', DECODE(SIGN(SA.SALDOANT),       ');
               SQL.Add('   -1, ''C'', ''D'' )) AS DEBCREANT,                             ');
               SQL.Add('   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) as SALDOABS,   ');  //AQUI
               SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                       ');

               if bQuebraPlanoPatro then
                 SQL.Add('   ,S.IDPLANOPREV, PPC.NOME AS PLANOPREV, S.IDPATRO, P.NOME AS PATRO ');

               if bquebraPorPatro then
                 SQL.Add('   , S.IDPATRO, P.NOME AS PATRO ');


               if bQuebraPorPlanoPrev then
                 SQL.Add('   ,S.IDPLANOPREV, PPC.NOME AS PLANOPREV ');

               if bQuebraPorPlanoSPC then
                SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');

              if bQuebraPorPlanoSPC then
              begin
                SQL.ADD(' (SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                SQL.ADD('  UNION ');
                SQL.ADD('  SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         PC.CODSPC ');
                SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL  WHERE IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano +') PPC, ');
              end;

               if bQuebraPlanoPatro then
                 SQL.Add(' PESSOA P, PLANPREVCONTABIL PPC, ');

               if bquebraPorPatro then
                 SQL.Add(' PESSOA P, ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(' PLANPREVCONTABIL PPC, ');

               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
//início - andre tavares pendencia 22614 13/07/2006
{
               SQL.Add('   (SELECT PS.PLACONTA,                                             ');
               SQL.Add('       SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, PS.PLSDEBITOCORRENTE) ');
               SQL.Add('       - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCREDITOCOR)) AS SALDOANT ');
}
               if bQuebraPlanoPatro OR bquebraPorPatro or bQuebraPorPlanoPrev then
                 SQL.Add(' (SELECT  PATRO.PLACONTA, SUM(PLNSALDO.SALDOANT) AS SALDOANT ')
               else
                 SQL.Add(' (SELECT  PPC.PLACONTA, SUM(PLNSALDO.SALDOANT) AS SALDOANT ');

               if bQuebraPlanoPatro then
//                 SQL.Add('    , PS.IDPLANOPREV, PT.IDPESSOA AS IDPATRO ');
                 SQL.Add('    , PATRO.IDPATRO, PATRO.IDPLANOPREV ');

               if bquebraPorPatro then
//                 SQL.Add('    , PT.IDPESSOA AS IDPATRO ');
                 SQL.Add('    , PATRO.IDPATRO ');

               if bQuebraPorPlanoPrev then
//                 SQL.Add('    , PS.IDPLANOPREV ');
                 SQL.Add('    , PATRO.IDPLANOPREV ');

               if bQuebraPorPlanoSPC then
                SQL.ADD('     , PPC.CODSPC  ');

//               SQL.Add('    FROM PLANOSALDO PS ');
                 SQL.Add('FROM  ');

                 SQL.Add('         (SELECT PS.PLACONTA, SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, PS.PLSDEBITOCORRENTE) - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCREDITOCOR)) AS SALDOANT ');

                if bQuebraPlanoPatro then
                  SQL.Add('               , PS.IDPLANOPREV, PS.IDPATRO ');

               if bQuebraPorPlanoPrev or bQuebraPorPlanoSPC then //andre tavares - pendencia 23320 - 03/10/2006
                 SQL.Add('    , PS.IDPLANOPREV ');

               if bquebraPorPatro then
                 SQL.Add('    , PS.IDPATRO ');

                SQL.Add('           FROM PLANOSALDO PS ');
                SQL.Add('           WHERE (PS.PEREXERCICIO = '+ sExercicio +') AND ');
                SQL.Add('                 ((PS.PERNUMERO < '+ GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PS.PERNUMERO IS NULL)) AND ');
                SQL.Add('                 (PS.IDPESSOA = ' + sEmpresa +') AND ');
                SQL.Add('                 (PS.PLANO = ' + sPlano + ') AND ');
                SQL.Add('                 (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
                SQL.Add('                 (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

                If trim(sAtividade) <> '' then
                Begin
                   SQL.Add(' AND   ((PS.UNIDNEGOC = ' + trim(sAtividade) + ')  ');
                   SQL.Add(' AND   (PS.IDPESSOA =' + sEmpresa + '))  ');
                End;
                If trim(sPlanoPrevG) <> '' then
                Begin
                   SQL.Add(' AND  (PS.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) ');
                End;
                If trim(sPatroG) <> '' then
                Begin
                   SQL.Add(' AND  (PS.IDPATRO IN (' + trim(sPatroG) + '))  ');
                End;
                If trim(sAtividadeG) <> '' then
                Begin
                   SQL.Add(' AND  (PS.UNIDNEGOC IN (' + trim(sAtividadeG) + '))  ');
                End;

                SQL.Add('            GROUP BY PS.PLACONTA ');
                if bQuebraPlanoPatro then
                  SQL.Add('                 , PS.IDPLANOPREV, PS.IDPATRO ');

                if bquebraPorPatro then
                  SQL.Add('                 , PS.IDPATRO ');

                if bQuebraPorPlanoPrev OR bQuebraPorPlanoSPC then
                  SQL.Add('                 , PS.IDPLANOPREV ');

                SQL.Add('          )PLNSALDO ');

               if bQuebraPlanoPatro OR bquebraPorPatro or bQuebraPorPlanoPrev then
               begin
                 //SQL.Add(' ,PATRO PT ');
                 if bQuebraPlanoPatro then
                   SQL.Add('      ,  ( SELECT PC.PLACONTA, PP.IDPLANOPREV, PP.IDPATRO ');

                 if bquebraPorPatro then
                   SQL.Add('      ,  ( SELECT PC.PLACONTA, PP.IDPATRO ');

                 if bQuebraPorPlanoPrev then
                   SQL.Add('      ,  ( SELECT PC.PLACONTA, PP.IDPLANOPREV ');

                 SQL.Add('           FROM PLANPREVCONTABPATRO PP, PLANOCONTA PC ');
                 SQL.Add('           WHERE PP.IDPATRO IS NOT NULL AND PP.IDPLANOPREV IS NOT NULL AND ');
                 SQL.Add('                 (PC.PLANO = ' + sPlano + ') AND ');
                 SQL.Add('                 (PC.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
                 SQL.Add('                 (PC.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

                 if bQuebraPlanoPatro then
                   SQL.Add('        GROUP BY PC.PLACONTA, PP.IDPATRO, PP.IDPLANOPREV ');

                 if bquebraPorPatro then
                   SQL.Add('        GROUP BY PC.PLACONTA, PP.IDPATRO ');

                 if bQuebraPorPlanoPrev then
                   SQL.Add('        GROUP BY PC.PLACONTA, PP.IDPLANOPREV ');

                 SQL.Add('          ) PATRO ');
               end;
{
               SQL.Add(' WHERE ');

               if bQuebraPlanoPatro OR bquebraPorPatro then
                 SQL.Add('   PATRO.IDPATRO = PLNSALDO.IDPATRO(+) AND ');

               if bQuebraPlanoPatro or bQuebraPorPlanoPrev then
                 SQL.Add('   PATRO.IDPLANOPREV = PLNSALDO.IDPLANOPREV(+) ');

               SQL.Add('       GROUP BY PLNSALDO.PLACONTA');

               if bQuebraPlanoPatro OR bquebraPorPatro then
                 SQL.Add('            , PATRO.IDPATRO ');

               if bQuebraPlanoPatro or bQuebraPorPlanoPrev then
                 SQL.Add('            , PATRO.IDPLANOPREV ');

}
//fim - andre tavares pendencia 22614 13/07/2006

              if bQuebraPorPlanoSPC then
              begin
                SQL.ADD(' ,(SELECT PC.NOME, ');
                SQL.ADD('          PC.IDPLANOPREV, ');
                SQL.ADD('          PL.PLACONTA, ');
                SQL.ADD('          DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                SQL.ADD('  UNION ');
                SQL.ADD('  SELECT PC.NOME, ');
                SQL.ADD('         PC.IDPLANOPREV, ');
                SQL.ADD('         PL.PLACONTA, ');
                SQL.ADD('         PC.CODSPC ');
                SQL.ADD('   FROM PLANPREVCONTABIL PC, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano+ ') PPC ');
              end;

                 SQL.Add(' WHERE  1=1 ');
//início - andre tavares pendencia 22614 13/07/2006
{
               SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('       ((PS.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PS.PERNUMERO IS NULL)) AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (PS.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                  SQL.Add('      (PS.IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (PS.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;
}
               if bQuebraPlanoPatro OR bquebraPorPatro or bQuebraPorPlanoPrev then
                 SQL.Add(' AND PATRO.PLACONTA = PLNSALDO.PLACONTA(+) ');

               if bQuebraPlanoPatro OR bquebraPorPatro then
                 SQL.Add(' AND PATRO.IDPATRO = PLNSALDO.IDPATRO(+) ');

               if bQuebraPlanoPatro or bQuebraPorPlanoPrev then
                 SQL.Add(' AND  PATRO.IDPLANOPREV = PLNSALDO.IDPLANOPREV(+) ');

               if bQuebraPorPlanoSPC then
                SQL.ADD(' AND (PPC.IDPLANOPREV = PLNSALDO.IDPLANOPREV(+)) ');

               if bQuebraPlanoPatro OR bquebraPorPatro or bQuebraPorPlanoPrev then
                 SQL.Add(' GROUP BY PATRO.PLACONTA ')
               else
                 SQL.Add(' GROUP BY PPC.PLACONTA ');


               if bQuebraPlanoPatro then
                 //SQL.Add(' , PS.IDPLANOPREV, PT.IDPESSOA ');
                 SQL.Add(' , PATRO.IDPLANOPREV, PATRO.IDPATRO ');

               if bquebraPorPatro then
                 //SQL.Add(' , PT.IDPESSOA ');
                 SQL.Add(' , PATRO.IDPATRO ');

               if bQuebraPorPlanoPrev then
                 //SQL.Add(' , PS.IDPLANOPREV ');
                 SQL.Add(' , PATRO.IDPLANOPREV ');

//fim - andre tavares pendencia 22614 13/07/2006

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');


               if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(') SA, ');

               SQL.Add('                                                                 ');

               //início - andre tavares - pendência 23320 - 03/10/2006 - alterei a query para listar também as contas sem movimento
               if bQuebraPlanoPatro then
               begin
                 SQL.Add(' (SELECT PPP.*, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
                 SQL.Add('  FROM  (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
                 SQL.Add('        FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
                 SQL.Add('        WHERE (PL.PLANO =' + sPlano + ')   ');
                 SQL.Add('        GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
                 SQL.Add('       (SELECT P.IDPLANOPREV, P.IDPATRO, P.PLANO, P.PLACONTA, ');
                 SQL.Add('               SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('               SUM(P.PLSCREDITOCOR) AS CRED, ');
                 SQL.Add('               SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('               SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA, ');
                 SQL.Add('               (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV ');
                 SQL.Add('        FROM PLANOSALDO P ');
                 SQL.Add('        WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('        (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('        (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('        (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('        (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('        (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('        GROUP BY P.IDPLANOPREV, P.IDPATRO, P.PLANO, P.PLACONTA ) SALDO ');
                 SQL.Add(' WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
                 SQL.Add('       PPP.IDPATRO     = SALDO.IDPATRO(+) AND     ');
                 SQL.Add('       PPP.PLANO       = SALDO.PLANO(+) AND       ');
                 SQL.Add('       PPP.PLACONTA    = SALDO.PLACONTA(+) ) S,   ');
               end
               else if bquebraPorPatro then
               begin
                 SQL.Add(' (SELECT PPP.*, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
                 SQL.Add('  FROM  (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
                 SQL.Add('        FROM PATRO PT, PLANOCONTA PL ');
                 SQL.Add('        WHERE (PL.PLANO =' + sPlano + ')   ');
                 SQL.Add('        GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
                 SQL.Add('       (SELECT P.IDPATRO, P.PLANO, P.PLACONTA, ');
                 SQL.Add('               SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('               SUM(P.PLSCREDITOCOR) AS CRED, ');
                 SQL.Add('               SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('               SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA, ');
                 SQL.Add('               (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV ');
                 SQL.Add('        FROM PLANOSALDO P ');
                 SQL.Add('        WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('        (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('        (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('        (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('        (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('        (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('        GROUP BY P.IDPATRO, P.PLANO, P.PLACONTA ) SALDO ');
                 SQL.Add(' WHERE PPP.IDPATRO     = SALDO.IDPATRO(+) AND     ');
                 SQL.Add('       PPP.PLANO       = SALDO.PLANO(+) AND       ');
                 SQL.Add('       PPP.PLACONTA    = SALDO.PLACONTA(+) ) S,   ');
               end
               else if bQuebraPorPlanoPrev then
               begin
                 SQL.Add(' (SELECT PPP.*, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
                 SQL.Add('  FROM  (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
                 SQL.Add('        FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
                 SQL.Add('        WHERE (PL.PLANO =' + sPlano + ') ');
                 SQL.Add('        GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
                 SQL.Add('       (SELECT P.IDPLANOPREV, P.PLANO, P.PLACONTA, ');
                 SQL.Add('               SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('               SUM(P.PLSCREDITOCOR) AS CRED, ');
                 SQL.Add('               SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('               SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA, ');
                 SQL.Add('               (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV ');
                 SQL.Add('        FROM PLANOSALDO P ');
                 SQL.Add('        WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('        (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('        (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('        (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('        (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('        (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('        GROUP BY P.IDPLANOPREV, P.PLANO, P.PLACONTA ) SALDO ');
                 SQL.Add(' WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
                 SQL.Add('       PPP.PLANO       = SALDO.PLANO(+) AND       ');
                 SQL.Add('       PPP.PLACONTA    = SALDO.PLACONTA(+) ) S,   ');
               end
               else if  bQuebraPorPlanoSPC then
               begin
                 SQL.Add(' (SELECT PPC.PLACONTA,                  ');
                 SQL.Add('         PPC.CODSPC,                    ');
                 SQL.Add('         NVL(SUM(SDL.DEB), 0)  AS DEB,  ');
                 SQL.Add('         NVL(SUM(SDL.CRED), 0) AS CRED, ');
                 SQL.Add('         NVL(SUM(SDL.CREDA), 0)AS CREDA,');
                 SQL.Add('         NVL(SUM(SDL.DEBA), 0) AS DEBA, ');
                 SQL.Add('         NVL(SUM(SDL.MOV), 0) AS MOV    ');
                 SQL.Add('  FROM  ');
                 SQL.ADD('       (SELECT PC.NOME, ');
                 SQL.ADD('          PC.IDPLANOPREV, ');
                 SQL.ADD('          PS.PLACONTA, ');
                 SQL.ADD('          DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('        FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PS WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PS.PLANO = '+ sPlano);
                 SQL.ADD('        UNION ');
                 SQL.ADD('        SELECT PC.NOME, ');
                 SQL.ADD('          PC.IDPLANOPREV, ');
                 SQL.ADD('          PS.PLACONTA, ');
                 SQL.ADD('          PC.CODSPC ');
                 SQL.ADD('        FROM PLANPREVCONTABIL PC, PLANOCONTA PS WHERE IDPLANOPREVPREV IS NULL AND PS.PLANO = '+ sPlano +') PPC, ');
                 SQL.Add('      (SELECT P.PLACONTA,               ');
                 SQL.Add('              SUM(P.PLSDEBITOCORRENTE) AS DEB, ');
                 SQL.Add('              SUM(P.PLSCREDITOCOR) AS CRED,    ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSDEBITOCORRENTE, 0)) AS DEBA, ');
                 SQL.Add('              SUM(DECODE(P.PLSTIPO, ''A'', P.PLSCREDITOCOR, 0)) AS CREDA,    ');
                 SQL.Add('              (SUM(P.PLSDEBITOCORRENTE) - SUM(P.PLSCREDITOCOR)) AS MOV       ');
                 SQL.Add('              , P.IDPLANOPREV ');
                 SQL.Add('       FROM PLANOSALDO P ');
                 SQL.Add('       WHERE (P.PEREXERCICIO =' + sExercicio + ') AND       ');
                 SQL.Add('             (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
                 SQL.Add('             (P.IDPESSOA =' + sEmpresa + ') AND ');
                 SQL.Add('             (P.PLANO =' + sPlano + ') AND   ');
                 SQL.Add('             (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
                 SQL.Add('             (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
                 SQL.Add('       GROUP BY P.PLACONTA, P.IDPLANOPREV ) SDL ');
                 SQL.Add(' WHERE PPC.IDPLANOPREV = SDL.IDPLANOPREV(+)  ');
                 SQL.Add(' GROUP BY PPC.CODSPC, PPC.PLACONTA) S, ');
               end;
               //fim - andre tavares - pendência 23320 - 03/10/2006 - alterei a query para listar também as contas sem movimento


               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT                                                 ');
               SQL.Add('       PPC.PLACONTA, SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, PS.PLSDEBITOCORRENTE) ');
               SQL.Add('                   - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCREDITOCOR)) AS SALDO');

               if bQuebraPlanoPatro then
                 SQL.Add(', PPC.IDPLANOPREV, PPC.IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add(' , PPC.IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(', PPC.IDPLANOPREV ');

               if bQuebraPorPlanoSPC then
                 SQL.ADD(' , PPC.CODSPC  ');

               SQL.Add('    FROM PLANOSALDO PS');

               if bQuebraPorPlanoSPC then
               begin
                 SQL.ADD(' ,(SELECT PC.NOME, ');
                 SQL.ADD('         PC.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC ');
                 SQL.ADD('  FROM PLANPREVCONTABIL PC, PLANPREV PP, PLANOCONTA PL WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PL.PLANO = '+ sPlano);
                 SQL.ADD('  UNION ');
                 SQL.ADD('  SELECT P.NOME, ');
                 SQL.ADD('         P.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         P.CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL P, PLANOCONTA PL  WHERE IDPLANOPREVPREV IS NULL AND PL.PLANO = '+ sPlano +') PPC ');
               end
               else if bQuebraPlanoPatro then
               begin
                 SQL.ADD(',(SELECT P.IDPLANOPREV, ');
                 SQL.ADD('         PL.PLACONTA, ');
                 SQL.ADD('         PT.IDPESSOA AS IDPATRO ');
                 SQL.ADD('   FROM PLANPREVCONTABIL P, PATRO PT, PLANOCONTA PL WHERE  PL.PLANO = '+ sPlano +') PPC ');
               end
               else if bquebraPorPatro then
               begin
                 SQL.ADD(',(SELECT PL.PLACONTA, ');
                 SQL.ADD('         PT.IDPESSOA AS IDPATRO ');
                 SQL.ADD('   FROM PATRO PT, PLANOCONTA PL WHERE PL.PLANO = '+ sPlano +') PPC ');
               end
               else
               begin
                 SQL.ADD(' ,(SELECT P.IDPLANOPREV, ');
                 SQL.ADD('          PL.PLACONTA, ');
                 SQL.ADD('          P.CODSPC ');
                 SQL.ADD('   FROM PLANPREVCONTABIL P, PLANOCONTA PL  WHERE PL.PLANO = '+ sPlano +') PPC ');
               end;


               SQL.Add('    WHERE  ');
               SQL.Add('          (PS.PEREXERCICIO =' + sExercicio + ') AND      ');
               SQL.Add('          ((PS.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') OR (PS.PERNUMERO IS NULL)) AND ');

               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sPlanoPrevG) <> '' then
               Begin
                  SQL.Add('      (PPC.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
               End;
               If trim(sPatroG) <> '' then
               Begin
                 SQL.Add('      (PPC.IDPATRO IN (' + trim(sPatroG) + ')) AND ');
               End;
               If trim(sAtividadeG) <> '' then
               Begin
                  SQL.Add('      (PS.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND ');
               End;

               if bQuebraPorPlanoSPC or bQuebraPorPlanoPrev then
                 SQL.ADD('  (PPC.IDPLANOPREV = PS.IDPLANOPREV(+)) AND ');

               if bquebraPorPatro then
                 SQL.ADD('  (PPC.IDPATRO = PS.IDPATRO(+)) AND ');

               if bQuebraPlanoPatro then
               begin
                 SQL.ADD('  (PPC.IDPLANOPREV = PS.IDPLANOPREV(+)) AND ');
                 SQL.ADD('  (PPC.IDPATRO = PS.IDPATRO(+)) AND ');
               end;

               SQL.ADD('  (PPC.PLACONTA = PS.PLACONTA(+)) AND ');

               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PPC.PLACONTA ');

               if bQuebraPlanoPatro then
                 SQL.Add(' , PPC.IDPLANOPREV, PPC.IDPATRO ');

               if bquebraPorPatro then
                 SQL.Add(' , PPC.IDPATRO ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(' , PPC.IDPLANOPREV ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' ORDER BY PPC.CODSPC ');

               SQL.Add(' ) SS ');

               SQL.Add('                                      ');
               SQL.Add('WHERE                                 ');
               SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND  ');

               SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND ');

               SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND ');

               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND ');
               SQL.Add('    (PD.PLANO(+) = C.PLANO) AND       ');

               if bQuebraPlanoPatro then
               begin
                 SQL.Add('    (S.IDPLANOPREV = SA.IDPLANOPREV)AND   ');
                 SQL.Add('    (SS.IDPLANOPREV = S.IDPLANOPREV) AND  ');
                 SQL.Add('    (S.IDPATRO = SA.IDPATRO) AND          ');
                 SQL.Add('    (SS.IDPATRO = S.IDPATRO) AND          ');
               end;

               if bquebraPorPatro then
               begin
                 SQL.Add('    (S.IDPATRO = SA.IDPATRO) AND          ');
                 SQL.Add('    (SS.IDPATRO = S.IDPATRO) AND          ');
               end;

               if bQuebraPorPlanoPrev then
               begin
                 SQL.Add('    (S.IDPLANOPREV = SA.IDPLANOPREV)AND   ');
                 SQL.Add('    (SS.IDPLANOPREV = S.IDPLANOPREV) AND  ');
               end;


//               SQL.Add(' (PPC.PLACONTA = C.PLACONTA) AND ');

               if bQuebraPorPlanoSPC then
               begin
                 SQL.Add('  (PPC.CODSPC = PPC.CODSPC) AND ');
                 SQL.Add('  (SA.CODSPC = PPC.CODSPC) AND ');
                 SQL.Add('  (S.CODSPC  = PPC.CODSPC) AND ');
                 SQL.Add('  (SS.CODSPC = PPC.CODSPC) AND ');
                 SQL.Add('  (PPC.PLACONTA = C.PLACONTA) AND ');
               end;

               SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND                          ');
               SQL.Add('    (C.PLANO =' + sPlano + ') AND                             ');
               SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
               SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

               If bDescEstatistica then
               Begin
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'') ');
               End;

               //início - andre tavares - 23/10/2006 - pendência 23333
               If bContraNatureza then
               Begin
                 SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                 SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               End;
               //fim - andre tavares - 23/10/2006 - pendência 23333

               if bQuebraPlanoPatro then
               begin
                 SQL.Add(' AND P.IDPESSOA = S.IDPATRO AND PPC.IDPLANOPREV = S.IDPLANOPREV AND ');
                 SQL.Add(' SS.IDPATRO = S.IDPATRO AND SS.IDPLANOPREV = S.IDPLANOPREV ');
               end;

               if bquebraPorPatro then
               begin
                 SQL.Add(' AND P.IDPESSOA = S.IDPATRO ');
                 SQL.Add(' AND SS.IDPATRO = S.IDPATRO  ');
               end;

               if bQuebraPorPlanoPrev  then
                 SQL.Add(' AND PPC.IDPLANOPREV = S.IDPLANOPREV AND SS.IDPLANOPREV = S.IDPLANOPREV ');


               SQL.Add('GROUP BY                                                         ');
               SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP, ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');

               if bQuebraPlanoPatro then
                 SQL.Add(', S.IDPLANOPREV, PPC.NOME, S.IDPATRO, P.NOME ');

               if bquebraPorPatro then
                 SQL.Add(' , S.IDPATRO, P.NOME ');

               if bQuebraPorPlanoPrev then
                 SQL.Add(' , S.IDPLANOPREV, PPC.NOME ');

               if  bQuebraPorPlanoSPC then
                 SQL.Add(' , PPC.CODSPC ');

               SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
               SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
               SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
               SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');


                ssql := '';
               if bQuebraPlanoPatro then
                 ssql := ' ORDER BY PATRO, PLANOPREV, ';

               if bquebraPorPatro then
                 ssql := ' ORDER BY PATRO, ';

               if bQuebraPorPlanoPrev then
                 ssql := ' ORDER BY PLANOPREV, ';

               if bQuebraPorPlanoSPC then
                 ssql := ' ORDER BY PPC.CODSPC,  ';


               if ssql = '' then
                 ssql := ' ORDER BY ';

               If bContaCorresp then
               Begin
                  SQL.Add(ssql + ' C.PLACONCORRESP                                              ');
               End Else
               Begin
                  SQL.Add(ssql + ' C.PLACONTA                                                   ');
               End;

            End;
          End;
          CMDebugToFile(SQLChanged, 'c:\balancete.txt');
//          SQL.SaveToFile('C:\TESTE.TXT');

          Result := Data;

     Finally
        Free;
     End;


end;



function TCtrlRptBalanceteAnalPPX.SelecionaPlanoContaPer(iPeriodo,
  iExercicio, IdEmpresa: Double): String;
var sDataRef : String;
begin
   if iPeriodo < 10 then
      sDataRef := FloatToStr(iExercicio)+'0'+FloatToStr(iPeriodo)
   else
      sDataRef := FloatToStr(iExercicio)+FloatToStr(iPeriodo);
   Result := '(SELECT P.PLANOME, P.PLACONTA, P.PLANO, P.PLATIPO, P.PLAINATIVA '+
             '  FROM  PLANOCONTAPER P, '+
             '            (SELECT PLACONTA, PLANO, MIN(TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,''0''||TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0)))) AS PERNUMERO '+
             '             FROM PLANOCONTAPER '+
             '             WHERE (TO_CHAR(PEREXERCICIO)||DECODE(LENGTH(NVL(PERNUMERO,0)),1,''0''||TO_CHAR(NVL(PERNUMERO,0)),TO_CHAR(NVL(PERNUMERO,0))) >= '''+sDataRef+''') '+
             '               AND (IDPESSOA = '+FloatToStr(idEmpresa)+') '+
             '             GROUP BY  PLACONTA, PLANO) PX '+
             '  WHERE (P.PLACONTA = PX.PLACONTA) '+
             '    AND (P.PLANO = PX.PLANO)       '+
             '    AND (P.IDPESSOA = '+FloatToStr(idEmpresa)+') '+
             '    AND (TO_CHAR(P.PEREXERCICIO)||DECODE(LENGTH(NVL(P.PERNUMERO,0)),1,''0''||TO_CHAR(NVL(P.PERNUMERO,0)),TO_CHAR(NVL(P.PERNUMERO,0))) = PX.PERNUMERO)) ';
end;

end.







