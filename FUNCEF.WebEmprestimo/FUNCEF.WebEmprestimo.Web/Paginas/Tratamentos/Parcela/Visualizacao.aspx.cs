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
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.GlobalWeb.Web.IU.Controles;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela
{
    /// <summary>
    /// Representa a página de visualização de suspensão de parcelas.
    /// </summary>
    public partial class Visualizacao : PaginaSegura
    {
        #region Propriedades

        private long numeroContrato
        {
            get
            {
                string queryString = Request.QueryString["Numero"];
                long numero = 0;

                long.TryParse(queryString, out numero);

                return numero;
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
                this.carregarTela();
            }
        }

        /*//William Moreira da Silva - SOL 155626
        protected void gridLogAlteracoes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            gridLogAlteracoes.PageIndex = e.NewPageIndex;
            gridLogAlteracoes.DataBind();
            recipienteAbaSuspensoes.ActiveTabIndex = 1;
        }
        //William Moreira da Silva - SOL 155626*/

        #endregion

        #region Métodos Auxiliares

        private void carregarTela()
        {
            string mensagem = string.Empty;
            gridParcelas.EmptyDataText = "Não existem suspensões.";
            //gridLogAlteracoes.EmptyDataText = "Não há alterações";

            // Saulo - FUNCEF
            //Contrato contrato = null;
            ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

            //Contrato contrato = null;
            List<HistoricoSuspensao> historico = null;

            //William Moreira da Silva - SOL 155626
            //List<LogContrato> logAlteracoes = null;
            //LogContrato log = new LogContrato();

            //log.numeroContrato = this.numeroContrato;
            //William Moreira da Silva - SOL 155626   

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //contrato = cliente.contrato.consultarContrato(this.numeroContrato); // Saulo - FUNCEF
                historico = cliente.contrato.consultarHistoricoSuspensao(this.numeroContrato, 0);

                //WO7740
                foreach (var item in historico)
                {
                    if (item.dataFim != null)
                    {
                        int diferencaMeses = (DateTime.Today.Year - Convert.ToDateTime(item.dataFim).Year) * 12 + DateTime.Today.Month - Convert.ToDateTime(item.dataFim).Month;

                        if (item.status.ToLower().Trim() == "ativa" && diferencaMeses >= 12)
                        {
                            mensagem = $@"Existe suspensão {item.descricaoTipoSuspAux} cuja data final expirou ({String.Format("{0:dd/MM/yyyy}", item.dataFim)}) e continua ativa. Providencie o encerramento para possibilitar incluir nova suspensão.";
                        }
                    }
                }

                //log.numeroContrato = historico[0].//William Moreira da Silva - SOL 235167 PPM 446221

                //logAlteracoes = cliente.contrato.consultarLogOrigem(log, Origem.consultaContratos.chave);
            }           

            if (contrato != null)
            {
                labelNumContrato.Text = contrato.numero.ToString();
                labelMutuario.Text = contrato.mutuario.nome;
                labelMatricula.Text = contrato.mutuario.matricula;
            }

            //gridLogAlteracoes.DataSource = logAlteracoes;
            //gridLogAlteracoes.DataBind();
            //William Moreira da Silva - SOL 155626

            gridParcelas.DataSource = historico;
            gridParcelas.DataBind();

            if (!string.IsNullOrEmpty(mensagem))
            {
                this.registrarAlerta(mensagem);
            }
        }

        /// <summary>
        /// Evento de clique do botão Continuar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoIncluir_Click(object sender, EventArgs e)
        {
            try
            {
                bool existeSuspensaoAtiva = false;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    existeSuspensaoAtiva = cliente.contrato.verificarSuspensaoAtiva(this.numeroContrato);
                }

                if (existeSuspensaoAtiva)
                {
                    this.registrarAlerta(MensagensAplicacao.instancia.mensagem034);
                }
                else
                {
                    Response.Redirect(String.Format("~/Paginas/Tratamentos/Parcela/Inclusao.aspx?Numero={0}", this.numeroContrato));
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
        /// Obtém a identificação do contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.lancamentoHistoricoSuspensaoContrato;
            }
        }

        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
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
