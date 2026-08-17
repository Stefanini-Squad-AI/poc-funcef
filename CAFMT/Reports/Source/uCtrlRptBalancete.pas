unit uCtrlRptBalancete;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,uSistema,Provider,uCtrlPeriodo,
     uCtrlContab,ComCtrls, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF},uCMSqlParams;


  Type
    TCtrlRptBalancete = Class(TCmControlObject)
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
                         sContaFim,sCustoIni,sCustoFim,sNumero,sAtividade,sPlano,
                         sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                         bContaCorresp,bIndenta, bContraNatureza,bDescResultado,bDescEstatistica:Boolean):OleVariant;
    protected

    End;


implementation

uses UMensErro, uString,uData, uFuncaoGeral,FSM_FxLib;

procedure TCtrlRptBalancete.AfterInitialize;
begin
  inherited;
  Periodo.initializeas(self);
  Contab.initializeas(self);
end;

constructor TCtrlRptBalancete.Create;
begin
  inherited;
  Periodo       := TCtrlPeriodo.Create;
  Contab        := TCtrlContab.Create;

end;

destructor TCtrlRptBalancete.Destroy;
begin

  inherited;
  Periodo.free;
  Contab.Free;
end;



procedure TCtrlRptBalancete.DoChangeDataBase;
begin
  inherited;

end;

Function TCtrlRptBalancete.FazQuery(sDataIni,sDataFim,sExercicio,sPeriodoIni,sPeriodoFim,sContaIni,
                         sContaFim,sCustoIni,sCustoFim,sNumero,sAtividade,sPlano,
                         sEmpresa,sTipCodigo,sPlanoPrevG,sPatroG,sAtividadeG,sGrau:string;bOutroIdioma,
                         bContaCorresp,bIndenta, bContraNatureza,bDescResultado,bDescEstatistica:Boolean):OleVariant;
