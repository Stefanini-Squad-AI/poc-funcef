using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    public class GerenciadorDesconto
    {
        private IAcessoDesconto acesso = FabricaObjetos.instancia.obterAcessoDesconto();
        private long numeroContrato;
        private DateTime dataCalculo;
        private int tipoProposta;
        private int quantMesesAtraso;
        private double valorDesconto;
        private int qtdDiasDeAtraso;

        public List<ItemDescontoContrato> itensDesconto { get; private set; }

        public double calcularManter(long numContrato, int tipoContrato, DateTime dtCalculo, List<ItemContrato> itensCalculados, int origem, int tpProposta)
        {
            this.itensDesconto = new List<ItemDescontoContrato>();
            this.tipoProposta = tpProposta;
            this.quantMesesAtraso = 0;
            this.numeroContrato = numContrato;
            this.dataCalculo = dtCalculo;       
            double valorDesconto = 0;

            List<int> itens = acesso.itensParaDesconto(tipoContrato);

            //WO13621 - Alterando para período em dias
            //this.quantMesesAtraso = calcularMesesAtraso(numContrato, dtCalculo);
            this.qtdDiasDeAtraso = ObterQtdDiasDeAtraso(numContrato, dtCalculo);

            foreach (var idItem in itens)
            {
                ItemDescontoContrato itemDesconto = new ItemDescontoContrato();
                int idItemCalculado;
                switch (origem)
                {
                    case 3: //quitação
                        switch (idItem)
                        {
                            case 13:
                                idItemCalculado = 36;
                                break;
                            case 99:
                                idItemCalculado = 113;
                                break;
                            case 42:
                                idItemCalculado = 39;
                                break;
                            case 43:
                                idItemCalculado = 38;
                                break;
                            case 44:
                                idItemCalculado = 37;
                                break;
                            case 46:
                                idItemCalculado = 40;
                                break;
                            case 121:
                                idItemCalculado = 122;
                                break;
                            default:
                                idItemCalculado = 0;
                                break;
                        }
                        break;
                    case 4: //tratamento de parcelas
                        idItemCalculado = idItem;
                        break;
                    default:
                        idItemCalculado = 0;
                        break;
                }
                itemDesconto.valorNominal = (itensCalculados.Find(x => x.id == idItemCalculado) == null ? 0 : itensCalculados.Find(x => x.id == idItemCalculado).valor);
                //WO13621 - Alterando para período em dias com qtdDiasDeAtraso e ObterPercentualDescontoDias
                itemDesconto.percentualDesconto = acesso.ObterPercentualDescontoDias(idItem, tpProposta, qtdDiasDeAtraso);               

                itemDesconto.valorComDesconto = Math.Round(itemDesconto.valorNominal - itemDesconto.valorNominal * itemDesconto.percentualDesconto, 2);
                itemDesconto.idItem = idItem;
                itemDesconto.descItem = acesso.buscaDescricaoItem(idItem);
                itemDesconto.valorDesconto = Math.Round(itemDesconto.valorNominal * itemDesconto.percentualDesconto, 2);//WO13621
                valorDesconto += itemDesconto.valorDesconto;//WO13621

                this.itensDesconto.Add(itemDesconto);
            }
            return itensDesconto.Sum(x => x.valorDesconto);
        }

        public Dictionary<int,double> obterPercDescontoPorItem(long numContrato, int tipoContrato, DateTime dtCalculo, int tipoProposta)
        {
            Dictionary<int, double> itensPercDesconto = new Dictionary<int, double>();

            List<int> itens = acesso.itensParaDesconto(tipoContrato);
            int qtdMesesAtraso = calcularMesesAtraso(numContrato, dtCalculo);

            foreach (var idItem in itens)
            {
                double percentualDesconto = acesso.obterPercentualDesconto(idItem, tipoProposta, qtdMesesAtraso);
                itensPercDesconto.Add(idItem, percentualDesconto);
            }
            return itensPercDesconto;
        }

        public void gravar()
        {
            acesso.registraDescontoConcedido(this.numeroContrato, this.tipoProposta, this.quantMesesAtraso, this.itensDesconto, this.dataCalculo, this.qtdDiasDeAtraso);
        }

        public Dictionary<int, string> obterItensDaCampanha(int tipoContrato)
        {
            Dictionary<int, string> itensDaCampanha = new Dictionary<int, string>();

            List<int> itens = acesso.itensParaDesconto(tipoContrato);
            foreach (var idItem in itens)
            {
                itensDaCampanha.Add(idItem, acesso.buscaDescricaoItem(idItem));
            }
            return itensDaCampanha;
        }

        public bool verificaCampanhaPendente(long numeroContrato, int tipoProposta)
        {
            return acesso.verificaCampanhaPendente(numeroContrato, tipoProposta);            
        }

        private int calcularMesesAtraso(long numContrato, DateTime dtCalculo)
        {
            int qtdMesesAtraso;
            Dictionary<string, DateTime> datasAtraso = acesso.buscarQuantidadeMenorMaiorDataAtraso(numContrato, dtCalculo);

            if(datasAtraso.Count() > 0)
            {
                DateTime primeiraData = datasAtraso["Primeira_Data"];
                int qtdMesesMaiorAtraso = -1;
                while (primeiraData <= dtCalculo)
                {
                    qtdMesesMaiorAtraso++;
                    primeiraData = primeiraData.AddMonths(1);
                }
                DateTime ultimaData = datasAtraso["Ultima_Data"];
                int qtdMesesMenorAtraso = -1;
                while (ultimaData <= dtCalculo)
                {
                    qtdMesesMenorAtraso++;
                    ultimaData = ultimaData.AddMonths(1);
                }
                if (qtdMesesMaiorAtraso > 60 && qtdMesesMenorAtraso > 60)
                    qtdMesesAtraso = -1;
                else
                    qtdMesesAtraso = qtdMesesMaiorAtraso;
            }
            else
            {
                qtdMesesAtraso = 0;
            }

            return qtdMesesAtraso;
        }

        public List<ParametrosCampanha> ObterParametrosCampanha(DateTime? DataInicio, DateTime? DataFim)
        {
            return acesso.obterParametrosCampanha(DataInicio, DataFim);
        }

        public List<TipoProposta> listarTipoProposta()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<TipoProposta> listaTipoProposta = acesso.listarTipoProposta();

                //Completa a transação
                transacao.Complete();

                return listaTipoProposta;
            }
        }

        public void IncluirParametrosCampanha(ParametrosCampanha parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirParametrosCampanha(parametros);

                //Completa a transação
                transacao.Complete();
            }
        }

        public void AtualizarParametrosCampanha(ParametrosCampanha parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.atualizarParametrosCampanha(parametros);

                //Completa a transação
                transacao.Complete();
            }
        }

        //WO13621
        public int ObterQtdDiasDeAtraso(double NumeroContrato, DateTime DataCalculo)
        {
            return acesso.ObterQtdDiasDeAtraso(NumeroContrato, DataCalculo);
        }        
    }
}
