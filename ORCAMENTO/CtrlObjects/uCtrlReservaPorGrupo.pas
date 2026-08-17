unit uCtrlReservaPorGrupo;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider;


Type
  TCtrlReservaPorGrupo = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;

  private



  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      function ListaPlanoTrab(iIdUsuario,iIdPessoa: integer): OleVariant;
      function ListaRatCriter(iIdPessoa: integer): OleVariant;
      function ListaContas(iIdPlanoOrc,iIdPessoaAcesso,iIdPessoa,iIdGrupoOrc,
                           iUnidNegoc,iIdPlanoPrev,iIdPatro: integer): OleVariant;
  end;




implementation


procedure TCtrlReservaPorGrupo.DoChangeDataBase;
begin
  inherited;
  //
end;




constructor TCtrlReservaPorGrupo.Create;
begin
  inherited;

end;




destructor TCtrlReservaPorGrupo.Destroy;
begin
  inherited;

end;

     



function TCtrlReservaPorGrupo.ListaPlanoTrab(iIdUsuario,iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT '                                                     +
                           '  DISTINCT O.DESCRICAO, '                                    +
                           '  O.IDPLANOTRABALHO, '                                       +
                           '  O.UNIDNEGOC, '                                             +
                           '  U.NOME AS NOMEUN, '                                        +
                           '  CR.NOME AS NOMECR '                                        +
                           'FROM '                                                       +
                           '  PLANOTRABALHOORC O, '                                      +
                           '  PESSOAXCRESP C, '                                          +
                           '  CENTRESPON CR, '                                           +
                           '  UNIDNEGOCIO U '                                            +
                           'WHERE '                                                      +
                           '  (O.CODCENTRORESPON = C.CODCENTRORESPON ) AND '             +
                           '  (O.IDPESSOA = C.IDPESSOA) AND '                            +
                           '  (C.IDPESSOAACESSO =  ' + IntToStr(iIdUsuario) + ' ) AND '  +
                           '  (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND '           +
                           '  (CR.CODCENTRORESPON = O.CODCENTRORESPON) AND '             +
                           '  (CR.IDPESSOA = O.IDPESSOA) AND '                           +
                           '  (U.UNIDNEGOC = O.UNIDNEGOC) AND '                          +
                           '  (U.IDPESSOA = O.IDPESSOA) '                                +
                           'ORDER BY '                                                   +
                           '  O.DESCRICAO ');
end;




function TCtrlReservaPorGrupo.ListaRatCriter(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           ' C.IDCRITERIORATORC, ' +
                           ' C.DESCRICAO, ' +
                           ' C.TIPORATEIO, ' +
                           ' C.IDDATAVIEW, ' +
                           ' C.PERNUMERO, ' +
                           ' C.PEREXERCICIO, ' +
                           ' P.PERDATINI, ' +
                           ' P.PERDATFIM ' +
                           'FROM ' +
                           '  CRITERIORATORC C, ' +
                           ' PERIODO P ' +
                           'WHERE ' +
                           ' (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                           ' (C.PERNUMERO = P.PERNUMERO(+)) AND ' +
                           ' (C.PEREXERCICIO = P.PEREXERCICIO(+)) AND ' +
                           ' (C.IDPESSOA = P.IDPESSOA(+)) ' +
                           'ORDER BY ' +
                           ' C.DESCRICAO ');

end;




function TCtrlReservaPorGrupo.ListaContas(iIdPlanoOrc,iIdPessoaAcesso,iIdPessoa,iIdGrupoOrc,
                                          iUnidNegoc,iIdPlanoPrev,iIdPatro: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' +
           '  C.IDCONTAORCAMEN, ' +
           '  C.CODCENTRORESPON, ' +
           '  R.NOME AS CRESP, ' +
           '  C.CODCENTROCUSTO, ' +
           '  CC.NOME AS NOME, ' +
           '  (0) AS VLRCOMPROMISSO, ' +
           '  TO_DATE(SYSDATE,''DD/MM/YYYY'') AS DATAREFERENCIA ' +
           'FROM ' +
           '  CONTASORCAMEN C, ' +
           '  CENTRESPON R, ' +
           '  CENTCUST CC ' +
           'WHERE ' +
           '  (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND ' +
           '  (C.IDPLANOORCAMEN =  ' + IntToStr(iIdPlanoOrc) + ') AND ' +
           '  (C.CODCENTRORESPON IN ' +
           '       (SELECT CODCENTRORESPON ' +
           '        FROM PESSOAXCRESP ' +
           '        WHERE IDPESSOAACESSO = ' + IntToStr(iIdPessoaAcesso) + ')) AND ' +
           '  (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND ' +
           '  (CC.ATIVO = ''S'') AND ' +
           '  (CC.IDEMPRESA = ' + IntToStr(iIdPessoa) + ' ) AND ' +
           '  (C.IDPESSOA = ' + IntToStr(iIdPessoa) + ' ) AND ' +
           '  (C.IDGRUPOORCAMEN =  ' + IntToStr(iIdGrupoOrc) + ' ) AND ';

           if iUnidNegoc = -1 then
              sSQL := sSQL + '(C.UNIDNEGOC IS NULL) AND '
           else
              sSQL := sSQL + '(C.UNIDNEGOC = ' + IntToStr(iUnidNegoc) + ') AND ';

           if iIdPlanoPrev = -1 then
              sSQL := sSQL + '(C.IDPLANOPREV IS NULL) AND '
           else
              sSQL := sSQL + '(C.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ') AND ';

           if iIdPatro = -1 then
              sSQL := sSQL + '(C.IDPATRO IS NULL)'
           else
              sSQL := sSQL + '(C.IDPATRO = ' + IntToStr(iIdPatro) + ')';


   Result := GetDataPacket(sSQL);
end;

end.
