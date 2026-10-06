using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Tipos
{
    public class Header_Realatorio_Dados_do_Contrato
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
        public string DataCredito { get; set; }
        public string DataAssinatura { get; set; }
        public string ValorContratado { get; set; }
        public string PrazoMeses { get; set; }
        public string TaxaJuros{ get; set; }
        public string IndiceCorrecaoSaldo { get; set; }
        public string QuantidadeDeParcelas { get; set; }
        public int IdTipoContrato { get; set; }
        public string ValorSolicitado { get; set; }
        public string SaldoDevedorVencido { get; set; }
        public string DataCalculo { get; set; }
    }

    public class Header_Realatorio_Dados_da_Concessao
    {
        public string NomeDoCampo { get; set; }
        public string ValorDoCampo { get; set; }
    }

    public class Item_Relatorio
    {
        public string MesAnoReferencia { get; set; }
        public string Item { get; set; }
        public string DataVencimento { get; set; }
        public string DataPagamento { get; set; }
        public string Valor { get; set; }
        public string ValorEfetivo { get; set; }
        public string Amortizacao { get; set; }
        public string Juros { get; set; }
        public string FGQC { get; set; }
        public string Encargos { get; set; }
        public string ValorComEncargos { get; set; }
        public string SaldoDevedor { get; set; }
        public string AtualizacaoMonetariaSalvoDev { get; set; }
        public string FormaDeCobranca { get; set; }
        public string Observacao { get; set; }
        public int NumUltimaParcela { get; set; }
        public int NumParcela { get; set; }

       
        public string Parcela { get; set; }
        public string CorrecaoMonetaria { get; set; }
        public string JurosRemuneratorios { get; set; }
        public string JurosMora { get; set; }
        public string Multa { get; set; }
        public string IofComplementar { get; set; }      
        public string TotalEncargos { get; set; }
        public string ValorTotal { get; set; }
        public string SaldoDevedorVencido { get; set; }
        public string SaldoDevedorTotal { get; set; }
    }

    
}
