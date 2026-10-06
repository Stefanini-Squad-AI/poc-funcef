using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Collections;
using FUNCEF.Planus.GlobalWeb.Web.UI;

namespace FUNCEF.Planus.WebEmprestimo.Web.CssDinamico
{
    /// <summary>
    /// Representa um estilo configurável.
    /// Esta class possui propriedades para os dados de estilo configuráveis.
    /// </summary>
    public sealed class ProvedorEstiloConfiguravel : IProvedorEstiloConfiguravel
    {
        public Hashtable obterConfiguracoes()
        {
            Hashtable configuracoes = new Hashtable();

            //Carrega as Imagens.
            configuracoes.Add("cache.imagemConfiguravel.logoLogin", "~/Imagens/logoLoginWebEmprestimo.png");
            configuracoes.Add("cache.imagemConfiguravel.planusLogin", "~/Imagens/PlanusHorizontal.png");
            configuracoes.Add("cache.imagemConfiguravel.logoTopoCabecalho", "~/Imagens/marcaTransparenteWebEmprestimo.png");
            configuracoes.Add("cache.imagemConfiguravel.planusCabecalho", "~/Imagens/MarcaPlanus.png");
            configuracoes.Add("cache.imagemConfiguravel.menu", "~/Imagens/MenuAba2.gif");
            configuracoes.Add("cache.imagemConfiguravel.fundoCabecalho", "~/Imagens/FundoAzul2.gif");

            configuracoes.Add("cache.imagemConfiguravel.botaoIncluir", "~/Imagens/imgInserir.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoAlterar", "~/Imagens/imgAlterar.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoExcluir", "~/Imagens/imgExcluir.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoProcurar", "~/Imagens/imgProcurar.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoCancelar", "~/Imagens/imgCancelar.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoSair", "~/Imagens/imgSairHome.gif");
            configuracoes.Add("cache.imagemConfiguravel.botaoLimpar", "~/Imagens/imgLimpar.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoAnterior", "~/Imagens/imgBack.gif");
            configuracoes.Add("cache.imagemConfiguravel.botaoProximo", "~/Imagens/imgForward.gif");
            configuracoes.Add("cache.imagemConfiguravel.botaoVoltar", "~/Imagens/imgSair.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoOk", "~/Imagens/imgOk.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoDetalhes", "~/Imagens/imgAdd.gif");

            configuracoes.Add("cache.imagemConfiguravel.botaoAjuda", "~/Imagens/imgAjuda.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoImprimir", "~/Imagens/imgImprimir.png");
            configuracoes.Add("cache.imagemConfiguravel.botaoArquivo", "~/Imagens/imgContratarEP.png");

            //Cores
            configuracoes.Add("cache.cores.fundoAplicacao", "#fefaee");
            configuracoes.Add("cache.cores.fundoLogin", "#ffffff");
            configuracoes.Add("cache.cores.fundoMenu", "#526a8e");
            configuracoes.Add("cache.cores.fundoMenuSelecao", "#ef9e07");
            configuracoes.Add("cache.cores.cabecalhoTabelaGrid", "#b9cde5");
            configuracoes.Add("cache.cores.tabelaGridAlterna", "#CFCFCF"); //NILTON 25/01/13 - cor anterior #eaeaea
            configuracoes.Add("cache.cores.fundoTabela", "#ffffff");
            configuracoes.Add("cache.cores.bordaCaixaTexto", "#c2c2c2");

            //Fontes
            configuracoes.Add("cache.fontes.tituloInterno", "Arial");
            configuracoes.Add("cache.fontes.abaInativa", "Arial");
            configuracoes.Add("cache.fontes.abaAtiva", "Arial");
            configuracoes.Add("cache.fontes.tabelaGrid", "Arial");
            configuracoes.Add("cache.fontes.telaInicial", "Arial");
            configuracoes.Add("cache.fontes.menuSelecao", "Arial");
            configuracoes.Add("cache.fontes.menu", "Arial");

            configuracoes.Add("cache.fontes.corMenu", "#ffffff");
            configuracoes.Add("cache.fontes.corMenuSelecao", "#ffffff");
            configuracoes.Add("cache.fontes.corTelaInicial", "#000000");
            configuracoes.Add("cache.fontes.corTabelaGrid", "#000000");
            configuracoes.Add("cache.fontes.corAbaAtiva", "#000000");
            configuracoes.Add("cache.fontes.corAbaInativa", "#c0c0c0");
            configuracoes.Add("cache.fontes.corTituloInterno", "#526a8e");

            configuracoes.Add("cache.fontes.tamanhoMenu", "11");
            configuracoes.Add("cache.fontes.tamanhoMenuSelecao", "11");
            configuracoes.Add("cache.fontes.tamanhoTelaInicial", "13");
            configuracoes.Add("cache.fontes.tamanhoTabelaGrid", "11");
            configuracoes.Add("cache.fontes.tamanhoAbaAtiva", "12");
            configuracoes.Add("cache.fontes.tamanhoAbaInativa", "12");
            configuracoes.Add("cache.fontes.tamanhoTituloInterno", "12");

            configuracoes.Add("cache.fontes.estiloMenu", "N");
            configuracoes.Add("cache.fontes.estiloMenuSelecao", "N");
            configuracoes.Add("cache.fontes.estiloTelaInicial", "N");
            configuracoes.Add("cache.fontes.estiloTabelaGrid", "");
            configuracoes.Add("cache.fontes.estiloAbaAtiva", "");
            configuracoes.Add("cache.fontes.estiloAbaInativa", "");
            configuracoes.Add("cache.fontes.estiloTituloInterno", "N");

            //Título
            configuracoes.Add("cache.tituloNavegador", "Funcef");

            //Geral
            configuracoes.Add("cache.geral.tituloNavegador", "Funcef");
            configuracoes.Add("cache.geral.bordaCaixaTexto", true);
            configuracoes.Add("cache.geral.registrosPagina", 20);

            return configuracoes;
        }
    }
}
