using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    public class GerenciadorInadimplencia
    {
        private IAcessoInadimplencia acesso = FabricaObjetos.instancia.obterAcessoInadimplencia();

        private ObjetosNegocio.ObjetoContrato contrato;

        public List<ItemContrato> obterParcelasEmAberto(long numeroContrato, DateTime dataInadimplencia)
        {
            List<ItemContrato> parcelasEmAberto = acesso.obterParcelasEmAberto(numeroContrato, dataInadimplencia);
            return parcelasEmAberto;
        }

        public Dictionary<string, double> calculaEncargosParcela(long numeroContrato, int numParcela, int parcRestantes, DateTime dataPrestacao, double valorNominalParcela, DateTime dataCalculo, string sistemaAmortizacao, bool Calculado)
        {
            if (contrato == null)
                contrato = new ObjetosNegocio.ObjetoContrato(numeroContrato);

            double jurosAA = (double)contrato.taxaJuros;
            double valorSolicitado = (double)contrato.valorContrato;
            DateTime dataCredito = (DateTime)contrato.dataCredito;

            Dictionary<string, double> encargos = new Dictionary<string, double>();
            double valor;

            valor = acesso.calculaCorrecaoMonetaria(dataPrestacao, valorNominalParcela, dataCalculo);
            encargos.Add("Correcao_Monetaria", valor);

            valor = acesso.calculaJurosRemuneratorios(dataPrestacao, valorNominalParcela, valor, jurosAA, dataCalculo);
            encargos.Add("Juros_Remuneratorios", valor);

            valor = acesso.calculaJurosMoratorios(dataPrestacao, valorNominalParcela, dataCalculo);
            encargos.Add("Juros_Moratorios", valor);

            valor = acesso.calculaMulta(dataPrestacao, valorNominalParcela);
            encargos.Add("Multa", valor);

            valor = acesso.calculaIOFComplementar(dataPrestacao, dataCredito, numParcela, parcRestantes, jurosAA, valorSolicitado, dataCalculo, sistemaAmortizacao, Calculado, numeroContrato);
            encargos.Add("IOF_Complementar", valor);

            valor = acesso.calculaFGQC(numeroContrato, numParcela);
            encargos.Add("FGQC", valor);

            return encargos;
        }

        public bool tratarParcelasEmAtraso(long numeroContrato, DateTime dataCalculo, int numParcela, string origemRecurso, int tipoProposta)
        {
            return acesso.tratarParcelasEmAtraso(numeroContrato, dataCalculo, numParcela, origemRecurso, tipoProposta);
        }

        public double buscaSaldoInadimplente(long numeroContrato, DateTime dataInadimplencia)
        {
            return acesso.buscaSaldoInadimplente(numeroContrato, dataInadimplencia);
        }

        //SIG 42330
        public List<Serasa> BuscarContratosInclusaoSerasa(int NumeroRemessa, string Usuario, DateTime DataEventoCobranca)
        {
            return acesso.BuscarContratosInclusaoSerasa(NumeroRemessa, Usuario, DataEventoCobranca);
        }        
        
        public void GravarDataGeracaoArquivoSerasa(decimal NumeroContrato, int NumeroRemessa, int IdEventoCobranca)
        {
            acesso.GravarDataGeracaoArquivoSerasa(NumeroContrato, NumeroRemessa, IdEventoCobranca);
        }       

        //SIG 42330
        public int ObterNumeroRemessaArquivo()
        {
            return acesso.ObterNumeroRemessaArquivo();
        }

        public List<long> BuscarContratosInadimplentes(int IdPessoa)
        {
            return acesso.BuscarContratosInadimplentes(IdPessoa);
        }

        public itemPrestacaoDTO BuscarResumoInadimplencia(long NumeroContrato, DateTime DataPrevista)
        {
            return acesso.BuscarResumoInadimplencia(NumeroContrato, DataPrevista);
        }

        public void DesfazerRemessaSerasa(int NumeroRemessa, double IdUsuarioLogado)
        {
            acesso.DesfazerRemessaSerasa(NumeroRemessa, IdUsuarioLogado);
        }         
        
        public void ExecutarRelatorioInadimplencia(long NumeroContrato, DateTime DataLimite)
        {
            acesso.ExecutarRelatorioInadimplencia(NumeroContrato, DataLimite);
        }

        public List<long> BuscarContratosAtivosEncerrados()
        {
           return  acesso.BuscarContratosAtivosEncerrados();
        }

        public void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa, DateTime dataEvento)
        {
            acesso.AtualizarDataArquivoEmLote(contratos, numeroRemessa, dataEvento);
        }       

    }
}
