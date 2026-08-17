SELECT
        p.nome,
       d.matricula,
       p.numdocumento as "CPF",
       dc.numdocumento as "RG",
       pf.nomepai,
       pf.nomemae,
       DECODE(pf.estcivil,
              'S',
              'Solteiro(a)',
              'M',
              'Marital',
              'C',
              'Casado(a)',
              'V',
              'Viúvo(a)',
              'D',
              'Divorciado(a)',
              'P',
              'Separado(a)',
              'J',
              'Separado(a) Judicialmente',
              'E',
              'Desquitado(a)',
              'O',
              'Outros') AS "EstadoCivil",
          pi.nomenacionalidade,
       pb.nome as "Plano Origem",
       CASE
         WHEN c.idpessoa = c.idbenef THEN
          (SELECT sf.descricao
             FROM elegpatro el
             JOIN sitfunc sf
               ON (sf.idsitfunc = el.idsitfunc)
            WHERE el.idpessoa = c.idbenef
              AND el.idpessjur = c.idpatro)
         ELSE
          NULL
       END AS SIT_PATRO,
       CASE
         WHEN c.idpessoa = c.idbenef THEN
          (SELECT DISTINCT sp.descricao
             FROM partprevplan ppp
             JOIN sitpart sp
               ON sp.idsitpart = ppp.idsitpart
            WHERE ppp.idpessoa = c.idbenef
              AND ((ppp.idsitplanoprev = 25) OR
                  (ppp.idplanoprev =
                  (SELECT MAX(ppp2.idplanoprev)
                       FROM partprevplan ppp2
                      WHERE ppp2.flgdesativado = 0
                        AND ppp2.idpessoa = ppp.idpessoa) AND NOT EXISTS
                   (SELECT 1
                       FROM partprevplan ppp2
                      WHERE ppp2.idpessoa = ppp.idpessoa
                        AND ppp2.idsitplanoprev = 25)) OR
                  ((PPP.FLGDESATIVADO = 1) AND NOT EXISTS
                   (SELECT 1
                       FROM partprevplan ppp1
                      WHERE ppp1.idpessoa = ppp.idpessoa
                        AND ppp1.flgdesativado = 0) AND
                   ppp.idplanoprev =
                   (SELECT MAX(ppp1.idplanoprev)
                       FROM partprevplan ppp1
                      WHERE ppp1.idpessoa = ppp.idpessoa
                        AND NVL(ppp1.datacancelamento, TRIM(SYSDATE)) =
                            (SELECT NVL(MAX(ppp2.datacancelamento),
                                        TRIM(SYSDATE))
                               FROM partprevplan ppp2
                              WHERE ppp2.idpessoa = ppp1.idpessoa)
                        AND NOT EXISTS
                      (SELECT 1
                               FROM partprevplan ppp2
                              WHERE ppp2.idpessoa = ppp1.idpessoa
                                AND ppp2.idsitplanoprev = 25)))))
         ELSE
          'PENSIONISTA'
       END AS SIT_FUND,
       DECODE(NVL(C.FLGINTERNET, 0), 1, 'INTERNET', 'FUNCEF') AS ORIGEM,
       c.idcontratoemptmo,
      DECODE(c.flgsituacao,
       'A', 'Ativo', 
       'C', 'Cancelado',
       'E', 'Encerrado',
       'Q', 'Quitado',
       'R', 'Refinanciado',
       'S', 'Suspenso',
       'P', 'Pendente de Liberação',
       'K', 'Pendente de Quitação') AS "Situação do Contrato",
       tc.tcedescricao AS MODALIDADE,
       (SELECT MIN(h.hmedataprevista)
          FROM histmovemptmo h
         WHERE 1 = 1
           AND NVL(h.flgestornado, 0) = 0
           AND h.idcontratoemptmo = c.idcontratoemptmo
           AND h.iditememptmo = 6
           AND h.hmetipomov = 0
           AND h.hmeorigem = 0) AS "Data Concessão",
       (SELECT SUM(h.hmevlrprevisto)
          FROM histmovemptmo h
         WHERE 1 = 1
           AND NVL(h.flgestornado, 0) = 0
           AND h.idcontratoemptmo = c.idcontratoemptmo
           AND h.iditememptmo = 22
           AND h.hmetipomov = 0
           AND h.hmeorigem = 0) AS "Valor Solicitado",
  (SELECT MIN(h.hmevlrprevisto)
          FROM histmovemptmo h
         WHERE 1 = 1
           AND NVL(h.flgestornado, 0) = 0
           AND h.idcontratoemptmo = c.idcontratoemptmo
           AND h.iditememptmo = 6
           AND h.hmetipomov = 0
           AND h.hmeorigem = 0) AS "Valor Liquido",
         C.NUMPARCELAS AS "Prazo",
       cc.idcontratoemptmo as "Contrato Quitado" ,
       ci.uf,
       he.dataeventocob,
       he.dataeventocobfim,
       te.desceventocob,
       he.ce,
       he.nup,
       he.obscob as Observação,
       he.dtajuizamento as "data ajuizamento",
       he.jurisdicao as "Local/orgão jurisdicional",
       he.procjud as "Numero Processo Judicial",
       NVL(pck_emprestimo.fn_saldoinadimplente(c.idcontratoemptmo, TRUNC(SYSDATE)),0) AS SALDOINAD,
       (
             NVL(pck_emprestimo.fn_saldoinadimplente(c.idcontratoemptmo, TRUNC(SYSDATE)),0)+
             NVL(pck_emprestimo.fn_saldodevedor(c.idcontratoemptmo, TRUNC(SYSDATE)),0)
       ) AS SaldoTotal,
       (SELECT MAX(DATAVENCTO) FROM hmeprestacao WHERE idcontratoemptmo  =c.idcontratoemptmo) AS DataVencimento,
       
 '#DataEventoInicio#' AS DataInicial,
'#DataEventoFim#' AS DataFinal
FROM contratoemptmo c
  left JOIN tipocontremptmo tc
    ON tc.idtipocontremptmo = c.idtipocontremptmo
  left JOIN histeventocobemptmo he
    ON he.idcontratoemptmo = c.idcontratoemptmo
  left JOIN tipoeventocobemptmo te
    ON te.idtipoeventocobemptmo = he.idtipoeventocobemptmo
  left JOIN depentit d
    ON d.idtitular = c.idpessoa
   AND d.idpessoa = c.idbenef
  left JOIN pessoa p
    ON p.idpessoa = c.idbenef
left  JOIN docpessoa dc
    on dc.idpessoa = p.idpessoa
    and dc.iddocumento = 11
  left join pessoafisica pf
    on pf.idpessoa = p.idpessoa
  left  join planprevcontabil pb
    on pb.idplanoprev = c.idplanoorigem
    left join contratoemptmo cc
    on cc.idcontrquitacao = c.idcontratoemptmo
  LEFT JOIN Endpess ep
    ON ep.idendereco =
       NVL(NVL(p.idendcorresp, p.idendresidencial), p.idendcobranca)
  LEFT JOIN cidades ci
    ON ci.idcidades = ep.idcidades
     LEFT JOIN pais pi
    ON pi.idpais = ci.idpais
WHERE he.idtipoeventocobemptmo = 16
AND   he.dataeventocob BETWEEN to_date('#DataEventoInicio#','DD/MM/YYYY')  AND to_date('#DataEventoFim#','DD/MM/YYYY') 
AND ( 'SIM'='#QUIT#' AND C.FLGSITUACAO ='Q'   OR ('NAO' ='#QUIT#' and C.FLGSITUACAO <>'Q' ) OR ('NULO'='#QUIT#'))