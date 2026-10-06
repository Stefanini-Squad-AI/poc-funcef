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
#region SIG 36305
/// Autor:
/// William Moreira da Silva
///
/// Descrição da Alteração:
/// Colocar data efetiva para quitações por falecimento
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
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using System.Reflection;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Quitacao
{
    /// <summary>
    /// Representa a página de itens para cálculo de quitação.
    /// </summary>
    public partial class Valores : PaginaSegura
    {
        #region Propriedades

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

        private DateTime dataQuitacao
        {
            get
            {
                if (this.ViewState["dataQuitacao"] != null)
                    return (DateTime)this.ViewState["dataQuitacao"];
                else
                    return DateTime.MinValue;
            }
            set
            {
                this.ViewState["dataQuitacao"] = value;
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
        private bool campanhaInadimplencia
        {
            get
            {
                if (this.ViewState["campanhaInadimplencia"] != null)
                    return (bool)this.ViewState["campanhaInadimplencia"];
                else
                    return false;
            }
            set
            {
                this.ViewState["campanhaInadimplencia"] = value;
            }
        }
        private List<ItemDescontoContrato> descontoQuitacao
        {
            get
            {
                if (this.ViewState["Desconto"] != null)
                    return (List<ItemDescontoContrato>)this.ViewState["Desconto"];
                else
                    return new List<ItemDescontoContrato>();
            }

            set
            {
                this.ViewState["Desconto"] = value;
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
                Dictionary<string, object> parametrosQuitacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidQuitacao);
                this.numeroContrato = (long)parametrosQuitacao["numeroContrato"];
                this.tipoContrato = (TipoContrato)parametrosQuitacao["tipoContrato"];
                this.dataQuitacao = (DateTime)parametrosQuitacao["dataQuitacao"];
                this.idMutuario = (int)parametrosQuitacao["idMutuario"];
                this.campanhaInadimplencia = (bool)parametrosQuitacao["CampanhaInadimplencia"]; //SIG 67808 - Matias           

                List<ItemContrato> itens = null;

                try
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        itens = cliente.contrato.calcularItensQuitacao(tipoContrato, this.numeroContrato, this.dataQuitacao, TipoOperacao.quitacao, this.campanhaInadimplencia);
                        gridItens.DataSource = itens;
                        gridItens.DataBind();
                        if (campanhaInadimplencia)
                            descontoQuitacao = cliente.contrato.obterDesconto(this.numeroContrato, this.tipoContrato.id, this.dataQuitacao, itens, 3, 1);

                        parametrosQuitacao["itens"] = itens;
                    }
                }
                catch (FaultException<ContratoFaltaNegocio> ex)
                {
                    this.registrarAlerta(this.tratarMensagem(ex.Detail.mensagemErro));
                }

                this.proxyEstado.manterEstadoSincrono(this.guidQuitacao, parametrosQuitacao);

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
                registrarAlerta("Quitação não pode ser concluída pois os itens não foram calculados.");
                return;
            }

            //Willliam Moreira da Silva - SOL 239915
            if (Session["quitacao"] != null && Session["quitacao"].ToString() == "1")
            {
                registrarAlerta("Essa quitação já foi realizada.");
                return;
            }
            
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

            Dictionary<string, object> parametrosQuitacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidQuitacao);
            List<ItemContrato> itens = (List<ItemContrato>)parametrosQuitacao["itens"];

            long itemCentralizador = 0;
            foreach (ItemContrato item in itens)
            {
                if (item.centraliza == 1)
                    itemCentralizador = item.id;
            }

            List<Historico> historico = new List<Historico>();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                // Saulo / FUNCEF
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

                    itemHistorico.id = item.id;//William Moreira da Silva SOL 210452 KINTANA 2029466
                    itemHistorico.numeroContrato = this.numeroContrato;
                    if (itemCentralizador > 0)
                        itemHistorico.itemCentraliza = new ItemContrato() { id = itemCentralizador };
                    itemHistorico.item = item;
                    itemHistorico.parcela = 0;
                    itemHistorico.tipoMovimento = item.tipoEvento;
                    
                    //William Moreira da Silva - SIG 36305
                    //itemHistorico.dataEfetiva = null;
                    //William Moreira da Silva - SIG 36305
                    
                    if (item.valor != 0)
                        itemHistorico.valorEfetivo = null;
                    else
                        itemHistorico.valorEfetivo = 0;

                    //William Moreira da Silva - SOL 262601 - PPM 1129625
                    if (!contrato.mutuario.dataFalecimento.HasValue)
                    {
                        itemHistorico.origem = Origem.quitacao;

                        //William Moreira da Silva - SIG 36305
                        itemHistorico.dataEfetiva = null;
                        //William Moreira da Silva - SIG 36305
                    }
                    else
                    {
                        itemHistorico.origem = Origem.quitacaoMorte;

                        //William Moreira da Silva - SIG 36305
                        if (itemCentralizador == item.id)
                        {
                            itemHistorico.dataEfetiva = this.dataQuitacao;
                        }
                        else
                        {
                            itemHistorico.dataEfetiva = null;
                        }
                        //William Moreira da Silva - SIG 36305
                    }

                    itemHistorico.formaCobranca = listaOpcoesFormaEnvio.SelectedValue;
                    itemHistorico.sequenciaCobranca = 1;
                    itemHistorico.prioridade = item.prioridade;
                    itemHistorico.centraliza = item.centraliza;
                    itemHistorico.destacado = item.destacado;
                    itemHistorico.data = DateTime.Now;
                    itemHistorico.dataPrevista = this.dataQuitacao;
                    itemHistorico.dataAtualizacao = this.dataQuitacao;
                    itemHistorico.anoCompetencia = this.dataQuitacao.Year;
                    itemHistorico.mesCompetencia = this.dataQuitacao.Month;
                    itemHistorico.anoCobranca = this.dataQuitacao.Year;
                    itemHistorico.mesCobranca = this.dataQuitacao.Month;
                    itemHistorico.valorPrevisto = item.valor;
                    itemHistorico.saldoDevedor = 0;
                    itemHistorico.taxaJuros = 0;
                    itemHistorico.baixado = 0;
                    itemHistorico.enviado = 0;
                    itemHistorico.rubrica = item.rubrica;
                    itemHistorico.pagarReceber = item.pagarReceber;
                    itemHistorico.numeroParcelas = 0;
                    itemHistorico.dataVencimento = this.dataQuitacao;
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

                if (this.campanhaInadimplencia == true)
                {
                    double ValorDesconto = cliente.contrato.calcularGravarDesconto(this.numeroContrato, contrato.tipo.id, this.dataQuitacao, itens, 3, 1);

                    //WO13621
                    using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
                    {
                        client.contrato.IncluirEventoDeCobranca((double)numeroContrato,
                                                                     DateTime.Today.Date,
                                                                     32,
                                                                     "Evento automático por adesão à Política de Recuperação de Crédito (P1).");


                        if (ValorDesconto > 300)
                        {
                            client.contrato.incluirContratoEmptmoSuspconcessao(numeroContrato,
                                                                                this.idMutuario,
                                                                                "Bloqueio automático por adesão à Política de Recuperação de Crédito (P1).",
                                                                                21,
                                                                                12,
                                                                                "89, 90, 92, 93");
                        }
                    }
                }

                cliente.contrato.gravarQuitacao(this.numeroContrato, this.dataQuitacao, historico);

                double saldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, this.dataQuitacao.AddDays(-1));//William Moreira da Silva - SOL 201217 KINTANA 1944822
                cliente.contrato.executarAjusteSaldo(this.numeroContrato, this.dataQuitacao, saldoDevedor);//William Moreira da Silva - SOL 201217 KINTANA 1944822
            }



            Session["quitacao"] = "1"; // Felipe A. Santos SOL 224034/17909 PPM 1165556 

            //if (this.campanhaInadimplencia == true)
            //{
            //    MontarContratoTermo();
            //}

            this.confirmarOperacao(MensagensAplicacao.instancia.mensagem032, "~/Paginas/Transacoes/Quitacao/Listagem.aspx");

        }

        /// <summary>
        /// Evento de clique do botão Voltar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("Itens.aspx?manterEstado=true&guidQuitacao={0}&campanha={1}", this.guidQuitacao, this.campanhaInadimplencia));
        }

        #endregion

        //William Moreira da Silva - SOL 216458 KTN INICIO
        #region metodos

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
        #endregion
        //William Moreira da Silva - SOL 216458 KTN FIM

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

        public RelatorioContrato ObterDadosContrato(long numeroContrato)
        {

            ObjetoContrato contrato = new ObjetoContrato(numeroContrato);
            RelatorioContrato dadosContratos = new RelatorioContrato();


            //contrato = cliente.contrato.consultarContrato(this.numeroContrato); Saulo / FUNCEF
            if (Request.QueryString["dataQuitacao"] == null)
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    dataQuitacao = cliente.contrato.calcularDataLimiteDebito(DateTime.Now);
                }

            if (contrato != null)
            {
                dadosContratos.numeroContrato = contrato.numero;
                dadosContratos.mutuario = contrato.mutuario;
                dadosContratos.tipoContrato = contrato.tipo;
                dadosContratos.dataAssinatura = (DateTime)contrato.dataAssinatura;
                dadosContratos.valorSolicitado = (contrato.valorContrato.HasValue) ? (double)contrato.valorContrato : 0;
            }
            return dadosContratos;
        }

        public void AbrirContratoTermo(RelatorioContrato ContratoTermo)
        {
            this.proxyEstado.manterEstado(guidQuitacao, ContratoTermo);
            String strurl = String.Format("ImpressaoContrato.aspx?guidQuitacao={0}", guidQuitacao);

            //abrir a janela com a função exibirDialogo bem como showModalDialog não permite a impressao do contrato em pdf                   
            String strscript = "window.open('" + strurl + "', '_blank','toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,modal=no')";

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Contrato", strscript, true);

        }

        public void botaoDesconto_Click(object sender, EventArgs e)
        {
            if (campanhaInadimplencia)
            {
                string guidDesconto = Guid.NewGuid().ToString();
                this.proxyEstado.manterEstadoSincrono(guidDesconto, descontoQuitacao);
                //Abrir o form em um popup
                String strurl = String.Format("PopupDesconto.aspx?guidDesconto={0}", guidDesconto);
                String strscript = "window.open('../../Popup/" + strurl + "', 'name','height=280,width=720,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup para exibição dos descontos", strscript, true);
            }
            else
            {
                this.registrarAlerta("Para ativar o desconto é necessário voltar e marcar a opção Campanha de Inadimplência.");
            }
        }
    }
}
