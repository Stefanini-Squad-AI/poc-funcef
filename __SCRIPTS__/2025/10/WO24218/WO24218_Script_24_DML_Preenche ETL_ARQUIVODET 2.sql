DECLARE
  vIdParamETL     number;
  vIdParamArq     number; 
BEGIN
 
    BEGIN
      SELECT IDPARAMETLARQ, IDPARAMETL into vIdParamArq, vIdParamETL FROM PARAM_ETL_ARQUIVO 
       where lower(NOMEETLARQUIVO) = '_dt_pagto.txt';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            vIdParamArq := 0;
    END;	

    IF (vIdParamArq > 0) THEN
	
	insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '#INDICE;DATA',
	    '0;#!dtpgto-d1!# 00:00:00'|| CHR(13) || CHR(10) ||
            '1;#!dtpgto-d2!# 00:00:00'|| CHR(13) || CHR(10) ||
            '2;#!dtpgto-d3!# 00:00:00');

	end if;
	--commit;
end;	