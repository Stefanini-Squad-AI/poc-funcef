unit uCtrlRelatOrcamento;
{-----------------------------------------------------------------------------------------
 Data      : 23/08/2007
 Autor     : Rodolpho da Silva
 Pendência : 20591
 Descrição : Implementar qry que busca as composições das contas orçamentárias
{-----------------------------------------------------------------------------------------
 Data      : 12/04/2007
 Autor     : Rodolpho da Silva
 Pendência : 23811
 Descrição : Implementar qry que busca as contas contábeis cadastradas para o grupo 
-----------------------------------------------------------------------------------------}

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider, uFuncaoGeral;

Type
  TCtrlRelatOrcamento = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function Suplemen(numalteracao, idpessoa: double) : OleVariant;

      function ListaCContabGrupo(iIdPessoa,iIdPlanoContab, iIdPlanoOrc: integer; sCodGrupoIni,
                                 sCodGrupoFim,sContaContabIni,sContaContabFim: string): OleVariant;

      function ListaCompContas(iIdPlanoOrcamen, iIdPessoa: integer; iIdGrupo: integer = -1): OleVariant;
      function ListaImagem(iIdPessoa: integer): OleVariant;

      function ListaSaldoGrupoOrcamen(iIdEmpresa,iExercicio,iPerIni,iPerFim: integer;
                                      dValorDiv: Double;
                                      sIdPlanPrev, sIdPatro, sCodCCUsto,
                                      sAtivProj: string;
                                      iIdGrupoOrcamen: integer = -1;
                                      iIdPlanoOrcamen: integer = -1;
                                      iIdCenario: integer = -1): OleVariant;


  end;





implementation


procedure TCtrlRelatOrcamento.DoChangeDataBase;
begin
  inherited;
  //
end;



constructor TCtrlRelatOrcamento.Create;
begin
  inherited;
  //
end;



destructor TCtrlRelatOrcamento.Destroy;
begin
  inherited;
  //
end;



function TCtrlRelatOrcamento.Suplemen(numalteracao, idpessoa: double) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                                     ' +
           '   A.IDCONTAORIGEM, C1.NOMECONTAORCAMEN AS CONTAORI,       ' +
           '   A.OBSALTERORCAMEN, A.DATAREFERENCIA, A.NUMALTERACAO,    ' +
           '   CR.CODCENTRORESPON, CR.NOME, A.VLRSOLICITADO            ' +
           'FROM                                                       ' +
           '   ALTERORCAMENTO A, CENTRESPON CR, CONTASORCAMEN C1       ' +
           'WHERE                                                      ' +
           '   (A.FLGTIPOALTER = ''S'') AND                            ' +
           '   (A.IDCONTAORIGEM = C1.IDCONTAORCAMEN) AND               ' +
           '   (A.IDPLANOORCAMEN = C1.IDPLANOORCAMEN) AND              ' +
           '   (C1.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND        ' +
           '   (C1.IDPESSOA = CR.IDPESSOA(+))  AND                     ' +
           '   (A.NUMALTERACAO = ' + FloatToStr(numalteracao) + ') AND ' +
           '   (A.IDPESSOA = ' + FloatToStr(idpessoa) + ')';
   Result := GetDataPacket(sSql);
end;






function TCtrlRelatOrcamento.ListaCContabGrupo(iIdPessoa,iIdPlanoContab, iIdPlanoOrc: integer;
                                               sCodGrupoIni,sCodGrupoFim,sContaContabIni,sContaContabFim: string): OleVariant;
var
  sSQL: string;
begin
   sSQL := 'SELECT ' +
           '   G.IDGRUPOORCAMEN, ' +
           '   G.NOMEGRUPOORCAMEN, ' +
           '   TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS DESCGRUPO, ' +
           '   P.PLACONTA, ' +
           '   P.PLANOME ' +
           'FROM ' +
           '   CONTASORCAMEN C, ' +
           '   COMPCONTASORCAMEN CP, ' +
           '   GRUPOORCAMEN G, ' +
           '   PLANOCONTA P ' +
           
           'WHERE ' +
           '   (C.IDGRUPOORCAMEN    = G.IDGRUPOORCAMEN)  AND ' +
           '   (C.IDCONTAORCAMEN    = CP.IDCONTAORCAMEN) AND ' +
           '   (C.IDPLANOORCAMEN    = CP.IDPLANOORCAMEN) AND ' +
           '   (P.PLANO             = CP.PLANO) AND ' +
           '   (P.PLACONTA          = CP.PLACONTA) AND ' +
           '   (C.TIPOCALCREALIZADO = ''P'') AND ' +
           '   (CP.PLANO            = ' + IntToStr(iIdPlanoContab)  + ') AND ' +
           '   (C.IDPESSOA          = ' + IntToStr(iIdPessoa)       + ') AND ' +
           '   (C.IDPLANOORCAMEN    = ' + IntToStr(iIdPlanoOrc)     + ') ';

           if Trim(sCodGrupoIni) <> '' then
              sSQL := sSQL + ' AND (G.CODGRUPOORC >= ' + QuotedStr(sCodGrupoIni) + ') ';

           if Trim(sCodGrupoFim) <> '' then
              sSQL := sSQL + ' AND (G.CODGRUPOORC <= ' + QuotedStr(sCodGrupoFim) + ') ';

           if Trim(sContaContabIni) <> '' then
              sSQL := sSQL + ' AND (P.PLACONTA >= ' + QuotedStr(sContaContabIni + StringOfChar(' ',(18 - length(sContaContabIni)))) + ') ';

           if Trim(sContaContabFim) <> '' then
              sSQL := sSQL + ' AND (P.PLACONTA <= ' + QuotedStr(sContaContabFim + StringOfChar(' ',(18 - length(sContaContabFim)))) + ') ';



           sSQL := sSQL +
           'GROUP BY ' +
           '   G.IDGRUPOORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, P.PLACONTA, P.PLANOME ' +
           'ORDER BY ' +
           '   G.NOMEGRUPOORCAMEN, P.PLACONTA ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlRelatOrcamento.ListaCompContas(iIdPlanoOrcamen, iIdPessoa,
  iIdGrupo: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT U.IDGRUPOORCAMEN, ' +
          '       U.CODGRUPOORC, ' +
          '       TRIM(U.CODGRUPOORC) || '' - '' || U.NOMEGRUPOORCAMEN AS NOMEGRUPOORCAMEN, ' +
          '       U.IDCONTAORCAMEN, ' +
          '       U.NOMECONTAORCAMEN, ' +
          '       U.TIPOCALC, ' +
          '       U.CODCENTRORESPON, ' +
          '       TRIM(CR.CODEXTERNO) || '' - '' || CR.NOME AS CENTRORESP, ' +
          '       TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTROCUST, ' +
          '       AP.NOME AS ATIVPROJ, ' +
          '       PT.NOME AS PATRO, ' +
          '       PL.NOME AS PLANO, ' +
          '       U.DETALHE ' +
          'FROM ' +
          '(   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Contabilidade'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Conta contábil: ''||TRIM(CC.PLACONTA)||'' - ''||P.PLANOME||''   ''||'' C.Custo: ''||TRIM(CCU.CODEXTERNO)||'' - ''|| CCU.NOME ||'' At.Proj: ''||SUBSTR(U.NOME,1,10)||'' ''||'' Plano: ''||SUBSTR(PN.NOME,1,10)||'' ''||'' Patro: ''||SUBSTR(PT.NOME,1,10)) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G, ' +
          '       COMPCONTASORCAMEN CC, ' +
          '       PLANOCONTA P, ' +
          '       UNIDNEGOCIO U, ' +
          '       PESSOA PT, ' +
          '       PLANPREV PN, ' +
          '       CENTCUST CCU ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''P'') AND ' +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
          '       (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ' +
          '       (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (CC.PLANO = P.PLANO) AND ' +
          '       (CC.PLACONTA = P.PLACONTA) AND ' +
          '       (CC.IDPATRO = PT.IDPESSOA(+)) AND ' +
          '       (CC.IDPLANOPREV = PN.IDPLANOPREV(+)) AND ' +
          '       (CC.IDPESSOA = U.IDPESSOA(+)) AND ' +
          '       (CC.CODCENTROCUSTO=CCU.CODCENTROCUSTO(+)) AND ' +
          '       (CC.UNIDNEGOC = U.UNIDNEGOC(+))  ) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Fluxo de Caixa'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Tipo Rec/Des: ''||TRIM(CC.CODTIPRECDES)||'' - ''||P.DESCRICAO||''   ''||'' C.Custo: ''||CCU.CODEXTERNO||'' ''||'' At.Proj: ''||SUBSTR(U.NOME,1,10)||'' ''||'' Plano: ''||SUBSTR(PN.NOME,1,10)||'' ''||'' Patro: ''||SUBSTR(PT.NOME,1,10)) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G, ' +
          '       COMPCONTASORCAMEN CC, ' +
          '       TIPORECEBDESEMB P, ' +
          '       UNIDNEGOCIO U, ' +
          '       PESSOA PT, ' +
          '       PLANPREV PN, ' +
          '       CENTCUST CCU ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''X'') AND ' +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
          '       (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ' +
          '       (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (CC.IDPESSOA = P.IDPESSOA) AND ' +
          '       (CC.CODTIPRECDES = P.CODTIPRECDES) AND ' +
          '       (CC.RECPAG = P.RECPAG) AND ' +
          '       (CC.IDPATRO = PT.IDPESSOA(+)) AND ' +
          '       (CC.IDPLANOPREV = PN.IDPLANOPREV(+)) AND ' +
          '       (CC.IDPESSOA = U.IDPESSOA(+)) AND ' +
          '       (CC.CODCENTROCUSTO=CCU.CODCENTROCUSTO(+)) AND ' +
          '       (CC.UNIDNEGOC = U.UNIDNEGOC(+))  ) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Composição'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Conta Orçamentária: ''||TRIM(CC.IDCONTAREFREAL)||'' - ''||P.NOMECONTAORCAMEN||''    Percentual: ''||TO_CHAR(PERCCONTAREFREA)) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G, ' +
          '       COMPCONTASORCAMEN CC, ' +
          '       CONTASORCAMEN P ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''F'') AND ' +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ' +
          '       (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND ' +
          '       (CC.IDPLANOORCAMEN = P.IDPLANOORCAMEN) AND ' +
          '       (CC.IDCONTAREFREAL = P.IDCONTAORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Fórmula'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Fórmula: ''||C.FORMULAREALIZADO) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''M'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Valor Fixo'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Valor Fixo: ''||TO_CHAR(C.VLRINFORMADOREAL)) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''I'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Valor Manual'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       ('' '') AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''V'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Arquivo Genérico'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       ('' '') AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''G'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do realizado: Condicional'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Se a Conta ''||CC.IDCONTACONDINI||'' for ''||CC.CONDICAO|| ' +
          '         DECODE(CC.TIPOCONDINI,''V'','' que o Valor ''||TO_CHAR(CC.VLRCONDINI),'' que a Conta ''||TO_CHAR(CC.IDCONTACONDFIM))|| ' +
          '        '' então a condição receberá o Valor ''|| ' +
          '         DECODE(CC.TIPOCONDRES,''V'',TO_CHAR(CC.VLRCONDRES),'' da Conta ''||TO_CHAR(CC.IDCONTACONDRES))) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G, ' +
          '       COMPCONTASORCAMEN CC ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCREALIZADO = ''C'') AND ' +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
          '       (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do orçado: Composição'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Conta Orçamentária: ''||CC.IDCONTAREFORCADO||'' - ''||P.NOMECONTAORCAMEN||''    Percentual: ''||TO_CHAR(PERCCONTAREFORC)) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G, ' +
          '       COMPCONTASORCAMEN CC, ' +
          '       CONTASORCAMEN P ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCORCADO = ''F'') AND ' +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
          '       (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ' +
          '       (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (CC.IDPLANOORCAMEN = P.IDPLANOORCAMEN) AND ' +
          '       (CC.IDCONTAREFORCADO = P.IDCONTAORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do orçado: Fórmula'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Fórmula: ''||C.FORMULAORCADO) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCORCADO = ''M'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do orçado: Valor Fixo'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Valor Fixo: ''||TO_CHAR(C.VLRINFORMADOORC)) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCORCADO = ''I'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do orçado: Valor Manual'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       ('' '') AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCORCADO = ''V'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do orçado: Arquivo Genérico'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       ('' '') AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCORCADO = ''G'') AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)) ' +
          '   UNION ALL ' +
          '   (SELECT ' +
          '       C.IDCONTAORCAMEN, ' +
          '       C.IDPLANOORCAMEN, ' +
          '       C.IDPATRO, ' +
          '       C.IDPLANOPREV, ' +
          '       C.CODCENTROCUSTO, ' +
          '       C.UNIDNEGOC, ' +
          '       C.IDGRUPOORCAMEN, ' +
          '       C.NOMECONTAORCAMEN, ' +
          '       ''Tipo de calculo do orçado: Condicional'' AS TIPOCALC, ' +
          '       C.CODCENTRORESPON, ' +
          '       G.NOMEGRUPOORCAMEN, ' +
          '       G.CODGRUPOORC, ' +
          '       (''Se a Conta ''||CC.IDCONTACONDINI||'' for ''||CC.CONDICAO|| ' +
          '         DECODE(CC.TIPOCONDINI,''V'','' que o Valor ''||TO_CHAR(CC.VLRCONDINI),'' que a Conta ''||TO_CHAR(CC.IDCONTACONDFIM))|| ' +
          '        '' então a condição receberá o Valor ''|| ' +
          '         DECODE(CC.TIPOCONDRES,''V'',TO_CHAR(CC.VLRCONDRES),'' da Conta ''||TO_CHAR(CC.IDCONTACONDRES))) AS DETALHE ' +
          '    FROM ' +
          '       CONTASORCAMEN C, ' +
          '       GRUPOORCAMEN G, ' +
          '       COMPCONTASORCAMEN CC ' +
          '    WHERE ' +
          '       (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcamen) + ') AND ' +
          '       (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
          '       (C.TIPOCALCORCADO = ''C'') AND ' +
          '       (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ';

          if iIdGrupo <> -1 then
             sSQL := sSQL + '(C.IDGRUPOORCAMEN = ' + IntToStr(iIdGrupo) + ') AND ';

          sSQL := sSQL +
          '       (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ' +
          '       (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN)) ' +
          ') U, ' +

          '   CENTCUST CC, ' +
          '   CENTRESPON CR, ' +
          '   UNIDNEGOCIO AP, ' +
          '   PLANPREVCONTABIL PL, ' +
          '   PESSOA PT ' +

          'WHERE (U.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) ' +
          '  AND (U.CODCENTRORESPON = CR.CODCENTRORESPON(+)) ' +
          '  AND (U.UNIDNEGOC       = AP.UNIDNEGOC(+)) ' +
          '  AND (U.IDPLANOPREV     = PL.IDPLANOPREV(+)) ' +
          '  AND (U.IDPATRO         = PT.IDPESSOA(+)) ' +

          'ORDER BY  U.CODGRUPOORC, U.IDCONTAORCAMEN ';

   Result := GetDataPacket(sSQL);          
