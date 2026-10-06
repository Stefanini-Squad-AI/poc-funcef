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
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;

using System.Web.Script.Services;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao
{
    /// <summary>
    /// Representa a página de visualização de grupos de usuários da aplicação.
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

        private DateTime dataQuitacao
        {
            get
            {
                if (Request.QueryString["dataQuitacao"] != null)
                    this.ViewState["dataQuitacao"] = Convert.ToDateTime(Request.QueryString["dataQuitacao"]);
                return (DateTime)this.ViewState["dataQuitacao"];
            }
            set
            {
                this.ViewState["dataQuitacao"] = value;
            }
        }

        private DateTime dataLimite
        {
            get
            {
                if (this.ViewState["dataLimite"] != null)
                    return (DateTime)this.ViewState["dataLimite"];
                else
                    return DateTime.MinValue;
            }
            set
            {
                this.ViewState["dataLimite"] = value;
            }
        }

        private DateTime dataCredito
        {
            get
            {
                if (this.ViewState["dataCredito"] != null)
                    return (DateTime)this.ViewState["dataCredito"];
                else
                    return DateTime.MinValue;
            }
            set
            {
                this.ViewState["dataCredito"] = value;
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

        private int idMutuario
        {
            get
            {
                if (this.ViewState["idMutuario"] != null)
                    return (int)this.ViewState["idMutuario"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idMutuario"] = value;
            }
        }

        private bool excepcional
        {
            get
            {
                if (this.ViewState["excepcional"] == null)
                    this.ViewState["excepcional"] = Request.QueryString["excepcional"];
                bool retorno = false;

                bool.TryParse((string)this.ViewState["excepcional"], out retorno);

                return retorno;
            }
            set
            {
                this.ViewState["excepcional"] = value;
            }
        }

        //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
        private int isDocumentoObito
        {
            get
            {
                if (this.ViewState["isDocumentoObito"] != null)
                    return (int)this.ViewState["isDocumentoObito"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["isDocumentoObito"] = value;
            }
        }

        private int numeroDocumentoParamPrev
        {
            get
            {
                if (this.ViewState["numeroDocumentoParamPrev"] != null)
                    return (int)this.ViewState["numeroDocumentoParamPrev"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["numeroDocumentoParamPrev"] = value;
            }
        }

        private bool campanhaInadimplencia
        {
            get
            {
                if (this.ViewState["campanhaInadimplencia"] == null)
                    this.ViewState["campanhaInadimplencia"] = Request.QueryString["campanha"];
                bool retorno = false;

                bool.TryParse((string)this.ViewState["campanhaInadimplencia"], out retorno);

                return retorno;
            }
            set
            {
                this.ViewState["campanhaInadimplencia"] = value;
            }
        }

        //marcio sanches spinosa sol 199356  kintana 1931062 - Fim
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
            VerificarPermissoes();//Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964

        }

        #endregion

        #region Métodos Auxiliares

        private void carregarTela()
        {
            //Contrato contrato = null;
            // Saulo / FUNCEF
            ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);


            //contrato = cliente.contrato.consultarContrato(this.numeroContrato); Saulo / FUNCEF
            if (Request.QueryString["dataQuitacao"] == null)
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    dataQuitacao = cliente.contrato.calcularDataLimiteDebito(DateTime.Now);
                }

            if (contrato != null)
            {
                labelNumContrato.Text = contrato.numero.ToString();
                labelMutuario.Text = contrato.mutuario.nome;
                labelMatricula.Text = contrato.mutuario.matricula;
                labelCPF.Text = UtilidadeSistema.formatarCPF(contrato.mutuario.cpf);
                labelSituacao.Text = contrato.mutuario.situacao;
                labelPlano.Text = contrato.plano.descricao;
                labelPatrocinadora.Text = contrato.patrocinadora.nome;
                labelTipoEmprestimo.Text = contrato.tipoEmprestimo.descricao;
                labelTipoContrato.Text = contrato.tipo.descricao;
                labelIndexador.Text = contrato.indexador.sigla;
                labelDataAssinatura.Text = contrato.dataAssinatura.obterString();
                labelDataCredito.Text = (contrato.dataCredito.HasValue) ? contrato.dataCredito.Value.ToString("dd/MM/yyyy") : string.Empty;
                if (contrato.dataCredito.HasValue)
                    this.dataCredito = contrato.dataCredito.Value;
                labelDataPrimeiraParcela.Text = (contrato.dataPrimeiraParcela.HasValue) ? contrato.dataPrimeiraParcela.Value.ToString("dd/MM/yyyy") : string.Empty;
                labelTaxaJuros.Text = (contrato.taxaJuros.HasValue) ? contrato.taxaJuros.Value.ToString("N2") : string.Empty;
                labelValorSolicitado.Text = (contrato.valorContrato.HasValue) ? contrato.valorContrato.Value.ToString("N2") : string.Empty;
                labelNumParcelas.Text = contrato.totalParcelas.ToString();
                labelValorParcela.Text = (contrato.valorParcela.HasValue) ? contrato.valorParcela.Value.ToString("N2") : string.Empty;

                //CORRECAO - NILTON - 05/02/2013
                if (contrato.mutuario.dataFalecimento.HasValue)
                    labelDataFalecimento.Text = contrato.mutuario.dataFalecimento.Value.ToString("dd/MM/yyyy");
                //else
                //    trFalecimento.Style["display"] = "none";
                caixaTextoData.valorData = dataQuitacao;
                this.dataLimite = dataQuitacao;
                this.idTipoContrato = contrato.tipo.id;
                this.idMutuario = contrato.mutuario.id;
                this.caixaSelecaoExcepcional.Checked = this.excepcional;
                //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
                this.isDocumentoObito = contrato.isDocumentoObito;
                this.numeroDocumentoParamPrev = contrato.numeroDocumentoParamPrev;

                //SIG 67808 - Matias
                this.caixaSelecaoCampanhaInad.Checked = this.campanhaInadimplencia;

                //if (this.numeroDocumentoParamPrev != 0)
                //{
                //    if (this.isDocumentoObito == 0 && !string.IsNullOrEmpty(labelDataFalecimento.Text))
                //    {
                //        this.registrarAlerta("Não existe documento de óbito cadastrado!");
                //    }
                //}

                //marcio sanches spinosa sol 199356  kintana 1931062 - Fim
            }
        }

        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Inicio
        private void VerificarPermissoes()
        {
            this.caixaSelecaoExcepcional.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.excepcional.ToString());
            this.caixaTextoData.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.dataQuitacao.ToString());

            //SIG 67808 - Matias
            //this.caixaSelecaoCampanhaInad.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.excepcional.ToString());
        }
        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Fim

        //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
        private bool verificarDocumentoObito(bool bFalecimento)
        {
            if (numeroDocumentoParamPrev != 0)
            {                                                                                      //SIG 67808 - Matias        
                if (isDocumentoObito == 0 && bFalecimento && !caixaSelecaoExcepcional.Checked && !caixaSelecaoCampanhaInad.Checked)
                {
                    this.redirecionarComAlerta("Não será possivel a quitação por falecimento!", "~/Paginas/Transacoes/Quitacao/Visualizacao.aspx?Numero=" + this.numeroContrato);

                    return false;
                }
                else
                    return true;
            }
            else
                return false;

        }

        private void verificaDataFalecimentoDocumento()
        {
            if (this.numeroDocumentoParamPrev != 0)
            {
                if (this.isDocumentoObito == 0 && !string.IsNullOrEmpty(labelDataFalecimento.Text))
                {
                    this.registrarAlerta("Não existe documento de óbito cadastrado!");
                }
            }
        }
        //marcio sanches spinosa sol 199356  kintana 1931062 - Fim

        //Jessica Y. Oshiro - SOL 235314
        /// <summary>
        /// Verifica se data quitação é dia util.
        /// </summary>
        /// <param name="dataAmortizacao">Data Quitação como parametro</param>
        /// <returns>Se data amortização é dia util.</returns>
        /// 

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool verificaData(string dataQuitacao)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                bool diaUtil = cliente.contrato.verificaDataUtil(Convert.ToDateTime(dataQuitacao));

                if (!diaUtil)
                {
                    return false;
                }
            }
            return true;
        }

        protected bool verificaDataUtil(DateTime dataQuitacao)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                bool diaUtil = cliente.contrato.verificaDataUtil(dataQuitacao);

                if (!diaUtil)
                {
                    return false;
                }
            }
            return true;
        }
        /// <summary>
        /// Evento de clique do botão Continuar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            this.ViewState["excepcional"] = this.caixaSelecaoExcepcional.Checked.ToString();

            //SIG 67808 - Matias
            this.ViewState["campanhaInadimplencia"] = this.caixaSelecaoCampanhaInad.Checked.ToString();

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                try
                {
                    // SOL 204424 KTN 1976597 Otacilio
                    // Verificar se a quitação é por falecimento
                    bool bfalecimento = (!string.IsNullOrEmpty(labelDataFalecimento.Text));

                    if (cliente.contrato.validarQuitacao(this.numeroContrato, caixaTextoData.valorData.Value, this.dataCredito, this.dataLimite, caixaSelecaoExcepcional.Checked, bfalecimento))
                    {
                        Dictionary<string, object> parametros = new Dictionary<string, object>();

                        parametros["numeroContrato"] = this.numeroContrato;
                        parametros["idTipoContrato"] = this.idTipoContrato;
                        parametros["dataQuitacao"] = caixaTextoData.valorData.Value;
                        parametros["idMutuario"] = this.idMutuario;
                        parametros["CampanhaInadimplencia"] = this.campanhaInadimplencia;

                        string guid = Guid.NewGuid().ToString();
                        this.proxyEstado.manterEstadoSincrono(guid, parametros);

                        //Jessica Y. Oshiro - SOL 235314
                        if (!this.verificaDataUtil(Convert.ToDateTime(caixaTextoData.Text)))
                        {
                            this.registrarAlerta("A data de quitação deve ser um dia útil. ");
                            return;
                        }

                        //marcio sanches spinosa sol 199356  kintana 1931062 - Inicio
                        verificaDataFalecimentoDocumento();
                        //SIG 67808 - Matias
                        if (!this.caixaSelecaoExcepcional.Checked || !this.caixaSelecaoCampanhaInad.Checked)
                        {
                            if (!verificarDocumentoObito(bfalecimento) && numeroDocumentoParamPrev != 0)
                                return;
                        }
                        //marcio sanches spinosa sol 199356  kintana 1931062 - Fim

                        if (labelDataFalecimento.Visible && !string.IsNullOrEmpty(labelDataFalecimento.Text))
                        {                                                                                                                                                               //SIG 67808 - Matias
                            this.redirecionarComAlerta("Mutuário falecido. Quitação será por falecimento.", String.Format("~/Paginas/Transacoes/Quitacao/Itens.aspx?guidQuitacao={0}&excepcional={1}&campanha={2}", guid, this.excepcional, this.campanhaInadimplencia));
                        }
                        else
                        {                                                                                                                                                           //SIG 67808 - Matias
                            Response.Redirect(String.Format("~/Paginas/Transacoes/Quitacao/Itens.aspx?guidQuitacao={0}&excepcional={1}&campanha={2}", guid, this.excepcional, this.campanhaInadimplencia));
                        }
                    }
                }
                catch (FaultException<ContratoFaltaNegocio> erro)
                {
                    this.registrarAlerta(erro.Detail.mensagemErro);
                }
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
