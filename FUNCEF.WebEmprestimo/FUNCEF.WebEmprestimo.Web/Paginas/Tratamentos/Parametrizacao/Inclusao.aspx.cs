using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parametrizacao
{
    public partial class Inclusao : PaginaSegura
    {
        private ParametrosCampanha parametrosItens { get; set; }
        private string guidParametros
        {
            get
            {
                string queryString = Request.QueryString["guidItens"];

                return queryString;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            botaoCancelar.urlVoltar = String.Format("Listagem.aspx");
            if (!IsPostBack)
            {
                this.carregarComboTipoProposta();
                if (!string.IsNullOrEmpty(this.guidParametros))
                {
                    this.parametrosItens = (ParametrosCampanha)this.proxyEstado.obterEstado(this.guidParametros);
                    if(parametrosItens != null)
                    {
                        caixaSelecaoTipoProposta.SelectedValue = parametrosItens.IdTipoPropostaCampanha.ToString();
                        txtDataInicio.valorData = parametrosItens.DataInicio;
                        txtDataFim.valorData = parametrosItens.DataFim;
                    }
                }
            }

        }


        protected void botaoSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!this.validaCampos())
                {
                    return;
                }

                this.parametrosItens = new ParametrosCampanha();
                this.parametrosItens.IdTipoPropostaCampanha = Convert.ToInt32(caixaSelecaoTipoProposta.SelectedValue);
                this.parametrosItens.DataInicio = txtDataInicio.valorData.Value;
                this.parametrosItens.DataFim = txtDataFim.valorData.Value;

                if(!string.IsNullOrEmpty(this.guidParametros))
                {
                    this.parametrosItens.IdCampanha = ((ParametrosCampanha)this.proxyEstado.obterEstado(this.guidParametros)).IdCampanha;
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        cliente.contrato.atualizarParametrosCampanha(this.parametrosItens);
                    }
                    this.confirmarOperacao(MensagensAplicacao.instancia.mensagem005, "~/Paginas/Tratamentos/Parametrizacao/Listagem.aspx");
                }
                else
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        cliente.contrato.incluirParametrosCampanha(this.parametrosItens);
                    }
                    this.confirmarOperacao(MensagensAplicacao.instancia.mensagem004, "~/Paginas/Tratamentos/Parametrizacao/Listagem.aspx");
                }
            }
            catch (FaultException<ContratoFaltaNegocio> ex)
            {
                this.registrarAlerta("Ocorreu um erro ao salvar os parâmetros. Detalhes: " + ex.Detail.mensagemErro);
                return;
            }
            catch (Exception ex)
            {
                this.registrarAlerta("Ocorreu um erro ao salvar os parâmetros. Detalhes: " + ex.Message);
                return;
            }
        }

        #region Contexto da Página / Permissões

        /// <summary>
        /// Obtém a identificação do contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.lancamentoHistoricoSuspensaoContrato; ;
            }
        }


        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return ((Int64)PermissoesSistema.incluir).ToString();
            }
        }

        #endregion
        private void carregarComboTipoProposta()
        {
            List<TipoProposta> listaTipoProposta = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listaTipoProposta = cliente.contrato.listarTipoProposta();
            }
            UtilidadesPagina.preencherDropDown(caixaSelecaoTipoProposta, listaTipoProposta, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "descricao", "id");
        }

        private bool validaCampos()
        {
            if (string.IsNullOrEmpty(caixaSelecaoTipoProposta.SelectedValue) || !txtDataInicio.valorData.HasValue || !txtDataFim.valorData.HasValue)
            {
                this.registrarAlerta("Preencha todos os campos de dados para a parametrização.");
                return false;
            }
            return true;
        }
    }
}