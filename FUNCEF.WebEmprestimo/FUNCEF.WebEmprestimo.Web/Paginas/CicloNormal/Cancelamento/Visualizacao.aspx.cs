#region SIG 93932
///
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Alteração:
/// 26/12/2019
///
/// Descrição da Alteração:
/// Ajuste na mensagem do Cancelamento de Concessão
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 30/01/2017
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion
#region SOL 238824 / PPM 508902
///
/// Autor:
/// Fernando Francisco Xavier
///
/// Data da Alteração:
/// 09/09/2014 15:39:10
///
/// Descrição da Alteração:
/// O Sistema não diferenciava conta de credito e debito
///
#endregion

using System;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FUNCEF.Planus.GlobalWeb.Web.IU;

using System.Collections.Generic;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using System.Net;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Cancelamento
{
    /// <summary>
    /// Representa a página de visualização de usuários do sistema.
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

        private Mutuario mutuario
        {
            get
            {
                if (this.ViewState["mutuario"] != null)
                    return (Mutuario) this.ViewState["mutuario"];
                else
                    return new Mutuario();
            }
            set
            {
                this.ViewState["mutuario"] =value;
            }
        }
        private long idInscricao
        {
            get
            {
                if (this.ViewState["idInscricao"] != null)
                    return (long)this.ViewState["idInscricao"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idInscricao"] = value;
            }
        }
        #endregion

        #region Eventos


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                this.carregarContratosQuitados();
                   
                this.carregarContaBancaria();
                this.carregarContaBancariaDebito();
                this.carregarDetalhesAplicacao();
                

                botaoCancelarConcessao.Enabled = false;                                         
                //botaoCancelarConcessao.CssClass = "disabledStyle";
            }
            
            this.verificarPermissoes();            
        }

        protected void dataSourceItens_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (e.InputParameters.Count == 0)
            {
                e.InputParameters.Add("numero", this.numeroContrato);
            }
        }
        protected void gridHistorico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Attributes["onClick"] = String.Format("exibirDialogo('PopupHistorico.aspx?idHistorico={0}&numeroContrato={1}', 1100, 530); return false;", ((Historico)e.Row.DataItem).id, this.numeroContrato);//William Moreira da Silva - SOL 199847 KINTANA 1926357

                if (DataBinder.Eval(e.Row.DataItem, "valorEfetivoTexto").ToString() == "(estornado)")
                {
                    e.Row.Cells[11].ForeColor = System.Drawing.Color.Red;
                }

                e.Row.Cells[1].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[1].Text);
                e.Row.Cells[2].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[2].Text);
                e.Row.Cells[17].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[17].Text);

                string auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[1].Text);

                if (auxiliar.Length > 16)
                {
                    e.Row.Cells[1].Text = auxiliar.Substring(0, 16);
                }

                auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[2].Text);

                if (auxiliar.Length > 16)
                {
                    e.Row.Cells[2].Text = auxiliar.Substring(0, 16);
                }

                auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[17].Text);

                if (auxiliar.Length > 10)
                {
                    e.Row.Cells[17].Text = auxiliar.Substring(0, 10);
                }
            }
       
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Attributes.Add("Title", e.Row.Cells[1].Text);
                e.Row.Cells[2].Attributes.Add("Title", e.Row.Cells[2].Text);
                e.Row.Cells[3].Attributes.Add("Title", e.Row.Cells[3].Text);
                e.Row.Cells[4].Attributes.Add("Title", "Sequencial");
                e.Row.Cells[5].Attributes.Add("Title", "Mês/Ano Competência");
                e.Row.Cells[6].Attributes.Add("Title", "Mês/Ano Cobrança");
                e.Row.Cells[7].Attributes.Add("Title", "Data Prevista");
                e.Row.Cells[8].Attributes.Add("Title", "Data Vencimento");
                e.Row.Cells[9].Attributes.Add("Title", "Valor Previsto");
                e.Row.Cells[10].Attributes.Add("Title", "Data Efetiva");
                e.Row.Cells[11].Attributes.Add("Title", "Valor Efetivo");
                e.Row.Cells[12].Attributes.Add("Title", "Saldo Devedor");
                e.Row.Cells[13].Attributes.Add("Title", "Envio");
                e.Row.Cells[14].Attributes.Add("Title", "Data envio");
                e.Row.Cells[15].Attributes.Add("Title", "Data Recebimento");
                e.Row.Cells[16].Attributes.Add("Title", "Taxa de Juros");
                e.Row.Cells[17].Attributes.Add("Title", "Tipo de Suspensão");
            }
        }

        protected void gridEventosCobranca_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink link = e.Row.Cells[0].Controls[0] as HyperLink;

                Historico historico = (Historico)e.Row.DataItem;

                if (link != null)
                {
                    link.Attributes["onClick"] = String.Format("exibirDialogo('PopupHistoricoCobranca.aspx?numeroContrato={0}&tipoEvento={1}&dataEvento={2}&idEvento={3}', 750, 530); return false;", this.numeroContrato, historico.eventoCobranca.id, historico.data.ToString("dd/MM/yyyy"), historico.id);
                    link.Style[HtmlTextWriterStyle.Cursor] = "pointer";
                }
            }
        }

        protected void gridHistorico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }

        protected void gridItens_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            recipienteAbaContratoPrincipal.ActiveTabIndex = 3;
        }

        protected void botaoAjustarSaldo_Click(object sender, EventArgs e)
        {
            int idIndex = 0;

            if (Request["rbItemHistorico"] == null)
            {
                this.registrarAlerta("Selecione um registro para Ajustar Saldo");
                return;
            }
            else
            {
                idIndex = int.Parse(Request["rbItemHistorico"].ToString());
            }

            try
            {
                //DataKey dataKey = gridHistorico.DataKeys[idIndex];

                //DateTime dataPrevista = (DateTime)dataKey.Values[0]; //Era utilizado data atualização.
                //double saldoDevedor = (double)dataKey.Values[1];


                //using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                //{
                //    cliente.contrato.executarAjusteSaldo(this.numeroContrato, dataPrevista, saldoDevedor);
                //}

                //this.carregarGridLog();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }

            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }

        protected void botaoCancelarConcessao_Click(object sender, EventArgs e)
        {

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                if (cliente.contrato.verificarAtualizacaoDiaria(numeroContrato, DateTime.Today))
                {
                    this.registrarScript("Validação", String.Format("ConfirmarComAtualizacaoDiaria();"));
                }
                else if (cliente.contrato.VerificarDocumentoBaixado(numeroContrato))
                {
                    registrarAlerta("Documento já baixado para o contrato ou encaminhado para pagamento."); //TAES - SIG93932
                }
                else if (cliente.contrato.VerificaExistenciaPrestacoes(numeroContrato))
                {
                    registrarAlerta("O contrato não pode ser cancelado.");
                }
                else
                {
                    CancelarConcessaoEmprestimo();
                };
            }
        }
        protected void botaoOcultoCancelarConcessao_Click(object sender, EventArgs e)
        {            
            CancelarConcessaoEmprestimo();
        }

        #endregion

        #region Métodos de Apoio

        private void carregarDetalhesAplicacao()
        {
            ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);
            List<ItemContrato> itensEmAberto = null;

            string saldoDevedor = string.Empty;


            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //Consultar o saldo devedor do contrato.
                saldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, DateTime.Today).ToString("N2");

                List<ItemContrato> lista = cliente.contrato.listarItens();
                
                #region Carregar Grid de Itens em Aberto

                ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                double valorTotalItens = 0;
                itensEmAberto = cliente.contrato.obterItensContratoEmAberto(this.numeroContrato, ref parametrosConsulta, ref valorTotalItens);          

                string itensAberto = parametrosConsulta.totalRegistros.ToString(); 

                #endregion
            }

            if (contrato != null)
            {
                #region Aba Contrato

                labelNumeroContrato.Text = contrato.numero.ToString();

                //labelContratoCabecalho.Visible = true;
                //labelContratoCabecalho.Text = contrato.numero.ToString();
                //labelNomeCabecalho.Visible = true;
                //labelNomeCabecalho.Text = contrato.mutuario.nome;
                if (!string.IsNullOrEmpty(contrato.numProtocolo))
                {
                    string NUP = contrato.numProtocolo.PadLeft(15, '0');
                    labelNUP.Text = NUP.Substring(0, 5) + "." + NUP.Substring(6, 6) + "/" + NUP.Substring(11, 4);

                }
                else
                {
                    labelNUP.Text = "";
                }

                labelAcordoJudicial.Text =  contrato.FlagAcordoJudicial == 1 ? "Sim" : "Não";

                this.mutuario = contrato.mutuario;
                this.idTipoContrato = contrato.idTipoContratoEmpto;
                this.idInscricao = contrato.inscricaoEmprestimo.id;

                Session["idSituacao"] = contrato.situacao.codigo;
                labelMutuario.Text = contrato.mutuario.nome;
                labelInscricaoPrevidenciara.Text = contrato.mutuario.inscricaoPrevidenciaria.ToString();
                labelMatriculaEmpresa.Text = contrato.mutuario.matricula;
                labelInscricaoEmprestimo.Text = contrato.inscricaoEmprestimo.id.ToString();
                labelPlanoPrevidenciario.Text = contrato.plano.descricao;
                labelEntidadeContabil.Text = contrato.plano.planoOrigem;
                labelSituacaoParticipante.Text = contrato.mutuario.situacao;
                labelPatrocinadora.Text = contrato.patrocinadora.nome;
                labelCedido.Text = contrato.patrocinadora.nomeCedido;
                labelSituacaoFuncional.Text = contrato.patrocinadora.situacaoFuncional;
                labelSituacaoPlano.Text = contrato.plano.situacao;

                chklistExcepcional.Visible = false;
                fdsExcepcional.Visible = false;
                this.carregarTiposExcepcional();

                if(contrato.excepcional && !chklistExcepcional.Visible)
                {
                    chklistExcepcional.Visible = true;
                    fdsExcepcional.Visible = true;
                    chklistExcepcional.Items[0].Selected = true;
                    chklistExcepcional.Items[1].Selected = true;
                    chklistExcepcional.Items[2].Selected = true;
                    chklistExcepcional.Items[3].Selected = true;
                }

                labelExcepcional.Text = contrato.excepcional == true? "Sim": "Não";
                labelInternet.Text = contrato.internet == true ? "Internet" : "Funcef" ;

                #region Aba Dados do Contrato

                labelTipoContrato.Text = contrato.tipo.descricao;
                labelIndexador.Text = contrato.indexador.sigla;
                labelResponsavel.Text = contrato.nomeResponsavel;
                labelDataAssinatura.Text = contrato.dataAssinatura.obterString();
                labelDataSolicitacao.Text = contrato.dataSolicitacao.obterString();
                labelDataCredito.Text = contrato.dataCredito.obterString();
                labelDataPrimeiraParcela.Text = contrato.dataPrimeiraParcela.obterString();

                #endregion

                #region Aba Valores

                labelValorSolicitado.Text = contrato.valorContrato.HasValue ? contrato.valorContrato.Value.ToString("N2") : "";
                labelValorParcelaBase.Text = contrato.valorParcela.HasValue ? contrato.valorParcela.Value.ToString("N2") : "";
                labelSalarioConsiderado.Text = contrato.salarioBase.HasValue ? contrato.salarioBase.Value.ToString("N2") : "";
                labelTaxaJuros.Text = contrato.taxaJuros.HasValue ? contrato.taxaJuros.Value.ToString("N2") : "";
                labelSaldoDevedor.Text = saldoDevedor;
                labelMargemConsiderada.Text = contrato.valorMargem.HasValue ? contrato.valorMargem.Value.ToString("N2") : "";
                labelNumeroParcelas.Text = contrato.totalParcelas.ToString();
                labelParcelasRestantes.Text = contrato.parcelasRestantes.ToString();
                labelParcelasCobrar.Text = contrato.numeroParcelasAtrasadas.ToString();
                labelNrContratosQuitados.Text = contrato.nrContratosQuitados.ToString();
                labelvlrMaxPermitido.Text = contrato.valorMaximo.ToString("N2");

                #endregion

                #endregion

                #region Aba Integração

                #region Conta Bancária para Crédito da Concessão

                labelFavorecidoCredito.Text = contrato.mutuario.nome;

                #endregion

                #region Crédito Contas a Pagar

                labelContasPagar.Text = contrato.flagFormaPagamento == "F" ? "Folha de Pagamento" : "Contas a Pagar";
                labelFormaPagamentoCredito.Text = contrato.formaPagamento;
                labelContaCaixaFormaPagamento.Text = contrato.portadorCredito;

                #endregion

                #region Débito Contas a Receber

                labelContasReceber.Text = contrato.flagFormaRecebimento == "F" ? "Folha de Pagamento" : "Contas a Receber";
                labelFormaPagamentoDebito.Text = contrato.portadorDebito;

                #endregion

                #endregion
            }
        }
                
        private void carregarTiposExcepcional()
        {
            int[] tiposExcepcional;

            chklistExcepcional.Visible = false;
            labelExcepcional.Visible = true;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                tiposExcepcional = cliente.contrato.buscaTiposExcepcional(numeroContrato);
            }
            if(!tiposExcepcional.Contains(1))
            {
                chklistExcepcional.Visible = false;               
            }
            else
            {
                chklistExcepcional.Visible = true;              
                fdsExcepcional.Visible = true;

                chklistExcepcional.Items[0].Selected = (tiposExcepcional[1] == 1);
                chklistExcepcional.Items[1].Selected = (tiposExcepcional[2] == 1);
                chklistExcepcional.Items[2].Selected = (tiposExcepcional[3] == 1);
                chklistExcepcional.Items[3].Selected = (tiposExcepcional[4] == 1);
            }
        }
     
        private void carregarContratosQuitados()
        {
            List<Contrato> listContratosQuitados = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listContratosQuitados = cliente.contrato.consultarContratosQuitados(this.numeroContrato);
                if (!listContratosQuitados.Count.Equals(0))
                    gridContratosQuitados.DataSource = listContratosQuitados;
                else
                    gridContratosQuitados.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridContratosQuitados.DataBind();
            }

        }

        private void carregarContaBancaria()
        {
            DadosBancarios dadosBancarios = null;

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                dadosBancarios = cliente.contrato.consultarContaBancaria(this.numeroContrato);
            }

            if (dadosBancarios != null)
            {
                #region Aba Integração

                #region Conta Bancária para Crédito da Concessão

                labelBancoCredito.Text = dadosBancarios.nomeBanco;
                labelAgenciaCredito.Text = dadosBancarios.agencia;
                labelContaCorrenteCredito.Text = dadosBancarios.contaCorrente;

                #endregion

                #endregion
            }
        }

        private void carregarContaBancariaDebito()
        {
            DadosBancarios dadosBancarios = null;

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                dadosBancarios = cliente.contrato.consultarContaBancariaDebito(this.numeroContrato);
            }

            if (dadosBancarios != null)
            {
                #region Aba Integração

                #region Conta Bancária Débito de Prestações/Devoluções

                labelBancoDebito.Text = dadosBancarios.nomeBanco;
                labelAgenciaDebito.Text = dadosBancarios.agencia;
                labelContaCorrenteDebito.Text = dadosBancarios.contaCorrente;

                #endregion

                #endregion
            }
        }

        //private void AbrirModalProtocoloCRM()
        //{           

        //    string guidCRM = Guid.NewGuid().ToString();
        //    this.proxyEstado.manterEstadoSincrono(guidCRM, matricula);

        //    string script = String.Format("exibirDialogo('ModalNup.aspx?guidCRM={0}', 500, 200);", guidCRM);
        //    ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "Modal protocolo CRM", script, true);
        //}                        

        #endregion

        #region Contexto da Página / Permissões

        private void verificarPermissoes()
        {
            //this.botaoAjustarSaldo.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.ajustarSaldo.ToString());
            this.botaoCancelarConcessao.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.ajustarSituacao.ToString());
            //this.BotaoChaveMestre.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.chaveMestre.ToString());
        }

        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.contrato;
            }
        }
        
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }
        #endregion

        protected void botaoValidarCRM_Click(object sender, EventArgs e)
        {
            ValidarCRM();
        }

        //protected void campoCRM_TextChanged(object sender, EventArgs e)
        //{
        //    campoCRM.Text = System.Text.RegularExpressions.Regex.Replace(campoCRM.Text, "[^0-9./]", "");
        //    if (string.IsNullOrEmpty(campoCRM.Text))
        //    {
        //        botaoCancelarConcessao.Enabled = false;                
        //        botaoCancelarConcessao.CssClass = "disabledStyle";
        //        return;                
        //    }
        //    ValidateCRM.Validate();
        //}
        protected void ValidarCRM()
        {
            campoCRM.Text = System.Text.RegularExpressions.Regex.Replace(campoCRM.Text, "[^0-9./]", "");
            if (string.IsNullOrEmpty(campoCRM.Text))
            {
                botaoCancelarConcessao.Enabled = false;                
                return;
            }
            ValidateCRM.Validate();
        }

        protected void ValidateCRM_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool CRMencontrado;

            try
            {


            if (string.IsNullOrEmpty(campoCRM.Text))
            {                
                args.IsValid = false;
                return;
            }

            try
            {
                    //WO3200 - Validação retirada temporáriamente a pedido da copart via demanda Atender xxxx . A validação sera retomada por meio de outra demanda, solicitando a alteração de ferramenta de crm.
                    //CRMencontrado = ValidaProtocoloCRM(campoCRM.Text, this.mutuario.matricula);
                    CRMencontrado = true;
            }
            catch (Exception)
            {
                CRMencontrado = false;                
            }

            if (CRMencontrado == false)
                {
                    args.IsValid = false;
                    botaoCancelarConcessao.Enabled = false;
                    //ValidateCRM.ErrorMessage = "Não foi encontrado o protocolo CRM.";
                    //botaoCancelarConcessao.CssClass = "disabledStyle";                          
            }
            else
            {               
                args.IsValid = true;
                //botaoCancelarConcessao.CssClass = "botaoAcao";
                botaoCancelarConcessao.Enabled = true;                
            };
            }
            catch (Exception ex)
            {
                registrarAlerta(string.Concat("Erro ao tentar validar CRM. ", ex.Message));
            }

        }

        private bool ValidaProtocoloCRM(string protocolo, string matricula)
        {
            bool resultadoValidacao = false;
            //matricula = "0876";

            try
            {
                IDictionary<string, object> parametros = new Dictionary<string, object>();
                parametros.Add("Protocolo", protocolo);
                parametros.Add("Matricula", matricula);

                string json = JsonConvert.SerializeObject(parametros, Formatting.Indented);

                using (HttpClient cliente = new HttpClient())
                {
                    using (StringContent content = new StringContent(json, Encoding.UTF8, "application/json"))
                    {
                        var response = cliente.PostAsync(Url + "/CRM/BuscarHistoricoPorProtocolo", content).Result;

                        if (response.IsSuccessStatusCode)
                        {
                            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                            var strJson = response.Content.ReadAsStringAsync().Result;
                            CrmListaDTO crm = JsonConvert.DeserializeObject<CrmListaDTO>(strJson);

                            if (crm.resultado != null)
                            {
                                if (crm.resultado.Count == 1)
                                    resultadoValidacao = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultadoValidacao;
        }

        private void CancelarConcessaoEmprestimo()
        {
            if (!String.IsNullOrEmpty(campoCRM.Text))
            {
                try
                {
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        Contrato contrato = new Contrato();
                        contrato.idTipoContratoEmpto = this.idTipoContrato;
                        contrato.numero = this.numeroContrato;
                        contrato.mutuario = this.mutuario;
                        contrato.inscricaoEmprestimo = new InscricaoEmprestimo { id = this.idInscricao };

                        //string usuarioLogado = this.contextoSistema.loginUsuarioAtual;
                        string usuarioLogado = "CM"+this.contextoSistema.usuarioAtual.idPlanus;


                        cliente.contrato.CancelarConcessaoEmprestimo(contrato, campoCRM.Text, usuarioLogado);

                        confirmarOperacao("Contrato nº "+ contrato.numero +" foi cancelado.", ResolveUrl("~/Paginas/CicloNormal/Cancelamento/Listagem.aspx"));
                    }
                }
                catch (Exception ex)
                {
                    //if (ex.InnerException != null)
                    //{
                    //    registrarAlerta(string.Concat("Erro ao tentar cancelar contrato de empréstimo: ", ex.InnerException.Message));
                    //}
                    //else
                    //{
                        registrarAlerta(string.Concat("Erro ao tentar cancelar contrato de empréstimo: ", ex.Message));
                    //}
                }
            }
        }        

        private static string Url
        {
            get
            {
                return ConfigurationManager.AppSettings["LinkCorporativo"];
            }
        }
    }
}
