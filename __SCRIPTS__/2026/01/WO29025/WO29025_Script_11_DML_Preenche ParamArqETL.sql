BEGIN
DML_PRODUCAO(137360, 0, 
'UPDATE PARAM_ETL_ARQUIVODET
SET BLOCO = ''$DBConnectionCM_Src=#!conexao!#

$$id_execucao    =#!id!#
$$ANOMES_COBRANCA=#!mescobranca!#
$$ANOMES_ABONO   =#!anomescobranca!#/13
$$DATAPAGTO      =#!datapgto!#
$$idLote_lista   =#!listalote!#

$Param_Base_DeterminaBase   =#!idexecucao!#_Base_DeterminaBase.txt
$Param_Total_Rub_Legal         =#!idexecucao!#_Total_Rub_Legal.txt

# Arquivos baseados nas rotinas VerificaAcoesEmLiminar e AcaoJudicialEmLiminar
$Param_Acoes_Liminar         =#!idexecucao!#_Acoes_Liminar.txt
$Param_Acoes_Judicial_Liminar   =#!idexecucao!#_Acoes_Judicial_Liminar.txt

$Param_Acoes_Deposito   =#!idexecucao!#_Acoes_Deposito.txt

$Param_Obj_Acao_Judicial=#!idexecucao!#_Obj_Acao_Judicial.txt
$Param_AgrupaRubricas_1 =#!idexecucao!#_AgrupaRubricas_1.txt
$Param_Det_Proc_Judicial=#!idexecucao!#_Det_Proc_Judicial.txt
$Param_Recebedor_Previa =#!idexecucao!#_Recebedor_Previa.txt
$Param_Dt_Pagto         =#!idexecucao!#_Dt_Pagto.txt

$Param_Base_Soma_Fontes   =#!idexecucao!#_Base_Soma_Fontes.txt
$Param_Base_2Acoes     =#!idexecucao!#_Base_2Acoes.txt

$Param_IR_Soma_Fontes_etapa1     =#!idexecucao!#_Base_IR_Fontes_etapa1.txt
$Param_IR_Soma_Fontes_etapa2    =#!idexecucao!#_Base_IR_Fontes_etapa2.txt
$Param_InsereRubrica_IRSimplif_etapa1    =#!idexecucao!#_InsereRubrica_IRSimplif_etapa1.txt
$Param_InsereRubrica_IRSimplif_etapa2    =#!idexecucao!#_InsereRubrica_IRSimplif_etapa2.txt
$Param_InsereRubrica_IRProgressivo_etapa1=#!idexecucao!#_InsereRubrica_IRProgressivo_etapa1.txt
$Param_InsereRubrica_IRProgressivo_etapa2=#!idexecucao!#_InsereRubrica_IRProgressivo_etapa2.txt
$Param_InsereRubrica_IRCompl_etapa1    =#!idexecucao!#_InsereRubrica_IRCompl_etapa1.txt
$Param_InsereRubrica_IRCompl_etapa2    =#!idexecucao!#_InsereRubrica_IRCompl_etapa2.txt

$Param_IR_Soma_Fontes_etapa3     =#!idexecucao!#_Base_IR_Fontes_etapa3.txt
$Param_InsereRubrica_IRProgressivo_etapa3   =#!idexecucao!#_InsereRubrica_IRProgressivo_etapa3.txt
$Param_InsereRubrica_IRSimplif_etapa3    =#!idexecucao!#_InsereRubrica_IRSimplif_etapa3.txt
$Param_InsereRubrica_IRCompl_etapa3    =#!idexecucao!#_InsereRubrica_IRCompl_etapa3.txt

$Param_Soma_Fontes_Equa      =#!idexecucao!#_Base_Soma_Fontes_Equa.txt
$Param_InsereRubrica_IRProgressivo_Equa  =#!idexecucao!#_InsereRubrica_IRProgressivo_Equa.txt
$Param_InsereRubrica_IRCompl_Equa   =#!idexecucao!#_InsereRubrica_IRCompl_Equa.txt

$Param_IR_Soma_Fontes_Desconsiderar   =#!idexecucao!#_Base_IR_Fontes_Desconsiderar.txt

$Param_Lista_Recebedor_Previa   =#!idexecucao!#_Lista_Recebedor_Previa.txt
$Param_RegraImposto      =#!idexecucao!#_RegraImposto.txt
$Param_AtribuiValores         =#!idexecucao!#_AtribuiValores.txt
$Param_InsereRubrica_IR_Judicial    =#!idexecucao!#_InsereRubrica_IR_Judicial.txt
$Param_RubricaJud_Tipo         =#!idexecucao!#_RubricaJud_Tipo.txt
$Param_RubricaEqua_Tipo        =#!idexecucao!#_Rubrica_Equa_Tipo.txt

$Param_BASE_IR_equacionamento=#!idexecucao!#_BASE_IR_equacionamento.txt

$Param_CriaRubrica_IR_Progressivo     =#!idexecucao!#_CriaRubricaProgressivo.txt
$Param_CriaRubrica_IR_Compl       =#!idexecucao!#_CriaRubricaIRCompl.txt
$Param_CriaRubrica_IR_Simpl       =#!idexecucao!#_CriaRubricaIRSimpl.txt

$Param_CriaRubrica_IR_Progressivo_EquaXXX   =#!idexecucao!#_CriaRubricaProgressivo_Equa.txt

$Param_Recebedor_DadoBancario=#!idexecucao!#_Recebedor_DadoBancario.txt

$Param_IR_REDUCAO=#!idexecucao!#_IR_REDUCAO.txt
$Param_IR_REDUCAO_JUD=#!idexecucao!#_IR_REDUCAO_JUD.txt
''
WHERE IDPARAMETL     = 9
 AND IDSEQSESSAO = 18'
, 'WO29025', 2, 1);
END; 