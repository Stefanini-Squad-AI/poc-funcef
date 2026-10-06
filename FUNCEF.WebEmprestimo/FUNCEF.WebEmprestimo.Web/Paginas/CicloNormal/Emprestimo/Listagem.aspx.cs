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
    /// Representa a página de listagem mutuarios.
    /// </summary>
    public partial class Listagem : PaginaSeguraComEstado
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
                gridMutuarios.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                UtilidadeSistema.preencherDropDown<InstrucaoLike>(comboLike, true, EnumeradorItemPreenchimento.Nenhum);
            }
            Session.Clear();//William Moreira da Silva - SOL 143476/16437
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridMutuarios.DataSourceID = dataSourceMutuarios.ID;
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
            caixaTextoNumMatricula.Text = String.Empty;

            gridMutuarios.limpar();
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceMutuario_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        protected void gridMutuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text.ToLower().Contains("consultas aos"))
                {
                    e.Row.Cells[0].ColumnSpan = 5;
                    e.Row.Cells[0].Text = "Consultas aos próprios contratos de empréstimo, somente poderão ser realizadas no Autoatendimento ou aplicativo FUNCEF";

                    e.Row.Cells[1].Visible = false;
                    e.Row.Cells[2].Visible = false;
                    e.Row.Cells[3].Visible = false;
                    e.Row.Cells[4].Visible = false;
                    e.Row.Cells[5].Visible = false;                         
                }
            }
        }
    }
}
