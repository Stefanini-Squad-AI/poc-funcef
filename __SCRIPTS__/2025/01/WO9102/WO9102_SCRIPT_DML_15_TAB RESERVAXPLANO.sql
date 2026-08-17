 
UPDATE CM.RESERVAXPLANO SET  FLGPORTABILIDADE = 1 
 WHERE NOME LIKE '%special%'
   AND idtiporeserva not in (217,218)

update reservaxplano set FLGREGRESSIVA = 1 where IDTIPORESERVA in (208,209,210,211)