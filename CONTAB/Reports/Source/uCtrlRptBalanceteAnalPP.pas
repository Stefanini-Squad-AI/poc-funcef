{ --------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Rotina........: FazQuery
N. Chamado....: WO28183
Dt Alterações.: 04/12/2025
Responsável...: Paulo Nobre
Descrição.....: Ajustes para retirar a concatenação dos espaços em branco nas contas contábeis. Ex:
                '1.02.01.01.01.01        ' para '1.02.01.01.01.01'
----------------------------------------------------------------------------------------------------
Rotina......: FazQuery
Nº SOL......: 140372
Nº KINTANA..: 877866
Data........: 29/07/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implemetação da flag "Sem Quebra"
---------------------------------------------------------------------------------------------------}
{=========================================================================================
Autor(a)    :  Luis Ferrari
Data        :  15/03/2022
Pendência   :  SOL 122748
Descricao   :  Ajustar ordenação e quebra de pagina
               foi ajustado e incluido para opção de contas zeradas
------------------------------------------------------------------------------
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 40495
 Kintana...: 523623
 Data      : 25/09/2009
 Descrição : Alterações no layout do relatório conforme solicitação do SOL
=========================================================================================}
{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
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


unit uCtrlRptBalanceteAnalPP;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,uSistema,Provider,uCtrlPeriodo,
     uCtrlContab,ComCtrls, uCMTypes, uCMSqlParams, uCMFileUtils, MIdas,
     uCmClientDataSet, Classes;


  Type
    TCtrlRptBalanceteAnalPP = Class(TCmControlObject)
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
       Function FazQuery(sDataIni,
                         sDataFim,
                         sExercicio,
                         sPeriodoIni,
                         sPeriodoFim,
                         sContaIni,
                         sContaFim           : string;
                         bQuebraPorPatro,
                         bQuebraPorPlanoSPC  : boolean;
                         sNumero,
                         sAtividade,
                         sPlano,
                         sEmpresa,
                         sTipCodigo,
                         sPlanoPrevG,
                         sPatroG,
                         sAtividadeG,
                         sGrau                : string;
                         bOutroIdioma,
                         bContaCorresp,
                         bIndenta,
                         bQuebraPorPlanoPrev,
                         bDescResultado,
                         bDescEstatistica,
                         bQuebraPlanoPatro,
                         bContraNatureza      : boolean;
                         sContasZeradas       : string = 'N';
                         bInclueCODCNPB       : Boolean = False;
                         // Alterado por FHBS - SOL: 140372 KTN: 877866
                         bSemQuebra           : Boolean = False) : OleVariant;
       // Alterado por Arnaldo Vicente Scarin em 14/09/2009
       // SOL: 40495 Kintana: 523623
       // Alterações no layout do relatório conforme solicitação do SOL
       function AjustaModImpressao(ovDados              : OleVariant;
                                   bSomenteContasComMov,
                                   bSomenteSintComMov   : boolean) : OleVariant;

    protected

    End;


implementation

uses UMensErro, uString,uData, uFuncaoGeral, FSM_FxLib;

procedure TCtrlRptBalanceteAnalPP.AfterInitialize;
begin
  inherited;
  Periodo.initializeas(self);
  Contab.initializeas(self);
end;



function TCtrlRptBalanceteAnalPP.AjustaModImpressao(ovDados               : OleVariant;
                                                    bSomenteContasComMov,
                                                    bSomenteSintComMov    : boolean): OleVariant;
var
  cdsAux: TCMClientDataSet;
  sUltimaContaAnalitica: string;

  //  Função que verifica se a o saldo da conta está zerado...
  function VerificaSaldoZeradoConta: boolean;
  begin
    Result := False;
    if (abs(cdsAux.FieldByName('DEB').AsFloat)     +
        abs(cdsAux.FieldByName('CRED').AsFloat)    +
        abs(cdsAux.FieldByName('SALDO').AsFloat)   +
        abs(cdsAux.FieldByName('SALDOANT').AsFloat)) = 0 then
      Result := True;
  end;

begin
  try
     cdsAux := TCMClientDataSet.Create(nil);
     cdsAux.Data := ovDados;

     //  Imprimir somente contas com movimentação
     if  bSomenteContasComMov then
     begin
       while not cdsAux.Eof do
       begin
         if (cdsAux.FieldByName('DEB').asFloat + cdsAux.FieldByName('CRED').asFloat + cdsAux.FieldByName('MOVABS').asFloat) = 0 then
           cdsAux.delete
         else
           cdsAux.next;
       end;
    end;

    //  Imprimir somente contas sintéticas com movimentação
    if bSomenteSintComMov then
    begin
      cdsAux.Last;
      sUltimaContaAnalitica := '';
      while not cdsAux.Bof do
      begin
        //  Verifica se a conta em foco é sintética
        if (cdsAux.FieldByName('PLATIPO').AsString = 'S') then
        begin
          //  Verifica se a conta sintética é o pai da última conta analítica apurada
          if cdsAux.FieldByName('PLACONTA').AsString <>
             Copy(sUltimaContaAnalitica,0,Length(cdsAux.FieldByName('PLACONTA').AsString)) then
          begin
            if VerificaSaldoZeradoConta then
            begin
              cdsAux.Delete;
              if ((cdsAux.RecNo) <> (cdsAux.RecordCount)) then 
                cdsAux.Prior;
            end
            else
              cdsAux.Prior;
          end
          else
            cdsAux.Prior;
        end
        else
        begin
          sUltimaContaAnalitica := cdsAux.FieldByName('PLACONTA').AsString;
          cdsAux.Prior;
        end;
      end;
    end;
    Result := cdsAux.Data;
  finally
    FreeAndNil(cdsAux);
  end;
end;

constructor TCtrlRptBalanceteAnalPP.Create;
begin
  inherited;
  Periodo := TCtrlPeriodo.Create;
  Contab  := TCtrlContab.Create;
end;

destructor TCtrlRptBalanceteAnalPP.Destroy;
begin
  inherited;
  Periodo.free;
  Contab.Free;
end;

procedure TCtrlRptBalanceteAnalPP.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlRptBalanceteAnalPP.FazQuery(sDataIni,
                                          sDataFim,
                                          sExercicio,
                                          sPeriodoIni,
                                          sPeriodoFim,
                                          sContaIni,
                                          sContaFim           : string;
                                          bQuebraPorPatro,
                                          bQuebraPorPlanoSPC  : boolean;
                                          sNumero,
                                          sAtividade,
                                          sPlano,
                                          sEmpresa,
                                          sTipCodigo,
                                          sPlanoPrevG,
                                          sPatroG,
                                          sAtividadeG,
                                          sGrau               : String;
                                          bOutroIdioma,
                                          bContaCorresp,
                                          bIndenta,
                                          bQuebraPorPlanoPrev,
                                          bDescResultado,
                                          bDescEstatistica,
                                          bQuebraPlanoPatro,
                                          bContraNatureza     : boolean;
                                          sContasZeradas      : String = 'N';
                                          bInclueCODCNPB      : Boolean = false;
                                          bSemQuebra          : Boolean = False) : OleVariant;
var
// Inicio  variavel sordenacao
  sSql, sordenacao: string;
//fim
begin
   sSql := '';
   If Trim(sDataIni) <> '' then
     Periodo.RetornaPeriodoExercicioData(StrToFloat(sEmpresa),sDataIni);

   With TCMSqlParams.Create(nil) Do
   Try
     SQL.Clear;

     If Trim(sDataIni) <> '' then
     Begin
       SQL.Add('SELECT /*+RULE*/                                                     ');
       SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLATIPO, C.PLACONCORRESP, C.PLANATUREZA, ');
       SQL.Add('   SUBSTR(C.PLACONTA, 1, ' + sNumero + ') AS GRAU,                   ');
       if bOutroIdioma then
       Begin
         SQL.Add('   C.PLANOMEOUTLING AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,');
         If bIndenta then
           SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || C.PLANOMEOUTLING, 1, 150) AS NOMEINDENTADO,')
         Else
           SQL.Add('   C.PLANOMEOUTLING AS NOMEINDENTADO,                         ');
       End
       Else
       Begin
         SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS CONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, C.PLANOMEOUTLING,');
         If bIndenta then
           SQL.Add('   SUBSTR(LPAD('' '', ((C.PLAGRAU - 1) * 3)) || DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME), 1, 150) AS NOMEINDENTADO,')
         Else
           SQL.Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS NOMEINDENTADO,');
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
       SQL.Add('   DECODE(SIGN(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)),  -1, ''C'', ''D'' )) AS DEBCRESALDO,    ');
       SQL.Add('   DECODE(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0), 0, '' '',              ');
       SQL.Add('   DECODE(SIGN(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)), -1, ''C'', ''D'' )) AS DEBCREANT, ');
       SQL.Add('   ABS(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)) as SALDOANTABS,           ');
       SQL.Add('   ABS(NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) as SALDOABS,    ');
       SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                   ');
       if bQuebraPlanoPatro then
         // Alterado por FHBS - SOL: 140372 KTN: 877866 - Adicionado o campo PPC.IDPLANOPREV
         SQL.Add(' , PPC.IDPLANOPREV, PPC.NOME AS PLANOPREV, P.NOME AS PATRO ');
       if bQuebraPorPatro then
         SQL.Add(' , P.NOME AS PATRO, P.IDPESSOA AS IDPATRO ');
       if bQuebraPorPlanoPrev then
         SQL.Add(' , PPC.NOME AS PLANOPREV ');
       if bQuebraPorPlanoSPC then
         SQL.ADD(' , PPC.CODSPC  ');
       SQL.Add('FROM ');
       SQL.Add('  PLANOCONTA C, ');
       if bQuebraPlanoPatro then
         SQL.Add(' PLANPREVCONTABIL PPC, PESSOA P, ');
       if bQuebraPorPatro then
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

         // Paulo Nobre - WO28183 - Inicio

