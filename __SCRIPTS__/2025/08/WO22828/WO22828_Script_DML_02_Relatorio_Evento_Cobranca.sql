select matricula,
       nome,
       "CPF",
       idcontratoemptmo,
       MODALIDADE,
       dataeventocob,
       dataeventocobfim,
       desceventocob,
       "Parcela",
       "ValorPrestação",
       "ValorFGQC",
       "SomaEncargos",
       nvl ("ValorPrestação",0)+ nvl("ValorFGQC",0) + nvl("SomaEncargos",0) as "Valor_Parcela",
       "DataPrevista",
        nvl ( "Dataefetiva", "DataQuit") as "DataEfetiva/Quitação",
         Observação,
        "numcrm",
       "ce",
       "nup",
       "ar",
       "SituaçãoAr",
       "procjud",
       "jurisdicao",
       "dtajuizamento",
       '#DataEventoInicio#' AS DataInicial,
       '#DataEventoFim#' AS DataFinal
  from (SELECT d.matricula,
               p.nome,
               p.numdocumento as "CPF",
               c.idcontratoemptmo,
               tc.tcedescricao AS MODALIDADE,
               he.dataeventocob,
               he.dataeventocobfim,
               te.desceventocob,
               he.obscob as Observação,
               (SELECT distinct hme.parcela
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo in (13,99)) AS "Parcela",
               (SELECT distinct hme.datavencto
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo in (13)) AS "DataVencto",
               (SELECT distinct hme.dataefetiva
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo in (13,99)) AS "Dataefetiva",
                         (SELECT distinct hme.dataquitabonoestorno
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.flgquitabonoestorno=1
                   and hme.iditememptmo in (13,99)) AS "DataQuit",
               (SELECT hme.vlrprevisto
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo = 13) AS "ValorPrestação",
               (SELECT hme.vlrprevisto
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo = 99) AS "ValorFGQC",
               '#DataEventoInicio#' AS DataInicial,
               '#DataEventoFim#' AS DataFinal,
               (SELECT distinct hme.dataprevista
                  FROM hmeprestacao hme
                  join eventocobxhistmovemptmo ev
                    on hme.idhistmovemptmo = ev.idhistmovemptmo
                 WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo in (13,99)) AS "DataPrevista",
                       he.numcrm as "numcrm",
               he.ce as "ce",
               he.nup as "nup",
               he.Ar as "ar",
               DECODE(he.sitar,
                      '0',
                      '0-Recebido',
                      '1',
                      '1- Mudou-se',
                      '2',
                      '2-Endereço insuficiente',
                      '3',
                      '3-Não existe o número',
                      '4',
                      '4-Desconhecido',
                      '5',
                      '5- Recusado',
                      '6',
                      '6- Não procurado',
                      '7',
                      '7- Ausente',
                      '8',
                      '8- Falecido',
                      'null',
                      '') AS "SituaçãoAr",
               he.procjud as "procjud",
               he.jurisdicao as "jurisdicao",
               he.dtajuizamento as "dtajuizamento",
               he.obscob as "Observação",
       (SELECT distinct sum(hme.vlrprevisto)
                  FROM hmeencargos hme
                   WHERE hme.idcontratoemptmo = hx.idcontratoemptmo
                   and hme.parcela = hx.parcela
                   and hme.iditememptmo in (42,43,44,46,121)) AS "SomaEncargos"
        FROM contratoemptmo c
          JOIN tipocontremptmo tc
            ON tc.idtipocontremptmo = c.idtipocontremptmo
          JOIN histeventocobemptmo he
            ON he.idcontratoemptmo = c.idcontratoemptmo
          JOIN tipoeventocobemptmo te
            ON te.idtipoeventocobemptmo = he.idtipoeventocobemptmo
          JOIN depentit d
            ON d.idtitular = c.idpessoa
           AND d.idpessoa = c.idbenef
          JOIN pessoa p
            ON p.idpessoa = c.idbenef
          JOIN hmeprestacao hx
            ON hx.idcontratoemptmo = c.idcontratoemptmo
          JOIN eventocobxhistmovemptmo ev
            ON hx.idhistmovemptmo = ev.idhistmovemptmo
          join pessoa ptr
            on ptr.idpessoa = c.idpatro
         WHERE  hx.iditememptmo in (13,99)
                  AND ev.idhisteventocobemptmo = he.idhisteventocobemptmo
           AND he.dataeventocob BETWEEN to_date('#DataEventoInicio#', 'DD/MM/YYYY') AND
               to_date('#DataEventoFim#', 'DD/MM/YYYY'))
 GROUP BY matricula,
          nome,
          "CPF",
          idcontratoemptmo,
          MODALIDADE,
          dataeventocob,
          dataeventocobfim,
          desceventocob,
          Observação,
          "Parcela",
          "Dataefetiva",
          "ValorPrestação",
          "ValorFGQC",
          "DataPrevista",
          "numcrm",
          "ce",
          "nup",
          "ar",
          "SituaçãoAr",
          "procjud",
          "jurisdicao",
          "dtajuizamento",
          "SomaEncargos",
          "DataQuit"
