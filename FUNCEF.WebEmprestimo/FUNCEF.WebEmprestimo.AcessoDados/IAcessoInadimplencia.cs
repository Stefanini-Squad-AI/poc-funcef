#region SIG 90605
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 10/10/2019
///
/// Descrição da Alteração:
/// Opção para buscara valor de FGQC ainda não pago
///
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    public interface IAcessoInadimplencia : IObjetoAcesso
    {
        List<ItemContrato> obterParcelasEmAberto(long numeroContrato, DateTime dataInadimplencia);

        double calculaCorrecaoMonetaria(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo);

        double calculaJurosRemuneratorios(DateTime dataPrestacao, double valorNominal, double valorCorrMonet, double jurosAA, DateTime dataCalculo);

        double calculaJurosMoratorios(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo);

        double calculaMulta(DateTime dataPrestacao, double valorNominal);

        double calculaIOFComplementar(DateTime dataPrestacao, DateTime dataCredito, int numParcela, int parcRestantes, double jurosAA, double valorSolicitado, DateTime dataCalculo, string sistemaAmortizacao, bool Calculado, long NumeroContrato);

        //double calculaFGQC(long numeroContrato, int numParcela); //SIG90605
        double calculaFGQC(long numeroContrato, int numParcela, bool SomentePagos = true); //SIG90605

        bool tratarParcelasEmAtraso(long numeroContrato, DateTime dataCalculo, int numParcela, string origemRecurso, int tipoProposta);

        double buscaSaldoInadimplente(long numeroContrato, DateTime dataInadimplencia);

        List<Serasa> BuscarContratosInclusaoSerasa(int NumeroRemessa, string Usuario, DateTime DataEventoCobranca);

        //SIG 42330
        void GravarDataGeracaoArquivoSerasa(decimal NumeroContrato, int NumeroRemessa, int IdEventoCobranca);

        //SIG 42330
        int ObterNumeroRemessaArquivo();

        List<long> BuscarContratosInadimplentes(int IdPessoa);

        itemPrestacaoDTO BuscarResumoInadimplencia(long NumeroContrato, DateTime DataPrevista);

        void DesfazerRemessaSerasa(int NumeroRemessa, double IdUsuarioLogado);

        //SIG 58207
        void ExecutarRelatorioInadimplencia(long NumeroContrato, DateTime DataLimite);

        List<long> BuscarContratosAtivosEncerrados();
        
        void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa, DateTime dataEvento);
    }
}