//            SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND            ');
//            SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')   ');

         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('       GROUP BY L.IDPLANOPREV, L.IDPATRO, C.PLACONTA, C.PLANO ) SALDO ');
         SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('         PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
         SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
         SQL.Add('   ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
       end
       else if bQuebraPorPatro then
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

         // Paulo Nobre - WO28183 - Inicio

//            SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND            ');
//            SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')   ');

         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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

         // Paulo Nobre - WO28183 - Inicio

//            SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND            ');
//            SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')   ');

         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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
         //pendência 27374 - 13/02/2008
         If bDescResultado then
         Begin
           SQL.Add('                ((L.TIPCODIGO IS NULL) OR                        ');
           SQL.Add('                (L.TIPCODIGO <> '''+sTipCodigo+''')) AND         ');
         End;
         SQL.Add('                (L.PLANO = C.PLANO) AND ');
         SQL.Add('                (P.PLNCODIGO = L.PLNCODIGO) AND ');
         SQL.Add('                (P.PLNCODIGO = P.PLNCODIGO) AND ');
         SQL.Add('                (P.PEREXERCICIO =' + sExercicio + ') AND       ');
         SQL.Add('                (P.PLNDATDIA < TO_DATE('''+sDataIni+''',''DD/MM/YYYY'')) AND ');
         SQL.Add('                (P.PLNDATDIA >= TO_DATE('''+DateToStr(Periodo.DataIniPeriodo)+''',''DD/MM/YYYY'')) AND ');
         SQL.Add('                (P.IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('                (L.PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//            SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0',[sContaIni]), ' ', 18)) + ') AND            ');
//            SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')   ');

         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('       GROUP BY L.IDPLANOPREV, C.PLACONTA, C.PLANO ) SALDO ');
         SQL.Add('   WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('         PPP.PLANO       = SALDO.PLANO(+) AND   ');
         SQL.Add('         PPP.PLACONTA    = SALDO.PLACONTA(+)    ');
         SQL.Add('   GROUP BY PPP.CODSPC, PPP.PLANO, PPP.PLACONTA ');
       end;
       SQL.Add(') SA, ');
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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY PLACONTA, IDPLANOPREV, IDPATRO, PLANO ');
         SQL.Add('    ORDER BY  IDPATRO, IDPLANOPREV,  PLACONTA) SALDO ');
         SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('          PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('    ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
       end
       else if bQuebraPorPatro then
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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('          (PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY PLACONTA, IDPLANOPREV, PLANO ');
         SQL.Add('  ) SALDO ');
         SQL.Add('    WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('          PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('          PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('    GROUP BY  PPP.CODSPC, PPP.PLANO, PPP.PLACONTA ');
       end;
       SQL.Add(' ) SN, ');
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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY C.PLACONTA, L.IDPLANOPREV, L.IDPATRO, L.PLANO ');
         SQL.Add('    ORDER BY L.IDPATRO, L.IDPLANOPREV, C.PLACONTA ) SALDO ');
         SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('        PPP.IDPATRO     = SALDO.IDPATRO(+) AND ');
         SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         SQL.Add('  ORDER BY  PPP.IDPLANOPREV, PPP.IDPATRO, PPP.PLANO, PPP.PLACONTA ');
       end
       else if bQuebraPorPatro then
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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('               (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('               (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('                (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('                (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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

         // Paulo Nobre - WO28183 - Inicio

//         SQL.Add('          (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND ');
//         SQL.Add('          (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ') ');

         SQL.Add('             (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('             (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY C.PLACONTA, L.IDPLANOPREV, L.PLANO ');
         SQL.Add('    ) SALDO ');
         SQL.Add('  WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
         SQL.Add('        PPP.PLANO       = SALDO.PLANO(+) AND ');
         SQL.Add('        PPP.PLACONTA    = SALDO.PLACONTA(+) ');
         //pendência 27374 - 13/02/2008
         if bDescResultado then
         Begin
           SQL.Add('        ((L.TIPCODIGO IS NULL) OR ');
           SQL.Add('        (L.TIPCODIGO <> '''+sTipCodigo+''')) AND             ');
         End;
         SQL.Add('  GROUP BY PPP.CODSPC, PPP.PLANO, PPP.PLACONTA ');
       end;
       SQL.Add(' ) S ');
       SQL.Add('                                      ');
       SQL.Add('WHERE                                 ');
       SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND  ');
       SQL.Add('    (S.PLANO(+) = C.PLANO) AND        ');
       SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND ');
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
       if bQuebraPorPatro then
       begin
         SQL.Add(' SA.IDPATRO = P.IDPESSOA AND          ');
         SQL.Add(' S.IDPATRO = P.IDPESSOA AND           ');
         SQL.Add(' SN.IDPATRO = P.IDPESSOA AND          ');
         SQL.Add(' SA.IDPATRO = SN.IDPATRO AND          ');
         SQL.Add(' SA.IDPATRO = S.IDPATRO AND           ');
       end;
       SQL.Add('    (C.PLACONTA = C.PLACONTA) AND ');
       SQL.Add('    (C.PLANO = C.PLANO) AND ');
       SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND        ');
       SQL.Add('    (C.PLANO =' + sPlano + ') AND   ');

       // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

       SQL.Add('     (C.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
       SQL.Add('     (C.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

       // Paulo Nobre - WO28183 - Fim

       If bDescEstatistica then
       Begin
         SQL.Add(' AND (C.PLAGRUPO <> ''E'')                            ');
       End;
       if bContraNatureza then
       begin
         SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) < 0)) OR         ');
         SQL.Add('      ((C.PLANATUREZA = ''C'') AND  ((NVL(SA.SALDOANT,0)+NVL(SN.SALDOAN,0)+NVL(S.MOV,0)) >= 0)))         ');
       end;
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
         // Alterado por FHBS - SOL: 140372 KTN: 877866 - Adicionado o campo PPC.IDPLANOPREV
         SQL.Add(' , PPC.IDPLANOPREV, PPC.NOME, P.NOME ');
         SQL.Add(' , P.IDPESSOA ');
       end;
       if bQuebraPorPatro then
       begin
         SQL.Add(' , P.NOME ');
         SQL.Add(' , P.IDPESSOA ');
       end;
       if bQuebraPorPlanoPrev then
         SQL.Add(' , PPC.NOME ');
       if bQuebraPorPlanoSPC then
         SQL.Add(' , PPC.CODSPC ');
       // Alterado por Arnaldo Vicente Scarin em 14/09/2009
       // SOL: 40495 Kintana: 523623
       // Alterações no layout do relatório conforme solicitação do SOL
       if sContasZeradas = 'S' then// IMPRIME CONTAS SINTÉTICAS ZERADAS          // SIG 122748 Ferrari
       begin
         SQL.Add('HAVING ((DECODE(C.PLATIPO,''A'',                                ');
         SQL.Add('       (DECODE(NVL(S.DEB,0),0,                                  ');
         SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                 ');
         // Alterado por FHBS - SOL: 140372 KTN: 877866
         // Estava dando erro com "SS.SALDO". Foi passado para "SN.SALDOAN"
         SQL.Add('       (DECODE(NVL(SN.SALDOAN,0),0,                             ');
         // Fim - Alterado por FHBS 
         SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')),''1'')) = ''1'') ');
       end;
       if ((sContasZeradas = 'N') or (sContasZeradas = 'SM')) then                 // SIG 122748 Ferrari
       begin
         SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
         SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
         SQL.Add('       (DECODE(NVL(SN.SALDOAN,0),0,                              ');
         SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
       end;
       SQL.Add(' ORDER BY ');
       if bQuebraPlanoPatro then
         SQL.Add('PATRO, PLANOPREV, ');
       if bQuebraPorPatro then
         SQL.Add('PATRO, ');
       if bQuebraPorPlanoPrev then
         SQL.Add('PLANOPREV, ');
       if bQuebraPorPlanoSPC then
         SQL.Add(' PPC.CODSPC, ');
       SQL.Add(' C.PLACONTA ');
     End
     Else
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
         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('   , U.IDPLANOPREV, U.PLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('   , U.IDPATRO, U.PATRO ');
         if (bQuebraPorPlanoSPC) then
           SQL.Add('   , U.CODSPC ' );
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
         End
         Else
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
         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('   , C.IDPLANOPREV, C.PLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('   , C.IDPATRO, C.PATRO ');
         if (bQuebraPorPlanoSPC) then
           SQL.Add('   , C.CODSPC ' );
         SQL.Add('FROM                                                             ');
         SQL.Add('(SELECT PL.PLANO, PL.PLACONTA, PL.PLATIPO, PL.PLAGRUPO, PL.PLACONCORRESP, PL.PLANOME, PL.PLANOMEOUTLING, PL.PLAGRAU, PL.PLANATUREZA ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('        , PT.IDPESSOA AS IDPATRO, PT.NOME AS PATRO ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('       ,PPC.CODSPC, PPC.IDPLANOPREV, PPC.NOME AS PLANOPREV ');
         SQL.Add(' FROM  PLANOCONTA PL ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('      ,PLANPREVCONTABIL PPC ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('      ,(SELECT P.IDPESSOA, P.NOME FROM PATRO PT, PESSOA P WHERE PT.IDPESSOA = P.IDPESSOA) PT ');
         SQL.Add(' WHERE PL.PLANO = '+ sPlano );
         SQL.Add(' GROUP BY PL.PLANO, PL.PLACONTA, PL.PLATIPO ');
         SQL.Add('         ,PL.PLAGRUPO, PL.PLACONCORRESP, PL.PLANOME, PL.PLANOMEOUTLING, PL.PLAGRAU, PL.PLANATUREZA ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('        ,PPC.CODSPC ,PPC.IDPLANOPREV, PPC.NOME ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('         ,PT.IDPESSOA, PT.NOME ');
         SQL.Add(') C,');
         SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
         SQL.Add('   (SELECT C.PLACONTA,                                           ');
         SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('   , L.IDPLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('   , L.IDPATRO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC     ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
         SQL.Add('          (P.PLNCODIGO    = L.PLNCODIGO) AND                     ');
         SQL.Add('          (L.TIPCODIGO    = '''+sTipCodigo+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + sExercicio + ') AND       ');
         SQL.Add('          (P.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni])+') AND ');
         If Trim(sAtividade) <> '' then
         Begin
           SQL.Add('       ((L.UNIDNEGOC = ' + Trim(sAtividade) + ') AND          ');
           SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND ');
         End;
         SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');
         If Trim(sPlanoPrevG) <> '' then
         Begin
           SQL.Add('      (L.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
         End;
         If Trim(sPatroG) <> '' then
         Begin
           SQL.Add('      (L.IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
         End;
         If Trim(sAtividadeG) <> '' then
         Begin
           SQL.Add('      (L.UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
         End;
         SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY C.PLACONTA ' );
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('             , L.IDPLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('             , L.IDPATRO ');
         SQL.Add(') SA,  ');
         SQL.Add('                                                                       ');
         SQL.Add('   (SELECT C.PLACONTA,                                                 ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0)) AS DEB,          ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0)) AS CRED,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''D'',L.LACVALOR*-1,0),0)) AS DEBA,         ');
         SQL.Add('       SUM(DECODE(C.PLATIPO,''A'',DECODE(L.LACDEBCRE,''C'',L.LACVALOR*-1,0),0)) AS CREDA,        ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS MOV  ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('       , L.IDPLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('       , L.IDPATRO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC  ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND      ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                             ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sTipCodigo+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + sExercicio + ') AND       ');
         SQL.Add('          (P.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni])  + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim]) + ') AND  ');
         If Trim(sAtividade) <> '' then
         Begin
           SQL.Add('       ((L.UNIDNEGOC = ' + Trim(sAtividade) + ') AND   ');
           SQL.Add('       (L.IDPESSOA =' + sEmpresa + ')) AND ');
         End;
         SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');
         If Trim(sPlanoPrevG) <> '' then
         Begin
           SQL.Add('      (L.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
         End;
         If Trim(sPatroG) <> '' then
         Begin
           SQL.Add('      (L.IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
         End;
         If Trim(sAtividadeG) <> '' then
         Begin
           SQL.Add('      (L.UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
         End;
         SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY C.PLACONTA ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('           , L.IDPLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('       , L.IDPATRO ');
         SQL.Add(') S, ');
         SQL.Add('                                                           ');
         SQL.Add('   (SELECT C.PLACONTA,                                     ');
         SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('       , L.IDPLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('       , L.IDPATRO ');
         SQL.Add('    FROM PLANOCONTA C, LANCAMENTO L, PLANILHA P, CENTCUST CC     ');
         SQL.Add('    WHERE (L.PLACONTA LIKE RTRIM(C.PLACONTA)||''%'') AND         ');
         SQL.Add('          (L.PLANO = C.PLANO) AND                                ');
         SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
         SQL.Add('          (L.TIPCODIGO = '''+sTipCodigo+''') AND ');
         SQL.Add('          (P.PEREXERCICIO =' + sExercicio + ') AND       ');
         SQL.Add('          (P.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])+') AND ');
         If Trim(sAtividade) <> '' Then
         Begin
           SQL.Add('       ((L.UNIDNEGOC = ' + Trim(sAtividade) + ') AND   ');
           SQL.Add('       (L.IDPESSOA   = ' + sEmpresa + ')) AND ');
         End;
         SQL.Add('         (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');
         If Trim(sPlanoPrevG) <> '' then
         Begin
           SQL.Add('      (L.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
         End;
         If Trim(sPatroG) <> '' then
         Begin
           SQL.Add('      (L.IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
         End;
         If Trim(sAtividadeG) <> '' then
         Begin
           SQL.Add('      (L.UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
         End;
         SQL.Add('          (P.IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (L.PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (L.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (L.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (L.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (L.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY C.PLACONTA ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('       , L.IDPLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('       , L.IDPATRO ');
         SQL.Add(') SS ');
         SQL.Add('                                                              ');
         SQL.Add('WHERE                                                         ');
         SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
         begin
           SQL.Add('    (S.idplanoprev(+)  = C.idplanoprev) AND ');
           SQL.Add('    (SA.idplanoprev(+) = C.idplanoprev) AND ');
           SQL.Add('    (SS.idplanoprev(+) = C.idplanoprev) AND ');
         end;
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
         begin
           SQL.Add('    (S.IDPATRO(+)  = C.IDPATRO) AND ');
           SQL.Add('    (SA.IDPATRO(+) = C.IDPATRO) AND ');
           SQL.Add('    (SS.IDPATRO(+) = C.IDPATRO) AND ');
         end;
         SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND        ');
         SQL.Add('    (C.PLANO =' + sPlano + ') AND   ');
         
         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (C.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (C.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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
         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('    , C.IDPLANOPREV, C.PLANOPREV ');
         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('    , C.IDPATRO, C.PATRO ');
         if (bQuebraPorPlanoSPC) then
           SQL.Add('    , C.CODSPC ' );
         // Alterado por Arnaldo Vicente Scarin em 14/09/2009
         // SOL: 40495 Kintana: 523623
         // Alterações no layout do relatório conforme solicitação do SOL
         if ((sContasZeradas = 'S') or (sContasZeradas = 'SM')) then  // IMPRIME CONTAS SINTÉTICAS ZERADAS     // SIG 122748 Ferrari
         begin
      {     SQL.Add('HAVING ((DECODE(C.PLATIPO,''A'',                                ');
           SQL.Add('       (DECODE(NVL(S.DEB,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
           SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')),''1'')) = ''1'') ');    }
           // Inicio 122748 Ferrari
           SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
           SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'')) ');
           // Fim
         end;
         if sContasZeradas = 'N' then
         begin
           SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
           SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'')) ');
         end;
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
         End
         Else
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
         SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS ');

         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('   , C.IDPLANOPREV, C.PLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('   , C.IDPATRO, C.PATRO ');

         if (bQuebraPorPlanoSPC) then
           SQL.Add('   , C.CODSPC ' );

         SQL.Add('FROM ');

         SQL.Add('(SELECT PL.PLANO, PL.PLACONTA, PL.PLATIPO, PL.PLAGRUPO, PL.PLACONCORRESP, PL.PLANOME, PL.PLANOMEOUTLING, PL.PLAGRAU, PL.PLANATUREZA ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('        , PT.IDPESSOA AS IDPATRO, PT.NOME AS PATRO ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('        ,PPC.CODSPC , PPC.IDPLANOPREV, PPC.NOME AS PLANOPREV ');

         SQL.Add(' FROM  PLANOCONTA PL ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('      ,PLANPREVCONTABIL PPC ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('      ,(SELECT P.IDPESSOA, P.NOME FROM PATRO PT, PESSOA P WHERE PT.IDPESSOA = P.IDPESSOA) PT ');

         SQL.Add(' WHERE PL.PLANO = '+ sPlano );
         SQL.Add(' GROUP BY PL.PLANO, PL.PLACONTA, PL.PLATIPO ');
         SQL.Add('         ,PL.PLAGRUPO, PL.PLACONCORRESP, PL.PLANOME, PL.PLANOMEOUTLING, PL.PLAGRAU, PL.PLANATUREZA ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('         ,PPC.IDPLANOPREV, PPC.NOME, PPC.CODSPC ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('         ,PT.IDPESSOA, PT.NOME ');

         SQL.Add(') C,');

         SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
         SQL.Add('   (SELECT PS.PLACONTA,                                             ');
         SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)    ');
         SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('    , PS.IDPLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('    , PS.IDPATRO ');

         SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                           ');
         SQL.Add('    WHERE                                                     ');
         SQL.Add('       (PS.PEREXERCICIO =' + sExercicio + ') AND         ');
         SQL.Add('       ((PS.PERNUMERO <' + GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PERNUMERO IS NULL)) AND  ');
         If Trim(sAtividade) <> '' then
         Begin
           SQL.Add('       ((PS.UNIDNEGOC = ' + Trim(sAtividade) + ') AND   ');
           SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
         End;

         SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

         If Trim(sPlanoPrevG) <> '' then
         Begin
           SQL.Add('      (PS.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
         End;
         If Trim(sPatroG) <> '' then
         Begin
           SQL.Add('      (PS.IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
         End;
         If Trim(sAtividadeG) <> '' then
         Begin
           SQL.Add('      (PS.UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
         End;
         SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (PS.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (PS.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY PS.PLACONTA ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('           , PS.IDPLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('           , PS.IDPATRO ');

         SQL.Add(') SA, ');

         SQL.Add('                                                                 ');
         SQL.Add('   (SELECT PLACONTA,                                                     ');
         SQL.Add('           SUM(PLSDEBITOCORRENTE) AS DEB,                                ');
         SQL.Add('           SUM(PLSCREDITOCOR) AS CRED,                                   ');
         SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSDEBITOCORRENTE, 0)) AS DEBA,    ');
         SQL.Add('           SUM(DECODE(PLSTIPO, ''A'', PLSCREDITOCOR, 0)) AS CREDA,       ');
         SQL.Add('           (SUM(PLSDEBITOCORRENTE) - SUM(PLSCREDITOCOR)) AS MOV          ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('           , PS.IDPLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('           , PS.IDPATRO ');

         SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                          ');
         SQL.Add('    WHERE                                                     ');
         SQL.Add('       (PS.PEREXERCICIO =' + sExercicio+ ') AND         ');
         SQL.Add('       (PS.PERNUMERO BETWEEN ' + GetFirstNotEmpty('0', [sPeriodoIni]) + ' AND ' + GetFirstNotEmpty('0', [sPeriodoFim])+ ') AND  ');
         If Trim(sAtividade) <> '' then
         Begin
           SQL.Add('       ((PS.UNIDNEGOC = ' + Trim(sAtividade) + ') AND   ');
           SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
         End;

         SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

         If Trim(sPlanoPrevG) <> '' then
         Begin
           SQL.Add('      (PS.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
         End;
         If Trim(sPatroG) <> '' then
         Begin
           SQL.Add('      (PS.IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
         End;
         If Trim(sAtividadeG) <> '' then
         Begin
           SQL.Add('      (PS.UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
         End;
         SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (PS.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (PS.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY PS.PLACONTA ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('           , PS.IDPLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('           , PS.IDPATRO ');

         SQL.Add('    ) S, ');

         SQL.Add('                                                                 ');
         SQL.Add('   (SELECT                                                       ');
         SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
         SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('           , PS.IDPLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('           , PS.IDPATRO ');

         SQL.Add('    FROM PLANOSALDO PS, CENTCUST CC                           ');
         SQL.Add('    WHERE                                                     ');
         SQL.Add('          (PS.PEREXERCICIO =' + sExercicio + ') AND              ');
         SQL.Add('          ((PS.PERNUMERO <=' + GetFirstNotEmpty('0', [sPeriodoFim])  + ') OR (PERNUMERO IS NULL)) AND ');
         If Trim(sAtividade) <> '' then
         Begin
           SQL.Add('       ((PS.UNIDNEGOC = ' + Trim(sAtividade) + ') AND   ');
           SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
         End;

         SQL.Add('         (PS.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND       ');

         If Trim(sPlanoPrevG) <> '' then
         Begin
           SQL.Add('      (IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
         End;
         If Trim(sPatroG) <> '' then
         Begin
           SQL.Add('      (IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
         End;
         If Trim(sAtividadeG) <> '' then
         Begin
           SQL.Add('      (UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
         End;
         SQL.Add('          (IDPESSOA =' + sEmpresa + ') AND ');
         SQL.Add('          (PLANO =' + sPlano + ') AND   ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

         SQL.Add('    GROUP BY PLACONTA ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('           , PS.IDPLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('           , PS.IDPATRO ');

         SQL.Add(') SS ');

         SQL.Add('                                                              ');
         SQL.Add('WHERE                                                         ');
         SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                         ');

         if (bQuebraPorPlanoSPC or bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
         begin
           SQL.Add('    (S.IDPLANOPREV(+)  = C.IDPLANOPREV) AND ');
           SQL.Add('    (SA.IDPLANOPREV(+) = C.IDPLANOPREV) AND ');
           SQL.Add('    (SS.IDPLANOPREV(+) = C.IDPLANOPREV) AND ');
         end;

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
         begin
           SQL.Add('    (S.IDPATRO(+)  = C.IDPATRO) AND ');
           SQL.Add('    (SA.IDPATRO(+) = C.IDPATRO) AND ');
           SQL.Add('    (SS.IDPATRO(+) = C.IDPATRO) AND ');
         end;

         SQL.Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                         ');
         SQL.Add('    (PD.PLANO(+) = C.PLANO) AND                               ');
         SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND                          ');
         SQL.Add('    (C.PLANO =' + sPlano + ') AND                             ');

         // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

         SQL.Add('      (C.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
         SQL.Add('      (C.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

         // Paulo Nobre - WO28183 - Fim

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

         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('    , C.IDPLANOPREV, C.PLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('    , C.IDPATRO, C.PATRO ');

         if (bQuebraPorPlanoSPC) then
           SQL.Add('    , C.CODSPC ' );

         // Alterado por Arnaldo Vicente Scarin em 14/09/2009
         // SOL: 40495 Kintana: 523623
         // Alterações no layout do relatório conforme solicitação do SOL
         if ((sContasZeradas = 'S') or (sContasZeradas = 'SM')) then  // IMPRIME CONTAS SINTÉTICAS ZERADAS    // SIG 122748 Ferrari
         begin
         {  SQL.Add('HAVING ((DECODE(C.PLATIPO,''A'',                                ');
           SQL.Add('       (DECODE(NVL(S.DEB,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
           SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
           SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')),''1'')) = ''1'') ');  }
           // Inicio 122748 Ferrari
           SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                        ');
           SQL.Add('       (DECODE(NVL(S.CRED,0),0,                        ');
           SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                                      ');
           SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'' ');
           // Fim
         end;
         if sContasZeradas = 'N' then
         begin
           SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                        ');
           SQL.Add('       (DECODE(NVL(S.CRED,0),0,                        ');
           SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                                      ');
           SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'' ');
         end;

         sql.Add(' ))) U ');

         SQL.Add('GROUP BY ');
         SQL.Add('   U.PLACONTA, U.PLAGRAU, U.PLATIPO, U.PLACONCORRESP, U.PLANATUREZA, ');
         SQL.Add('   U.GRAU,                                                           ');
         SQL.Add('   U.CONTA, U.PLANOMEOUTLING, U.PLANOME,                         ');
         SQL.Add('   U.NOMEINDENTADO                                               ');

         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           SQL.Add('   , U.IDPLANOPREV, U.PLANOPREV ');

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           SQL.Add('   , U.IDPATRO, U.PATRO ');

         if (bQuebraPorPlanoSPC) then
           SQL.Add('   , U.CODSPC ' );

         SQL.Add('ORDER BY                                                         ');
//inicio ferrari
         sordenacao := '';
         if (bQuebraPlanoPatro or bQuebraPorPlanoPrev) then
           sordenacao := 'U.IDPLANOPREV, U.PLANOPREV ';

         if (bQuebraPorPatro or bQuebraPlanoPatro) then
           sordenacao := sordenacao + IIF((sordenacao <> '' ),',','') + 'U.IDPATRO, U.PATRO ';

         if (bQuebraPorPlanoSPC) then
           sordenacao := sordenacao + IIF((sordenacao <> '' ),',','') + 'U.CODSPC ';

         If bContaCorresp then
         Begin
           sordenacao := sordenacao + IIF((sordenacao <> '' ),',','') + 'U.PLACONCORRESP ';
//           SQL.Add(' U.PLACONCORRESP                                              ');
         End
         Else
         Begin
           sordenacao := sordenacao + IIF((sordenacao <> '' ),',','') + 'U.PLACONTA ';
//           SQL.Add(' U.PLACONTA                                                   ');
         End;
         SQL.Add(sordenacao);
//fim

      End
      Else
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
        End
        Else
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
        SQL.Add('   ABS(NVL(S.MOV,0)) AS MOVABS                                       ');

        if bQuebraPlanoPatro then
          SQL.Add('   ,S.IDPLANOPREV, PPC.NOME AS PLANOPREV, S.IDPATRO, P.NOME AS PATRO ');

        if bQuebraPorPatro then
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

        if bQuebraPorPatro then
          SQL.Add(' PESSOA P, ');

        if bQuebraPorPlanoPrev then
          SQL.Add(' PLANPREVCONTABIL PPC, ');

        SQL.Add(SelecionaPlanoContaPer(StrToIntDef(sPeriodoIni,0),StrToIntDef(sExercicio,0),StrToIntDef(sEmpresa,0))+' PD, ');
        if bQuebraPlanoPatro OR bQuebraPorPatro or bQuebraPorPlanoPrev then
          SQL.Add(' (SELECT  PATRO.PLACONTA, SUM(PLNSALDO.SALDOANT) AS SALDOANT ')
        else
          SQL.Add(' (SELECT  PPC.PLACONTA, SUM(PLNSALDO.SALDOANT) AS SALDOANT ');

        if bQuebraPlanoPatro then
          SQL.Add('    , PATRO.IDPATRO, PATRO.IDPLANOPREV ');

        if bQuebraPorPatro then
          SQL.Add('    , PATRO.IDPATRO ');

        if bQuebraPorPlanoPrev then
          SQL.Add('    , PATRO.IDPLANOPREV ');

        if bQuebraPorPlanoSPC then
          SQL.ADD('     , PPC.CODSPC  ');

        SQL.Add('FROM  ');
        SQL.Add('         (SELECT PS.PLACONTA, SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, PS.PLSDEBITOCORRENTE) - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCREDITOCOR)) AS SALDOANT ');

        if bQuebraPlanoPatro then
          SQL.Add('               , PS.IDPLANOPREV, PS.IDPATRO ');

        if bQuebraPorPlanoPrev or bQuebraPorPlanoSPC then
          SQL.Add('    , PS.IDPLANOPREV ');

        if bQuebraPorPatro then
          SQL.Add('    , PS.IDPATRO ');

        SQL.Add('           FROM PLANOSALDO PS ');
        SQL.Add('           WHERE (PS.PEREXERCICIO = '+ sExercicio +') AND ');
        SQL.Add('                 ((PS.PERNUMERO < '+ GetFirstNotEmpty('0', [sPeriodoIni]) + ') OR (PS.PERNUMERO IS NULL)) AND ');
        SQL.Add('                 (PS.IDPESSOA = ' + sEmpresa +') AND ');
        SQL.Add('                 (PS.PLANO = ' + sPlano + ') AND ');
        // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

        SQL.Add('                 (PS.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
        SQL.Add('                 (PS.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

        // Paulo Nobre - WO28183 - Fim

        If Trim(sAtividade) <> '' then
        Begin
          SQL.Add(' AND   ((PS.UNIDNEGOC = ' + Trim(sAtividade) + ')  ');
          SQL.Add(' AND   (PS.IDPESSOA =' + sEmpresa + '))  ');
        End;
        If Trim(sPlanoPrevG) <> '' then
        Begin
          SQL.Add(' AND  (PS.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) ');
        End;
        If Trim(sPatroG) <> '' then
        Begin
          SQL.Add(' AND  (PS.IDPATRO IN (' + Trim(sPatroG) + '))  ');
        End;
        If Trim(sAtividadeG) <> '' then
        Begin
          SQL.Add(' AND  (PS.UNIDNEGOC IN (' + Trim(sAtividadeG) + '))  ');
        End;

        SQL.Add('            GROUP BY PS.PLACONTA ');
        if bQuebraPlanoPatro then
          SQL.Add('                 , PS.IDPLANOPREV, PS.IDPATRO ');

        if bQuebraPorPatro then
          SQL.Add('                 , PS.IDPATRO ');

        if bQuebraPorPlanoPrev OR bQuebraPorPlanoSPC then
          SQL.Add('                 , PS.IDPLANOPREV ');

        SQL.Add('          )PLNSALDO ');

        if bQuebraPlanoPatro OR bQuebraPorPatro or bQuebraPorPlanoPrev then
        begin
          if bQuebraPlanoPatro then
            SQL.Add('      ,  ( SELECT PC.PLACONTA, PP.IDPLANOPREV, PP.IDPATRO ');

          if bQuebraPorPatro then
            SQL.Add('      ,  ( SELECT PC.PLACONTA, PP.IDPATRO ');

          if bQuebraPorPlanoPrev then
            SQL.Add('      ,  ( SELECT PC.PLACONTA, PP.IDPLANOPREV ');

          SQL.Add('           FROM PLANPREVCONTABPATRO PP, PLANOCONTA PC ');
          SQL.Add('           WHERE PP.IDPATRO IS NOT NULL AND PP.IDPLANOPREV IS NOT NULL AND ');
          SQL.Add('                 (PC.PLANO = ' + sPlano + ') AND ');

          // Paulo Nobre - WO28183 - Inicio

//        SQL.Add('    (PC.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//        SQL.Add('    (PC.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

          SQL.Add('                (PC.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
          SQL.Add('                (PC.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

          // Paulo Nobre - WO28183 - Fim

          if bQuebraPlanoPatro then
            SQL.Add('        GROUP BY PC.PLACONTA, PP.IDPATRO, PP.IDPLANOPREV ');

          if bQuebraPorPatro then
            SQL.Add('        GROUP BY PC.PLACONTA, PP.IDPATRO ');

          if bQuebraPorPlanoPrev then
            SQL.Add('        GROUP BY PC.PLACONTA, PP.IDPLANOPREV ');

          SQL.Add('          ) PATRO ');
        end;

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

        if bQuebraPlanoPatro OR bQuebraPorPatro or bQuebraPorPlanoPrev then
          SQL.Add(' AND PATRO.PLACONTA = PLNSALDO.PLACONTA(+) ');

        if bQuebraPlanoPatro OR bQuebraPorPatro then
          SQL.Add(' AND PATRO.IDPATRO = PLNSALDO.IDPATRO(+) ');

        if bQuebraPlanoPatro or bQuebraPorPlanoPrev then
          SQL.Add(' AND  PATRO.IDPLANOPREV = PLNSALDO.IDPLANOPREV(+) ');

        if bQuebraPorPlanoSPC then
        begin
          SQL.ADD(' AND (PPC.IDPLANOPREV = PLNSALDO.IDPLANOPREV(+)) ');
          SQL.ADD(' AND (PPC.PLACONTA = PLNSALDO.PLACONTA(+)) ');
        end;

        if bQuebraPlanoPatro OR bQuebraPorPatro or bQuebraPorPlanoPrev then
          SQL.Add(' GROUP BY PATRO.PLACONTA ')
        else
          SQL.Add(' GROUP BY PPC.PLACONTA ');

        if bQuebraPlanoPatro then
          SQL.Add(' , PATRO.IDPLANOPREV, PATRO.IDPATRO ');

        if bQuebraPorPatro then
          SQL.Add(' , PATRO.IDPATRO ');

        if bQuebraPorPlanoPrev then
          SQL.Add(' , PATRO.IDPLANOPREV ');

        if bQuebraPorPlanoSPC then
          SQL.Add(' , PPC.CODSPC ');

        if bQuebraPorPlanoSPC then
          SQL.Add(' ORDER BY PPC.CODSPC ');

        SQL.Add(') SA, ');

        SQL.Add('                                                                 ');

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

          // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

          SQL.Add('        (P.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
          SQL.Add('        (P.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

          // Paulo Nobre - WO28183 - Fim

          SQL.Add('        GROUP BY P.IDPLANOPREV, P.IDPATRO, P.PLANO, P.PLACONTA ) SALDO ');
          SQL.Add(' WHERE PPP.IDPLANOPREV = SALDO.IDPLANOPREV(+) AND ');
          SQL.Add('       PPP.IDPATRO     = SALDO.IDPATRO(+) AND     ');
          SQL.Add('       PPP.PLANO       = SALDO.PLANO(+) AND       ');
          SQL.Add('       PPP.PLACONTA    = SALDO.PLACONTA(+) ) S,   ');
        end
        else if bQuebraPorPatro then
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

          // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

          SQL.Add('        (P.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
          SQL.Add('        (P.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

          // Paulo Nobre - WO28183 - Fim
          
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

          // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

          SQL.Add('        (P.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
          SQL.Add('        (P.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

          // Paulo Nobre - WO28183 - Fim

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

          // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (P.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (P.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

          SQL.Add('             (P.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
          SQL.Add('             (P.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

          // Paulo Nobre - WO28183 - Fim

          SQL.Add('       GROUP BY P.PLACONTA, P.IDPLANOPREV ) SDL ');
          SQL.Add(' WHERE PPC.IDPLANOPREV = SDL.IDPLANOPREV(+)  ');
          SQL.Add('       AND PPC.PLACONTA = SDL.PLACONTA(+) ');

          SQL.Add(' GROUP BY PPC.CODSPC, PPC.PLACONTA) S, ');
        end;

        SQL.Add('                                                                 ');
        SQL.Add('   (SELECT                                                 ');
        SQL.Add('       PPC.PLACONTA, SUM(DECODE(PS.PLSDEBITOCORRENTE, NULL, 0, PS.PLSDEBITOCORRENTE) ');
        SQL.Add('                   - DECODE(PS.PLSCREDITOCOR, NULL, 0, PS.PLSCREDITOCOR)) AS SALDO');

        if bQuebraPlanoPatro then
          SQL.Add(', PPC.IDPLANOPREV, PPC.IDPATRO ');

        if bQuebraPorPatro then
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
        else if bQuebraPorPatro then
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

        If Trim(sAtividade) <> '' then
        Begin
          SQL.Add('       ((PS.UNIDNEGOC = ' + Trim(sAtividade) + ') AND   ');
          SQL.Add('       (PS.IDPESSOA =' + sEmpresa + ')) AND ');
        End;
        If Trim(sPlanoPrevG) <> '' then
        Begin
          SQL.Add('      (PPC.IDPLANOPREV IN (' + Trim(sPlanoPrevG) + ')) AND ');
        End;
        If Trim(sPatroG) <> '' then
        Begin
          // Alterado por FHBS - SOL: 140372 KTN: 877866 - Alterado de PPC.IDPATRO para PS.IDPATRO
          SQL.Add('      (PS.IDPATRO IN (' + Trim(sPatroG) + ')) AND ');
        End;
        If Trim(sAtividadeG) <> '' then
        Begin
          SQL.Add('      (PS.UNIDNEGOC IN (' + Trim(sAtividadeG) + ')) AND ');
        End;

        if bQuebraPorPlanoSPC or bQuebraPorPlanoPrev then
          SQL.ADD('  (PPC.IDPLANOPREV = PS.IDPLANOPREV(+)) AND ');

        if bQuebraPorPatro then
          SQL.ADD('  (PPC.IDPATRO = PS.IDPATRO(+)) AND ');

        if bQuebraPlanoPatro then
        begin
          SQL.ADD('  (PPC.IDPLANOPREV = PS.IDPLANOPREV(+)) AND ');
          SQL.ADD('  (PPC.IDPATRO = PS.IDPATRO(+)) AND ');
        end;

        SQL.ADD('  (PPC.PLACONTA = PS.PLACONTA(+)) AND ');

        SQL.Add('          (PS.IDPESSOA =' + sEmpresa + ') AND ');
        SQL.Add('          (PS.PLANO =' + sPlano + ') AND   ');

        // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (PS.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (PS.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

        SQL.Add('          (PS.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
        SQL.Add('          (PS.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

        // Paulo Nobre - WO28183 - Fim
        
        SQL.Add('    GROUP BY PPC.PLACONTA ');

        if bQuebraPlanoPatro then
          SQL.Add(' , PPC.IDPLANOPREV, PPC.IDPATRO ');

        if bQuebraPorPatro then
          SQL.Add(' , PPC.IDPATRO ');

        if bQuebraPorPlanoPrev then
          SQL.Add(' , PPC.IDPLANOPREV ');

        if bQuebraPorPlanoSPC then
          SQL.Add(' , PPC.CODSPC ');

        if bQuebraPorPlanoSPC then
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

        if bQuebraPorPatro then
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
          SQL.Add('  (PPC.CODSPC = PPC.CODSPC) AND ');
          SQL.Add('  (SA.CODSPC  = PPC.CODSPC) AND ');
          SQL.Add('  (S.CODSPC   = PPC.CODSPC) AND ');
          SQL.Add('  (SS.CODSPC  = PPC.CODSPC) AND ');
          SQL.Add('  (PPC.PLACONTA(+) = C.PLACONTA) AND ');
        end;

        SQL.Add('    (C.PLAGRAU <= ' + sGrau + ') AND                          ');
        SQL.Add('    (C.PLANO =' + sPlano + ') AND                             ');
        // Paulo Nobre - WO28183 - Inicio

//       SQL.Add('    (C.PLACONTA >= ' + QuotedStr(RFillString(GetFirstNotEmpty('0', [sContaIni]), ' ', 18)) + ') AND                  ');
//       SQL.Add('    (C.PLACONTA <= ' + QuotedStr(RFillString(GetFirstNotEmpty('999999999999999999', [sContaFim]), ' ', 18)) + ')                      ');

        SQL.Add('    (C.PLACONTA >= ' + QuotedStr(GetFirstNotEmpty('0',[sContaIni])) + ') AND                ');
        SQL.Add('    (C.PLACONTA <= ' + QuotedStr(GetFirstNotEmpty('999999999999999999', [sContaFim])) + ')  ');

        // Paulo Nobre - WO28183 - Fim

        If bDescEstatistica then
        Begin
          SQL.Add(' AND (C.PLAGRUPO <> ''E'') ');
        End;

        If bContraNatureza then
        Begin
          SQL.Add(' AND (((C.PLANATUREZA = ''D'') AND (SS.SALDO < 0)) OR         ');
          SQL.Add('      ((C.PLANATUREZA = ''C'') AND  (SS.SALDO >= 0)))         ');
        End;

        if bQuebraPlanoPatro then
        begin
          SQL.Add(' AND P.IDPESSOA = S.IDPATRO AND PPC.IDPLANOPREV = S.IDPLANOPREV AND ');
          SQL.Add(' SS.IDPATRO = S.IDPATRO AND SS.IDPLANOPREV = S.IDPLANOPREV ');
        end;

        if bQuebraPorPatro then
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

        if bQuebraPorPatro then
          SQL.Add(' , S.IDPATRO, P.NOME ');

        if bQuebraPorPlanoPrev then
          SQL.Add(' , S.IDPLANOPREV, PPC.NOME ');

        if  bQuebraPorPlanoSPC then
          SQL.Add(' , PPC.CODSPC ');

        // Alterado por Arnaldo Vicente Scarin em 14/09/2009
        // SOL: 40495 Kintana: 523623
        // Alterações no layout do relatório conforme solicitação do SOL
        if sContasZeradas = 'S' then  // IMPRIME CONTAS SINTÉTICAS ZERADAS      // SIG 122748 Ferrari
        begin
          SQL.Add('HAVING ((DECODE(C.PLATIPO,''A'',                                ');
          SQL.Add('       (DECODE(NVL(S.DEB,0),0,                                  ');
          SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
          SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
          SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')),''1'')) = ''1'') ');
        end;
        if ((sContasZeradas = 'N') or (sContasZeradas = 'SM')) then           // SIG 122748 Ferrari
        begin
          SQL.Add('HAVING ((DECODE(NVL(S.DEB,0),0,                                  ');
          SQL.Add('       (DECODE(NVL(S.CRED,0),0,                                  ');
          SQL.Add('       (DECODE(NVL(SS.SALDO,0),0,                                ');
          SQL.Add('       (DECODE(NVL(SA.SALDOANT,0),0,''0'',''1'')),''1'')),''1'')),''1'')) = ''1'') ');
        end;

        sSql := '';
        if bQuebraPlanoPatro then
          sSql := ' ORDER BY PATRO, PLANOPREV, ';

        if bQuebraPorPatro then
          sSql := ' ORDER BY PATRO, ';

        if bQuebraPorPlanoPrev then
          sSql := ' ORDER BY PLANOPREV, ';

        if bQuebraPorPlanoSPC then
          sSql := ' ORDER BY PPC.CODSPC,  ';

        if sSql = '' then
          sSql := ' ORDER BY ';

        If bContaCorresp then
        Begin
          SQL.Add(sSql + ' C.PLACONCORRESP ');
        End
        Else
        Begin
          SQL.Add(sSql + ' C.PLACONTA ');
        End;

      End;
    End;

    If bInclueCODCNPB and bQuebraPlanoPatro then
    begin
      sql.Text := 'Select m.*,cnpb.codspc'+#13+
                  'From ('+Sql.Text+') m,'+#13+
                  '     (SELECT PC.IDPLANOPREV,'+#13+
                  '      DECODE(NVL(PC.IDPLANOPREVPREV, 0), 0, PC.CODSPC, PP.CODIGOSPC) AS CODSPC'+#13+
                  '      FROM PLANPREVCONTABIL PC, PLANPREV PP'+#13+
                  '      WHERE PC.IDPLANOPREVPREV = PP.IDPLANOPREV) CNPB'+#13+
                  'Where m.idplanoprev = cnpb.idplanoprev';
    end;

    // Alterado por FHBS - SOL: 140372 KTN: 877866
    if bSemQuebra then
    begin
      SQL.Text := 'SELECT PLACONTA, PLAGRAU, PLATIPO, PLACONCORRESP, PLANATUREZA,' + #13#10 +
                  '       GRAU, CONTA, PLANOMEOUTLING, PLANOME, NOMEINDENTADO,' + #13#10 +
                  IIF((bInclueCODCNPB and bQuebraPlanoPatro),'CODSPC,' + #13#10,'') +
                  '       SUM(DEB) AS DEB,' + #13#10 +
                  '       SUM(CRED) AS CRED,' + #13#10 +
                  '       SUM(DEBA) AS DEBA,' + #13#10 +
                  '       SUM(CREDA) AS CREDA,' + #13#10 +
                  '       SUM(MOV) AS MOV,' + #13#10 +
                  '       SUM(SALDOANT) AS SALDOANT,' + #13#10 +
                  '       SUM(SALDO) AS SALDO,' + #13#10 +
                  '       DECODE(NVL(SUM(MOV),0), 0, '' '', DECODE(SIGN(SUM(MOV)), -1, ''C'', ''D'' )) AS MOVDC, ' + #13#10 +
                  '       DECODE(NVL(SUM(SALDO),0), 0, '' '', DECODE(SIGN(SUM(SALDO)), -1, ''C'', ''D'' )) AS DEBCRESALDO, ' + #13#10 +
                  '       DECODE(NVL(SUM(SALDOANT),0), 0, '' '', DECODE(SIGN(SUM(SALDOANT)), -1, ''C'', ''D'' )) AS DEBCREANT, ' + #13#10 +
                  '       ABS(NVL(SUM(SALDOANT),0)) as SALDOANTABS, ' + #13#10 +
                  '       ABS(NVL(SUM(SALDO),0)) as SALDOABS, ' + #13#10 +
                  '       ABS(NVL(SUM(MOV),0)) AS MOVABS ' + #13#10 +
                  'FROM (' + SQL.Text + ')' + #13#10 +
                  'GROUP BY PLACONTA, PLAGRAU, PLATIPO, PLACONCORRESP, PLANATUREZA,' + #13#10 +
                  '         GRAU, CONTA, PLANOMEOUTLING, PLANOME, NOMEINDENTADO' + #13#10 +
                  IIF((bInclueCODCNPB and bQuebraPlanoPatro),',CODSPC' + #13#10,'') +
                  'ORDER BY ' + IIF((bInclueCODCNPB and bQuebraPlanoPatro),'CODSPC, ','') + 'PLACONTA';
    end;
    // Fim - Alterado por FHBS
    
    CMDebugToFile(SQLChanged, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\balanceteCAD.txt');
    Result := Data;
  Finally
    Free;
  End;
end;

function TCtrlRptBalanceteAnalPP.SelecionaPlanoContaPer(iPeriodo, iExercicio, IdEmpresa: Double): String;
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

