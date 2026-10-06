using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    /// <summary>
    /// Representa a página de listagem Pesquisar Novo avalista.
    /// </summary>
    public partial class ListagemPesquisarNovoAvalista : PaginaSeguraComEstado
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
            this.obterAvalistasSelecionados();
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
        private List<Int32> obterAvalistasSelecionados()
        {
            List<Int32> avalistasSelecionados = new List<Int32>();
            string mensagem = string.Empty;
            string script   = string.Empty;
            int idIndex = 0;

            if (Request["rbNovoAvalista"] == null)
            {
                this.registrarAlerta("Selecione ao menos um registro.");
                return avalistasSelecionados;
            }
            else
            {
                idIndex = int.Parse(Request["rbNovoAvalista"].ToString());
            }

            try
            {
                DataKey dataKey = gridAvalista.DataKeys[idIndex];

                avalistasSelecionados.Add((Int32)dataKey.Values[0]);
                Session["idPessoa"] = (Int32)dataKey.Values[0];

                mensagem = "Avalista selecionado com sucesso. Por favor, aguarde o preenchimento dos campos.";

                script = string.Format("fecharRetorno('{0}');", mensagem);

                this.registrarScript("retornoMensagem", script);
            }
            catch (Exception e)
            {
                this.registrarAlerta(e.ToString());
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

                if (link != null)
                { 
                }
            }            
        }

        #endregion

        #region Métodos de Apoio

        protected void campo_CheckedChanged(object sender, EventArgs e)
        {
            this.ignorarContratosSelecionados = false;
            this.obterAvalistasSelecionados();
        }

        /// <summary>
        /// Propriedade que retorna se ignora ou não contratos selecionados no grid "Dívidas de Empréstimos"
        /// </summary>
        private bool ignorarContratosSelecionados
        {
            get
            {
                if (this.ViewState["ignorarContratorSelecionados"] != null)
                    return (bool)this.ViewState["ignorarContratorSelecionados"];
                else
                    return true;
            }

            set
            {
                this.ViewState["ignorarContratorSelecionados"] = value;
            }
        }


        


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
