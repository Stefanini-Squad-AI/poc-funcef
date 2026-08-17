{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
unit uCtrlRptBalanceteAnalSubConta;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,uSistema,Provider,uCtrlPeriodo,
     uCtrlContab,ComCtrls, uCMTypes, uCMSqlParams, uCMFileUtils, MIdas,
     uCmClientDataSet;


  Type
    TCtrlRptBalanceteAnalSubConta = Class(TCmControlObject)
    private
     Periodo   : TCtrlPeriodo;
     Contab    : TCtrlContab;


    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;


    public
       Constructor Create; Override;
       Destructor Destroy; Override;

       Function SelecionaPlanoContaPer(iPeriodo, iExercicio,idEmpresa : Double) : String;

       Function FazQuery(sDataIni,sDataFim,sExercicio,sPeriodoIni,sPeriodoFim,sContaIni,
                         sContaFim: string; bquebraPorPatro, bQuebraPorPlanoSPC: boolean; sNumero,sAtividade,sPlano,
                         sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                         bContaCorresp, bIndenta, bQuebraPorPlanoPrev, bDescResultado, bDescEstatistica: boolean;
                         bQuebraPlanoPatro: Boolean; bContraNatureza: boolean; const sContasZeradas: string = 'N'):OleVariant;



       Function FazQueryDetalhe(sDataIni,sDataFim,sExercicio,sPeriodoIni,sPeriodoFim,sContaIni,
                                sContaFim: string; bquebraPorPatro, bQuebraPorPlanoSPC: boolean; sNumero,sAtividade,sPlano,
                                sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                                bIndenta, bQuebraPorPlanoPrev, bDescResultado, bDescEstatistica: boolean;
                                bQuebraPlanoPatro: Boolean; bContraNatureza, bQuebraSubConta: boolean):OleVariant;



    End;


implementation

uses UMensErro, uString,uData, uFuncaoGeral,FSM_FxLib;

procedure TCtrlRptBalanceteAnalSubConta.AfterInitialize;
begin
  inherited;
  Periodo.initializeas(self);
  Contab.initializeas(self);
end;



constructor TCtrlRptBalanceteAnalSubConta.Create;
begin
  inherited;
  Periodo       := TCtrlPeriodo.Create;
  Contab        := TCtrlContab.Create;

end;

destructor TCtrlRptBalanceteAnalSubConta.Destroy;
begin
  Periodo.free;
  Contab.Free;
  
  inherited;
end;



procedure TCtrlRptBalanceteAnalSubConta.DoChangeDataBase;
begin
  inherited;

end;



function TCtrlRptBalanceteAnalSubConta.FazQuery(sDataIni,sDataFim,sExercicio,sPeriodoIni,sPeriodoFim,sContaIni,
                         sContaFim: string; bquebraPorPatro, bQuebraPorPlanoSPC: boolean; sNumero,sAtividade,sPlano,
                         sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                         bContaCorresp,bIndenta, bQuebraPorPlanoPrev, bDescResultado, bDescEstatistica: boolean;
                         bQuebraPlanoPatro: Boolean; bContraNatureza: boolean; const sContasZeradas: string = 'N'):OleVariant;

begin
     If trim(sDataIni) <> '' then
        Periodo.RetornaPeriodoExercicioData(StrToFloat(sEmpresa),sDataIni);


     With TCMSqlParams.Create(nil) Do
     Try
          SQL.Clear;
          If trim(sDataIni) <> '' then
          Begin
            SQL.Add('SELECT /*+ RULE */ ');
            //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
            SQL.Add('   C.PLASECRETARIA, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
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
            SQL.Add('FROM                                                             ');
            SQL.Add('    PLANOCONTA C,                                                ');
            SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
            SQL.Add('   (SELECT C.PLACONTA,                                           ');
            SQL.Add('           SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
            SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC     ');
            SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
            SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
            SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
            If bDescResultado then
            Begin
              SQL.Add('       ((L.TIPCODIGO IS NULL) OR                        ');
              SQL.Add('       (L.TIPCODIGO <> '''+sTipCodigo+''')) AND         ');
            End;
            SQL.Add('         (P.PEREXERCICIO =' + sExercicio + ') AND         ');
            SQL.Add('         (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND ');
            SQL.Add('         (P.PLNDATDIA >= TO_DATE('''+DateToStr(Periodo.DataIniPeriodo)+''',''DD/MM/YYYY'')) AND ');
            If trim(sAtividade) <> '' then
            Begin
              SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND    ');
              SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND           ');
            End;

            SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');


            If trim(sPlanoPrevG) <> '' then
            Begin
              SQL.Add('      (L.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
            End;
            If trim(sPatroG) <> '' then
            Begin
              SQL.Add('      (L.IDPATRO IN (' + trim(sPatroG) + ')) AND        ');
            End;
            If trim(sAtividadeG) <> '' then
            Begin
              SQL.Add('      (L.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND  ');
            End;
            SQL.Add('          (RTRIM(P.IDPESSOA) =' + sEmpresa + ') AND       ');
            SQL.Add('          (RTRIM(L.PLANO)    =' + sPlano + ') AND         ');
            SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND            ');
            SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
            SQL.Add('    GROUP BY C.PLACONTA ) SA,                                              ');
            SQL.Add('   (SELECT PS.PLACONTA,                                               ');
            SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)   ');
            SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
            SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                                ');
            SQL.Add('    WHERE                                                     ');
            SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND                 ');
            SQL.Add('       ((PS.PERNUMERO IS NULL) OR (PS.PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND                                ');
            If trim(sAtividade) <> '' then
            Begin
              SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
              SQL.Add('       (PS.IDPESSOA =' + sEmpresa +')) AND              ');
            End;

            SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');


            If trim(sPlanoPrevG) <> '' then
            Begin
               SQL.Add('      (PS.IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
            End;
            If trim(sPatroG) <> '' then
            Begin
              SQL.Add('      (PS.IDPATRO IN (' + trim(sPatroG) + ')) AND          ');
            End;
            If trim(sAtividadeG) <> '' then
            Begin
               SQL.Add('      (PS.UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND  ');
            End;
            SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
            SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
            SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
            SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
            SQL.Add('    GROUP BY PS.PLACONTA ) SN,                                            ');
            SQL.Add('                                                                       ');
            SQL.Add('   (SELECT C.PLACONTA,                                                 ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB,          ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED,         ');
            SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0),0)) AS DEBA,         ');
            SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0),0)) AS CREDA,        ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
            SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC           ');
            SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND               ');
            SQL.Add('          (L.PLANO = C.PLANO) AND                                      ');
            SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                              ');
            if bDescResultado then
            Begin
              SQL.Add('       ((L.TIPCODIGO IS NULL) OR ');
              SQL.Add('       (L.TIPCODIGO <> '''+sTipCodigo+''')) AND             ');
            End;
            SQL.Add('    (P.PEREXERCICIO = ' + sExercicio + ') AND                 ');
            SQL.Add('    (P.PLNDATDIA BETWEEN TO_DATE('''+sDataIni+''',''DD/MM/YYYY'') AND TO_DATE('''+sDataFim+''',''DD/MM/YYYY'')) AND ');
            If trim(sAtividade) <> '' then
            Begin
              SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND        ');
              SQL.Add('       (L.IDPESSOA =' + sEmpresa + ')) AND                  ');
            End;

            SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
            SQL.Add('          (RTRIM(P.IDPESSOA) = ' + sEmpresa + ') AND ');
            SQL.Add('          (RTRIM(L.PLANO)    = ' + sPlano  +  ') AND  ');
            SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
            SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
            SQL.Add('    GROUP BY C.PLACONTA ) S                                   ');
            SQL.Add('                                                              ');
            SQL.Add('WHERE                                                         ');
            SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
            SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
            SQL.Add('    (SN.PLACONTA(+) = C.PLACONTA) AND                         ');
            SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
            SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
            SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND        ');
            SQL.Add('    (C.PLANO =' + sPlano + ') AND   ');
            SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
            SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');
            If bDescEstatistica then
            Begin
               SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
            End;
            If bContraNatureza then
            Begin
               SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) < 0)) OR         ');
               SQL.Add('      ((C.PLANATUREZA = ''C'') AND  ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) >= 0)))         ');
            End;
            SQL.Add('GROUP BY                                                         ');
            //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
            SQL.Add('    C.PLASECRETARIA, C.PLACONTA, SA.SALDOANT, SN.SALDOAN,               ');
            SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
            SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
            SQL.Add('    S.DEB,                                                       ');
            SQL.Add('    S.CRED,                                                      ');
            SQL.Add('    S.DEBA,                                                      ');
            SQL.Add('    S.CREDA,                                                     ');
            SQL.Add('    S.MOV                                                        ');

            if sContasZeradas = 'N' then  // NÃO IMPRIME ZERADAS //
            begin
              SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
              SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
              SQL.Add('       (DECODE(NVL(SN.SALDOAN,0),0,                              ');
              SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
            end;
          End Else
          Begin
            If bDescResultado then
            Begin
               SQL.Add('SELECT                                                               ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('   U.PLASECRETARIA, U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, ');
               SQL.Add('   U.GRAU,                                                           ');
               SQL.Add('   U.CONTA, U.PLANOME, U.PLANOMEOUTLING,                             ');
               SQL.Add('   U.NOMEINDENTADO,                         ');
               SQL.Add('   ABS(SUM(NVL(U.DEB,0))) AS DEB,           ');
               SQL.Add('   ABS(SUM(NVL(U.CRED,0))) AS CRED,         ');
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
               SQL.Add('   ABS(SUM(NVL(U.SALDOANT,0))) as SALDOANTABS, ABS(SUM(NVL(U.SALDO,0))) as SALDOABS, ');
               SQL.Add('   ABS(SUM(NVL(U.MOV,0))) AS MOVABS              ');
               SQL.Add('FROM                                             ');
               SQL.Add('((SELECT                                         ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('   C.PLASECRETARIA, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
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
               SQL.Add('   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) as SALDOABS,   ');
               SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                          ');
               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');
               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT C.PLACONTA,                                           ');
               SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC     ');
               SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
               SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
               SQL.Add('          (P.PLNCODIGO    = L.PLNCODIGO) AND                     ');
               SQL.Add('          (L.TIPCODIGO    = '''+sTipCodigo+''') AND ');
               SQL.Add('          (P.PEREXERCICIO =' + sExercicio + ') AND       ');
               SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni])+') AND ');
               If trim(sAtividade) <> '' then
               Begin
                 SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND          ');
                 SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND ');
               End;

               SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ) SA,                                              ');
               SQL.Add('                                                                       ');
               SQL.Add('   (SELECT C.PLACONTA,                                                 ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEB,          ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CRED,         ');
               SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0),0)) AS DEBA,         ');
               SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0),0)) AS CREDA,        ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC  ');
               SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
               SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
               SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
               SQL.Add('       (L.TIPCODIGO = '''+sTipCodigo+''') AND ');
               SQL.Add('       (P.PEREXERCICIO =' + sExercicio + ') AND       ');
               SQL.Add('    (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (L.IDPESSOA =' + sEmpresa + ')) AND ');
               End;

               SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ) S,                               ');
               SQL.Add('                                                           ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('   (SELECT C.PLACONTA,   ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC     ');
               SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
               SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
               SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
               SQL.Add('       (L.TIPCODIGO = '''+sTipCodigo+''') AND ');
               SQL.Add('       (P.PEREXERCICIO =' + sExercicio + ') AND       ');
               SQL.Add('       (P.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])+') AND ');
               If trim(sAtividade) <> '' Then
               Begin
                  SQL.Add('       ((L.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND ');
               End;

               SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ) SS                         ');
               SQL.Add('                                                              ');
               SQL.Add('WHERE                                                         ');
               SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
               SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
               SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND        ');
               SQL.Add('    (C.PLANO =' + sPlano + ') AND   ');
               SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
               SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');
               If bDescResultado then
               Begin
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
               End;
               If bContraNatureza then
               Begin
                  SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                  SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               End;
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('GROUP BY                                                         ');
               SQL.Add('    C.PLASECRETARIA, C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');

               if sContasZeradas = 'N' then  // NÃO IMPRIME ZERADAS //
               begin
                 SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
                 SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
                 SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
                 SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'')) ');
               end;

               SQL.Add('UNION ALL                                                         ');
               SQL.Add('(SELECT                                                           ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('   C.PLASECRETARIA, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
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
               SQL.Add('   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) as SALDOABS,   ');
               SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS');
               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');
               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT PS.PLACONTA,                                             ');
               SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
               SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('       ((PS.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PERNUMERO IS NULL)) AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;

               SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PS.PLACONTA ) SA,                                              ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT PLACONTA,                                                     ');
               SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
               SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
               SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');
               SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                          ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PS.PEREXERCICIO =' + sExercicio+ ') AND         ');
               SQL.Add('       (PS.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni]) + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim])+ ') AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;

               SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PS.PLACONTA ) S,                                       ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT                                                       ');
               SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
               SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('          (PS.PEREXERCICIO =' + sExercicio + ') AND              ');
               SQL.Add('          ((PS.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])  + ') OR (PERNUMERO IS NULL)) AND ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;

               SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

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
               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PLACONTA ) SS                              ');
               SQL.Add('                                                              ');
               SQL.Add('WHERE                                                         ');
               SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
               SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
               SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND                          ');
               SQL.Add('    (C.PLANO =' + sPlano + ') AND                             ');
               SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND                  ');
               SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');
               If bDescEstatistica then
               Begin
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'')                                   ');
               End;
               If bContraNatureza then
               Begin
                  SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                  SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               End;
               SQL.Add('GROUP BY                                                         ');

               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('    C.PLASECRETARIA, C.PLACONTA, SA.SALDOANT, SS.SALDO,          ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,  ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');

               if sContasZeradas = 'N' then
               begin
                 SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                        ');
                 SQL.Add('       (DECODE(NVL(S.CRED,0),0,                        ');
                 SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                                      ');
                 SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'' ');
               end;


                 sql.Add(' ))) U ');

               SQL.Add('GROUP BY ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('   U.PLASECRETARIA, U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, ');
               SQL.Add('   U.GRAU,                                                           ');
               SQL.Add('   U.CONTA, U.PLANOMEOUTLING, U.PLANOME,                         ');
               SQL.Add('   U.NOMEINDENTADO                                               ');
               SQL.Add('ORDER BY                                                         ');
               If bContaCorresp then
               Begin
                 SQL.Add(' U.PLACONCORRESP                                              ');
               End Else
               Begin
                 SQL.Add(' U.PLACONTA                                                   ');
               End;
            End Else
            Begin
               SQL.Add('SELECT ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('   C.PLASECRETARIA, C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
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
               SQL.Add('   NVL(S.DEB,0) as DEB,                    ');
               SQL.Add('   NVL(S.CRED,0) as CRED,                  ');
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
               SQL.Add('   ABS(NVL(SA.SALDOANT,0)) as SALDOANTABS, ABS(NVL(SS.SALDO,0)) as SALDOABS,   ');
               SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                          ');
               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');
               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT PS.PLACONTA,                                             ');
               SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
               SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                               ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('       ((PS.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PERNUMERO IS NULL)) AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;

               Sql.Add(' ( CC.CODCENTROCUSTO(+) = PS.CODCENTROCUSTO ) AND ');

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
               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PS.PLACONTA ) SA,                                              ');
               SQL.Add('                                            ');
               SQL.Add('   (SELECT PS.PLACONTA,                                                  ');
               SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
               SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
               SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');
               SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                                ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('    (PS.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               Sql.Add(' ( CC.CODCENTROCUSTO(+) = PS.CODCENTROCUSTO ) AND ');

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
               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PS.PLACONTA ) S,                                      ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT                                                 ');
               SQL.Add('       PS.PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
               SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                                ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('          (PS.PEREXERCICIO =' + sExercicio + ') AND      ');
               SQL.Add('          ((PS.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') OR (PERNUMERO IS NULL)) AND ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((PS.UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               Sql.Add(' ( CC.CODCENTROCUSTO(+) = PS.CODCENTROCUSTO ) AND ');

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
               SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PS.PLACONTA ) SS                              ');
               SQL.Add('                                                              ');
               SQL.Add('WHERE                                                         ');
               SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
               SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
               SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
               SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND                          ');
               SQL.Add('    (C.PLANO =' + sPlano + ') AND                             ');
               SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND                  ');
               SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');
               If bDescEstatistica then
               Begin
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'')                                    ');
               End;
               If bContraNatureza then
               Begin
                  SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                  SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               End;
               SQL.Add('GROUP BY                                                         ');
               //pendência 27313 - 28/01/2008 - adicionada a coluna C.PLASECRETARIA para incluir no balancete somente as contas padrão da SPC, assim é possível fazer um filter.
               SQL.Add('    C.PLASECRETARIA, C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');

               //IMPRIME CONTAS SINTÉTICAS ZERADAS
               if ((sContasZeradas = 'S') or (sContasZeradas = 'SM')) then begin
                  SQL.Add('HAVING ((DECODE(C.PLATIPO,''A'',                                ');
                  SQL.Add('       (DECODE(NVL(S.DEB,0),0,                                  ');
                  SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
                  SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
                  SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')),''1'')) = ''1'') ');
               end;
               if sContasZeradas = 'N' then begin  // NÃO IMPRIME ZERADAS
                  SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
                  SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
                  SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
                  SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
               end;

               SQL.Add('ORDER BY                                                         ');
               If bContaCorresp then
               Begin
                  SQL.Add(' C.PLACONCORRESP                                              ');
               End Else
               Begin
                  SQL.Add(' C.PLACONTA                                                   ');
               End;
            End;
          End;
          //Henrique Massão
          //CMDebugToFile(SQLChanged, 'c:\balancetePPSubConta.txt');
          CMDebugToFile(SQLChanged, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\balancetePPSubConta.txt');

          Result := Data;

     Finally
        Free;
     End;

end;



function TCtrlRptBalanceteAnalSubConta.FazQueryDetalhe(sDataIni, sDataFim,
  sExercicio, sPeriodoIni, sPeriodoFim, sContaIni, sContaFim: string;
  bquebraPorPatro, bQuebraPorPlanoSPC: boolean; sNumero, sAtividade,
  sPlano, sEmpresa, sTipCodigo, sPlanoPrevG, sPatroG, sAtividadeG,
  sGrau: string; bOutroIdioma, bIndenta,
  bQuebraPorPlanoPrev, bDescResultado, bDescEstatistica, bQuebraPlanoPatro, bContraNatureza, bQuebraSubConta: boolean): OleVariant;

  var ssql: string;
begin
  If trim(sDataIni) <> '' then
    Periodo.RetornaPeriodoExercicioData(StrToFloat(sEmpresa),sDataIni);
  With TCMSqlParams.Create(nil) Do
  Try
     SQL.Clear;
     If trim(sDataIni) <> '' then
     Begin
       SQL.Add('SELECT /*+RULE*/                                                     ');

       if bQuebraSubConta then
       begin
         SQL.Add('  C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0) AS CODSUBCONTA, ');
         SQL.Add('  SUB.NOMESUBCONTA, ');
       end
       else
       begin
         SQL.Add('  C.PLACONTA, ');
       end;

       SQL.Add('  C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
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
       SQL.Add('   ABS(NVL(SUM(S.DEB),0)) as DEB,               ');
       SQL.Add('   ABS(NVL(SUM(S.CRED),0)) as CRED,             ');
       SQL.Add('   SUM(S.DEBA) AS DEBA,                         ');
       SQL.Add('   SUM(S.CREDA) AS CREDA,                       ');
       SQL.Add('   SUM(S.MOV) AS MOV,                           ');
///////////////////

       if  bQuebraSubConta and bQuebraPlanoPatro then
       begin
         SQL.Add('   PPC.NOME AS PLANOPREV, P.NOME AS PATRO, ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))      OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOABS,');
       end
       else if not bQuebraSubConta and bQuebraPlanoPatro then
       begin
         SQL.Add('   PPC.NOME AS PLANOPREV, P.NOME AS PATRO, ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))      OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY P.IDPESSOA, PPC.NOME, C.PLACONTA) AS SALDOABS,');
       end

       else if bQuebraSubConta and bQuebraPorPlanoPrev then
       begin
         SQL.Add('   PPC.NOME AS PLANOPREV, ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY  PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0))             OVER (PARTITION BY  PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY  PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY  PPC.NOME, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOABS,');
       end
       else if not bQuebraSubConta and bQuebraPorPlanoPrev then
       begin
         SQL.Add('   PPC.NOME AS PLANOPREV, ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY  PPC.NOME, C.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0))             OVER (PARTITION BY  PPC.NOME, C.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY  PPC.NOME, C.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY  PPC.NOME, C.PLACONTA) AS SALDOABS,');
       end

       else if bQuebraSubConta and bquebraPorPatro then
       begin
         SQL.Add('   P.NOME AS PATRO, ');
         SQL.Add('   P.IDPESSOA AS IDPATRO, ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY P.IDPESSOA, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0)+ NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0))         OVER (PARTITION BY P.IDPESSOA, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY P.IDPESSOA, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY P.IDPESSOA, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOABS,');
       end
       else if not bQuebraSubConta and bquebraPorPatro then
       begin
         SQL.Add('   P.NOME AS PATRO, ');
         SQL.Add('   P.IDPESSOA AS IDPATRO, ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY P.IDPESSOA, C.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0)+ NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0))         OVER (PARTITION BY P.IDPESSOA, C.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY P.IDPESSOA, C.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY P.IDPESSOA, C.PLACONTA) AS SALDOABS,');
       end

       else if bQuebraSubConta and bQuebraPorPlanoSPC then
       begin
         SQL.ADD('   PPC.CODSPC,  ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0)+ NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0))         OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA, NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0)) AS SALDOABS,');
       end
       else if not bQuebraSubConta and bQuebraPorPlanoSPC then
       begin
         SQL.ADD('   PPC.CODSPC,  ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0))                          OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0)+ NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0))         OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0)))                     OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   SUM(ABS(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0))) OVER (PARTITION BY  PPC.CODSPC, C.PLACONTA) AS SALDOABS,');
       end;


//////////////////
       SQL.Add('   DECODE(NVL(SUM(S.MOV),0), 0, '' '', DECODE(SIGN(SUM(S.MOV)), -1, ''C'', ''D'' )) AS MOVDC,  ');
       SQL.Add('   DECODE(NVL(SUM(SA.SALDOANT),0) + NVL(SUM(SN.SALDOAN),0) + NVL(SUM(S.MOV),0), 0, '' '', ');
       SQL.Add(' DECODE(SIGN(NVL(SUM(SA.SALDOANT),0)+NVL(SUM(SN.SALDOAN),0)+NVL(SUM(S.MOV),0)),  -1, ''C'', ''D'' )) AS DEBCRESALDO,    ');
       SQL.Add('   DECODE(NVL(SUM(SA.SALDOANT),0)+NVL(SUM(SN.SALDOAN),0), 0, '' '',              ');
       SQL.Add('DECODE(SIGN(NVL(SUM(SA.SALDOANT),0)+NVL(SUM(SN.SALDOAN),0)), -1, ''C'', ''D'' )) AS DEBCREANT, ');
       SQL.Add('   ABS(NVL(SUM(S.MOV),0)) AS MOVABS                                   ');

       SQL.Add('FROM                                             ');
       SQL.Add('  PLANOCONTA C, ');
       SQL.Add('  ( SELECT CODSUBCONTA, NOMESUBCONTA FROM SUBCONTA ');
       SQL.Add('    UNION ');
       SQL.Add('   SELECT (0) AS CODSUBCONTA, ');
       SQL.Add('          ''                                                                 '' AS NOMESUBCONTA FROM DUAL ');
       SQL.Add('  ) SUB, ');


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


       if bQuebraPlanoPatro then
       begin
         SQL.Add('(  SELECT PPP.*, SALDO.CODSUBCONTA, NVL(SALDO.SALDOANT, 0) AS SALDOANT ');
         SQL.Add('   FROM  (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
         SQL.Add('          FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
         SQL.Add('          WHERE PL.PLANO = ' + sPlano );


         SQL.Add('          GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');

         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('       GROUP BY L.IDPLANOPREV, L.IDPATRO, C.PLACONTA, L.CODSUBCONTA, C.PLANO ) SALDO ');
         SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('         PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
         SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
         SQL.Add('   ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bquebraPorPatro then
       begin
         SQL.Add('(  SELECT PPP.*, SALDO.CODSUBCONTA, NVL(SALDO.SALDOANT, 0) AS SALDOANT ');
         SQL.Add('   FROM  (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
         SQL.Add('          FROM PATRO PT, PLANOCONTA PL ');
         SQL.Add('          WHERE PL.PLANO = ' + sPlano );


         SQL.Add('          GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');

         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('       GROUP BY L.IDPATRO, C.PLACONTA, L.CODSUBCONTA, C.PLANO ) SALDO ');
         SQL.Add('   WHERE ');
         SQL.Add('         PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
         SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
         SQL.Add('   ORDER BY PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bQuebraPorPlanoPrev then
       begin
         SQL.Add('(  SELECT PPP.*, SALDO.CODSUBCONTA, NVL(SALDO.SALDOANT, 0) AS SALDOANT ');
         SQL.Add('   FROM  (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
         SQL.Add('          FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
         SQL.Add('          WHERE PL.PLANO = ' + sPlano );


         SQL.Add('          GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');

         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('       GROUP BY L.IDPLANOPREV, C.PLACONTA, L.CODSUBCONTA, C.PLANO ) SALDO ');
         SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
         SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
         SQL.Add('   ORDER BY  PPP.IDPLANOPREV, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bQuebraPorPlanoSPC then
       begin
         SQL.Add('(  SELECT PPP.PLACONTA, PPP.PLANO, SALDO.CODSUBCONTA, PPP.CODSPC, SUM(NVL(SALDO.SALDOANT, 0)) AS SALDOANT ');
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

         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('       GROUP BY L.IDPLANOPREV, C.PLACONTA, L.CODSUBCONTA, C.PLANO ) SALDO ');
         SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
         SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
         SQL.Add('   GROUP BY PPP.CODSPC, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end;

       SQL.Add(') SA, ');

       if bQuebraPlanoPatro then
       begin
         SQL.Add('(SELECT PPP.*, SALDO.CODSUBCONTA, NVL(SALDO.SALDOAN, 0) AS SALDOAN FROM ');
         SQL.Add('   (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
         SQL.Add('    FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
         SQL.Add(' WHERE PL.PLANO = ' + sPlano );

         SQL.Add('    GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('   (SELECT PLACONTA, CODSUBCONTA, ');
         SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
         SQL.Add('           ,IDPLANOPREV, IDPATRO, PLANO ');
         SQL.Add('    FROM PLANOSALDO ');
         SQL.Add('       WHERE ');
         SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
         SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
         SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PLANO =' + sPlano + ') AND   ');

       //somente contas analíticas
         SQL.Add('          (PLSTIPO = ''A'') AND ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
         SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA, IDPLANOPREV, IDPATRO, PLANO ');
         SQL.Add('    ORDER BY  IDPATRO, IDPLANOPREV,  PLACONTA, CODSUBCONTA ) SALDO ');

         SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('          PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('    ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bquebraPorPatro then
       begin
         SQL.Add('(SELECT PPP.*, SALDO.CODSUBCONTA, NVL(SALDO.SALDOAN, 0) AS SALDOAN FROM ');
         SQL.Add('   (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
         SQL.Add('    FROM PATRO PT, PLANOCONTA PL ');
         SQL.Add(' WHERE PL.PLANO = ' + sPlano );

       //somente contas analíticas

         SQL.Add('    GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('   (SELECT PLACONTA, CODSUBCONTA,');
         SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
         SQL.Add('           , IDPATRO, PLANO ');
         SQL.Add('    FROM PLANOSALDO ');
         SQL.Add('       WHERE ');
         SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
         SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
         SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PLANO =' + sPlano + ') AND   ');

       //somente contas analíticas
         SQL.Add('          (PLSTIPO = ''A'') AND ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
         SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA, IDPATRO, PLANO ');
         SQL.Add('    ORDER BY  IDPATRO, PLACONTA, CODSUBCONTA) SALDO ');

         SQL.Add('    WHERE ');
         SQL.Add('          PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('    ORDER BY PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bQuebraPorPlanoPrev then
       begin
         SQL.Add('(SELECT PPP.*, SALDO.CODSUBCONTA, NVL(SALDO.SALDOAN, 0) AS SALDOAN FROM ');
         SQL.Add('   (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
         SQL.Add('    FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
         SQL.Add(' WHERE PL.PLANO = ' + sPlano );

       //somente contas analíticas

         SQL.Add('    GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('   (SELECT PLACONTA, CODSUBCONTA, ');
         SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
         SQL.Add('           ,IDPLANOPREV, PLANO ');
         SQL.Add('    FROM PLANOSALDO ');
         SQL.Add('       WHERE ');
         SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
         SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');
         SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PLANO =' + sPlano + ') AND   ');

       //somente contas analíticas
         SQL.Add('          (PLSTIPO = ''A'') AND ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
         SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA, IDPLANOPREV, PLANO ');
         SQL.Add('    ORDER BY  IDPLANOPREV, PLACONTA, CODSUBCONTA) SALDO ');

         SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('    ORDER BY  PPP.IDPLANOPREV, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bQuebraPorPlanoSPC then
       begin
         SQL.Add('(SELECT PPP.CODSPC, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA, SUM(NVL(SALDO.SALDOAN, 0)) AS SALDOAN FROM ');
         SQL.Add('   (SELECT PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
         SQL.Add('    FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
         SQL.Add('    WHERE PL.PLANO = ' + sPlano );

       //somente contas analíticas

         SQL.Add('    GROUP BY PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');

         SQL.Add('   (SELECT PLACONTA, CODSUBCONTA, ');
         SQL.Add('           SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
         SQL.Add('           ,IDPLANOPREV, PLANO ');
         SQL.Add('    FROM PLANOSALDO ');
         SQL.Add('       WHERE ');
         SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND ');
         SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND ');

       //somente contas analíticas
         SQL.Add('          (PLSTIPO = ''A'') AND ');

         SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PLANO =' + sPlano + ') AND   ');
         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
         SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA, IDPLANOPREV, PLANO ');

         SQL.Add('  ) SALDO ');

         SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('    GROUP BY  PPP.CODSPC, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end;
       SQL.Add(' ) SN, ');

       if bQuebraPlanoPatro then
       begin
         SQL.Add(' (SELECT PPP.PLACONTA, SALDO.CODSUBCONTA, PPP.PLANO, PPP.IDPLANOPREV, PPP.IDPATRO, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
         SQL.Add('  FROM (SELECT PPC.IDPLANOPREV, PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
         SQL.Add('        FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
         SQL.Add('        WHERE PL.PLANO = ' + sPlano );


         SQL.Add('        GROUP BY PPC.IDPLANOPREV, PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('    GROUP BY C.PLACONTA, L.CODSUBCONTA, L.IDPLANOPREV, L.IDPATRO, L.PLANO ');
         SQL.Add('    ORDER BY L.IDPATRO, L.IDPLANOPREV, C.PLACONTA, L.CODSUBCONTA ) SALDO ');
         SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('        PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('  ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bquebraPorPatro then
       begin
         SQL.Add(' (SELECT PPP.PLACONTA, SALDO.CODSUBCONTA, PPP.PLANO, PPP.IDPATRO, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
         SQL.Add('  FROM (SELECT PT.IDPESSOA AS IDPATRO, PL.PLANO, PL.PLACONTA ');
         SQL.Add('        FROM PLANPREVCONTABIL PPC, PATRO PT, PLANOCONTA PL ');
         SQL.Add('        WHERE PL.PLANO = ' + sPlano );

         SQL.Add('        GROUP BY PT.IDPESSOA, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('    GROUP BY C.PLACONTA, L.CODSUBCONTA, L.IDPATRO, L.PLANO ');
         SQL.Add('    ORDER BY L.IDPATRO, C.PLACONTA, L.CODSUBCONTA ) SALDO ');
         SQL.Add('  WHERE ');
         SQL.Add('        PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('  ORDER BY PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bQuebraPorPlanoPrev then
       begin
         SQL.Add(' (SELECT PPP.PLACONTA, SALDO.CODSUBCONTA, PPP.PLANO, PPP.IDPLANOPREV, SALDO.DEB, SALDO.CRED, SALDO.DEBA, SALDO.CREDA, SALDO.MOV ');
         SQL.Add('  FROM (SELECT PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
         SQL.Add('        FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
         SQL.Add('        WHERE PL.PLANO = ' + sPlano );

         SQL.Add('        GROUP BY PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('         (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('    GROUP BY C.PLACONTA, L.CODSUBCONTA, L.IDPLANOPREV, L.PLANO ');
         SQL.Add('    ORDER BY L.IDPLANOPREV, C.PLACONTA, L.CODSUBCONTA ) SALDO ');
         SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('  ORDER BY  PPP.IDPLANOPREV, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end
       else if bQuebraPorPlanoSPC then
       begin
         SQL.Add(' (SELECT PPP.PLACONTA, SALDO.CODSUBCONTA, PPP.PLANO, PPP.CODSPC, SUM(SALDO.DEB) AS DEB, SUM(SALDO.CRED) AS CRED, SUM(SALDO.DEBA) DEBA, SUM(SALDO.CREDA) AS CREDA, SUM(SALDO.MOV) AS MOV ');
         SQL.Add('  FROM (SELECT PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA ');
         SQL.Add('        FROM PLANPREVCONTABIL PPC, PLANOCONTA PL ');
         SQL.Add('        WHERE PL.PLANO = ' + sPlano );

         SQL.Add('        GROUP BY PPC.CODSPC, PPC.IDPLANOPREV, PL.PLANO, PL.PLACONTA) PPP, ');
         SQL.Add('       (SELECT C.PLACONTA, L.CODSUBCONTA, ');
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
         SQL.Add('    GROUP BY C.PLACONTA, L.CODSUBCONTA, L.IDPLANOPREV, L.PLANO ');
         SQL.Add('    ) SALDO ');
         SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('  GROUP BY PPP.CODSPC, PPP.PLANO, PPP.PLACONTA, SALDO.CODSUBCONTA ');
       end;


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

       if bQuebraPlanoPatro then
       begin
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
       end;


       if bQuebraPorPlanoPrev  then
       begin
         SQL.Add(' SA.IDPLANOPREV = SN.IDPLANOPREV AND  ');
         SQL.Add(' SA.IDPLANOPREV = S.IDPLANOPREV AND   ');
         SQL.Add(' SA.IDPLANOPREV = PPC.IDPLANOPREV AND ');
         SQL.Add(' S.IDPLANOPREV = PPC.IDPLANOPREV AND  ');
         SQL.Add(' SN.IDPLANOPREV = PPC.IDPLANOPREV AND ');
       end;

       if bQuebraPorPlanoSPC then
       begin
         SQL.Add(' (SA.CODSPC = SN.CODSPC)  AND ');
         SQL.Add(' (SA.CODSPC = S.CODSPC)   AND ');
         SQL.Add(' (SA.CODSPC = PPC.CODSPC) AND ');
         SQL.Add(' (S.CODSPC  = PPC.CODSPC) AND ');
         SQL.Add(' (SN.CODSPC = PPC.CODSPC) AND ');
       end;

       if bquebraPorPatro then
       begin
         SQL.Add(' SA.IDPATRO = P.IDPESSOA AND          ');
         SQL.Add(' S.IDPATRO = P.IDPESSOA AND           ');
         SQL.Add(' SN.IDPATRO = P.IDPESSOA AND          ');
         SQL.Add(' SA.IDPATRO = SN.IDPATRO AND          ');
         SQL.Add(' SA.IDPATRO = S.IDPATRO AND           ');
       end;

       //isto reduz bastante o custo da query
       SQL.Add('    (C.PLACONTA = C.PLACONTA) AND ');
       SQL.Add('    (C.PLANO = C.PLANO) AND ');

       SQL.Add('   ((NVL(S.CODSUBCONTA, 0) = NVL(SN.CODSUBCONTA, 0)) OR (NVL(S.CODSUBCONTA, 0) = NVL(SA.CODSUBCONTA,0)) OR (NVL(SN.CODSUBCONTA, 0) = NVL(SA.CODSUBCONTA, 0))) AND ');
       SQL.Add('   (NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0) = SUB.CODSUBCONTA) AND ');


       SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND        ');
       SQL.Add('    (C.PLANO =' + sPlano + ') AND   ');
       SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
       SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

       If bDescEstatistica then
       Begin
          SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
       End;

       if bContraNatureza then
       begin
         SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) < 0)) OR         ');
         SQL.Add('      ((C.PLANATUREZA = ''C'') AND  ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) >= 0)))         ');
       end;


       SQL.Add('GROUP BY  C.PLACONTA, ');
       if bQuebraSubConta then
       begin
         SQL.Add('   NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0), ');
         SQL.Add('   SUB.NOMESUBCONTA, ');
       end;

       SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA, ');
       SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP, ');

       if bQuebraPlanoPatro then
       begin
         SQL.Add(' PPC.NOME, P.NOME, ');
         SQL.Add(' P.IDPESSOA ');
       end;

       if bquebraPorPatro then
       begin
         SQL.Add(' P.NOME, ');
         SQL.Add(' P.IDPESSOA ');
       end;

       if bQuebraPorPlanoPrev then
         SQL.Add(' PPC.NOME ');

       if  bQuebraPorPlanoSPC then
         SQL.Add(' PPC.CODSPC ');


       SQL.Add('HAVING ((DECODE(NVL(SUM(S.DEB),0),0,                                  ');
       SQL.Add('       (DECODE(NVL(SUM(S.CRED),0),0,                                  ');
       SQL.Add('       (DECODE(NVL(SUM(SN.SALDOAN),0),0,                              ');
       SQL.Add('       (DECODE(NVL(SUM(SA.SALDOANT),0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');

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


       if bQuebraSubConta then
         SQL.Add(', NVL(DECODE(SN.CODSUBCONTA, NULL, S.CODSUBCONTA, NULL, SA.CODSUBCONTA, 0), 0) ');

     End
    else
    begin
       SQL.Clear;
       SQL.Add('SELECT                                                                                              ');
       SQL.Add('   SUB.PLACONTA,                                                                                    ');

       if bQuebraSubConta then
       begin
         SQL.Add('   NVL(SUB.CODSUBCONTA, 0) AS CODSUBCONTA,                                                          ');
         SQL.Add('   SUB.NOMESUBCONTA,                                                                                ');
       end;

       SQL.Add('   SUB.PLAGRAU,                                                                                     ');
       SQL.Add('   SUB.PLATIPO,                                                                                     ');
       SQL.Add('   SUBSTR(SUB.PLACONTA, 1, 1) AS GRAU,                                                              ');
       SQL.Add('   SUB.PLACONCORRESP,                                                                               ');
       SQL.Add('   SUB.PLANATUREZA,                                                                                 ');
       SQL.Add('   SUB.PLANOME AS CONTA,                                                                            ');


       SQL.Add('   SUB.PLANOME AS NOMEINDENTADO,                                                                    ');
       SQL.Add('   NVL(SUM(DCM.DEB), 0) AS DEB,                                                                     ');
       SQL.Add('   NVL(SUM(DCM.CRED), 0) AS CRED,                                                                   ');
       SQL.Add('   NVL(SUM(DCM.MOV), 0) AS MOV,                                                                     ');


       if bQuebraSubConta and bQuebraPlanoPatro then
       begin
         SQL.Add('   SUB.IDPATRO,   ');
         SQL.Add('   SUB.PATRO,      ');
         SQL.Add('   SUB.IDPLANOPREV, ');
         SQL.Add('   SUB.NOME AS PLANOPREV, ');

         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA)) AS SALDOABS,');
         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end
       else if not bQuebraSubConta and bQuebraPlanoPatro then
       begin
         SQL.Add('   SUB.IDPATRO,   ');
         SQL.Add('   SUB.PATRO,      ');
         SQL.Add('   SUB.IDPLANOPREV, ');
         SQL.Add('   SUB.NOME AS PLANOPREV, ');

         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.IDPLANOPREV, SUB.PLACONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end

       else if bQuebraSubConta and bQuebraPorPlanoPrev then
       begin
         SQL.Add('   SUB.IDPLANOPREV,                                                                                 ');
         SQL.Add('   SUB.NOME AS PLANOPREV,                                                                           ');

         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))  OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))  OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA, SUB.CODSUBCONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end
       else if not bQuebraSubConta and bQuebraPorPlanoPrev then
       begin
         SQL.Add('   SUB.IDPLANOPREV,                                                                                 ');
         SQL.Add('   SUB.NOME AS PLANOPREV,                                                                           ');

         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))  OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))  OVER (PARTITION BY  SUB.IDPLANOPREV, SUB.PLACONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end


       else if bQuebraSubConta and bquebraPorPatro then
       begin
         SQL.Add('   SUB.IDPATRO,                                                                                     ');
         SQL.Add('   SUB.PATRO,                                                                                       ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA, SUB.CODSUBCONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))  OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA, SUB.CODSUBCONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))  OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA, SUB.CODSUBCONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end
       else if not bQuebraSubConta and bquebraPorPatro then
       begin
         SQL.Add('   SUB.IDPATRO,                                                                                     ');
         SQL.Add('   SUB.PATRO,                                                                                       ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))   OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))   OVER (PARTITION BY SUB.IDPATRO, SUB.PLACONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end

       else if bQuebraSubConta and bQuebraPorPlanoSPC then
       begin
         SQL.Add('   SUB.CODSPC,                                                                                      ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA, SUB.CODSUBCONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA, SUB.CODSUBCONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))   OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA, SUB.CODSUBCONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))   OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA, SUB.CODSUBCONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end
       else if not bQuebraSubConta and bQuebraPorPlanoSPC then
       begin
         SQL.Add('   SUB.CODSPC,                                                                                      ');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT),0))       OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA) AS SALDOANT,');
         SQL.Add('   SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA) AS SALDO, ');
         SQL.Add('   SUM(NVL(ABS(SUM(SA.SALDOANT)), 0)) OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA) AS SALDOANTABS,');
         SQL.Add('   ABS(SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0)) OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA)) AS SALDOABS, ');

         SQL.Add('   DECODE(NVL(  SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))   OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA)  ,0), 0, '' '', '+
                 '   DECODE(SIGN( SUM(NVL(SUM(SA.SALDOANT), 0) + NVL(SUM(DCM.MOV), 0))   OVER (PARTITION BY  SUB.CODSPC, SUB.PLACONTA)   ), -1, ''C'', ''D'' )) AS DEBCRESALDO,     ');

       end;

       SQL.Add('   NVL(SUM(DCM.DEBA), 0) AS DEBA,                                                                   ');
       SQL.Add('   NVL(SUM(DCM.CREDA), 0) AS CREDA,                                                                 ');
       SQL.Add('   DECODE(NVL(SUM(DCM.MOV),0), 0, '' '', DECODE(SIGN(SUM(DCM.MOV)), -1, ''C'', ''D'' )) AS MOVDC,   ');


       SQL.Add('   DECODE(NVL(SUM(SA.SALDOANT),0), 0, '' '', DECODE(SIGN(SUM(SA.SALDOANT)), -1, ''C'', ''D'' )) AS DEBCREANT, ');

       SQL.Add('   ABS(NVL(SUM(DCM.MOV),0)) AS MOVABS                                                               ');
       SQL.Add('FROM                                                                                                ');
       SQL.Add(' (                                                                                                  ');
       SQL.Add('   SELECT C.PLANO, C.PLAGRAU, C.PLANATUREZA, C.PLATIPO, C.PLACONCORRESP,                            ');
       SQL.Add('   C.PLACONTA, NVL(SUB.CODSUBCONTA, 0) AS CODSUBCONTA, SUB.NOMESUBCONTA, C.PLANOME,                                   ');
       SQL.Add('   PP.IDPLANOPREV, PP.IDPATRO, PP.PATRO, PP.CODSPC, PP.NOME, PS.PEREXERCICIO, PS.PERNUMERO          ');
       SQL.Add('   FROM PLANOCONTA C, SUBCONTA SUB, PLANOSALDO PS,                                                  ');
       SQL.Add('   (                                                                                                ');
       SQL.Add('     SELECT                                                                                         ');
       SQL.Add('       PATRO.IDPESSOA AS IDPATRO,                                                                   ');
       SQL.Add('       P.NOME AS PATRO,                                                                             ');
       SQL.Add('       PC.IDPLANOPREV,                                                                              ');
       SQL.Add('       PC.NOME,                                                                                     ');
       SQL.Add('       DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC                     ');
       SQL.Add('     FROM PLANPREVCONTABIL PC, PLANPREV PP, PATRO, PESSOA P                                         ');
       SQL.Add('     WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV AND PATRO.IDPESSOA = P.IDPESSOA                      ');
       SQL.Add('     UNION                                                                                          ');
       SQL.Add('     SELECT                                                                                         ');
       SQL.Add('       PATRO.IDPESSOA AS IDPATRO,                                                                   ');
       SQL.Add('       P.NOME AS PATRO,                                                                             ');
       SQL.Add('       PP.IDPLANOPREV,                                                                              ');
       SQL.Add('       PP.NOME,                                                                                     ');
       SQL.Add('       PP.CODSPC                                                                                    ');
       SQL.Add('     FROM PLANPREVCONTABIL PP, PATRO, PESSOA P                                                      ');
       SQL.Add('     WHERE IDPLANOPREVPREV IS NULL AND PATRO.IDPESSOA = P.IDPESSOA                                  ');
       SQL.Add('   ) PP                                                                                             ');
       SQL.Add('   WHERE C.PLANO = PS.PLANO(+) AND                                                                  ');
       SQL.Add('         C.PLACONTA = PS.PLACONTA(+) AND                                                            ');

       SQL.Add('         SUB.CODSUBCONTA(+) = PS.CODSUBCONTA AND                                                    ');
       SQL.Add('         PP.IDPLANOPREV = PS.IDPLANOPREV AND                                                        ');
       SQL.Add('         PP.IDPATRO = PS.IDPATRO                                                                    ');
       SQL.Add('   GROUP BY  C.PLACONTA, C.PLAGRAU, C.PLANATUREZA, C.PLATIPO, C.PLACONCORRESP, SUB.CODSUBCONTA, SUB.NOMESUBCONTA, ');
       SQL.Add('             C.PLANO, C.PLANOME, PP.IDPATRO, PP.PATRO, PP.IDPLANOPREV,                              ');
       SQL.Add('             PP.CODSPC, PP.NOME, PS.PEREXERCICIO, PS.PERNUMERO                                      ');
       SQL.Add(' )SUB,                                                                                              ');
       SQL.Add('                                                                                                    ');
       SQL.Add('(                                                                                                   ');
       SQL.Add('  SELECT ');
       SQL.Add('     S.PLANO, S.PLACONTA, NVL(S.CODSUBCONTA, 0) AS CODSUBCONTA, S.PERNUMERO, S.PEREXERCICIO,        ');
       SQL.Add('     NVL(SUM(S.PLSDEBITOCORRENTE), 0) AS DEB,                                                       ');
       SQL.Add('     NVL(SUM(S.PLSCREDITOCOR), 0) AS CRED,                                                          ');
       SQL.Add('     NVL((SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)), 0) AS MOV,                              ');
       SQL.Add('     SUM(DECODE(S.PLSTIPO, ''A'', S.PLSDEBITOCORRENTE, 0)) AS DEBA,                                   ');
       SQL.Add('     SUM(DECODE(S.PLSTIPO, ''A'', S.PLSCREDITOCOR, 0)) AS CREDA,                                      ');
       SQL.Add('     S.IDPATRO,                                                                                     ');
       SQL.Add('     S.IDPLANOPREV                                                                                  ');
       SQL.Add('  FROM PLANOSALDO S                                                                                 ');
       SQL.Add('  WHERE                                                                                             ');
       SQL.Add('    (S.PLANO = ' + sPlano + ') AND                                                                  ');
       SQL.Add('    (S.PEREXERCICIO(+) =' + sExercicio + ') AND                                                     ');
       SQL.Add('    (S.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ')AND  ');
       SQL.Add('    (S.IDPESSOA(+) = ' + sEmpresa + ') AND                                                          ');

       SQL.Add('    (S.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND  ');
       SQL.Add('    (S.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
       SQL.Add('  GROUP BY S.PLANO, S.PLACONTA, NVL(S.CODSUBCONTA, 0), S.PERNUMERO, S.PEREXERCICIO, S.IDPATRO, S.IDPLANOPREV ');

       SQL.Add(')DCM,                                                                                               ');
       SQL.Add('                                                                                                    ');
       SQL.Add(' (SELECT                                                                                            ');
       SQL.Add('       PLACONTA,                                                                                    ');
       SQL.Add('       PLANO,                                                                                       ');
       SQL.Add('       NVL(CODSUBCONTA, 0) AS CODSUBCONTA,                                                          ');
       SQL.Add('       PEREXERCICIO,                                                                                ');
       SQL.Add('       PERNUMERO,                                                                                   ');
       SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)                                    ');
       SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT,                    ');
       SQL.Add('       IDPATRO,                                                                                     ');
       SQL.Add('       IDPLANOPREV                                                                                  ');
       SQL.Add('    FROM PLANOSALDO                                                                                 ');
       SQL.Add('    WHERE (PLANO = ' + sPlano + ') AND                                                              ');
       SQL.Add('          (PEREXERCICIO = ' + sExercicio + ') AND                                                   ');
       SQL.Add('          ((PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni])  + ') OR (PERNUMERO IS NULL)) AND                   ');


       SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
       SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');
       SQL.Add('    GROUP BY PLACONTA , CODSUBCONTA, PLANO, PEREXERCICIO, PERNUMERO, IDPATRO, IDPLANOPREV           ');
       SQL.Add('    ) SA,                                                                                           ');
       SQL.Add('                                                                                                    ');
       SQL.Add('   (SELECT                                                                                          ');
       SQL.Add('       PLACONTA,                                                                                    ');
       SQL.Add('       PLANO,                                                                                       ');
       SQL.Add('       NVL(CODSUBCONTA, 0) AS CODSUBCONTA,                                                          ');
       SQL.Add('       PEREXERCICIO,                                                                                ');
       SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)                                    ');
       SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO,                       ');
       SQL.Add('       IDPATRO,                                                                                     ');
       SQL.Add('       IDPLANOPREV                                                                                  ');
       SQL.Add('    FROM PLANOSALDO                                                                                 ');
       SQL.Add('    WHERE (PLANO = 2) AND                                                                           ');
       SQL.Add('          (PEREXERCICIO = ' + sExercicio + ') AND                                                   ');
       SQL.Add('          ((PERNUMERO <= ' + GetFirstNotEmpty('0', [sPeriodoFim])+ ') OR (PERNUMERO IS NULL)) AND                                              ');

       SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
       SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

       SQL.Add('    GROUP BY PLACONTA, CODSUBCONTA, PLANO, PEREXERCICIO,                                            ');

       SQL.Add('       IDPATRO,                                                                                     ');
       SQL.Add('       IDPLANOPREV                                                                                  ');
       SQL.Add('   ) SS                                                                                             ');

       SQL.Add('                                                                                                    ');
       SQL.Add('WHERE                                                                                               ');
       SQL.Add('    (SA.PLANO(+) = SUB.PLANO) AND                                                                   ');
       SQL.Add('    (SA.PLACONTA(+) = SUB.PLACONTA) AND                                                             ');
       SQL.Add('    (SA.CODSUBCONTA(+)  = SUB.CODSUBCONTA)  AND                                                     ');
       SQL.Add('    (SA.PEREXERCICIO(+) = SUB.PEREXERCICIO) AND                                                     ');
       SQL.Add('    (SA.IDPATRO(+) = SUB.IDPATRO) AND                                                               ');
       SQL.Add('                                                                                                    ');
       SQL.Add('    (SA.IDPLANOPREV(+) = SUB.IDPLANOPREV) AND                                                       ');
       SQL.Add('    (SS.PLANO(+)  = SUB.PLANO)  AND                                                                 ');
       SQL.Add('    (SS.PLACONTA(+) = SUB.PLACONTA) AND                                                             ');
       SQL.Add('    (SS.CODSUBCONTA(+)  = SUB.CODSUBCONTA)  AND                                                     ');
       SQL.Add('    (SS.PEREXERCICIO(+) = SUB.PEREXERCICIO) AND                                                     ');
       SQL.Add('    (SS.IDPATRO(+) = SUB.IDPATRO) AND                                                               ');
       SQL.Add('    (SS.IDPLANOPREV(+) = SUB.IDPLANOPREV) AND                                                       ');
       SQL.Add('                                                                                                    ');
       SQL.Add('    (DCM.PLANO(+) = SUB.PLANO) AND                                                                  ');
       SQL.Add('    (DCM.PEREXERCICIO(+) = SUB.PEREXERCICIO) AND                                                    ');
       SQL.Add('    (DCM.PERNUMERO(+) = SUB.PERNUMERO) AND                                                          ');
       SQL.Add('    (DCM.PLACONTA(+) >= SUB.PLACONTA) AND                                                           ');
       SQL.Add('    (DCM.PLACONTA(+) <= SUB.PLACONTA) AND                                                           ');
       SQL.Add('    (DCM.CODSUBCONTA(+)  = SUB.CODSUBCONTA)  AND                                                    ');
       SQL.Add('    (DCM.IDPATRO(+) = SUB.IDPATRO) AND                                                              ');
       SQL.Add('    (DCM.IDPLANOPREV(+) = SUB.IDPLANOPREV) AND                                                      ');
       SQL.Add('                                                                                                    ');
       SQL.Add('    (SUB.PEREXERCICIO(+) = ' + sExercicio + ') AND                                                  ');

       SQL.Add('    (SUB.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND ');
       SQL.Add('    (SUB.PLACONTA <=  ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ' ) ');
       SQL.Add('                                                                                                    ');
       SQL.Add('GROUP BY                                                                                            ');

       if bQuebraSubConta then
         SQL.Add('    SUB.PLACONTA, SUB.CODSUBCONTA, SUB.NOMESUBCONTA, SUB.PLAGRAU, SUB.PLATIPO, SUB.PLACONCORRESP, SUB.PLANATUREZA, SUB.PLANOME, ')
       else
         SQL.Add('    SUB.PLACONTA, SUB.PLAGRAU, SUB.PLATIPO, SUB.PLACONCORRESP, SUB.PLANATUREZA, SUB.PLANOME, ');

       if bQuebraPlanoPatro then
       begin
         SQL.Add('   SUB.IDPATRO,  ');
         SQL.Add('   SUB.PATRO,    ');
         SQL.Add('   SUB.IDPLANOPREV, ');
         SQL.Add('   SUB.NOME ');
       end
       else if bquebraPorPatro then
       begin
         SQL.Add('   SUB.IDPATRO,  ');
         SQL.Add('   SUB.PATRO    ');
       end
       else if bQuebraPorPlanoPrev then
       begin
         SQL.Add('   SUB.IDPLANOPREV, ');
         SQL.Add('   SUB.NOME ');
       end
       else if bQuebraPorPlanoSPC then
       begin
         SQL.Add('   SUB.CODSPC ');
       end;

       SQL.Add('ORDER BY ');
       if bQuebraPlanoPatro then
       begin

         SQL.Add('   SUB.PATRO, ');
         SQL.Add('   PLANOPREV ');
       end
       else if bquebraPorPatro then
       begin
         SQL.Add('   SUB.PATRO    ');
       end
       else if bQuebraPorPlanoPrev then
       begin
         SQL.Add('   PLANOPREV ');
       end
       else if bQuebraPorPlanoSPC then
       begin
         SQL.Add('   SUB.CODSPC ');
       end;


     end;
   Finally
      //Henrique Massão
      //CMDebugToFile(SQLChanged, 'c:\balancetePPSubContaDet.txt');
      CMDebugToFile(SQLChanged, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\balancetePPSubContaDet.txt');

      Result := Data;
      Free;
   End;
end;



function TCtrlRptBalanceteAnalSubConta.SelecionaPlanoContaPer(iPeriodo,
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







