#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion

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
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using System.Reflection;
using System;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Amortizacao
{
    /// <summary>
    /// Representa a página de itens para cálculo de amortização.
    /// </summary>
    public partial class Valores : PaginaSegura
    {
        #region Propriedades

        private string guidAmortizacao
        {
            get
            {
                string queryString = Request.QueryString["guidAmortizacao"];

                return queryString;
            }
        }

        //William Moreira da Silva SOL 211419
        private bool parcPosterior
        {
            get
            {
                bool parcPosterior = bool.Parse(Request.QueryString["parcPosterior"]);

                return parcPosterior;
            }
        }
        //William Moreira da Silva SOL 211419

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

        private TipoContrato tipoContrato
        {
            get
            {
                if (this.ViewState["tipoContrato"] != null)
                    return (TipoContrato)this.ViewState["tipoContrato"];
                else
                    return null;
            }
            set
            {
                this.ViewState["tipoContrato"] = value;
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

        private int novoPrazo
        {
            get
            {
                if (this.ViewState["novoPrazo"] != null)
                    return (int)this.ViewState["novoPrazo"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["novoPrazo"] = value;
            }
        }

        private int prazoAnterior
        {
            get
            {
                if (this.ViewState["prazoAnterior"] != null)
                    return (int)this.ViewState["prazoAnterior"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["prazoAnterior"] = value;
            }
        }

        private double? valorAmortizacao
        {
            get
            {
                if (this.ViewState["valorAmortizacao"] != null)
                    return (double?)this.ViewState["valorAmortizacao"];
                else
                    return null;
            }
            set
            {
                this.ViewState["valorAmortizacao"] = value;
            }
        }

        private double? valorMargem
        {
            get
            {
                if (this.ViewState["valorMargem"] != null)
                    return (double?)this.ViewState["valorMargem"];
                else
                    return null;
            }
            set
            {
                this.ViewState["valorMargem"] = value;
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
                

                Dictionary<string, object> parametrosAmortizacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidAmortizacao);
                this.numeroContrato = (long)parametrosAmortizacao["numeroContrato"];
                this.tipoContrato = (TipoContrato)parametrosAmortizacao["tipoContrato"];
                this.dataAmortizacao = (DateTime)parametrosAmortizacao["dataAmortizacao"];
                this.idMutuario = (int)parametrosAmortizacao["idMutuario"];
                this.novoPrazo = int.Parse(parametrosAmortizacao["prazo"].ToString());
                this.prazoAnterior = int.Parse(parametrosAmortizacao["prazoAnterior"].ToString());
                this.valorAmortizacao = (double?)parametrosAmortizacao["valor"];
                this.valorMargem = (double?)parametrosAmortizacao["margem"];

                List<ItemContrato> itens = null;

                try
                {

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        itens = cliente.contrato.calcularItensAmortizacao(tipoContrato, this.numeroContrato, this.dataAmortizacao, this.novoPrazo, this.valorAmortizacao, this.valorMargem);
                        gridItens.DataSource = itens.FindAll(i => i.tipoEvento.chave == TipoEvento.amortizacao.chave);
                        gridItens.DataBind();

                        labelValorParcela.Text = itens.Find(i => i.tipoEvento.chave == TipoEvento.prestacao.chave && i.centraliza == 1 && i.destacado == 0).valor.ToString("N2");

                        //William Moreira da Silva - SOL 216458 KTN
                        if (itens.Find(i => i.tipoEvento.chave == 1 && i.destacado == 1) != null)
                        {
                            labelValorFGQC.Text = itens.Find(i => i.tipoEvento.chave == 1 && i.destacado == 1).valor.ToString("N2"); // SOL 168644 Xavier - Verificar origem para parcela 1 para fgqc 2 -- Alteração NILTON 10/12/2012
                        }
                        else
                        {
                            labelValorFGQC.Text = "0,00";
                        }
                        //William Moreira da Silva - SOL 216458 KTN

                        parametrosAmortizacao["itens"] = itens.Where(t1 => t1.tipoEvento == TipoEvento.amortizacao).ToList();

                    }
                }
                catch (FaultException<ContratoFaltaNegocio> ex)
                {
                    this.registrarAlerta(this.tratarMensagem(ex.Detail.mensagemErro));
                }

                this.proxyEstado.manterEstadoSincrono(this.guidAmortizacao, parametrosAmortizacao);

                List<DadosBancarios> dadosBancarios = null;

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    //dadosBancarios = cliente.contrato.consultarContaBancaria(this.idMutuario, 0, this.numeroContrato);
                    dadosBancarios = cliente.contrato.consultarContaBancaria(this.idMutuario, 0, 0);//William Moreira da Silva - SOL 216458 KTN
                    gridDadosBancarios.DataSource = dadosBancarios;
                    gridDadosBancarios.DataBind();

                    List<ContaCaixa> contasCaixa = cliente.contrato.listarContaCaixa();
                    UtilidadesPagina.preencherDropDown(comboFormaPagamento, contasCaixa.Where(t1 => t1.recPagamento.Equals("R")), EnumeradorItemPreenchimento.Nenhum, "descricao", "id");

                    List<TipoRecurso> tiposRecurso = cliente.contrato.listarTipoRecurso();
                    UtilidadesPagina.preencherDropDown(comboTipoRecurso, tiposRecurso, EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                }

                listaOpcoesFormaEnvio.Items[0].Selected = true;

                //William Moreira da Silva SOL 211419
                if (this.parcPosterior)
                {
                    this.registrarAlerta(MensagensAplicacao.instancia.mensagem042);
                    botaoConfirmar.Visible = false;
                }
                else
                {
                    this.habilitarBotaoConfirmar();
                }
                //William Moreira da Silva SOL 211419
            }

        }

        /// <summary>
        /// Evento de clique do botão Continuar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoConfirmar_Click(object sender, EventArgs e)
        {
            if (gridItens.Rows.Count == 0)
            {
                registrarAlerta("Amortização não pode ser concluída pois os itens não foram calculados.");
                return;
            }

            //Willliam Moreira da Silva - SOL 239915
            if (Session["amortizacao"] == "1")
            {
                registrarAlerta("Essa amortização já foi realizada.");
                return;
            }

            // Session["amortizacao"] = "1";  // Felipe A. Santos SOL 224034/17909 PPM 1165556 
            //Willliam Moreira da Silva - SOL 239915

            //William Moreira da Silva - SOL 216458 KTN
            int idContaCorrente = verificaContaSelecionada();
            if (idContaCorrente == 0)
            {
                return;
            }
            //verificar aqui o selecionamento da conta corrente.

            if (!this.verificaContaCaixa(idContaCorrente))
            {
                return;
            }
            //William Moreira da Silva - SOL 216458 KTN

            Dictionary<string, object> parametrosAmortizacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidAmortizacao);
            List<ItemContrato> itens = (List<ItemContrato>)parametrosAmortizacao["itens"];

            long itemCentralizador = 0;

            foreach (ItemContrato item in itens)
            {
                if (item.centraliza == 1)
                    itemCentralizador = item.id;
            }

            List<Historico> historico = new List<Historico>();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //Saulo / FUNCEF
                //Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                //William Moreira da Silva SOL 238689
                using (Cliente<IServicoMutuario> clienteMutuario = new Cliente<IServicoMutuario>())
                {
                    string usuario = Contexto.obterUsuario();
                    if (clienteMutuario.contrato.verificaMutuario(contrato.mutuario.id, usuario))
                    {
                        this.registrarAlerta(MensagensAplicacao.instancia.mensagem043);
                        return;
                    }
                }
                //William Moreira da Silva SOL 238689

                foreach (ItemContrato item in itens)
                {
                    Historico itemHistorico = new Historico();
                    itemHistorico.numeroContrato = this.numeroContrato;
                    if (itemCentralizador > 0)
                        itemHistorico.itemCentraliza = new ItemContrato() { id = itemCentralizador };
                    itemHistorico.item = item;
                    itemHistorico.parcela = item.parcela;
                    itemHistorico.tipoMovimento = item.tipoEvento;
                    itemHistorico.origem = Origem.amortizacao;
                    itemHistorico.formaCobranca = listaOpcoesFormaEnvio.SelectedValue;
                    itemHistorico.sequenciaCobranca = 1;
                    itemHistorico.prioridade = item.prioridade;
                    itemHistorico.centraliza = item.centraliza;
                    itemHistorico.destacado = item.destacado;
                    itemHistorico.data = DateTime.Today;
                    itemHistorico.dataPrevista = this.dataAmortizacao;
                    itemHistorico.dataEfetiva = null;
                    itemHistorico.dataAtualizacao = this.dataAmortizacao;
                    itemHistorico.anoCompetencia = this.dataAmortizacao.Year;
                    itemHistorico.mesCompetencia = this.dataAmortizacao.Month;
                    itemHistorico.anoCobranca = this.dataAmortizacao.Year;
                    itemHistorico.mesCobranca = this.dataAmortizacao.Month;
                    itemHistorico.valorPrevisto = item.valor;
                    itemHistorico.valorEfetivo = null;
                    itemHistorico.saldoDevedor = item.saldoDevedor.Value;
                    itemHistorico.taxaJuros = contrato.taxaJuros;
                    itemHistorico.baixado = 0;
                    itemHistorico.enviado = 0;
                    itemHistorico.rubrica = item.rubrica;
                    itemHistorico.pagarReceber = item.pagarReceber;
                    itemHistorico.numeroParcelas = this.novoPrazo;
                    itemHistorico.dataVencimento = this.dataAmortizacao;
                    itemHistorico.tipoDivergencia = 0;
                    itemHistorico.dataInclusao = DateTime.Now;
                    itemHistorico.usuarioInclusao = this.contextoSistema.loginUsuarioAtual;
                    itemHistorico.versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W");
                    itemHistorico.patrocinadora = contrato.patrocinadora;
                    itemHistorico.tipoRecurso = new TipoRecurso() { id = Convert.ToInt32(comboTipoRecurso.SelectedValue) };
                    itemHistorico.origemRecurso = caitaTextoOrigemRecurso.Text;
                    itemHistorico.parcelaAlternativa = 0;
                    itemHistorico.dadosBancarios = new DadosBancarios { id = idContaCorrente };//William Moreira da Silva - SOL 216458 KTN

                    historico.Add(itemHistorico);
                }

                historico = cliente.contrato.tratarHistoricoAmortizacao(historico);
                cliente.contrato.incluirHistorico(historico);

                cliente.contrato.executarAtualizacaoDiaria(numeroContrato);//William Moreira da Silva SOL 209315/14752

                LogContrato logContrato = new LogContrato()
                {
                    descricao = string.Format(String.Concat(Origem.amortizacao.descricao, ":{0}"), this.dataAmortizacao.ToString("dd/MM/yyyy")),
                    numeroContrato = contrato.numero,
                    origem = Origem.quitacao,
                };

                cliente.contrato.incluirLog(logContrato);
            }

            Session["amortizacao"] = "1";  // Felipe A. Santos SOL 224034/17909 PPM 1165556 

            this.confirmarOperacao(MensagensAplicacao.instancia.mensagem031, "~/Paginas/Transacoes/Amortizacao/Listagem.aspx");
        }

        /// <summary>
        /// Evento de clique do botão Voltar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoVoltar_Click(object sender, EventArgs e)
        {
            //William Moreira da Silva - SOL 238246
            //Response.Redirect(String.Format("Itens.aspx?manterEstado=true&guidAmortizacao={0}", this.guidAmortizacao));
            Response.Redirect(String.Format("Itens.aspx?manterEstado=true&guidAmortizacao={0}&msg={1}", this.guidAmortizacao, "False"));
            //William Moreira da Silva - SOL 238246
        }

        #endregion

        #region Métodos

        //William Moreira da Silva - SOL 216458 KTN INICIO
        /// <summary>
        /// Retorana a conta selecionada pelo usuario
        /// </summary>
        /// <returns>o id da conta selecionada</returns>
        public int verificaContaSelecionada()
        {
            int idConta = 0;
            if (gridDadosBancarios.chavesSelecionadas.Count == 1)
            {
                DataKey datakey = gridDadosBancarios.chavesSelecionadas[0];
                idConta = (int)datakey.Values[0];
            }
            else
            {
                if (gridDadosBancarios.chavesSelecionadas.Count > 1)
                {
                    this.registrarAlerta("Selecione apenas uma conta corrente.");
                    return idConta;
                }
                else
                {
                    this.registrarAlerta("Selecione ao menos uma conta corrente.");
                    return idConta;
                }
            }

            return idConta;
        }

        /// <summary>
        /// Verifica se a conta selecionada para quitação é da caixa econômica federal
        /// </summary>
        /// <param name="idContaCorrente">È passado o id da conta </param>
        /// <returns>Retorna se a conta é ou não da Caixa</returns>
        private bool verificaContaCaixa(int idContaCorrente)
        {
            int iIdConta = 0;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                iIdConta = cliente.contrato.consultarCodigoBanco(idContaCorrente);
            }

            if (iIdConta != 91008)
            {
                this.registrarAlerta("A conta bancária selecionada deve ser obrigatoriamente da Caixa Econômica Federal.");
                return false;
            }
            return true;
        }
        //William Moreira da Silva - SOL 216458 KTN FIM

        private void habilitarBotaoConfirmar()
        {
            Historico historico = new Historico();

            historico.numeroContrato = this.numeroContrato;
            historico.envio = 1;
            historico.tipoMovimento = TipoEvento.prestacao;

            historico.filtroHistorico = new FiltroHistorico()
            {
                internos = false,
                atualizacaoDiaria = false,
                emAberto = 3,
                estorno = 2,
                dataPrevistaDe = this.dataAmortizacao
            };

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                ParametrosConsulta parametros = new ParametrosConsulta();
                //William Moreira da Silva - SOL 208775 KINTANA 2017860
                /*if (cliente.contrato.consultarHistorico(historico, ref parametros).Count > 0)
                {
                    botaoConfirmar.Visible = (this.prazoAnterior == this.novoPrazo);
                }*/
                //William Moreira da Silva - SOL 208775 KINTANA 2017860
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
