using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using FUNCEF.Planus.GlobalWeb.Web.IU;

using System.ComponentModel;
using FUNCEF.Planus.Componentes.Web;
using System.Collections.Generic;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.RelatorioDemonstrativoValorAberto
{
    /// <summary>
    /// Representa a página de listagem de usuários da aplicação.
    /// </summary>

    
    public partial class Listagem : PaginaSeguraComEstado
    {
        public string DataAtual = string.Empty;
        #region Eventos

        /// <summary>
        /// Inicializa a página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Init(object sender, EventArgs e)
        {
            this.atualizarEstado += new EventHandler(botaoProcurar_Click);
        }

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridQuitacao.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                UtilidadeSistema.preencherDropDown<InstrucaoLike>(comboLike, true, EnumeradorItemPreenchimento.Nenhum);

                caixaDataAtualizacao.valorData = DateTime.Today;
            }
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridQuitacao.DataSourceID = dataSourceQuitacao.ID;
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            caixaTextoNumMatricula.Text = String.Empty;
            caixaTextoNumContrato.Text = String.Empty;
            caixaTextoNomeMutuario.Text = String.Empty;
            caixaTextoCPF.Text = String.Empty;

            gridQuitacao.limpar();
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceQuitacao_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //Verifica quais parametros usar.
            tratarFiltros(ref e);
        }

        #endregion

        #region Métodos de Apoio

        #endregion

        #region Contexto da Página / Permissões

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.tratamentoIndividualdeParcelas;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }

        #endregion

    }
}
