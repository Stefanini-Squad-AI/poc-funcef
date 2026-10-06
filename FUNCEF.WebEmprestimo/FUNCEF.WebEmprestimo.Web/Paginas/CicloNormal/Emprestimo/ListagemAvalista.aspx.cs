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
using System.ComponentModel;
using FUNCEF.Planus.Componentes.Web;
using System.Collections.Generic;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    /// <summary>
    /// Representa a página de listagem avalista.
    /// </summary>
    public partial class ListagemAvalista : PaginaSeguraComEstado
    {
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
                gridAvalista.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                UtilidadeSistema.preencherDropDown<InstrucaoLike>(comboLike, true, EnumeradorItemPreenchimento.Nenhum);
                //this.obterAvalistasSelecionados();
            }
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridAvalista.DataSourceID = dataSourceAvalista.ID;
        }

        /// <summary>
        /// Evento de clique do botão OK.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoOK_Click(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            caixaTextoCPF.Text = String.Empty;
            caixaTextoNome.Text = String.Empty;
            caixaTextoRazaoSocial.Text = String.Empty;

            gridAvalista.limpar();
        }

        /// <summary>
        /// Obtém Avalistas selecionados
        /// </summary>
        private List<long> obterAvalistasSelecionados()
        {

            List<long> avalistasSelecionados = new List<long>();

            if (gridAvalista.chavesSelecionadas.Count > 0)
            {

                int registros = gridAvalista.chavesSelecionadas.Count;

                for (int i = 0; i < registros; i++)
                {
                    DataKey dataKey = gridAvalista.chavesSelecionadas[i];
                    avalistasSelecionados.Add((long)dataKey.Values[0]);
                }

            }
            else
            {
                avalistasSelecionados = new List<long>();
            }

            return avalistasSelecionados;

        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceAvalista_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //Verifica quais parametros usar.
            tratarFiltros(ref e);
        }

        protected void gridAvalista_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink link = e.Row.Cells[0].Controls[0] as HyperLink;

                e.Row.Cells[4].Text = Request.QueryString["conjuge"];
                
                //William Moreira da Silva - SOL 143476/16437 
                if (e.Row.Cells[4].Text == "0")
                {
                    e.Row.Cells[0].Attributes["onClick"] = string.Format("exibirDialogo('PopupAvalista.aspx?id={0}&conjuge={1}', 1000, 500); fecharRetorno('Avalista incluido com sucesso.');", ((Avalistas)e.Row.DataItem).id, e.Row.Cells[4].Text);
                }
                else
                {
                    e.Row.Cells[0].Attributes["onClick"] = string.Format("exibirDialogo('PopupAvalista.aspx?id={0}&conjuge={1}', 1000, 500); fecharRetorno('Cônjuge incluido com sucesso.');", ((Avalistas)e.Row.DataItem).id, e.Row.Cells[4].Text);
                }
                //William Moreira da Silva - SOL 143476/16437 
            }
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
                return IdentificacaoContexto.emprestimo;
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
