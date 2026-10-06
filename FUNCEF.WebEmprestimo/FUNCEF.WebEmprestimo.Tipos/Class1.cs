using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class Header_Relatorio_Dados_do_Contrato
    {
        public string Nome { get; set; }
        public string Matricula { get; set; }
        public string CPF { get; set; }
        public string Patrocinadora { get; set; }
        public string Plano { get; set; }
        public string SitPatro { get; set; }
        public string SitFundacao { get; set; }

        public string NumeroContrato { get; set; }
        public string Modalidade { get; set; }
        public string DataDeCredito { get; set; }
        public string ValorContratado { get; set; }
        public string PrazoMeses { get; set; }
        public string TaxaJurosContratual { get; set; }
        public string IndiceAtualizacaoSaldoDevedor { get; set; }
        public string QuantidadeDeParcelas { get; set; }
        public int IdTipoContrato { get; set; }
    }
}
