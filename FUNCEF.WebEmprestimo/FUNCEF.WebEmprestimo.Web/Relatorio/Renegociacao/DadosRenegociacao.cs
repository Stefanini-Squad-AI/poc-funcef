using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FUNCEF.Planus.WebEmprestimo.Web.Relatorio.Renegociacao
{
    public class DadosRenegociacao
    {
        #region dados do mutuário
        public string nome_mutuario { get; set; }
        public string cpf_mutuario { get; set; }
        public string matricula_mutuario { get; set; }
        public string patrocinadora_mutuario { get; set; }
        public string plano_mutuario { get; set; }
        public string situacao_mutuario { get; set; }
        #endregion

        #region dados do contrato
        public string nr_contrato { get; set; }
        public string modalidade_contrato { get; set; }
        public string juros_contrato { get; set; }
        public string icsd_contrato { get; set; }
        public string prazo_contrato { get; set; }
        public string dtcredito_contrato { get; set; }
        public string dataProjecao { get; set; }
        #endregion

        #region itens em aberto        
        public string mes_ano_ref_itens { get; set; }
        public string item_itens { get; set; }
        public string dtvencimento_itens { get; set; }
        public string parcela_itens { get; set; }
        public string vlrnominal_itens { get; set; }
        public string vlrcorrecao_monetaria_itens { get; set; }
        public string vlrmulta_itens { get; set; }
        public string vlrjuros_mora_itens { get; set; }
        public string vlrjuros_remun_itens { get; set; }
        public string vlriof_compl_itens { get; set; }
        public string vlrtot_encargos_itens { get; set; }
        public string vlrtotal_itens { get; set; }
        #endregion

        #region resumo
        public string tp_contrato_resumo { get; set; }
        public string qtde_prestacoes_resumo { get; set; }
        public string qtde_fgqc_resumo { get; set; }
        public string vlrtotal_prestacoes_resumo { get; set; }
        public string vlrtotal_fgqc_resumo { get; set; }
        public string soma_qte_resumo { get; set; }
        public string soma_vlrtotal_resumo { get; set; }
        public string valorSaldoDevedorVencido { get; set; }
        public string valorSaldoDevedoraVencer { get; set; }
        public string valorSaldoDevedorTotal { get; set; }
        public string valorItensConcessao { get; set; }

        
        #endregion
    }
}