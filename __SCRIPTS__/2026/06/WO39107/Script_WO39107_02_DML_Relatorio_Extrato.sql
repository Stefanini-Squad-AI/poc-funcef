select decode(h.idtiporeserva, 55, 'Participante', 79, 'Participante', 62, 'Patrocinadora', 
23, 'Participante', 33, 'Patrocinadora', 51, 'Participante', 59, 'Patrocinadora', 52, 'Participante', 53, 'Participante', 60, 'Patrocinadora', 61, 'Patrocinadora', 117, 'Entidade Aberta', 167, 'Patro Total', 170, 'Patrocinadora',
210,'Participante', 211,'Participante', 218,'Participante', 134,'Participante', 228, 'Participante', 229, 'Patrocinadora', 'Especial Portada') tipo_reserva,
       decode(h.idtiporeserva, 55, 'Reserva de Migração', 62, 'Reserva de Migração', 79, 'Reserva de Migração', 228, 'Reserva de Recomposição', 229, 'Reserva de Recomposição', c.nome) as nomecontrib,
       h.mesreferencia,
       h.idcontribuicao,
       case
         when h.dataalimentacao = to_date('01/01/2008', 'dd/mm/yyyy') then nvl(cota98.vlrreal,0)
         else    sum(decode(h.flgentrada, 1, (h.vlrcotas * h.valorindice), - (h.vlrcotas * h.valorindice)))
       end vlrreal_nominal,
       sum(decode(h.flgentrada, 1, h.vlrcotas, -h.vlrcotas)) as vlrcotas,
       cc.cotvalor valorindice_hoje,
       sum((decode(h.flgentrada, 1, h.vlrcotas, -h.vlrcotas)) *
           (select cotvalor
              from cotacaomoeda m1
             where m1.moecodigo = tp.indicereajuste
               and m1.cotdata =
                   (select max(cotdata)
                      from cotacaomoeda m2
                     where m2.moecodigo = tp.indicereajuste))) vlrcorrig,
       nvl(custeio.vlrreal, 0) custeio,
       nvl(risco.vlrreal, 0) risco,
      -- nvl(nominal.valorrecebido, 0) valorrecebido,  SIG 115144
       case --SIG 115144
       	when nvl(nominal.valorrecebido, 0)=0 then
       	 			sum(decode(h.flgentrada, 1, (h.vlrcotas * h.valorindice), - (h.vlrcotas * h.valorindice)))
           else nvl(nominal.valorrecebido, 0)
       end valorrecebido,
	   
	   case
         when (h.idtiporeserva = 134 or h.idtiporeserva =  211) then 0 -- SIG 128623 - Tiago Von - Inclusão		 
		 else 
		  percentual.perc_reserva * 100
       end as percentual_resgate,
       sum(decode(h.idtiporeserva, 134, 0, 211, 0, (decode(h.flgentrada, 1, h.vlrcotas, -h.vlrcotas))) * cc.cotvalor) * percentual.perc_reserva as valor_resgatavel,
       sum(decode(h.idtiporeserva, 134, 0, 211, 0, (decode(h.flgentrada, 1, h.vlrcotas, -h.vlrcotas))) * cc.cotvalor) * percentual.perc_reserva as valor_resgatave2,
       pp.idplanoprev,
       el.matricula, el.idpessoa,
       --pe.nome,
       replace(pe.nome, '*') nome,
       to_char(sysdate, 'DD/MM/YYYY') as data_atual,
       pf.datanasc as data_nasc,
       trunc(((sysdate + 1) - pf.datanasc) / 365.25, 0) as idade_atual,
       el.codvinculafunc,
       el.dataadmissao,
       el.datademissao,
       pp.dtinicioinsc,
       tp.flgtitularcolet,
       h.dataalimentacao,
       h.datarecebimento
  from histmovreserva h
  join reservaxplano tp on h.idplanoprev = tp.idplanoprev and h.idtiporeserva = tp.idtiporeserva
  left join contribuicao c --Inserção do Left para casos de Resgate. 02/03/2021 - RAfael
    on h.idcontribuicao = c.idcontribuicao
  join pessoa pe on h.idpessoa = pe.idpessoa
  join elegpatro el on h.idpessoa = el.idpessoa and h.idpessjur = el.idpessjur
  join pessoafisica pf on h.idpessoa = pf.idpessoa
  join partprevplan pp on pp.idplanoprev = h.idplanoprev and h.idpessoa = pp.idpessoa and h.idpessjur = pp.idpessjur
  join cotacaomoeda cc on cc.moecodigo = tp.indicereajuste
  /* inicio WO18086 Ferrari */
  join (
	select rxp.nome, rxp.idtiporeserva, rxp.idplanoprev, ppp.idpessjur,ppp.idpessoa,
       case  
         when not ((RXP.CODHIERARQUIA like '12%' AND RP.IDTIPORESERVA <> 167 AND RXP.ANALITICOSINTETI = 'A') or (RXP.IDTIPORESERVA = 229)) THEN
           1
         else
           case
          WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) <= 4017 THEN  
            0.05   
         WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) >  4017 AND  
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) <= 5843 THEN 
             0.10  
         WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) >  5843 AND  
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) <= 7670 THEN 
             0.15  
         WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) >  7670 THEN 
             0.20  
         END 
       end perc_reserva,
       case
          WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) <= 4017 THEN  
            5   
         WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) >  4017 AND  
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) <= 5843 THEN 
             10  
         WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) >  5843 AND  
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) <= 7670 THEN 
             15  
         WHEN    
           PCK_ALL_FUNCAO_DATA.FN_DifDiasCorrido(PPP.DTINICIOINSC, TO_DATE('#data#', 'DD/MM/YYYY')) >  7670 THEN 
             20  
         END percentual_resgate 
               
	  from partprevplan ppp
	  join reservapart rp 
	    on rp.idpessoa = ppp.idpessoa 
	   and rp.idplanoprev = ppp.idplanoprev
	   and rp.idpessjur = ppp.idpessjur
	   and rp.seqproposta = ppp.seqproposta
	  join reservaxplano rxp 
	    on rxp.idtiporeserva = rp.idtiporeserva
	   and rxp.idplanoprev = rp.idplanoprev
	 where ppp.idplanoprev = 66  
	 and ppp.idpessoa in (select idpessoa from pessoa where idpessoa in (
   							select idpessoa from elegpatro where matricula = '#matricula#')
   					     )		    
           and rxp.analiticosinteti = 'A'
           and rxp.flgcontrole = 0
           and rxp.flgcoletiva = 0
           and nvl(rxp.flgcontrole, 0) <> 1
           and (substr(rxp.codhierarquia, 1, 2) in ('11', '12', '14') or rxp.idtiporeserva in (228, 229))
   	) percentual 
   on percentual.idtiporeserva = h.idtiporeserva 
   and percentual.IDPESSOA    = h.idpessoa -- 1560438     
   AND percentual.IDPLANOPREV = h.idplanoprev  -- 74
   AND percentual.IDPESSJUR  = h.idpessjur  -- 91008
  /* Fim WO18086 Ferrari */
	
  left join (select idpessjur,
                    66 idplanoprev,
                    idpessoa,
                    idcontribuicao,
                    idtiporeserva,
                    mesreferencia,
                    sum(decode(h1.flgentrada, 1, vlrreal, -vlrreal)) vlrreal,
                    count(*)
               from histmovreserva h1
              where h1.idpessoa =
                    (select idpessoa
                       from elegpatro
                      where matricula = '#matricula#') --  '#matricula#')
                and idplanoprev in (19)
              group by idpessjur,
                       idpessoa,
                       idcontribuicao,
                       idtiporeserva,
                       mesreferencia) cota98
    on cota98.idpessjur = h.idpessjur
   and cota98.idpessoa = h.idpessoa
   and cota98.mesreferencia = h.mesreferencia
   and cota98.idcontribuicao = h.idcontribuicao
   and cota98.idplanoprev = h.idplanoprev
   and decode(cota98.idtiporeserva,23,51,33,59) = h.idtiporeserva
  left join (select hi.idpessoa,
                    hi.mesreferencia,
                    hi.dataalimentacao,
                    sum(decode(hi.flgentrada, 1, hi.vlrreal, -hi.vlrreal)) vlrreal,
                    hi.idplanoprev,
                    hi.idpessjur,
                    hi.idcontribuicao
               from histmovreserva hi
               join assocreservaalimreserva ar on ar.idtiporeserva = hi.idtiporeserva
               join paramcontabalimreserva p on p.idparamcontabalimreserva = ar.idparamcontabalimreserva
              where hi.idplanoprev = 66
                --and hi.mesreferencia = '2020/13'
                --and hi.idpessoa = 1200187
                and p.idparamcontabalimreserva in (15, 16)
              group by hi.idpessoa,
                       hi.mesreferencia,
                       hi.idplanoprev,
                       hi.idpessjur,
                       hi.idcontribuicao,
                       hi.dataalimentacao) custeio
    on custeio.idpessoa = h.idpessoa
   and custeio.mesreferencia = h.mesreferencia
   and custeio.dataalimentacao = h.dataalimentacao 
   and custeio.idplanoprev = h.idplanoprev
   and custeio.idpessjur = h.idpessjur
   and custeio.idcontribuicao = h.idcontribuicao
  left join (select hi.idpessoa,
                    hi.mesreferencia,
                    hi.dataalimentacao,
                    sum(decode(hi.flgentrada, 1, hi.vlrreal, -hi.vlrreal)) vlrreal,
                    hi.idplanoprev,
                    hi.idpessjur,
                    hi.idcontribuicao
               from histmovreserva hi
               join assocreservaalimreserva ar on ar.idtiporeserva = hi.idtiporeserva
               join paramcontabalimreserva p on p.idparamcontabalimreserva = ar.idparamcontabalimreserva
              where hi.idplanoprev = 66
                --and hi.mesreferencia = '2020/13'
                --and hi.idpessoa = 1200187
                and p.idparamcontabalimreserva = 6
              group by hi.idpessoa,
                       hi.mesreferencia,
                       hi.idplanoprev,
                       hi.idpessjur,
                       hi.idcontribuicao,
                       hi.dataalimentacao) risco
    on risco.idpessoa = h.idpessoa
   and risco.mesreferencia = h.mesreferencia
   and risco.dataalimentacao = h.dataalimentacao 
   and risco.idplanoprev = h.idplanoprev
   and risco.idpessjur = h.idpessjur
   and risco.idcontribuicao = h.idcontribuicao
  left join (select hc.idpessoa,
               hc.mesreferencia, 
               to_char(hc.datarecebimento,'yyyy/mm') datarecebimento,
               sum(decode(flgdevolucao, 0, hc.valorrecebido, -hc.valorrecebido)) valorrecebido,
               hc.idplanoprev,
               hc.idpessjur,
               hc.idcontribuicao
          from hstcontribprev hc
          join assoccontribalimreserva ac on ac.idcontribuicao = hc.idcontribuicao
          join paramcontabalimreserva p on p.idparamcontabalimreserva = ac.idparamcontabalimreserva
         where p.idparamcontabalimreserva in (3, 4)
           --and hc.idpessoa = 1200187
           --and hc.mesreferencia = '2020/13'
         group by hc.idpessoa,
                  hc.mesreferencia,
                  hc.idplanoprev,
                  hc.idpessjur,
                  hc.idcontribuicao,
                  to_char(hc.datarecebimento,'yyyy/mm')
                  ) nominal
    on nominal.idpessoa = h.idpessoa
   and nominal.mesreferencia = h.mesreferencia
   and nominal.datarecebimento = to_char(h.dataalimentacao,'yyyy/mm')   
   and nominal.idplanoprev = h.idplanoprev
   and nominal.idpessjur = h.idpessjur
   and nominal.idcontribuicao = h.idcontribuicao
 where tp.analiticosinteti = 'A'
   and tp.flgcontrole = 0
   and tp.flgcoletiva = 0
   and h.idplanoprev = 66
   and (substr(tp.codhierarquia, 1, 2) in ('11', '12', '14')-- SIG 129095 - inclusão do codigo 14
      or tp.idtiporeserva in (228, 229))
   and nvl(tp.flgcontrole, 0) <> 1
   and h.idpessoa not in (select idpessoa
                            from partprevplan
                           where idplanoprev = 2
                             and idsitplanoprev = 1)
   and h.seqproposta = 1
   --and el.matricula = '#matricula#'
   and el.idpessoa in (select idpessoa from pessoa where idpessoa in (
   							select idpessoa from elegpatro where matricula = '#matricula#')
   					   )   
   --and h.mesreferencia = '2020/13'
   and cc.cotdata = (select max(cotdata)
                       from cotacaomoeda cm
                      where cm.moecodigo = cc.moecodigo)
 group by pp.idplanoprev,
          el.matricula, el.idpessoa,h.idtiporeserva, -- SIG 128623 - Tiago Von - Inclusão do h.idtiporeserva
          pe.nome,
          pf.datanasc,
          el.codvinculafunc,
          el.dataadmissao,
          el.datademissao,
          pp.dtinicioinsc,
          h.mesreferencia,
          c.nome,
          h.valorindice,
          decode(h.idtiporeserva, 55, 'Reserva de Migração', 62, 'Reserva de Migração', 79, 'Reserva de Migração', 228, 'Reserva de Recomposição', c.nome),
          tp.flgtitularcolet,
          tp.indicereajuste,
          cc.cotvalor,
          decode(h.idtiporeserva, 55, 'Participante', 79, 'Participante', 62, 'Patrocinadora', 23, 'Participante', 33, 'Patrocinadora', 51, 'Participante', 59, 'Patrocinadora', 52, 'Participante', 53, 'Participante', 60, 'Patrocinadora', 61, 'Patrocinadora', 117, 'Entidade Aberta', 167, 'Patro Total', 170, 'Patrocinadora', 210,'Participante', 211,'Participante', 218,'Participante', 228, 'Participante', 229, 'Patrocinadora', 'Especial Portada'),
          h.dataalimentacao,
          cota98.vlrreal,
          h.idcontribuicao,
          h.datarecebimento,
          custeio.vlrreal,
          risco.vlrreal,
          percentual.percentual_resgate,
          percentual.perc_reserva,
          nvl(nominal.valorrecebido, 0) 
 order by 1, matricula, 3