#region SOL 251529 / PPM 763520
///
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Alteração:
/// 13/05/2015 11:00:00
///
/// Descrição da Alteração: O sistema não está permitindo diminuir a quantidade de parcelas
/// 
///
#endregion
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
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;

using System.Web.Script.Services;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Amortizacao
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
                if (this.ViewState["numeroContrato"] == null)
                    this.ViewState["numeroContrato"] = Request.QueryString["Numero"];
                long numero = 0;

                long.TryParse((string)this.ViewState["numeroContrato"], out numero);

                return numero;
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
                if (Request.QueryString["dataAmortizacao"] != null)
                    this.ViewState["dataAmortizacao"] = Convert.ToDateTime(Request.QueryString["dataAmortizacao"]);
                return (DateTime)this.ViewState["dataAmortizacao"];
            }
            set
            {
                this.ViewState["dataAmortizacao"] = value;
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

        private Double salarioBase
        {
            get
            {
                if (this.ViewState["salarioBase"] != null)
                    return (Double)this.ViewState["salarioBase"];
                else
                    return 0;
            }

            set
            {
                this.ViewState["salarioBase"] = value;
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

        //Wylliam Leite da Silva SOL 251529 PPM 763520
        private double vlrParcela
        {
            get
            {
                if (this.ViewState["vlrParcela"] != null)
                    return (double)this.ViewState["vlrParcela"];
                else
                    return 0d;
            }

            set
            {
                this.ViewState["vlrParcela"] = value;
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
                // Saulo / FUNCEF
                //Contrato contrato = null;
                ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                if (Request.QueryString["dataAmortizacao"] == null)
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        //Saulo / FUNCEF
                        // contrato = cliente.contrato.consultarContrato(this.numeroContrato); 
                        //if (Request.QueryString["dataAmortizacao"] == null) Alterado local do IF
                        this.dataAmortizacao = cliente.contrato.calcularDataLimiteDebito(DateTime.Now);

                    }
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
                    caixaTextoData.valorData = dataAmortizacao;
                    this.dataLimite = dataAmortizacao;
                    this.idTipoContrato = contrato.tipo.id;
                    this.idMutuario = contrato.mutuario.id;
                    if (contrato.salarioBase.HasValue)
                        this.salarioBase = (double)contrato.salarioBase;
                    this.caixaSelecaoExcepcional.Checked = this.excepcional;

                    //Wylliam Leite da Silva SOL 251529 PPM 763520
                    this.vlrParcela = (double)contrato.valorParcela.Value;
                }
            }
            VerificarPermissoes();//Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964
        }

        /// <summary>
        /// Evento de clique do botão Continuar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            this.ViewState["excepcional"] = this.caixaSelecaoExcepcional.Checked.ToString();

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                try
                {
                    if (cliente.contrato.validarAmortizacao(this.numeroContrato, caixaTextoData.valorData.Value, this.dataCredito, this.dataLimite, caixaSelecaoExcepcional.Checked))
                    {
                        //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
                        if (!this.verificaDataUtil(Convert.ToDateTime(caixaTextoData.Text)))
                        {
                            this.registrarAlerta("A data de amortização deve ser um dia útil .");
                            return;
                        }
                        //Jessica Y. Oshiro - SOL 235314-18140 -FIM

                        Dictionary<string, object> parametros = new Dictionary<string, object>();

                        parametros["numeroContrato"] = this.numeroContrato;
                        parametros["idTipoContrato"] = this.idTipoContrato;
                        parametros["dataAmortizacao"] = caixaTextoData.valorData.Value;
                        parametros["idMutuario"] = this.idMutuario;
                        parametros["matricula"] = this.labelMatricula.Text;
                        parametros["salarioBase"] = this.salarioBase;
                        //Wylliam Leite da Silva SOL 251529 PPM 763520
                        parametros["vlrParcela"] = this.vlrParcela;

                        string guid = Guid.NewGuid().ToString();
                        this.proxyEstado.manterEstadoSincrono(guid, parametros);

                        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - INICIO
                        bool msg = verificarValorAmortizacao(this.numeroContrato, this.caixaTextoData.valorData.Value);

                        Response.Redirect(String.Format("~/Paginas/Transacoes/Amortizacao/Itens.aspx?guidAmortizacao={0}&excepcional={1}&msg={2}", guid, this.excepcional, msg.ToString()));
                        //Response.Redirect(String.Format("~/Paginas/Transacoes/Amortizacao/Itens.aspx?guidAmortizacao={0}&excepcional={1}", guid, this.excepcional));
                        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - INICIO
                        
                    }
                }
                catch (FaultException<ContratoFaltaNegocio> erro)
                {
                    this.registrarAlerta(erro.Detail.mensagemErro);
                }
            }
        }

        #endregion

        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Inicio
        #region Métodos
        /// <summary>
        /// Obtém as permissões necessárias para liberar os componentes conforme necessário.
        /// </summary>
        private void VerificarPermissoes()
        {
            this.caixaSelecaoExcepcional.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.excepcional.ToString());
            this.caixaTextoData.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.dataAmortizacao.ToString());

        }
        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - INICIO
        private bool verificarValorAmortizacao(long contrato, DateTime vencimento)
        {
            Cliente<IServicoContrato> clienteContrato = new Cliente<IServicoContrato>();
            return (clienteContrato.contrato.VerificarValorAmortizacao(contrato, vencimento));
        }
        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - FIM            

        //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
        /// <summary>
        /// Verifica se data amortização é dia util.
        /// </summary>
        /// <param name="dataCredito">Data amortização como parametro</param>
        /// <returns>Se data amortização é dia util.</returns>
        
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool verificaData(string dataAmortizacao)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                bool diaUtil = cliente.contrato.verificaDataUtil(Convert.ToDateTime(dataAmortizacao));

                if (!diaUtil)
                {
                    return false;
                }
            }
            return true;
        }

        private bool verificaDataUtil(DateTime dataAmortizacao)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                bool diaUtil = cliente.contrato.verificaDataUtil(dataAmortizacao);

                if (!diaUtil)
                {
                    return false;
                }
            }
            return true;
        }
        //Jessica Y. Oshiro - SOL 235314-18140 - FIM

        #endregion
        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Fim

        #region Contexto da Página / Permissões

        /// <summary>
        /// Obtém a identificação do contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.amortizacao;
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
