
INSERT INTO AUTORIZA (IDESPACESSO, IDOPERFUNC, IDPESSOA)
SELECT AU.IDESPACESSO, O.IDOPERFUNC, 1
  FROM OPERFUNC O,
       (SELECT distinct A.IDESPACESSO
          FROM AUTORIZA A
         WHERE EXISTS (SELECT 1
                 FROM OPERFUNC O
                WHERE O.IDOPERACAO = 1 
                  AND O.IDOPERFUNC = A.IDOPERFUNC
                  AND EXISTS (SELECT 1 
                                FROM FUNCAO F
                               WHERE UPPER(F.NOMEFUNCAO) = UPPER('RUBRICAS SALARIAIS')
                                 AND F.IDMODULO = 452
                                 AND F.IDFUNCAO = O.IDFUNCAO
                             )
              )       
       ) AU 
 WHERE O.IDOPERACAO = 1 
   AND EXISTS (select 1 
                 from funcao F
                where idmodulo = 452
                  and f.idfuncao = o.idfuncao
                  and f.nomefuncao  in (
    SELECT NOME FROM (
     SELECT 1 as menu, 0 as op,'Dados Pessoais'     as nome, 'DadosPessoais' as nomeobj, 1 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Documentos'         as nome, 'Documentos'    as nomeobj, 2 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Enderecos'          as nome, 'Enderecos'     as nomeobj, 3 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Telefones'          as nome, 'Telefones'     as nomeobj, 4 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Contatos'           as nome, 'Contatos'      as nomeobj, 5 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Contas Bancárias'   as nome, 'ContasBancrias'as nomeobj, 6 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Dependentes'        as nome, 'Dependentes'   as nomeobj, 7 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Ação Judicial'      as nome, 'AoJudicial'    as nomeobj, 8 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Outras Informações' as nome, 'OutrasInformaes1' as nomeobj, 9 AS ORDEM from dual  union
     SELECT 2 as menu, 0 as op, 'Dados Basicos'      as nome, 'DadosBasicos'             as nomeobj, 1 AS ORDEM from dual  union
     SELECT 2 as menu, 0 as op, 'Evolucao Funcional' as nome, 'EvolucaoFuncional'        as nomeobj, 2 AS ORDEM from dual  union
     SELECT 2 as menu, 0 as op, 'Historico Funcional' as nome, 'HistoricoFuncional' as nomeobj, 3 AS ORDEM from dual  union
     SELECT 2 as menu, 1 as op, 'Rubricas Salariais' as nome, 'RubricasSalariais' as nomeobj, 4 AS ORDEM from dual  union	 
     SELECT 2 as menu, 0 as op, 'Dados Para Enquadramento' as nome, 'Dadosparaenquadramento1' as nomeobj, 5 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Eventos'            as nome, 'Eventos'        as nomeobj, 1 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Protocolos'         as nome, 'Protocolos'     as nomeobj, 2 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Processos Rad'      as nome, 'ProcessosRad'   as nomeobj, 3 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'RUB'                as nome, 'RUB'            as nomeobj, 4 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Contribuições'      as nome, 'Contribuicoes'  as nomeobj, 5 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Benefícios'         as nome, 'Beneficios'     as nomeobj, 6 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Pagamentos'         as nome, 'Pagamentos'     as nomeobj, 7 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Contra-Cheque'      as nome, 'ContraCheque'   as nomeobj, 8 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Beneficiários'      as nome, 'Beneficiarios'  as nomeobj, 9 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Enquadramento'      as nome, 'Enquadramento'  as nomeobj, 10 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Emprestimo'         as nome, 'Emprestimo'     as nomeobj, 11 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Planos'             as nome, 'Planos2'        as nomeobj, 12 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Portabilidade'      as nome, 'Portabilidade1' as nomeobj, 13 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Vida na Fundação'   as nome, 'VidaNaFundao1'  as nomeobj, 14 AS ORDEM from dual) 
    ) )
   AND NOT EXISTS (select 1
                     from AUTORIZA X
                    WHERE AU.IDESPACESSO = X.IDESPACESSO  
                      AND O.IDOPERFUNC   = X.IDOPERFUNC )
  ;  