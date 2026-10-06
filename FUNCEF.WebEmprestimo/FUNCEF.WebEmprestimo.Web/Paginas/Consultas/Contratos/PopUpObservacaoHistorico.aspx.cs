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
//using FUNCEF.GlobalWeb.Tipos;

using System.ComponentModel;
//using FUNCEF.GlobalWeb.Tipos.Seguranca;
//using FUNCEF.Planus.GlobalWeb.Web.Componentes;
using FUNCEF.Planus.Componentes.Web;
//using FUNCEF.GlobalWeb.Servicos;
using System.Collections.Generic;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    /// <summary>
    /// Representa a página de listagem de usuários da aplicação.
    /// </summary>
    public partial class PopUpObservacaoHistorico : PaginaSeguraComEstado
    {
        #region Propriedades

        private long idHistorico
        {
            get
            {    
                string queryString = Request.QueryString["idHistorico"];
                long id = Convert.ToInt64(queryString);

                return id;
            }
        }

        private string observacao
        {
            get
            { 
                string queryString = HttpUtility.UrlDecode(Request.QueryString["observacao"]);

                return queryString;
            }
        }

        private long numeroContrato
        {
            get
            {
                string queryString = Request.QueryString["numeroContrato"];
                long numero = 0;

                long.TryParse(queryString, out numero);

                return numero;
            }
        }

        #endregion

        #region Eventos

        /// <summary>
        /// Inicializa a página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Init(object sender, EventArgs e)
        {
            
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
                caixaTextoObservacao.Text = this.observacao;
            }
        }
       
        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param> 
        /// <param name="e">Argumentos.</param>
        protected void botaoAlterar_Click(object sender, EventArgs e)
        {
            try
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {   
                    if (caixaTextoObservacao.Text != this.observacao)
                    {
                        LogContrato log = new LogContrato();
                        log.idHistorico = this.idHistorico;
                        log.descricao = "Alteração da Observação";
                        //log.descricao = "Alteração da Observação de " + this.observacao + " para " + caixaTextoObservacao.Text;
                        log.origem = Origem.consultaContratos;

                        //Altera a Observação
                        cliente.contrato.alterarObservacaoHistorico(this.idHistorico, caixaTextoObservacao.Text);
                        
                        //Inclui o Log de alteração da Observação
                        cliente.contrato.incluirLog(log);

                        this.registrarScript("Fechar", "fecharJanela();");
                    }
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
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
                return IdentificacaoContexto.contrato;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.alterar.ToString();
            }
        }

        #endregion
    }
}
