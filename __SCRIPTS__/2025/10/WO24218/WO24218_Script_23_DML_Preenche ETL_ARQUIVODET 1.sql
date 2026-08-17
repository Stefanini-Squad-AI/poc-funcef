DECLARE
  vIdParamETL     number;
  vIdParamArq     number; 
BEGIN

    BEGIN
      SELECT IDPARAMETLARQ, IDPARAMETL into vIdParamArq, vIdParamETL FROM PARAM_ETL_ARQUIVO 
       where lower(NOMEETLARQUIVO) = 'param_previa.par';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            vIdParamArq := 0;
    END;
	

    IF (vIdParamArq > 0) THEN
	

		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 1, '[FB_PREVIA.WF:wf_1100000000_APAGAPREVIA_ff]', 
			'$ParamOwnerCM      =CM'|| CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'|| CHR(13) || CHR(10) ||
			''|| CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'|| CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'|| CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'|| CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'|| CHR(13) || CHR(10) ||
			''|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			'$$etapa   =1'|| CHR(13) || CHR(10) ||
			''|| CHR(13) || CHR(10) ||
			'$ParamTablePrevia  =PREVIA'|| CHR(13) || CHR(10) ||
			''|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idprevia       =#!idexecucao!#_ApagaPreviaFB_idprevia.txt'|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgto     =#!idexecucao!#_ApagaPreviaFB_idbasepgto.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgtoreinf=#!idexecucao!#_ApagaPreviaFB_idbasepgtoreinf.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgtoapoio=#!idexecucao!#_ApagaPreviaFB_idbasepgtoapoio.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idobs          =#!idexecucao!#_ApagaPreviaFB_idobs.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idlogs         =#!idexecucao!#_ApagaPreviaFB_idlogs.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idhstbitrib_idtitular    =#!idexecucao!#_ApagaPreviaFB_idhstbitrib_idtitular.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idhstcontribprev         =#!idexecucao!#_ApagaPreviaFB_idhstcontribprev.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idhstprazoacumulacaofolha=#!idexecucao!#_ApagaPreviaFB_idhstprazoacumulacaofolha.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idarquivoderetornocaixa  =#!idexecucao!#_ApagaPreviaFB_idarquivoderetornocaixa.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idtmpdesc_emptmo         =#!idexecucao!#_ApagaPreviaFB_idtmpdesc_emptmo.txt '|| CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idtmpdesc_contrib        =#!idexecucao!#_ApagaPreviaFB_idtmpdesc_contrib.txt ');



		 insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 2, '[FB_PREVIA.WF:wf_1110000000_APAGAPREVIA_load_Geral]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$idLote_lista=#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgto     =#!idexecucao!#_ApagaPreviaFB_idbasepgto.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgtoreinf=#!idexecucao!#_ApagaPreviaFB_idbasepgtoreinf.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgtoapoio=#!idexecucao!#_ApagaPreviaFB_idbasepgtoapoio.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idobs          =#!idexecucao!#_ApagaPreviaFB_idobs.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idlogs         =#!idexecucao!#_ApagaPreviaFB_idlogs.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idhstbitrib_idtitular    =#!idexecucao!#_ApagaPreviaFB_idhstbitrib_idtitular.txt'||CHR(13) || CHR(10) || 
			'$Param_ApagaPrevia_idhstcontribprev         =#!idexecucao!#_ApagaPreviaFB_idhstcontribprev.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idhstprazoacumulacaofolha=#!idexecucao!#_ApagaPreviaFB_idhstprazoacumulacaofolha.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idarquivoderetornocaixa  =#!idexecucao!#_ApagaPreviaFB_idarquivoderetornocaixa.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idtmpdesc_emptmo         =#!idexecucao!#_ApagaPreviaFB_idtmpdesc_emptmo.txt '||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idtmpdesc_contrib        =#!idexecucao!#_ApagaPreviaFB_idtmpdesc_contrib.txt');



		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 3, '[FB_PREVIA.WF:wf_1130000000_APAGAPREVIA_load_Previa]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idprevia=#!idexecucao!#_ApagaPreviaFB_idprevia.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$ParamTablePrevia  =PREVIA');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
			  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 4, '[FB_PREVIA.WF:wf_1120000000_APAGAPREVIA_load_REINF]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_ApagaPrevia_idbasepgtoreinf=#!idexecucao!#_ApagaPreviaFB_idbasepgtoreinf.txt ');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 5, '[FB_PREVIA.WF:wf_1111000000_ARQUIVOS_1_ff]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||			
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			'$$etapa   =2'|| CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Beneficio=#!idexecucao!#_Lista_Beneficio.txt '||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Previa=#!idexecucao!#_Lista_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa      =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa          =#!idexecucao!#_Lista_Pessoa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_flgdestbenef=#!idexecucao!#_Recebedor_flgdestbenef.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Placontaliq =#!idexecucao!#_Recebedor_Placontaliq.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_ProcJud                      =#!idexecucao!#_ProcJud.txt'||CHR(13) || CHR(10) ||
			'$Param_ProcJud_Acao_Ganha_Bitrib    =#!idexecucao!#_ProcJud_Acao_Ganha_Bitrib.txt'||CHR(13) || CHR(10) ||
			'$Param_ProcJud_Acao_Ganha_Maior_Zero=#!idexecucao!#_ProcJud_Acao_Ganha_Maior_Zero.txt'||CHR(13) || CHR(10) ||
			'$Param_Det_Proc_Judicial            =#!idexecucao!#_Det_Proc_Judicial.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Acao_Judicial          =#!idexecucao!#_Lista_Acao_Judicial.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Saldo_Bitributacao=#!idexecucao!#_Saldo_Bitributacao.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 6, '[FB_PREVIA.WF:wf_1200000000_ARQUIVOS_2_ff]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_IrrfRRA     =#!idexecucao!#_RRA_Irrf.txt'||CHR(13) || CHR(10) ||
			'$Param_PartPrevPlan=#!idexecucao!#_PartPrevPlan.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 7, '[FB_PREVIA.WF:wf_1111200000_PROCESSA_Beneficio]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			'$$etapa   =3'|| CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$PP_IDMOTIVOFOLHABEN=3007'||CHR(13) || CHR(10) ||
			'$$PP_IDMOTIVOQUITACAO=3026'||CHR(13) || CHR(10) ||
			'$$PF_FLGABRERUBACJUD =1'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto          =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Beneficio   =#!idexecucao!#_Lista_Beneficio.txt '||CHR(13) || CHR(10) ||
			'$Param_Saldo_Bitributacao=#!idexecucao!#_Saldo_Bitributacao.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa  =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereBeneficio                =#!idexecucao!#_InsereBeneficio.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereBeneficio_etapa2         =#!idexecucao!#_InsereBeneficio_etapa2.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereBeneficioAtraso          =#!idexecucao!#_InsereBeneficio_Atraso.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereBeneficioCorrecao        =#!idexecucao!#_InsereBeneficio_Correcao.txt'||CHR(13) || CHR(10) ||
			'$Param_RegraNumerica_CorrecaoBeneficio=#!idexecucao!#_RegraNumerica_CorrecaoBeneficio.txt'||CHR(13) || CHR(10) ||
			'$Param_HST_Idade_Bitrib               =#!idexecucao!#_HST_Idade_Bitrib.txt'||CHR(13) || CHR(10) ||
			'$Param_HST_Bitrib                     =#!idexecucao!#_HST_Bitrib.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_CriaRubricaBeneficio    =#!idexecucao!#_CriaRubricaBeneficio.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubricaBenefAtraso  =#!idexecucao!#_CriaRubricaBenef_Atraso.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 8, '[FB_PREVIA.WF:wf_1111100000_CONTRIBUICAO_enviaContrib]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa          =#!idexecucao!#_Lista_Pessoa.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_HstContribPrev_TmpDesc=#!idexecucao!#_HstContribPrev_TmpDesc.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 9, '[FB_PREVIA.WF:wf_1111110000_PROCESSA_TmpDesc]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa    =#!idexecucao!#_Lista_Pessoa.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Beneficio =#!idexecucao!#_Lista_Beneficio.txt '||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa=#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto        =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Chave_TmpDesc=#!idexecucao!#_Chave_TmpDesc.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereTmpDesc        =#!idexecucao!#_InsereTmpDesc.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereTmpDescAtraso  =#!idexecucao!#_InsereTmpDesc_Atraso.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereTmpDescCorrecao=#!idexecucao!#_InsereTmpDesc_Correcao.txt'||CHR(13) || CHR(10) ||	
			'$Param_RegraNumerica_TmpDesc=#!idexecucao!#_RegraNumerica_TmpDesc.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_CriaRubricaTmpDesc        =#!idexecucao!#_CriaRubricaTmpDesc.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubricaTmpDescAtraso  =#!idexecucao!#_CriaRubricaTmpDesc_Atraso.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 10, '[FB_PREVIA.WF:wf_1111111000_PROCESSA_RubricaIndiv_Favorecido]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			'$$etapa   =4'|| CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rubricas           =#!idexecucao!#_indirect_rubricas_1.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa       =#!idexecucao!#_Lista_Pessoa.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Beneficio    =#!idexecucao!#_Lista_Beneficio.txt '||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa   =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto           =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_ClassificaBase=#!idexecucao!#_Base_ClassificaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa_Meses =#!idexecucao!#_Lista_Pessoa_Meses.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Placontaliq =#!idexecucao!#_Recebedor_Placontaliq.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_TMP    =#!idexecucao!#_InsereRubricaIndiv_TMP.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa_Favorecido   =#!idexecucao!#_Lista_Pessoa_Favorecido.txt'||CHR(13) || CHR(10) ||
            '$Param_Lista_Pessoa_Meses_Fav    =#!idexecucao!#_Lista_Pessoa_Meses_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Favorecido=#!idexecucao!#_Lista_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido      =#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Favorecido_Placontaliq =#!idexecucao!#_Favorecido_Placontaliq.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv=#!idexecucao!#_InsereRubricaIndiv.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica       =#!idexecucao!#_CriaRubricaIndiv.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id5923 =#!idexecucao!#_InsereRubricaIndiv_id5923.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id5953 =#!idexecucao!#_InsereRubricaIndiv_id5953.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id6526 =#!idexecucao!#_InsereRubricaIndiv_id6526.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id26238=#!idexecucao!#_InsereRubricaIndiv_id26238.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id25148=#!idexecucao!#_InsereRubricaIndiv_id25148.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id3123 =#!idexecucao!#_InsereRubricaIndiv_id3123.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id25546=#!idexecucao!#_InsereRubricaIndiv_id25546.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario =#!idexecucao!#_Recebedor_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_Favorecido_DadoBancario=#!idexecucao!#_Favorecido_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 11, '[FB_PREVIA.WF:wf_1111111100_REGRA_preparaRegraRubricaIndiv]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$id_execucao =#!id!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO=#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO   =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista=#!listalote!#'||CHR(13) || CHR(10) ||
			'$$etapa   =5'|| CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa      =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Rubricas              =#!idexecucao!#_indirect_rubricas_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_ValorBase        =#!idexecucao!#_Base_ValorBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_ClassificaBase   =#!idexecucao!#_Base_ClassificaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa_Meses    =#!idexecucao!#_Meses.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto              =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AtribuiValores     =#!idexecucao!#_AtribuiValores.txt'||CHR(13) || CHR(10) ||
			'$Param_executaRegraRubrica=#!idexecucao!#_ExecutaRegraRubrica.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id5923=#!idexecucao!#_InsereRubricaIndiv_id5923.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_5923         =#!idexecucao!#_InsereRegra_5923.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_5923           =#!idexecucao!#_CriaRubricaRegra_5923.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id5953=#!idexecucao!#_InsereRubricaIndiv_id5953.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_5953         =#!idexecucao!#_InsereRegra_5953.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_5953           =#!idexecucao!#_CriaRubricaRegra_5953.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id6526=#!idexecucao!#_InsereRubricaIndiv_id6526.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_6526         =#!idexecucao!#_InsereRegra_6526.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_6526           =#!idexecucao!#_CriaRubricaRegra_6526.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id26238=#!idexecucao!#_InsereRubricaIndiv_id26238.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_26238         =#!idexecucao!#_InsereRegra_26238.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_26238           =#!idexecucao!#_CriaRubricaRegra_26238.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id25148=#!idexecucao!#_InsereRubricaIndiv_id25148.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_25148         =#!idexecucao!#_InsereRegra_25148.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_25148           =#!idexecucao!#_CriaRubricaRegra_25148.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id3123=#!idexecucao!#_InsereRubricaIndiv_id3123.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_3123         =#!idexecucao!#_InsereRegra_3123.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_3123           =#!idexecucao!#_CriaRubricaRegra_3123.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaIndiv_id25546=#!idexecucao!#_InsereRubricaIndiv_id25546.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRegra_25546         =#!idexecucao!#_InsereRegra_25546.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRegra_25546           =#!idexecucao!#_CriaRubricaRegra_25546.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 12, '[FB_PREVIA.WF:wf_1111111110_REGRA_executaRegra_Planus]',
		    '$$etapa   =6'|| CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) || 
            '$$cmd_ExecutaRegra_Planus=#!cmdexecregra!#Executaregra.exe #!cmdexecregrauser!# #!cmdexecregrapsw!# #!id!# A $PMTargetFileDir\FB_PREVIA\_EW\ETAPA2\ EventWait_Segunda_Etapa.ew # # # #');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 13, '[FB_PREVIA.WF:wf_2100000000_REGRA_atribuiValor]',		  
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$etapa   =7'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rubricas=#!idexecucao!#_indirect_rubricas_3.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_1=#!idexecucao!#_AgrupaRubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_AtribuiValores  =#!idexecucao!#_AtribuiValores.txt');
			

		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 14, '[FB_PREVIA.WF:wf_2120000000_BASE_determinaBaseIRRF]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =8'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_1   =#!idexecucao!#_AgrupaRubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa       =#!idexecucao!#_Lista_Pessoa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa   =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_ClassificaBase=#!idexecucao!#_Base_ClassificaBase.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Base_DeterminaBase =#!idexecucao!#_Base_DeterminaBase.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 15, '[FB_PREVIA.WF:wf_2110000000_IRRF_RRA]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_1=#!idexecucao!#_AgrupaRubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_IrrfRRA         =#!idexecucao!#_RRA_Irrf.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa=#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto        =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereIrrfRRA     =#!idexecucao!#_InsereIRRF_RRA.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubricaIrrfRRA=#!idexecucao!#_CriaRubricaIrrfRRA.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt');
			  
			  
		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 16, '[FB_PREVIA.WF:wf_2121000000_IRRF_dep_idade]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$etapa   =8'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Previa =#!idexecucao!#_Lista_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa       =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_ClassificaBase    =#!idexecucao!#_Base_ClassificaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_DeterminaBase     =#!idexecucao!#_Base_DeterminaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto               =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaDepIdade  =#!idexecucao!#_InsereRubricaDepIdade.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Valor_Idade=#!idexecucao!#_Valor_Idade.txt'||CHR(13) || CHR(10) ||
			'$Param_Valor_Dep=#!idexecucao!#_Valor_Dep.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica=#!idexecucao!#_InsereRubricaDepIdade.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica  =#!idexecucao!#_CriaRubricaDepIdade.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 17, '[FB_PREVIA.WF:wf_2122000000_IRRF_Regressivo]', 
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Base_DeterminaBase 		=#!idexecucao!#_Base_DeterminaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_flgdestbenef 	=#!idexecucao!#_Recebedor_flgdestbenef.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa       	=#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa           	=#!idexecucao!#_Lista_Pessoa.txt'||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_1         =#!idexecucao!#_AgrupaRubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto               	=#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Prazo_Acumulacao        	=#!idexecucao!#_Prazo_Acumulacao.txt'||CHR(13) || CHR(10) ||
			'$Param_Valores_Regressivo      	=#!idexecucao!#_Valores_Regressivo.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_Regressivo_Resgate 	=#!idexecucao!#_Base_Regressivo_Resgate.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_Regressivo_Normal 	=#!idexecucao!#_Base_Regressivo_Normal.txt'||CHR(13) || CHR(10) ||
			'$Param_Atualiza_Acumulacao	 	=#!idexecucao!#_Atualiza_Acumulacao.txt'||CHR(13) || CHR(10) ||
			'$Param_Atualiza_PMP_FOLHA	 	=#!idexecucao!#_Atualiza_PMP_FOLHA.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rubricas_Regressivo		=#!idexecucao!#_indirect_basepgto_1.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubricaRegressivo  =#!idexecucao!#_InsereRubricaRegressivo.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica		 	=#!idexecucao!#_InsereRubricaRegressivo.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica  		 	=#!idexecucao!#_CriaRubricaRegressivo.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 18, '[FB_PREVIA.WF:wf_2123000000_IRRF_Progressivo]', 
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Base_DeterminaBase 		=#!idexecucao!#_Base_DeterminaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Total_Rub_Legal        	=#!idexecucao!#_Total_Rub_Legal.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'# Arquivos baseados nas rotinas VerificaAcoesEmLiminar e AcaoJudicialEmLiminar'||CHR(13) || CHR(10) ||
			'$Param_Acoes_Liminar        	=#!idexecucao!#_Acoes_Liminar.txt'||CHR(13) || CHR(10) ||
			'$Param_Acoes_Judicial_Liminar  	=#!idexecucao!#_Acoes_Judicial_Liminar.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Acoes_Deposito  	=#!idexecucao!#_Acoes_Deposito.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Obj_Acao_Judicial=#!idexecucao!#_Obj_Acao_Judicial.txt'||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_1 =#!idexecucao!#_AgrupaRubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_Det_Proc_Judicial=#!idexecucao!#_Det_Proc_Judicial.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto         =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Base_Soma_Fontes 		=#!idexecucao!#_Base_Soma_Fontes.txt'||CHR(13) || CHR(10) ||
			'$Param_Base_2Acoes		 		=#!idexecucao!#_Base_2Acoes.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_IR_Soma_Fontes_etapa1 			 =#!idexecucao!#_Base_IR_Fontes_etapa1.txt'||CHR(13) || CHR(10) ||
			'$Param_IR_Soma_Fontes_etapa2			 =#!idexecucao!#_Base_IR_Fontes_etapa2.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRSimplif_etapa1  	 =#!idexecucao!#_InsereRubrica_IRSimplif_etapa1.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRSimplif_etapa2  	 =#!idexecucao!#_InsereRubrica_IRSimplif_etapa2.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRProgressivo_etapa1=#!idexecucao!#_InsereRubrica_IRProgressivo_etapa1.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRProgressivo_etapa2=#!idexecucao!#_InsereRubrica_IRProgressivo_etapa2.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRCompl_etapa1  	 =#!idexecucao!#_InsereRubrica_IRCompl_etapa1.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRCompl_etapa2  	 =#!idexecucao!#_InsereRubrica_IRCompl_etapa2.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_IR_Soma_Fontes_etapa3 				=#!idexecucao!#_Base_IR_Fontes_etapa3.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRProgressivo_etapa3  	=#!idexecucao!#_InsereRubrica_IRProgressivo_etapa3.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRSimplif_etapa3  		=#!idexecucao!#_InsereRubrica_IRSimplif_etapa3.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRCompl_etapa3  		=#!idexecucao!#_InsereRubrica_IRCompl_etapa3.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Soma_Fontes_Equa						=#!idexecucao!#_Base_Soma_Fontes_Equa.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRProgressivo_Equa		=#!idexecucao!#_InsereRubrica_IRProgressivo_Equa.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRCompl_Equa			=#!idexecucao!#_InsereRubrica_IRCompl_Equa.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_IR_Soma_Fontes_Desconsiderar			=#!idexecucao!#_Base_IR_Fontes_Desconsiderar.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Previa			=#!idexecucao!#_Lista_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_RegraImposto						=#!idexecucao!#_RegraImposto.txt'||CHR(13) || CHR(10) ||
			'$Param_AtribuiValores     				=#!idexecucao!#_AtribuiValores.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IR_Judicial  		=#!idexecucao!#_InsereRubrica_IR_Judicial.txt'||CHR(13) || CHR(10) ||
			'$Param_RubricaJud_Tipo     				=#!idexecucao!#_RubricaJud_Tipo.txt'||CHR(13) || CHR(10) ||
			'$Param_RubricaEqua_Tipo    				=#!idexecucao!#_Rubrica_Equa_Tipo.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_BASE_IR_equacionamento=#!idexecucao!#_BASE_IR_equacionamento.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica_IR_Progressivo  			=#!idexecucao!#_CriaRubricaProgressivo.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica_IR_Compl		  			=#!idexecucao!#_CriaRubricaIRCompl.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica_IR_Simpl		  			=#!idexecucao!#_CriaRubricaIRSimpl.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica_IR_Progressivo_EquaXXX  	=#!idexecucao!#_CriaRubricaProgressivo_Equa.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 19, '[FB_PREVIA.WF:wf_2123100000_REGRA_executaRegra_Planus]', 
		    '$$etapa   =10'|| CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) || 
            '$$cmd_ExecutaRegra_Planus=#!cmdexecregra!#Executaregra.exe #!cmdexecregrauser!# #!cmdexecregrapsw!# #!id!# A $PMTargetFileDir\FB_PREVIA\_EW\ETAPA3\ EventWait_Terceira_Etapa.ew # # # #');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 20, '[FB_PREVIA.WF:wf_3100000000_REGRA_atribuiValor_IRRF_Judicial]', 
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =11'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa                  =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario            =#!idexecucao!#_Recebedor_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto                          =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			'$Param_RubricaJud_Tipo     				 =#!idexecucao!#_indirect_tipo_rub_1.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IRProgressivo_etapa3=#!idexecucao!#_InsereRubrica_IRProgressivo_etapa3.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica_IR_JudicialXXX=#!idexecucao!#_InsereRubrica_IR_Judicial.txt'||CHR(13) || CHR(10) ||
			'$Param_Rubricas     =#!idexecucao!#_indirect_imposto_jud_1.txt'||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica=#!idexecucao!#_InsereRubrica_IR_Judicial_Tratado.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica	=#!idexecucao!#_CriaRubricaProgressivo_Jud.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 21, '[FB_PREVIA.WF:wf_3110000000_MARGEM_verificaMargemDesconto]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =12'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rubricas=#!idexecucao!#_indirect_rubricas_4.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_2=#!idexecucao!#_AgrupaRubricas_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 22, '[FB_PREVIA.WF:wf_3111000000_EQUACIONAMENTO]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =13'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_2      =#!idexecucao!#_AgrupaRubricas_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa      =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_BASE_IR_equacionamento=#!idexecucao!#_BASE_IR_equacionamento.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Equacionamento=#!idexecucao!#_Equacionamento.txt'||CHR(13) || CHR(10) ||
			'$Param_SEM_Equacionamento1=#!idexecucao!#_SEM_Equacionamento_1.txt'||CHR(13) || CHR(10) ||
			'$Param_SEM_Equacionamento2=#!idexecucao!#_SEM_Equacionamento_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 23, '[FB_PREVIA.WF:wf_3111100000_RATEIO]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rubricas        =#!idexecucao!#_indirect_equacionamento_1.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa=#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rub_COM_Rateio=#!idexecucao!#_Rub_COM_Rateio.txt'||CHR(13) || CHR(10) ||
			'$Param_Rub_SEM_Rateio=#!idexecucao!#_Rub_SEM_Rateio.txt'||CHR(13) || CHR(10) ||
			'$Param_Rub_Default   =#!idexecucao!#_Rub_Rateio_Default.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 24, '[FB_PREVIA.WF:wf_3111110000_TRATA_rubricaTitular]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANO		  =#!anomescobranca!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista=#!listalote!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Rubricas        =#!idexecucao!#_indirect_rateio_1.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto        =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa=#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_LST_Planos    =#!idexecucao!#_LST_Planos.txt'||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_1=#!idexecucao!#_AgrupaRateio_1.txt'||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_2=#!idexecucao!#_AgrupaRateio_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 25, '[FB_PREVIA.WF:wf_3111112000_ATUALIZA]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_2=#!idexecucao!#_AgrupaRateio_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Chave_TmpDesc =#!idexecucao!#_Chave_TmpDesc.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_HST_Idade_Bitrib   =#!idexecucao!#_HST_Idade_Bitrib.txt'||CHR(13) || CHR(10) ||
			'$Param_HST_Bitrib         =#!idexecucao!#_HST_Bitrib.txt'||CHR(13) || CHR(10) ||
			'$Param_Atualiza_PMP_FOLHA =#!idexecucao!#_Atualiza_PMP_FOLHA.txt'||CHR(13) || CHR(10) ||
			'$Param_Atualiza_Acumulacao=#!idexecucao!#_Atualiza_Acumulacao.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 26, '[FB_PREVIA.WF:wf_3111111000_CONTABIL_FINANCEIRO_titular]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Placontaliq=#!idexecucao!#_Recebedor_Placontaliq.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa     =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_2=#!idexecucao!#_AgrupaRateio_2.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Contab_Financeiro_titular=#!idexecucao!#_Contab_Financeiro_titular.txt'||CHR(13) || CHR(10) ||
			'$Param_Contab_Financeiro_titular_Etapa2=#!idexecucao!#_Contab_Financeiro_titular_Etapa2.txt '); 

	
	insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 27, '[FB_PREVIA.WF:wf_3111111100_PREVIA_load_Titular]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =14'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Contab_Financeiro_titular_Etapa2=#!idexecucao!#_Contab_Financeiro_titular_Etapa2.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_RubricaJud_Tipo                 =#!idexecucao!#_indirect_tipo_rub_1.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$ParamTablePrevia=PREVIA'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_2=#!idexecucao!#_AgrupaRateio_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 28, '[FB_PREVIA.WF:wf_3111113000_BASEDEPAGAMENTO_ff]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$CONSIGNATARIO = 0'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
            '$$cmd_start_WF_BASEDEPAGAMENTO_REINF=pmcmd.exe startworkflow -sv #!cmdbasepagtoreinf!# -u carga -p carga -wait -f FB_PREVIA wf_3111113100_BASEDEPAGAMENTO_REINF_ff'||CHR(13) || CHR(10) || 			
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_2		 =#!idexecucao!#_AgrupaRateio_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa      =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_PartPrevPlan          =#!idexecucao!#_PartPrevPlan.txt'||CHR(13) || CHR(10) ||
			'$Param_BasesPgto             =#!idexecucao!#_indirect_basepgto_1.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento      =#!idexecucao!#_Base_Pagamento.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Apoio=#!idexecucao!#_Base_Pagamento_Apoio.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 29, '[FB_PREVIA.WF:wf_3111113100_BASEDEPAGAMENTO_REINF_ff]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$DATAPAGTO=#!datapgto!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#SRC'||CHR(13) || CHR(10) ||
			'$Param_AgrupaRateio_2=#!idexecucao!#_AgrupaRateio_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Acao_Judicial          =#!idexecucao!#_Lista_Acao_Judicial.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#LKP'||CHR(13) || CHR(10) ||
			'$Param_ProcJud               =#!idexecucao!#_ProcJud.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Previa=#!idexecucao!#_Lista_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Previa		 =#!idexecucao!#_Recebedor_Previa.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento       =#!idexecucao!#_Base_Pagamento.txt'||CHR(13) || CHR(10) ||
			'$Param_Valor_Idade			 =#!idexecucao!#_Valor_Idade.txt'||CHR(13) || CHR(10) ||
			'$Param_Valor_Dep			 =#!idexecucao!#_Valor_Dep.txt'||CHR(13) || CHR(10) ||
			'$Param_LST_Planos            =#!idexecucao!#_LST_Planos.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#TGT'||CHR(13) || CHR(10) ||
			'$Param_Lista_Acao_Judicial_Tratado          =#!idexecucao!#_Lista_Acao_Judicial_Tratado.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_Contrib=#!idexecucao!#_Base_Pagamento_Reinf_Contrib.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_Tipos=#!idexecucao!#_Base_Pagamento_Reinf_IR_Tipos.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_Grupos=#!idexecucao!#_Base_Pagamento_Reinf_Grupos.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_RRA_Meses=#!idexecucao!#_Base_Pagamento_Reinf_RRA_Meses.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_rra=#!idexecucao!#_Base_Pagamento_Reinf_IR_rra.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_regressivo=#!idexecucao!#_Base_Pagamento_Reinf_IR_regressivo.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_progressivo=#!idexecucao!#_Base_Pagamento_Reinf_IR_progressivo.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_rra=#!idexecucao!#_Base_Pagamento_Reinf_REND_rra.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_jud=#!idexecucao!#_Base_Pagamento_Reinf_IR_jud.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_PA=#!idexecucao!#_Base_Pagamento_Reinf_PA.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_BRUTO=#!idexecucao!#_Base_Pagamento_Reinf_REND_BRUTO.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_TRIB=#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IDADE=#!idexecucao!#_Base_Pagamento_Reinf_IDADE.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_DEP=#!idexecucao!#_Base_Pagamento_Reinf_DEP.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_SUSP=#!idexecucao!#_Base_Pagamento_Reinf_REND_SUSP.txt'||CHR(13) || CHR(10) ||
            '$Param_BaseDePagamento_Reinf_REND_TRIB_ETAPA_1=#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_ETAPA_1.txt'||CHR(13) || CHR(10) ||
            '$Param_BaseDePagamento_Reinf_REND_TRIB_ETAPA_2=#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_ETAPA_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 30, '[FB_PREVIA.WF:wf_3111113110_BASEDEPAGAMENTO_load]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento      =#!idexecucao!#_Base_Pagamento.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Apoio=#!idexecucao!#_Base_Pagamento_Apoio.txt'||CHR(13) || CHR(10) ||
			'$Param_BasedePagamento_Reinf=#!idexecucao!#_indirect_basereinf_1.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 31, '[FB_PREVIA.WF:wf_3112000000_FAV_processa_Rubricas]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_AgrupaRubricas_2          =#!idexecucao!#_AgrupaRubricas_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Favorecido=#!idexecucao!#_Lista_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido      =#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Favorecido_DadoBancario   =#!idexecucao!#_Favorecido_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto                  =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Fav_InsereRubrica=#!idexecucao!#_FAV_InsereRubrica.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_InsereRubrica=#!idexecucao!#_FAV_InsereRubrica.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica  =#!idexecucao!#_FAV_CriaRubrica.txt');
			

		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 32, '[FB_PREVIA.WF:wf_3112100000_FAV_processa_RubricaIndiv]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_ABONO   =#!anomescobranca!#/13'||CHR(13) || CHR(10) ||
			'$$DATAPAGTO      =#!datapgto!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto               =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			'$Param_CriaRubrica            =#!idexecucao!#_FAV_CriaRubrica.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_Base_ClassificaBase=#!idexecucao!#_FAV_Base_ClassificaBase.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa_Meses_Fav =#!idexecucao!#_Lista_Pessoa_Meses_Favorecido.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_TMP=#!idexecucao!#_FAV_InsereRubricaIndiv_TMP.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Pessoa_Favorecido   =#!idexecucao!#_Lista_Pessoa_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Favorecido=#!idexecucao!#_Lista_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido      =#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Favorecido_Placontaliq =#!idexecucao!#_Favorecido_Placontaliq.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv=#!idexecucao!#_FAV_InsereRubricaIndiv.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_CriaRubrica       =#!idexecucao!#_FAV_CriaRubricaIndiv.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id5923 =#!idexecucao!#_FAV_InsereRubricaIndiv_id5923.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id5953 =#!idexecucao!#_FAV_InsereRubricaIndiv_id5953.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id6526 =#!idexecucao!#_FAV_InsereRubricaIndiv_id6526.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id26238=#!idexecucao!#_FAV_InsereRubricaIndiv_id26238.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id25148=#!idexecucao!#_FAV_InsereRubricaIndiv_id25148.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id3123 =#!idexecucao!#_FAV_InsereRubricaIndiv_id3123.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_InsereRubricaIndiv_id25546=#!idexecucao!#_FAV_InsereRubricaIndiv_id25546.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Favorecido_DadoBancario=#!idexecucao!#_Favorecido_DadoBancario.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 33, '[FB_PREVIA.WF:wf_3112110000_FAV_trataRubrica]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANO		  =#!anomescobranca!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista=#!listalote!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_Rubricas        =#!idexecucao!#_FAV_indirect_rubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_Dt_Pagto            =#!idexecucao!#_Dt_Pagto.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido=#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_LST_Planos      =#!idexecucao!#_FAV_LST_Planos.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_AgrupaRubricas_1=#!idexecucao!#_FAV_AgrupaRubricas_1.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_AgrupaRubricas_2=#!idexecucao!#_FAV_AgrupaRubricas_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 34, '[FB_PREVIA.WF:wf_3112111000_FAV_CONTABIL_FINANCEIRO]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Favorecido_Placontaliq =#!idexecucao!#_Favorecido_Placontaliq.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido=#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_AgrupaRubricas_2=#!idexecucao!#_FAV_AgrupaRubricas_2.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Contab_Financeiro_fav       =#!idexecucao!#_Contab_Financeiro_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_Contab_Financeiro_fav_Etapa2=#!idexecucao!#_Contab_Financeiro_FAV_Etapa2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 35, '[FB_PREVIA.WF:wf_3112111100_FAV_load_PREVIA]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Contab_Financeiro_fav_Etapa2=#!idexecucao!#_Contab_Financeiro_FAV_Etapa2.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_RubricaJud_Tipo             =#!idexecucao!#_indirect_tipo_rub_1.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$ParamTablePrevia=PREVIA'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_AgrupaRubricas_2=#!idexecucao!#_FAV_AgrupaRubricas_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 36, '[FB_PREVIA.WF:wf_3112112000_FAV_BASEDEPAGAMENTO_ff]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$CONSIGNATARIO = 1'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$cmd_start_WF_BASEDEPAGAMENTO_REINF_FAV=pmcmd.exe startworkflow -sv #!cmdbasepagtoreinf!# -u carga -p carga -wait -f FB_PREVIA wf_3112112100_FAV_BASEDEPAGAMENTO_REINF_ff '||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_FAV_AgrupaRubricas_2      =#!idexecucao!#_FAV_AgrupaRubricas_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido      =#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Favorecido_DadoBancario   =#!idexecucao!#_Favorecido_DadoBancario.txt'||CHR(13) || CHR(10) ||
			'$Param_PartPrevPlan              =#!idexecucao!#_PartPrevPlan.txt'||CHR(13) || CHR(10) ||
			'$Param_BasesPgto                 =#!idexecucao!#_indirect_basepgto_1.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_FAV      =#!idexecucao!#_Base_Pagamento_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Apoio_FAV=#!idexecucao!#_Base_Pagamento_Apoio_FAV.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 37, '[FB_PREVIA.WF:wf_3112112100_FAV_BASEDEPAGAMENTO_REINF_ff]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$DATAPAGTO=#!datapgto!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#SRC'||CHR(13) || CHR(10) ||
			'#$Param_AgrupaRateio_2=#!idexecucao!#_AgrupaRateio_2.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_AgrupaRubricas_2      =#!idexecucao!#_FAV_AgrupaRubricas_2.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Acao_Judicial          =#!idexecucao!#_Lista_Acao_Judicial.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#LKP'||CHR(13) || CHR(10) ||
			'$Param_ProcJud               =#!idexecucao!#_ProcJud.txt'||CHR(13) || CHR(10) ||
			'$Param_Lista_Recebedor_Favorecido=#!idexecucao!#_Lista_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_Recebedor_Favorecido      =#!idexecucao!#_Recebedor_Favorecido.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_FAV      =#!idexecucao!#_Base_Pagamento_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_Valor_Idade			 =#!idexecucao!#_Valor_Idade.txt'||CHR(13) || CHR(10) ||
			'$Param_Valor_Dep			 =#!idexecucao!#_Valor_Dep.txt'||CHR(13) || CHR(10) ||
			'$Param_FAV_LST_Planos      =#!idexecucao!#_FAV_LST_Planos.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#TGT'||CHR(13) || CHR(10) ||
			'$Param_Lista_Acao_Judicial_Tratado_FAV          =#!idexecucao!#_Lista_Acao_Judicial_Tratado_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_Contrib_FAV=#!idexecucao!#_Base_Pagamento_Reinf_Contrib_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_Tipos_FAV=#!idexecucao!#_Base_Pagamento_Reinf_IR_Tipos_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_Grupos_FAV=#!idexecucao!#_Base_Pagamento_Reinf_Grupos_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_RRA_Meses_FAV=#!idexecucao!#_Base_Pagamento_Reinf_RRA_Meses_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_rra_FAV=#!idexecucao!#_Base_Pagamento_Reinf_IR_rra_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_regressivo_FAV=#!idexecucao!#_Base_Pagamento_Reinf_IR_regressivo_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_progressivo_FAV=#!idexecucao!#_Base_Pagamento_Reinf_IR_progressivo_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_rra_FAV=#!idexecucao!#_Base_Pagamento_Reinf_REND_rra_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IR_jud_FAV=#!idexecucao!#_Base_Pagamento_Reinf_IR_jud_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_PA_FAV=#!idexecucao!#_Base_Pagamento_Reinf_PA_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_BRUTO_FAV=#!idexecucao!#_Base_Pagamento_Reinf_REND_BRUTO_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_TRIB_FAV=#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_IDADE_FAV=#!idexecucao!#_Base_Pagamento_Reinf_IDADE_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_DEP_FAV=#!idexecucao!#_Base_Pagamento_Reinf_DEP_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_SUSP_FAV=#!idexecucao!#_Base_Pagamento_Reinf_REND_SUSP_FAV.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_TRIB_FAV_ETAPA_1=#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_FAV_ETAPA_1.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Reinf_REND_TRIB_FAV_ETAPA_2=#!idexecucao!#_Base_Pagamento_Reinf_REND_TRIB_FAV_ETAPA_2.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 38, '[FB_PREVIA.WF:wf_3112112110_FAV_BASEDEPAGAMENTO_load]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#$Param_BaseDePagamento      =#!idexecucao!#_Base_Pagamento.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_FAV      =#!idexecucao!#_Base_Pagamento_FAV.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#$Param_BaseDePagamento_Apoio=#!idexecucao!#_Base_Pagamento_Apoio.txt'||CHR(13) || CHR(10) ||
			'$Param_BaseDePagamento_Apoio_FAV=#!idexecucao!#_Base_Pagamento_Apoio_FAV.txt'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'#$Param_BasedePagamento_Reinf=#!idexecucao!#_indirect_basereinf_1.txt'||CHR(13) || CHR(10) ||
			'$Param_BasedePagamento_Reinf_FAV=#!idexecucao!#_indirect_basereinf_FAV_1.txt');
			
			
		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 39, '[FB_PREVIA.WF:wf_3111111110_SP_FB_CALCULO_RUBRICA]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =15'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$id_previabenef =#!idpreviabenef!#'||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_SP_OutPut=#!idexecucao!#_SP_FB_CALCULO_RUBRICA_ETL_OutPut.txt');


		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 40, '[FB_PREVIA.WF:wf_3111111111_PERFIL_idperfilinvest]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			'$$etapa   =16'|| CHR(13) || CHR(10) ||
			'$$id_execucao    =#!id!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$ANOMES_COBRANCA=#!mescobranca!#'||CHR(13) || CHR(10) ||
			'$$idLote_lista   =#!listalote!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$Param_Previa_Perfil=#!idexecucao!#_Previa_Perfil.txt');
			
			
		insert into PARAM_ETL_ARQUIVODET (IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO, ORDEM, NOMESESSAO, BLOCO)
		  values (vIdParamArq, vIdParamETL, seqPARAM_ETL_ARQDET.nextval, 41, '[FB_PREVIA.WF:wf_3111111112_FIM_folha_previa]', 
			'$ParamOwnerCM      =CM'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Src=#!conexao!#'||CHR(13) || CHR(10) ||
			'$DBConnectionCM_Tgt=#!conexao!#'||CHR(13) || CHR(10) ||
			''||CHR(13) || CHR(10) ||
			'$$id_execucao =#!id!#');
	end if;
	--commit;
end;	