begin
     If trim(sDataIni) <> '' then
        Periodo.RetornaPeriodoExercicioData(StrToFloat(sEmpresa),sDataIni);


     With TCMSqlParams.Create(nil) Do
     Try
          SQL.Clear;
          If trim(sDataIni) <> '' then
          Begin
            SQL.Add('SELECT /*+ RULE */                                                   ');
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
            SQL.Add('   ABS(NVL(S.DEB,0)) as DEB                ');
            SQL.Add('   ABS(NVL(S.CRED,0)) as CRED              ');
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
            SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
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
            If trim(sCustoIni) <> '' then
            Begin
              SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
              SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND               ');
            End;
            If trim(sCustoFim) <> '' then
            Begin
              SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
              SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND               ');
            End;
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
            SQL.Add('   (SELECT PLACONTA,                                               ');
            SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)   ');
            SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOAN ');
            SQL.Add('    FROM PLANOSALDO                                           ');
            SQL.Add('    WHERE                                                     ');
            SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND                 ');
            SQL.Add('       ((PERNUMERO IS NULL) OR (PERNUMERO < '+IntToStr(Periodo.Periodo)+')) AND                                ');
            If trim(sAtividade) <> '' then
            Begin
              SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
              SQL.Add('       (IDPESSOA =' + sEmpresa +')) AND              ');
            End;
            If trim(sCustoIni) <> '' then
            Begin
               SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
               SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND            ');
            End;
            If trim(sCustoFim) <> '' then
            Begin
              SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
              SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
            End;
            If trim(sPlanoPrevG) <> '' then
            Begin
               SQL.Add('      (IDPLANOPREV IN (' + trim(sPlanoPrevG) + ')) AND ');
            End;
            If trim(sPatroG) <> '' then
            Begin
              SQL.Add('      (IDPATRO IN (' + trim(sPatroG) + ')) AND          ');
            End;
            If trim(sAtividadeG) <> '' then
            Begin
               SQL.Add('      (UNIDNEGOC IN (' + trim(sAtividadeG) + ')) AND  ');
            End;
            SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
            SQL.Add('          (PLANO =' + sPlano + ') AND   ');
            SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
            SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
            SQL.Add('    GROUP BY PLACONTA ) SN,                                            ');
            SQL.Add('                                                                       ');
            SQL.Add('   (SELECT C.PLACONTA,                                                 ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB,          ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED,         ');
            SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0),0)) AS DEBA,         ');
            SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0),0)) AS CREDA,        ');
            SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
            SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                        ');
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
            If trim(sCustoIni) <> '' then
            Begin
              SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
              SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND                   ');
            End;
            If trim(sCustoFim) <> '' then
            Begin
               SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
               SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND                 ');
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
            SQL.Add('    C.PLACONTA, SA.SALDOANT, SN.SALDOAN,               ');
            SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
            SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
            SQL.Add('    S.DEB,                                                       ');
            SQL.Add('    S.CRED,                                                      ');
            SQL.Add('    S.DEBA,                                                      ');
            SQL.Add('    S.CREDA,                                                     ');
            SQL.Add('    S.MOV                                                        ');
            SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
            SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
            SQL.Add('       (DECODE(NVL(SN.SALDOAN,0),0,                              ');
            SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
          End Else
          Begin
            If bDescResultado then
            Begin
               SQL.Add('SELECT                                                               ');
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
               SQL.Add('FROM                                             ');
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
               SQL.Add('   ABS(NVL(S.DEB,0)) as DEB,                ');
               SQL.Add('   ABS(NVL(S.CRED,0)) as CRED,               ');
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
               SQL.Add('   ABS(S.MOV) AS MOVABS                                          ');
               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');
               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT C.PLACONTA,                                           ');
               SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
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
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (L.IDEMPRESA      =  ' + sEmpresa + ') AND ');
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
               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
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
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                            SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND ');
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
               SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY C.PLACONTA ) S,                               ');
               SQL.Add('                                                           ');
               SQL.Add('   (SELECT C.PLACONTA,                                     ');
               SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
               SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P                  ');
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
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (L.CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (L.CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (L.IDEMPRESA =' + sEmpresa + ') AND ');
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
               SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'')) ');
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
               SQL.Add('   ABS(S.MOV) AS MOVABS');
               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');
               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT PLACONTA,                                             ');
               SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
               SQL.Add('    FROM PLANOSALDO                                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('       ((PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PERNUMERO IS NULL)) AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA = ' + sEmpresa + ') AND ');
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
               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PLACONTA ) SA,                                              ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT PLACONTA,                                                     ');
               SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
               SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
               SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');
               SQL.Add('    FROM PLANOSALDO                                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PEREXERCICIO =' + sExercicio+ ') AND         ');
               SQL.Add('       (PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni]) + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim])+ ') AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA      = ' + sEmpresa + ') AND ');
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
               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PLACONTA ) S,                                       ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT                                                       ');
               SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
               SQL.Add('    FROM PLANOSALDO                                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('          (PEREXERCICIO =' + sExercicio + ') AND              ');
               SQL.Add('          ((PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])  + ') OR (PERNUMERO IS NULL)) AND ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND   ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND                           ');
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
               SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
               SQL.Add('    C.PLAGRAU, C.PLATIPO, C.PLANATUREZA,                         ');
               SQL.Add('    C.PLANOMEOUTLING, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), C.PLACONCORRESP,                ');
               SQL.Add('    S.DEB,                                                       ');
               SQL.Add('    S.CRED,                                                      ');
               SQL.Add('    S.DEBA,                                                      ');
               SQL.Add('    S.CREDA,                                                     ');
               SQL.Add('    S.MOV                                                        ');
               SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                        ');
               SQL.Add('       (DECODE(NVL(S.CRED,0),0,                        ');
               SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                                      ');
               SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1''))) U ');
               SQL.Add('GROUP BY ');
               SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, ');
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
               SQL.Add('   ABS(S.MOV) AS MOVABS                                          ');
               SQL.Add('FROM                                                             ');
               SQL.Add('    PLANOCONTA C,                                                ');
               SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
               SQL.Add('   (SELECT PLACONTA,                                             ');
               SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
               SQL.Add('    FROM PLANOSALDO                                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('       ((PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PERNUMERO IS NULL)) AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sCustoIni) <> '' then
               Begin
                 SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                 SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                 SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                 SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
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
               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PLACONTA ) SA,                                              ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT PLACONTA,                                                     ');
               SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
               SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
               SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
               SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');
               SQL.Add('    FROM PLANOSALDO                                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('       (PEREXERCICIO =' + sExercicio + ') AND         ');
               SQL.Add('    (PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND ');
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
               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
               SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999',[sContaFim]), ' ', 18)) + ')                  ');
               SQL.Add('    GROUP BY PLACONTA ) S,                                      ');
               SQL.Add('                                                                 ');
               SQL.Add('   (SELECT                                                 ');
               SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
               SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
               SQL.Add('    FROM PLANOSALDO                                           ');
               SQL.Add('    WHERE                                                     ');
               SQL.Add('          (PEREXERCICIO =' + sExercicio + ') AND      ');
               SQL.Add('          ((PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') OR (PERNUMERO IS NULL)) AND ');
               If trim(sAtividade) <> '' then
               Begin
                  SQL.Add('       ((UNIDNEGOC = ' + trim(sAtividade) + ') AND   ');
                  SQL.Add('       (IDPESSOA =' + sEmpresa + ')) AND ');
               End;
               If trim(sCustoIni) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO >= ' + QuotedStr(Espaco(sCustoIni,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND   ');
               End;
               If trim(sCustoFim) <> '' then
               Begin
                  SQL.Add('       (CODCENTROCUSTO <= ' + QuotedStr(Espaco(sCustoFim,10)) + ') AND ');
                  SQL.Add('       (IDEMPRESA =' + sEmpresa + ') AND                           ');
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
               SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
               SQL.Add('          (PLANO =' + sPlano + ') AND   ');
               SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND              ');
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
                  SQL.Add(' AND (C.PLAGRUPO <> ''E'')                                    ');
               End;
               If bContraNatureza then
               Begin
                  SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
                  SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
               End;
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
               If bContaCorresp then
               Begin
                  SQL.Add(' C.PLACONCORRESP                                              ');
               End Else
               Begin
                  SQL.Add(' C.PLACONTA                                                   ');
               End;
            End;
          End;
          SQL.SaveToFile('c:\bal');
          Result := Data;

     Finally
        Free;
     End;


end;

function TCtrlRptBalancete.SelecionaPlanoContaPer(iPeriodo,
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







