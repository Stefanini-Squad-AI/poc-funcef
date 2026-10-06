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
using FUNCEF.GlobalWeb.Web.IU;
//using FUNCEF.GlobalWeb.Tipos;

using System.ComponentModel;
//using FUNCEF.GlobalWeb.Tipos.Seguranca;
//using FUNCEF.GlobalWeb.Web.Componentes;
using FUNCEF.Planus.Componentes.Web;
//using FUNCEF.GlobalWeb.Servicos;
using System.Collections.Generic;
using FUNCEF.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.WebEmprestimo.Web.Componentes;

namespace FUNCEF.GlobalWeb.Web.Paginas.Funcionalidades
{
    /// <summary>
    /// Representa a página de listagem de usuários da aplicação.
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
            {/*
                gridFuncionalidades.EmptyDataText = Mensagens.instancia.mensagem007;

                using (Cliente<IServicoSeguranca> cliente = new Cliente<IServicoSeguranca>())
                {

                    List<Aplicacao> aplicacoes = cliente.contrato.consultarAplicacoes();
                    UtilidadesPagina.preencherDropDown(listaAplicacao, aplicacoes, EnumeradorItemPreenchimento.Todos, "nome", "id");
                }*/
            }
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            //gridFuncionalidades.DataSourceID = dataSourceFuncionalidades.ID;
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            //listaAplicacao.SelectedIndex = -1;
            //caixaTextoNome.Text = String.Empty;

            //gridFuncionalidades.limpar();
        }

        /// <summary>
        /// Evento executado após excluir um registro.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void dataSourceFuncionalidades_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            //registrarAlerta(Mensagens.instancia.mensagem008);
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceFuncionalidades_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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
                return string.Empty;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return "";// ((int)PermissoesPadrao.mascaraVazia).ToString();
            }
        }

        #endregion
    }
}
