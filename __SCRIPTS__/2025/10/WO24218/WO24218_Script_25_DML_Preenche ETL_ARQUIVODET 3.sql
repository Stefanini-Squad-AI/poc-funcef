DECLARE
  
  cursor crArq is
     select pa.IDPARAMETL, pa.IDPARAMETLARQ, pa.NOMEETLARQUIVO
       from PARAM_ETL_ARQUIVO pa
       join PARAMETLPLANUS    p  on p.IDPARAMETL = pa.IDPARAMETL
      where p.FUNCIONALIDADE = 'PREVIA'
        and p.ROTINA = 'PARAMETROS'  
 	    and Lower(pa.NOMEETLARQUIVO) not in ('param_previa.par', '_dt_pagto.txt')
      order by pa.ordem;

  rArq            crArq%RowType;
  vIdParamETL     number;
  vIdParamArq     number; 

BEGIN

  open crArq;
  loop
    fetch crArq
       into rArq;
    exit when crArq%notfound;
 
    vIdParamArq := rArq.IDPARAMETLARQ; 
	vIdParamETL := rArq.IDPARAMETL;
	
	if rArq.NOMEETLARQUIVO = '_FAV_indirect_rubricas_1.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_FAV_CriaRubrica.txt'|| CHR(13) || CHR(10) ||		
		                                                                      '#!idexecucao!#_FAV_CriaRubricaIndiv.txt');		
	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_basepgto_1.txt' then 
	
  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_Base_Regressivo_Normal.txt'|| CHR(13) || CHR(10) ||
		                                                                      '#!idexecucao!#_Base_Regressivo_Resgate.txt');

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_basereinf_1.txt' then 
	
  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_Base_Pagamento_Reinf_RRA_Meses.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_regressivo.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_progressivo.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_rra.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_rra.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_jud.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_Tipos.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_Contrib.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_BRUTO.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_Grupos.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_PA.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IDADE.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_DEP.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_ETAPA_1.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_ETAPA_2.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_SUSP.txt');																			  
																			  

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_basereinf_FAV_1.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_Base_Pagamento_Reinf_RRA_Meses_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_regressivo_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_progressivo_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_rra_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_rra_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_jud_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IR_Tipos_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_Contrib_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_BRUTO_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_Grupos_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_PA_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_IDADE_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_DEP_FAV.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_FAV_ETAPA_1.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_FAV_ETAPA_2.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Base_Pagamento_Reinf_REND_SUSP_FAV.txt');

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_equacionamento_1.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_Equacionamento.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_SEM_Equacionamento_1.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_SEM_Equacionamento_2.txt');

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_imposto_jud_1.txt' then 
	
  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_InsereRubrica_IR_Judicial.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_InsereRubrica_IRProgressivo_Equa.txt');

	
	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_rateio_1.txt' then 
	
  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_Rub_COM_Rateio.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_Rub_SEM_Rateio.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Rub_Rateio_Default.txt');	

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_rubricas_1.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_CriaRubricaBeneficio.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaBenef_Atraso.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaTmpDesc.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaTmpDesc_Atraso.txt');


	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_rubricas_2.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_CriaRubricaBeneficio.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaBenef_Atraso.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaTmpDesc.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaTmpDesc_Atraso.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaIndiv.txt');

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_rubricas_3.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_CriaRubricaBeneficio.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaBenef_Atraso.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaTmpDesc.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaTmpDesc_Atraso.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaIndiv.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_5923.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_5953.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_6526.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_26238.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_25148.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_3123.txt'|| CHR(13) || CHR(10) ||	
                                                                              '#!idexecucao!#_CriaRubricaRegra_25546.txt');	

	ELSIF 	rArq.NOMEETLARQUIVO = '_indirect_rubricas_4.txt' then 

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_AgrupaRubricas_1.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaIrrfRRA.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaDepIdade.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaRegressivo.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaProgressivo.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaIRCompl.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaIRSimpl.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_CriaRubricaProgressivo_Jud.txt');


	ELSE  	/*rArq.NOMEETLARQUIVO = '_indirect_tipo_rub_1.txt' */

  	  insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
	    values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '', '#!idexecucao!#_RubricaJud_Tipo.txt'|| CHR(13) || CHR(10) ||
                                                                              '#!idexecucao!#_Rubrica_Equa_Tipo.txt');

    end if;


  end loop;
  
  close crArq;
  
  --commit;
  
end;	