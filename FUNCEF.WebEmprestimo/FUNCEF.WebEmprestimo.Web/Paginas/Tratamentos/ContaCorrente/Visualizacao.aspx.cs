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
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System.Collections.Generic;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.Reflection;

using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ContaCorrente
{
    /// <summary>
    /// Representa a página de visualização de usuários do sistema.
    /// </summary>
    public partial class Visualizacao : PaginaSegura
    {
        #region Propriedades

        private long numContrato
        {
            get
            {
                string queryString = Request.QueryString["Numero"];
                long numero = 0;

                long.TryParse(queryString, out numero);

                return numero;
            }
        }

        //William Moreira da Silva SOL 238689
        private int idPessoa
        {
            get
            {
                if (this.ViewState["idPessoa"] != null)
                    return (int)this.ViewState["idPessoa"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idPessoa"] = value;
            }
        }
        //William Moreira da Silva SOL 238689

        /// <summary>
        /// Guarda Conta Corrente para fazer log
        /// </summary>
        private int contaCorrenteAnterior
        {
            get
            {
                if (ViewState["contaCorrenteAnterior"] != null)
                {
                    return (int)ViewState["contaCorrenteAnterior"];
                }
                else
                {
                    return 0;
                }

            }

            set { ViewState["contaCorrenteAnterior"] = value; }
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
                this.carregarDetalhesContrato();
                this.habilitarAlteracao(false);
            }
            else
                this.alterarVisao();

        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceBeneficiariosSeguro_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //Verifica quais parametros usar.
            tratarFiltros(ref e);
        }

        /// <summary>
        /// Ocorre quando o botão Alterar é pressionado.
        /// </summary>
        /// <param name="sender">Objeto disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoAlterar_Click(object sender, EventArgs e)
        {
            if (caixaSelecaoContaBancariaDebito.Items.Count > 0)
            {
                this.habilitarAlteracao(true);
                this.recipienteAbaContratoPrincipal.ActiveTabIndex = 1;
            }
            else
                this.registrarAlerta(MensagensAplicacao.instancia.mensagem040);
        }

        /// <summary>
        /// Ocorre quando o botão Ok é pressionado.
        /// </summary>
        /// <param name="sender">Objeto disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoOk_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                try
                {
                    if (String.Equals(hiddenStatus.Value, "S"))
                        this.salvar();
                    else
                        this.cancelar();
                }
                catch (FaultException<ContratoFaltaNegocio> ex)
                {
                    this.registrarAlerta(ex.Detail.mensagemErro);
                }
            }
        }

        #endregion

        #region Métodos de Apoio

        private void carregarDetalhesContrato()
        {
            //Contrato contrato = null;
            // Saulo / FUNCEF
            ObjetoContrato contrato = new ObjetoContrato(this.numContrato);

            idPessoa = contrato.mutuario.id;//William Moreira da Silva SOL 238689

            List<Contrato> logs = new List<Contrato>();

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //contrato = cliente.contrato.consultarContaCorrente(this.numContrato); //Saulo / FUNCEF

                logs = cliente.contrato.consultarLogDadosContratuais(this.numContrato);
            }

            if (logs.Count > 0)
                gridHistorico.DataSource = logs;
            else
                gridHistorico.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

            gridHistorico.DataBind();

            // Informações Gerais
            labelNumeroContrato.Text = contrato.numero.ToString();
            labelSituacaoContrato.Text = contrato.situacao.descricao;
            labelInscricaoPrevidenciaria.Text = contrato.mutuario.inscricaoPrevidenciaria.ToString();
            labelMatriculaEmpresa.Text = contrato.mutuario.matricula;
            labelSituacaoParticipante.Text = contrato.mutuario.situacao;
            labelInscricaoEmprestimo.Text = contrato.inscricaoEmprestimo.id.ToString();
            labelPlanoPrevidenciario.Text = contrato.plano.descricao;
            labelPatrocinadora.Text = contrato.patrocinadora.nome;
            labelNome.Text = contrato.mutuario.nome;

            // Informações da Aba "Informações Contratuais"
            labelBeneficiario.Text = contrato.beneficiario.nome;
            labelDataAssinatura.Text = contrato.dataAssinatura.HasValue ? contrato.dataAssinatura.Value.ToString("dd/MM/yyyy") : "";
            labelDataCredito.Text = (contrato.dataCredito.HasValue) ? contrato.dataCredito.Value.ToString("dd/MM/yyyy") : string.Empty;
            LabelValorSolicitado.Text = contrato.valorContrato.ToString();
            labelTipoContrato.Text = contrato.tipo.descricao;
            labelTipoEmprestimo.Text = contrato.tipoEmprestimo.descricao;

            // Informações da Aba "Alterações Contratuais"
            if (contrato.formaRecebimento.Equals("C"))
                botaoSelecaoUnicaContasReceber.Checked = true;
            else
                botaoSelecaoUnicaFolhaPagamento.Checked = true;

            List<DadosBancarios> listaDadosBancarios = null;
            List<ContaCaixa> listaContaCaixa = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaDadosBancarios = cliente.contrato.consultarContaBancaria(contrato.mutuario.id, 0, 0);
                listaContaCaixa = cliente.contrato.listarContaCaixa().Where(t1 => t1.recPagamento.Equals("R")).ToList<ContaCaixa>();
            }

            if (listaDadosBancarios == null)
                this.registrarAlerta(MensagensAplicacao.instancia.mensagem040);

            if (listaDadosBancarios != null)
            {
                if (listaDadosBancarios.Count > 0)
                {
                    foreach (DadosBancarios dadosBancarios in listaDadosBancarios)
                        caixaSelecaoContaBancariaDebito.Items.Add(new ListItem(dadosBancarios.dados, dadosBancarios.id.ToString()));

                    caixaSelecaoContaBancariaDebito.SelectedValue = contrato.mutuario.dadosBancarios.id.ToString();
                    contaCorrenteAnterior = contrato.mutuario.dadosBancarios.id;
                }
            }

            if (!listaContaCaixa.Count.Equals(0))
            {
                foreach (ContaCaixa contaCaixa in listaContaCaixa)
                    caixaSelecaoContaCaixaFormaRecebimento.Items.Add(new ListItem(contaCaixa.descricao, contaCaixa.id.ToString()));

                caixaSelecaoContaCaixaFormaRecebimento.SelectedIndex = 0;
            }

            caixaNumericaUpDownNumeroParcelasAtrasadasCobranca.Text = contrato.numeroParcelasAtrasadas.ToString();

            // Carrega a Aba "Beneficiários de Seguro"
            this.carregarBeneficiariosSeguro();

            if (caixaSelecaoContaBancariaDebito.Items.Count > 0)
                // Salva as informações do contratro.
                this.proxyEstado.manterEstadoSincrono("dadosContrato", this.gerarContratoAlteracao());

        }

        private void carregarBeneficiariosSeguro()
        {
            List<Beneficiario> beneficiarios = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                beneficiarios = cliente.contrato.consultarBeneficiarios(this.numContrato);
                if (!beneficiarios.Count.Equals(0))
                    gridBeneficiariosSeguro.DataSource = beneficiarios;
                else
                    gridBeneficiariosSeguro.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridBeneficiariosSeguro.DataBind();
            }
        }

        private void habilitarAlteracao(bool habilitar)
        {
            botaoSelecaoUnicaContasReceber.Enabled = habilitar;
            botaoSelecaoUnicaFolhaPagamento.Enabled = habilitar;
            caixaSelecaoContaBancariaDebito.Enabled = habilitar;
            caixaSelecaoContaCaixaFormaRecebimento.Enabled = habilitar ? botaoSelecaoUnicaContasReceber.Checked : habilitar;
            caixaNumericaUpDownNumeroParcelasAtrasadasCobranca.Enabled = habilitar;
            this.alterarVisaoBotoes(habilitar);
        }

        private void alterarVisaoBotoes(bool habilitar)
        {
            botaoSalvar.Visible = habilitar;
            botaoAlterar.Visible = !habilitar;
        }

        private void alterarVisao()
        {
            if (botaoSelecaoUnicaContasReceber.Enabled)
            {
                caixaSelecaoContaCaixaFormaRecebimento.Enabled = botaoSelecaoUnicaContasReceber.Checked;
                this.alterarVisaoBotoes(true);
            }
            else
            {
                this.alterarVisaoBotoes(false);
            }
        }

        private void salvar()
        {
            Contrato contrato = this.gerarContratoAlteracao();

            //Marcio Sanches Spinosa SOL 201765 Kintana 2006964
            if (!verificarDadosBancariosOperacoes(contrato.mutuario.dadosBancarios.id))
                return;
            //Marcio Sanches Spinosa SOL 201765 Kintana 2006964


            //William Moreira da Silva SOL 238689
            using (Cliente<IServicoMutuario> clienteMutuario = new Cliente<IServicoMutuario>())
            {
                string usuario = Contexto.obterUsuario();
                if (clienteMutuario.contrato.verificaMutuario(idPessoa, usuario))
                {
                    this.registrarAlerta(MensagensAplicacao.instancia.mensagem043);
                    return;
                }
            }
            //William Moreira da Silva SOL 238689


            if (this.verificarAlteracoesContratuais(contrato))
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    if (cliente.contrato.alterarInformacoesContratuais(contrato))
                    {
                        cliente.contrato.incluirLogDadosContratuais(contrato.numero, contaCorrenteAnterior, this.contextoSistema.loginUsuarioAtual);

                        this.proxyEstado.manterEstadoSincrono("dadosContrato", contrato);
                    }
                }
            }

            this.redirecionarComAlerta("Processo finalizado. Contrato Alterado.", "~/Paginas/Tratamentos/ContaCorrente/Listagem.aspx?manterEstado=true");
        }

        private void cancelar()
        {
            // Volta ao estado inicial da aba de alteração.
            Contrato contrato = (Contrato)this.proxyEstado.obterEstado("dadosContrato");

            if (contrato.formaRecebimento.Equals("C"))
                botaoSelecaoUnicaContasReceber.Checked = true;
            else
                botaoSelecaoUnicaFolhaPagamento.Checked = true;

            caixaSelecaoContaBancariaDebito.SelectedValue = contrato.mutuario.dadosBancarios.id.ToString();
            caixaSelecaoContaCaixaFormaRecebimento.SelectedIndex = 0;
            caixaNumericaUpDownNumeroParcelasAtrasadasCobranca.Text = contrato.numeroParcelasAtrasadas.ToString();
            habilitarAlteracao(false);
        }

        private Contrato gerarContratoAlteracao()
        {
            Contrato contrato = new Contrato()
            {
                formaRecebimento = (botaoSelecaoUnicaFolhaPagamento.Checked ? "F" : "C"),
                numero = Convert.ToInt64(labelNumeroContrato.Text),
                numeroParcelasAtrasadas = Convert.ToInt32(caixaNumericaUpDownNumeroParcelasAtrasadasCobranca.Text),
                portadorRecebimento = caixaSelecaoContaCaixaFormaRecebimento.SelectedValue,
                mutuario = new Mutuario()
                {
                    dadosBancarios = new DadosBancarios()
                    {
                        id = Convert.ToInt32(caixaSelecaoContaBancariaDebito.SelectedValue)
                    }
                }
            };

            return contrato;
        }

        /// <summary>
        /// Verifica se os dados do contrato foram alterados.
        /// </summary>
        /// <param name="dadosContratoAtual">Dados do contrato atuais.</param>
        /// <returns>Se o dado foi alterado.</returns>
        private bool verificarAlteracoesContratuais(Contrato dadosContratoAtual)
        {
            Contrato dadosContratoInicial = (Contrato)this.proxyEstado.obterEstado("dadosContrato");

            return !(dadosContratoInicial.formaRecebimento.Equals(dadosContratoAtual.formaRecebimento) && dadosContratoInicial.numero.Equals(dadosContratoAtual.numero) && dadosContratoInicial.numeroParcelasAtrasadas.Equals(dadosContratoAtual.numeroParcelasAtrasadas) && dadosContratoInicial.portadorRecebimento.Equals(dadosContratoAtual.portadorRecebimento) && dadosContratoInicial.mutuario.dadosBancarios.id.Equals(dadosContratoAtual.mutuario.dadosBancarios.id));
        }

        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964
        /// <summary>
        /// Verifica se os dados bancários atendem as operações 001 e/ou 003
        /// </summary>
        /// <param name="verificarDadosBancariosOperacoes">Dados bancarios alteradors</param>
        /// <returns>Se o dado foi alterado.</returns>
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Inicio
        private bool verificarDadosBancariosOperacoes(int pIdContaCorrente)
        {
            DadosBancarios listaDadosBancarios = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaDadosBancarios = cliente.contrato.consultarContaBancariaOperacao(pIdContaCorrente);

                //if (listaDadosBancarios.contaCorrente.Substring(0, 3).Contains("001") && listaDadosBancarios.banco == 91008)
                //    return true;
                //else if (listaDadosBancarios.contaCorrente.Substring(0, 3).Contains("013") && listaDadosBancarios.banco == 91008)
                //    return true;
                //else
                if ((listaDadosBancarios.Tipo == 2 || listaDadosBancarios.Tipo == 0) || listaDadosBancarios.banco != 91008)
                {
                    this.registrarAlerta("O Banco selecionado deve ser somente a CAIXA e contas Correntes ou Conta Poupança.");
                    return false;
                }
                else 
                { 
                    return true; 
                }
            }
        }
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Fim
        #endregion

        #region Contexto da Página / Permissões

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.alteracoesContratuais;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
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
