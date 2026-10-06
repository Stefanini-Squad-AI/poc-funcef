using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    public interface IAcessoDesconto : IObjetoAcesso
    {
        List<int> itensParaDesconto(int tipoContrato);
        Dictionary<string, DateTime> buscarQuantidadeMenorMaiorDataAtraso(long numContrato, DateTime dataCalculo);
        double obterPercentualDesconto(int item, int tipoProposta, int qtdMesesAtraso);
        void registraDescontoConcedido(long numeroContrato, int tipoProposta, int qtdMesesAtraso, List<ItemDescontoContrato> itensDesconto, DateTime dataOperacao, int qtdDiasAtraso);
        string buscaDescricaoItem(int idItem);
        bool verificaCampanhaPendente(long numeroContrato, int tipoProposta);
        List<ParametrosCampanha> obterParametrosCampanha(DateTime? DataInicio, DateTime? DataFim);
        List<TipoProposta> listarTipoProposta();
        void incluirParametrosCampanha(ParametrosCampanha parametros);
        void atualizarParametrosCampanha(ParametrosCampanha parametros);

        //WO13621
        int ObterQtdDiasDeAtraso(double NumeroContrato, DateTime DataCalculo);
        double ObterPercentualDescontoDias(int Item, int TipoProposta, int QtdDiasDeAtraso);
    }
}