end;




function TCtrlRelatOrcamento.ListaImagem(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('select ' +
                           '   i.imagem ' +
                           'from ' +
                           '   imagens i, ' +
                           '   pessoa p ' +
                           'where ' +
                           '  (p.idimagem = i.idimagem) and ' +
                           '  (p.idpessoa = ' + IntToStr(iIdPessoa)+ ') ');

end;




function TCtrlRelatOrcamento.ListaSaldoGrupoOrcamen(iIdEmpresa, iExercicio,
  iPerIni, iPerFim: integer; dValorDiv: Double;
  sIdPlanPrev, sIdPatro, sCodCCUsto,sAtivProj: string;
  iIdGrupoOrcamen,iIdPlanoOrcamen, iIdCenario: integer): OleVariant;
var
  sSQL : string;
  Func : TFuncaoGeral;
begin
   try
      Func := TFuncaoGeral.Create;

      sSQL := 'SELECT ' +

              //David Ayrolla - Pendência 20632
              '   DISTINCT ' +

              '   TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS GRUPO, ' +

              //David Ayrolla - Pendência 20632
              //'   S.IDCONTAORCAMEN, ' +

              ' P.NOMEPERIODO, ' +
              '   SUM(NVL(ROUND(S.VLRORCADO,2),0))/'       + Func.OraNumero(dValorDiv) + ' AS SLDORCADO, ' +
              '   SUM(NVL(ROUND(S.VLRREALIZADO,2),0))/'    + Func.OraNumero(dValorDiv) + ' AS SLDREALIZADO, ' +
              '   SUM(NVL(ROUND(S.VLRCOMPROMETIDO,2),0))/' + Func.OraNumero(dValorDiv) + ' AS SLDCOMPROMETIDO, ' +
              '   SUM(NVL(ROUND(S.VLRRESERVADO,2),0))/'    + Func.OraNumero(dValorDiv) + ' AS SLDRESERVADO, ' +

              //David Ayrolla - Pendência 20632
              //'   C.NOMECONTAORCAMEN, ' +
              //'   TRIM(CC.CODEXTERNO)|| '' - '' ||CC.NOME AS CENTCUSTO, ' +
              //'   PT.NOME AS PATRO, ' +
              //'   PL.NOME AS PLANO, ' +
              //'   AP.NOME AS ATIVPROJ, ' +

              '   S.PERIODO, ' +
              '   S.EXERCICIO ' +

              'FROM ' +
              '  SALDOORCADO S, ' +
              '  CONTASORCAMEN C, ' +
              '  GRUPOORCAMEN G, ' +
              '  PERIODOORCAMEN P ' +

              //David Ayrolla - Pendência 20632
              //'  UNIDNEGOCIO AP, ' +
              //'  PLANPREVCONTABIL PL, ' +
              //'  PESSOA PT, ' +
              //'  CENTCUST CC ' +

              'WHERE (S.EXERCICIO = ' + IntToStr(iExercicio) + ') ' +
              '  AND (S.IDPESSOA  = ' + IntToStr(iIdEmpresa) + ') ' +
              '  AND (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') ' +
              '  AND (NVL(C.FLGATIVA,''A'') = ''A'') ' +
              '  AND (C.IDCONTAORCAMEN  = S.IDCONTAORCAMEN) ' +
              '  AND (C.IDPLANOORCAMEN  = S.IDPLANOORCAMEN) ' +
              '  AND (C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN) ';

              if iIdPlanoOrcamen <> -1 then
                 sSQL := sSQL + '  AND (C.IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrcamen) + ')';

              if iIdGrupoOrcamen <> -1 then
                 sSQL := sSQL + '  AND (C.IDGRUPOORCAMEN  = ' + IntToStr(iIdGrupoOrcamen) + ')';

              if trim(sIdPlanPrev) <> '' then
                 sSQL := sSQL + ' AND (C.IDPLANOPREV = ' + sIdPlanPrev + ')';

              if trim(sIdPatro) <> '' then
                 sSQL := sSQL + ' AND (C.IDPATRO = ' + sIdPatro + ')';

              if trim(sCodCCUsto) <> '' then
                 sSQL := sSQL + ' AND (C.CODCENTROCUSTO = ' + QuotedStr(sCodCCUsto) + ')';

              if trim(sAtivProj) <> '' then
                 sSQL := sSQL + ' AND (C.UNIDNEGOC = ' + sAtivProj + ')';


              sSQL := sSQL +
              '  AND (S.EXERCICIO       = P.EXERCICIO) ' +
              '  AND (S.PERIODO         = P.PERIODO) ' +
              '  AND (S.IDPESSOA        = P.IDPESSOA) ' +

              //David Ayrolla - Pendência 20632
              //'  AND (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) ' +
              //'  AND (C.IDPLANOPREV     = PL.IDPLANOPREV(+)) ' +
              //'  AND (C.IDPATRO         = PT.IDPESSOA(+)) ' +
              //'  AND (C.UNIDNEGOC       = AP.UNIDNEGOC(+)) ' +

              'GROUP BY ' +
               //David Ayrolla - Pendência 20632
               //'  S.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, ' +
               '  G.CODGRUPOORC, S.PERIODO, S.EXERCICIO, P.NOMEPERIODO, G.NOMEGRUPOORCAMEN ' ;

              //David Ayrolla - Pendência 20632
              //'  CC.CODEXTERNO,CC.NOME,PT.NOME,PL.NOME,AP.NOME ';

              if iIdCenario <> -1 then
              begin
                 sSQL := sSQL +
                 'UNION ' +

                 'SELECT ' +
                 '   TRIM(G.CODGRUPOORC) || '' - '' || G.NOMEGRUPOORCAMEN AS GRUPO, ' +

                 //David Ayrolla - Pendência 20632
                 //'   S.IDCONTAORCAMEN, ' +

                 '   P.NOMEPERIODO, ' +
                 '   SUM(NVL(ROUND(S.VLRORCCENARIO,2),0))/' + Func.OraNumero(dValorDiv) + ' AS SLDORCADO, ' +
                 '   0 AS SLDREALIZADO, ' +
                 '   0 AS SLDCOMPROMETIDO, ' +
                 '   0 AS SLDRESERVADO, ' +

                 //David Ayrolla - Pendência 20632
                 //'   C.NOMECONTAORCAMEN, ' +
                 //'   TRIM(CC.CODEXTERNO)|| '' - '' ||CC.NOME AS CENTCUSTO, ' +
                 //'   PT.NOME AS PATRO, ' +
                 //'   PL.NOME AS PLANO, ' +
                 //'   AP.NOME AS ATIVPROJ, ' +

                 '   S.PERIODO, ' +
                 '   S.EXERCICIO ' +
                 'FROM ' +
                 '  VALORESCENARIO S, ' +
                 '  CONTASORCAMEN C, ' +
                 '  GRUPOORCAMEN G, ' +
                 '  PERIODOORCAMEN P ' +

                 //David Ayrolla - Pendência 20632
                 //'  UNIDNEGOCIO AP, ' +
                 //'  PLANPREVCONTABIL PL, ' +
                 //'  PESSOA PT, ' +
                 //'  CENTCUST CC ' +

                 'WHERE (S.EXERCICIO = ' + IntToStr(iExercicio) + ') ' +
                 '  AND (S.IDPESSOA  = ' + IntToStr(iIdEmpresa) + ') ' +
                 '  AND (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') ' +
                 '  AND (S.IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                 '  AND (NVL(C.FLGATIVA,''A'') = ''A'') ' +
                 '  AND (C.IDCONTAORCAMEN  = S.IDCONTAORCAMEN) ' +
                 '  AND (C.IDPLANOORCAMEN  = S.IDPLANOORCAMEN) ' +
                 '  AND (C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN) ';

                 if iIdPlanoOrcamen <> -1 then
                    sSQL := sSQL + '  AND (C.IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrcamen) + ')';

                 if iIdGrupoOrcamen <> -1 then
                    sSQL := sSQL + '  AND (C.IDGRUPOORCAMEN  = ' + IntToStr(iIdGrupoOrcamen) + ')';

                 if trim(sIdPlanPrev) <> '' then
                    sSQL := sSQL + ' AND (C.IDPLANOPREV = ' + sIdPlanPrev + ')';

                 if trim(sIdPatro) <> '' then
                    sSQL := sSQL + ' AND (C.IDPATRO = ' + sIdPatro + ')';

                 if trim(sCodCCUsto) <> '' then
                    sSQL := sSQL + ' AND (C.CODCENTROCUSTO = ' + QuotedStr(sCodCCUsto) + ')';

                 if trim(sAtivProj) <> '' then
                    sSQL := sSQL + ' AND (C.UNIDNEGOC = ' + sAtivProj + ')';

                 sSQL := sSQL +
                 '  AND (S.EXERCICIO       = P.EXERCICIO) ' +
                 '  AND (S.PERIODO         = P.PERIODO) ' +
                 '  AND (S.IDPESSOA        = P.IDPESSOA) ' +

                 //David Ayrolla - Pendência 20632
                 //'  AND (C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) ' +
                 //'  AND (C.IDPLANOPREV     = PL.IDPLANOPREV(+)) ' +
                 //'  AND (C.IDPATRO         = PT.IDPESSOA(+)) ' +
                 //'  AND (C.UNIDNEGOC       = AP.UNIDNEGOC(+)) ' +

                 'GROUP BY ' +
                 //David Ayrolla - Pendência 20632
                 //'  S.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, ' +
                 '  G.CODGRUPOORC, S.PERIODO, S.EXERCICIO, P.NOMEPERIODO, G.NOMEGRUPOORCAMEN ' ;

                 //David Ayrolla - Pendência 20632
                 //'  CC.CODEXTERNO,CC.NOME,PT.NOME,PL.NOME,AP.NOME ';
              end;

              //David Ayrolla - Pendência 20632
              //sSQL := sSQL + 'ORDER BY GRUPO, PERIODO ';
              sSQL := sSQL + 'ORDER BY PERIODO, GRUPO ';


      Result := GetDataPacket(sSQL);

   finally
      FreeAndNil(Func);
   end;
end;

end.


