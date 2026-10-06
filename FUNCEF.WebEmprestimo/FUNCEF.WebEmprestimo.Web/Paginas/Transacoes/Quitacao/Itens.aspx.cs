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

using System.Collections.Generic;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao
{
    /// <summary>
    /// Representa a página de itens para cálculo de quitação.
    /// </summary>
    public partial class Itens : PaginaSegura
    {
        #region Propriedades
        private bool CampanhaInadimplencia = false;

        private string guidQuitacao
        {
            get
            {
                string queryString = Request.QueryString["guidQuitacao"];

                return queryString;
            }
        }

        private long numeroContrato
        {
            get
            {
                if (this.ViewState["numeroContrato"] != null)
                    return (long)this.ViewState["numeroContrato"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["numeroContrato"] = value;
            }
        }

        private DateTime dataAmortizacao
        {
            get
            {
                if (this.ViewState["dataAmortizacao"] != null)
                    return (DateTime)this.ViewState["dataAmortizacao"];
                else
                    return DateTime.MinValue;
            }
            set
            {
                this.ViewState["dataAmortizacao"] = value;
            }
        }

        private int idTipoContrato
        {
            get
            {
                if (this.ViewState["idTipoContrato"] != null)
                    return (int)this.ViewState["idTipoContrato"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idTipoContrato"] = value;
            }
        }

        private bool excepcional
        {
            get
            {
                if (this.ViewState["excepcional"] == null)
                    this.ViewState["excepcional"] = Request.QueryString["excepcional"];
                bool resultado = false;

                bool.TryParse((string)this.ViewState["excepcional"], out resultado);

                return resultado;
            }
        }

        private bool campanhaInadimplencia
        {
            get
            {
                if (this.ViewState["campanhaInadimplencia"] == null)
                    this.ViewState["campanhaInadimplencia"] = Request.QueryString["campanha"];
                bool resultado = false;

                bool.TryParse((string)this.ViewState["campanhaInadimplencia"], out resultado);

                return resultado;
            }
        }

        #endregion

        #region Eventos

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridItens.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                Dictionary<string, object> parametrosQuitacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidQuitacao);
                this.numeroContrato = (long)parametrosQuitacao["numeroContrato"];
                this.dataAmortizacao = (DateTime)parametrosQuitacao["dataQuitacao"];
                if (parametrosQuitacao.Keys.Contains("idTipoContrato"))
                    this.idTipoContrato = (int)parametrosQuitacao["idTipoContrato"];
                else
                    this.idTipoContrato = ((TipoContrato)parametrosQuitacao["tipoContrato"]).id;

                CampanhaInadimplencia = (bool)parametrosQuitacao["CampanhaInadimplencia"];

                List<ItemContrato> itensEmAberto = null;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                    double valorTotalItens = 0;
                    parametrosConsulta.paginacao = new Paginacao { indiceLinha = 0, maximoLinhas = 20 };
                    //itensEmAberto = cliente.contrato.obterItensContratoEmAberto(this.numeroContrato, ref parametrosConsulta, ref valorTotalItens);

                    //if (CampanhaInadimplencia == false)
                    //{
                        //itensEmAberto = cliente.contrato.obterItensContratoEmAberto(this.numeroContrato, ref parametrosConsulta, ref valorTotalItens);
                        dataSourceItensAberto.SelectMethod = "obterItensContratoEmAberto";
                    //}
                    //else
                    //{
                    //    dataSourceItensAberto.SelectMethod = "ObterItensContratoEmAbertoAgrupados";
                    //    dataSourceItensAberto.SelectCountMethod = "totalItensContratoEmAberto";

                    //}
                    gridItens.DataSourceID = dataSourceItensAberto.ID;

                    //gridItens.DataSource = itensEmAberto;
                    //gridItens.DataBind();

                    TipoContrato tipoContrato = cliente.contrato.consultarTipoContrato(this.idTipoContrato, false);
                    parametrosQuitacao.Remove("idTipoContrato");
                    parametrosQuitacao["tipoContrato"] = tipoContrato;
                    //parametrosQuitacao["CampanhaInadimplencia"] = CampanhaInadimplencia; //SIG 67808 - Matias
                    this.proxyEstado.manterEstadoSincrono(this.guidQuitacao, parametrosQuitacao);
                }
            }
        }

        /// <summary>
        /// Evento de clique do botão Continuar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("~/Paginas/Transacoes/Quitacao/Valores.aspx?guidQuitacao={0}", this.guidQuitacao));
        }

        /// <summary>
        /// Evento de clique do botão Volta.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("Visualizacao.aspx?Numero={0}&dataAmortizacao={1}&excepcional={2}&campanha={3}", this.numeroContrato, this.dataAmortizacao, this.excepcional, this.campanhaInadimplencia));
        }

        protected void dataSourceItensAberto_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (e.InputParameters.Count == 0)
            {
                e.InputParameters.Add("numero", this.numeroContrato);
            }

        }


        #endregion

        #region Contexto da Página / Permissões

        /// <summary>
        /// Obtém a identificação do contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.quitacao;
            }
        }

        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.incluir.ToString();
            }
        }

        #endregion
    }
}
