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
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
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

        //private RelatorioContrato relatorio
        //{
        //    get
        //    {
        //        if (this.ViewState["RelatContrato"] != null)
        //            return (RelatorioContrato)this.ViewState["RelatContrato"];
        //        else
        //            return new RelatorioContrato();
        //    }

        //    set
        //    {
        //        this.ViewState["RelatContrato"] = value;
        //    }
        //}

        #endregion

        #region Eventos

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {

            //Popup Chave mestre
            //string script = String.Format("exibirDialogo('PopupChaveMestre.aspx?nrContrato={0}&acao={1}', 320, 120); return false;", numeroContrato, "I");
            //BotaoChaveMestre.OnClientClick = script;

            gridHistorico.tamanhoPagina = 100;//William Moreira da Silva - SOL 220732 KTN 2053571
            gridHistorico.EmptyDataText = MensagensAplicacao.instancia.mensagem007;//William Moreira da Silva - SOL 220732 KTN 2053571
            gridHistorico.Font.Size = FontUnit.XXSmall;

            if (!this.IsPostBack)
            {
                //gridHistorico.tamanhoPagina = 100;//William Moreira da Silva - SOL 220732 KTN 2053571
                //gridHistorico.EmptyDataText = MensagensAplicacao.instancia.mensagem007;//William Moreira da Silva - SOL 220732 KTN 2053571
                gridItens.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                this.carregarContratosQuitados();
                this.carregarBeneficiariosSeguro();         
                this.carregarContaBancaria();
                this.carregarContaBancariaDebito();// Fernando Francisco Xavier - SOL 238824 PPM 508902
                this.carregarDetalhesAplicacao();
                //this.consultaHistoricoInicial();//William Moreira da Silva - SOL 220732 KTN 2053571      
            }
            this.consultaHistoricoInicial(!this.IsPostBack);//William Moreira da Silva - SOL 220732 KTN 2053571
            this.verificarPermissoes();//Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964            
        }

        protected void BotaoChaveMestre_Click(object sender, EventArgs e)
        {
            String strurl = String.Format("PopupChaveMestre.aspx?nrContrato={0}&acao={1}", numeroContrato, "I");
            String strscript = "window.open('" + strurl + "', 'name','height=150,width=380,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup Chave Mestra", strscript, true);
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurarHistorico_Click(object sender, EventArgs e)
        {
            gridHistorico.DataSourceID = dataSourceHistorico.ID;
            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }

        //William Moreira da Silva - SOL 235175 PPM
        /// <summary>
        /// Evento para recarregar a tela com as informações do contrato anterior quitado
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoContratoQuitado_Click(object sender, EventArgs e)
        {
            Server.Transfer(String.Format("Visualizacao.aspx?Numero={0}", labelQuitadoPor.Text));
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param> 
        /// <param name="e">Argumentos.</param>
        protected void botaoLimparHistorico_Click(object sender, EventArgs e)
        {
            //Limpar todos os campos da aba de Histórico
            caixaSelecaoItensEnvio.Checked = false;
            //caixaSelecaoEstorno.Checked = false;
            caixaSelecaoAtualizacaoDiaria.Checked = false;
            caixaSelecaoItensInternos.Checked = false;
            //caixaSelecaoEmAberto.Checked = false;
            caixaTextoDataMovimentacaoMesCobrancaDe.Text = String.Empty;
            caixaTextoDataMovimentacaoMesCobrancaAte.Text = String.Empty;
            caixaTextoDataMovimentacaoDataPrevistaDe.Text = String.Empty;
            caixaTextoDataMovimentacaoDataPrevistaAte.Text = String.Empty;
            caixaTextoNumeroParcela.Text = String.Empty;
            comboEventos.SelectedIndex = 0;
            comboItens.SelectedIndex = 0;
            comboOrdenacao.SelectedIndex = 0;

            gridHistorico.limpar();

            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceHistorico_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (e.InputParameters.Count == 0)
            {
                Historico historico = new Historico();

                historico.numeroContrato = this.numeroContrato;
                historico.envio = Convert.ToInt32(caixaSelecaoItensEnvio.Checked);

                historico.filtroHistorico = new FiltroHistorico()
                {
                    internos = caixaSelecaoItensInternos.Checked,
                    atualizacaoDiaria = caixaSelecaoAtualizacaoDiaria.Checked,
                    emAberto = int.Parse(opcoesItensEmAberto.SelectedValue),
                    estorno = int.Parse(opcoesItensEstorno.SelectedValue),

                    //Obtém os meses e anos da Data Cobrança separados, pois no banco os campos são separados.
                    mesCobrancaDe = caixaTextoDataMovimentacaoMesCobrancaDe.obterMes(),
                    anoCobrancaDe = caixaTextoDataMovimentacaoMesCobrancaDe.obterAno(),
                    mesCobrancaAte = caixaTextoDataMovimentacaoMesCobrancaAte.obterMes(),
                    anoCobrancaAte = caixaTextoDataMovimentacaoMesCobrancaAte.obterAno(),

                    dataPrevistaDe = caixaTextoDataMovimentacaoDataPrevistaDe.valorData,
                    dataPrevistaAte = caixaTextoDataMovimentacaoDataPrevistaAte.valorData,
                    campoOrdenacao = this.ordenarPor()
                };

                if (!String.IsNullOrEmpty(comboEventos.SelectedValue))
                    historico.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(Convert.ToInt32(comboEventos.SelectedValue));
                else
                    historico.tipoMovimento = TipoEvento.nenhum;

                if (comboItens.SelectedIndex != 0)
                {
                    historico.item = new ItemContrato()
                    {
                        id = Convert.ToInt32(comboItens.SelectedValue)
                    };
                }

                if (caixaTextoNumeroParcela.Text != "")
                {
                    historico.parcela = Convert.ToInt32(caixaTextoNumeroParcela.Text);
                }

                e.InputParameters.Add("historico", historico);
            }
        }

        protected void dataSourceItens_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (e.InputParameters.Count == 0)
            {
                e.InputParameters.Add("numero", this.numeroContrato);
            }
        }


        /// <summary>
        /// Evento do click dos links do Grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gridHistorico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //William Moreira da Silva - SOL 235173
                //HyperLink link = e.Row.Cells[2].Controls[0] as HyperLink;

                //if (link != null)
                //{
                //link.Attributes["onClick"] = String.Format("exibirDialogo('PopupHistorico.aspx?idHistorico={0}&numeroContrato={1}', 700, 530); return false;", ((Historico)e.Row.DataItem).id, this.numeroContrato);//William Moreira da Silva - SOL 199847 KINTANA 1926357
                //e.Row.Cells[2].Attributes["onClick"] = String.Format("exibirDialogo('PopupHistorico.aspx?idHistorico={0}&numeroContrato={1}', 1100, 530); return false;", ((Historico)e.Row.DataItem).id, this.numeroContrato);//William Moreira da Silva - SOL 199847 KINTANA 1926357
                //link.Style[HtmlTextWriterStyle.Cursor] = "pointer";
                //}

                e.Row.Cells[2].Attributes["onClick"] = ClientScript.GetPostBackClientHyperlink(this.gridHistorico, "Select$" + e.Row.RowIndex);

                if (DataBinder.Eval(e.Row.DataItem, "valorEfetivoTexto").ToString() == "(estornado)")
                {
                    e.Row.Cells[11].ForeColor = System.Drawing.Color.Red;
                }

                e.Row.Cells[1].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[1].Text);
                e.Row.Cells[2].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[2].Text);
                e.Row.Cells[17].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[17].Text);//William Moreira da Silva SOL 235167

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
                //William Moreira da Silva - SOL 235173

                //William Moreira da Silva SOL 235167
                auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[17].Text);

                if (auxiliar.Length > 10)
                {
                    e.Row.Cells[17].Text = auxiliar.Substring(0, 10);
                }
                //William Moreira da Silva SOL 235167

            }
            //William Moreira da Silva SOL 235167
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
            //William Moreira da Silva SOL 235167
        }

        protected void gridHistorico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                DataKey dataKey = gridHistorico.DataKeys[Convert.ToInt32(e.CommandArgument)];

                string strurl = String.Format("PopupHistorico.aspx?idHistorico={0}&numeroContrato={1}", dataKey[2].ToString(), this.numeroContrato.ToString());
                string strscript = "window.open('" + strurl + "', '_blank','height=640,width=900,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes')";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "popup Histórico", strscript, true);                
            }
        }

        protected void gridEventosCobranca_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Attributes["onClick"] = ClientScript.GetPostBackClientHyperlink(this.gridEventosCobranca, "Select$" + e.Row.RowIndex);

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink link = e.Row.Cells[0].Controls[0] as HyperLink;

                link.Style[HtmlTextWriterStyle.Cursor] = "pointer";

                //Historico historico = (Historico)e.Row.DataItem;

                if (link != null)
                {
                    //link.Attributes["onClick"] = String.Format("exibirDialogo('PopupHistoricoCobranca.aspx?numeroContrato={0}&tipoEvento={1}&dataEvento={2}&idEvento={3}', 750, 530); return false;", this.numeroContrato, historico.eventoCobranca.id, historico.data.ToString("dd/MM/yyyy"), historico.id);
                    link.Style[HtmlTextWriterStyle.Cursor] = "pointer";                    
                }
            }
        }

        protected void gridEventosCobranca_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Historico historico = (Historico)e.CommandArgument.DataItem;

            DataKey dataKey = gridEventosCobranca.DataKeys[Convert.ToInt32(e.CommandArgument)];

            String strurl = String.Format("PopupHistoricoCobranca.aspx?numeroContrato={0}&tipoEvento={1}&dataEvento={2}&idEvento={3}", dataKey[0].ToString(), ((TipoEventoCobranca)dataKey[1]).id.ToString(), Convert.ToDateTime(dataKey[2]).ToString("dd/MM/yyyy"), dataKey[3].ToString());
            String strscript = "window.open('" + strurl + "', '_blank','height=530,width=710,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup Histórico Evento Cobrança", strscript, true);
        }

        protected void gridHistorico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }

        protected void gridItens_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            recipienteAbaContratoPrincipal.ActiveTabIndex = 3;
        }


        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
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
                DataKey dataKey = gridHistorico.DataKeys[idIndex];

                DateTime dataPrevista = (DateTime)dataKey.Values[0]; //Era utilizado data atualização.
                double saldoDevedor = (double)dataKey.Values[1];


                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    cliente.contrato.executarAjusteSaldo(this.numeroContrato, dataPrevista, saldoDevedor);
                }

                this.carregarGridLog();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }

            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoAjustarSituacao_Click(object sender, EventArgs e)
        {
            try
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    cliente.contrato.ajustarSituacao(this.numeroContrato, DateTime.Today);
                }
                this.carregarGridLog();
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }
        }

        //William Moreira da Silva
        /// <summary>
        /// Evento para atulizar a grid do historico
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //protected void atualizaGrid_Click(object sender, EventArgs e)
        //{
        //gridHistorico.limpar();
        //gridHistorico.

        //}
        //William Moreira da Silva

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoCalcularValorQuitacao_Click(object sender, EventArgs e)
        {
            List<ItemContrato> itensGrid = null;

            if (caixaTextoDataQuitacao.Text != "")
            {
                try
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        //Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                        //Saulo - FUNCEF
                        ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                        //Se a situação do contrato for "Quitado" ou "Em Quitação"
                        if (contrato.situacao.codigo.Equals("Q") || contrato.situacao.codigo.Equals("K"))
                        {
                            this.registrarAlerta("O Contrato já teve o valor de quitação calculado.");
                            recipienteAbaContratoPrincipal.ActiveTabIndex = 4;
                            return;
                        }
                                                                                                                                                                        //SIG 67808 - Matias
                        itensGrid = cliente.contrato.calcularItensQuitacao(new TipoContrato(), this.numeroContrato, caixaTextoDataQuitacao.valorData.Value, TipoOperacao.quitacao, false);
                        gridValorQuitacao.DataSource = itensGrid;
                        gridValorQuitacao.DataBind();

                        labelValorProjetadoQuitacao.Text = itensGrid.Find(i => i.centraliza == 1).valor.ToString("N2");
                    }
                    this.carregarGridLog();
                }
                catch (FaultException<ContratoFaltaNegocio> erro)
                {
                    this.registrarAlerta(erro.Detail.mensagemErro);
                }

                recipienteAbaContratoPrincipal.ActiveTabIndex = 4;
            }
            else
            {
                this.registrarAlerta("Informe uma Data para Quitação.");
                gridValorQuitacao.limpar();
                recipienteAbaContratoPrincipal.ActiveTabIndex = 4;
            }
        }

        #endregion

        #region Métodos de Apoio

        /// <summary>
        /// Carrega os detalhes do usuário.
        /// </summary>
        private void carregarDetalhesAplicacao()
        {
            // Contrato contrato = null;
            //Contrato contrato;
            //Saulo / FUNCEF
            ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);
            List<ItemContrato> itensEmAberto = null;
            TipoContrato tipoContrato = new TipoContrato();

            string saldoDevedor = string.Empty;
            //string parcelasRestantes = string.Empty; //Saulo / FUNCEF - consulta a parcelas restantes será feito diretamente ao objeto contrato.

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //Consultar todas as informações do contrato.
                //contrato = cliente.contrato.consultarContrato(this.numeroContrato); Saulo / FUNCEF

                //Consultar o saldo devedor do contrato.
                saldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, DateTime.Today).ToString("N2");

                //Consultar as parcelas restantes do contrato.
                //parcelasRestantes = cliente.contrato.obterParcelasRestantes(this.numeroContrato, DateTime.Today).ToString();
                //Saulo / FUNCEF - consulta a parcelas restantes será feito diretamente ao objeto contrato.

                List<ItemContrato> lista = cliente.contrato.listarItens();
                UtilidadesPagina.preencherDropDown(comboItens, lista, EnumeradorItemPreenchimento.Todos, "descricao", "id");

                #region Carregar Grid de Itens em Aberto

                ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                double valorTotalItens = 0;
                itensEmAberto = cliente.contrato.obterItensContratoEmAberto(this.numeroContrato, ref parametrosConsulta, ref valorTotalItens);

                gridItens.DataSourceID = dataSourceItens.ID;

                string itensAberto = parametrosConsulta.totalRegistros.ToString("N0");

                labelItensAberto.Text = itensAberto;
                labelValorTotalItens.Text = valorTotalItens.ToString("N2");

                //Jogar o mesmo valor da aba "Itens em Aberto" para "Histórico"
                labelItensAbertoHistorico.Text = itensAberto;
                labelValorTotalHistorico.Text = valorTotalItens.ToString("N2");

                #endregion

                #region Carregar Grid de Log

                this.carregarGridLog();

                #endregion

                #region Aba Cobranças

                List<Historico> historicos = cliente.contrato.consultarEventoCobranca(this.numeroContrato, null);

                if (historicos.Count > 0)
                    gridEventosCobranca.DataSource = historicos;
                else
                    gridEventosCobranca.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridEventosCobranca.DataBind();

                #endregion 
            }

            if (contrato != null)
            {
                #region Aba Contrato

                labelNumeroContrato.Text = contrato.numero.ToString();

                //William Moreira da Silva
                labelContratoCabecalho.Visible = true;
                labelContratoCabecalho.Text = contrato.numero.ToString();
                labelNomeCabecalho.Visible = true;
                labelNomeCabecalho.Text = contrato.mutuario.nome;
                if (!string.IsNullOrEmpty(contrato.numProtocolo))//William Moreira da Silva - SOL 213725 KINTANA 2040469
                {
                    string NUP = contrato.numProtocolo.PadLeft(15, '0');//William Moreira da Silva - SOL 213725 KINTANA 2040469
                    labelNUP.Text = NUP.Substring(0, 5) + "." + NUP.Substring(6, 6) + "/" + NUP.Substring(11, 4);

                }
                else
                {
                    labelNUP.Text = "";
                }
                //William Moreira da Silva

                //William Moreira da Silva - SOL 224034/17909
                if(contrato.FlagAcordoJudicial == 1)
                {
                    labelAcordoJudicial.Visible = true;
                }
                else
                {
                    labelAcordoJudicial.Visible = false;
                }
                //William Moreira da Silva - SOL 224034/17909

                labelSituacao.Text = contrato.situacao.descricao;

                //SIG 130739
                lblNivelProvisãoPerdas.Text = contrato.ProvisaoPerda;

                //Bruno.silva PPM:984370 SOL:255322/17559 - Início
                if (labelSituacao.Text.ToUpper() == "EM QUITAÇÃO")
                {
                    labelContrato.ForeColor = System.Drawing.Color.FromArgb(128, 128, 0);//Bruno 
                    labelSituacao.ForeColor = System.Drawing.Color.FromArgb(128, 128, 0);//Bruno
                }
                if (labelSituacao.Text.ToUpper() == "QUITADO")
                {
                    labelContrato.ForeColor = System.Drawing.Color.FromArgb(0, 128, 0);//Bruno
                    labelSituacao.ForeColor = System.Drawing.Color.FromArgb(0, 128, 0);//Bruno
                }
                if (labelSituacao.Text.ToUpper() == "ATIVO")
                {
                    labelContrato.ForeColor = System.Drawing.Color.FromArgb(0, 0, 128);//Bruno
                    labelSituacao.ForeColor = System.Drawing.Color.FromArgb(0, 0, 128);//Bruno
                }
                if (labelSituacao.Text.ToUpper() == "CANCELADO")
                {
                    labelContrato.ForeColor = System.Drawing.Color.FromArgb(128, 0, 0);//Bruno
                    labelSituacao.ForeColor = System.Drawing.Color.FromArgb(128, 0, 0);//Bruno
                }
                if (labelSituacao.Text.ToUpper() == "ENCERRADO")
                {
                    labelContrato.ForeColor = System.Drawing.Color.FromArgb(128, 128, 0);//Bruno
                    labelSituacao.ForeColor = System.Drawing.Color.FromArgb(128, 128, 0);//Bruno
                }
                //Bruno.silva PPM:984370 SOL:255322/17559 - FIM           

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
                //Bruno.silva PPM:984370 SOL:255322/17559 - Início
                chklistExcepcional.Visible = false;
                fdsExcepcional.Visible = false;
                this.carregarTiposExcepcional();//Bruno.silva PPM:984370 SOL:255322/17559
                if(contrato.excepcional && !chklistExcepcional.Visible)
                {
                    chklistExcepcional.Visible = true;
                    fdsExcepcional.Visible = true;
                    chklistExcepcional.Items[0].Selected = true;
                    chklistExcepcional.Items[1].Selected = true;
                    chklistExcepcional.Items[2].Selected = true;
                    chklistExcepcional.Items[3].Selected = true;
                }
                labelExcepcional.Visible = contrato.excepcional;
                //Bruno.silva PPM:984370 SOL:255322/17559 - FIM

                labelInternet.Visible = contrato.internet;
                labelInterno.Visible = !contrato.internet;
                //Sadi SOL213592_Kintana2040335
                labelPerda.Visible = false;
                if (contrato.efetiva)
                {
                    labelPerda.Visible = contrato.efetiva;
                    labelPerda.ForeColor = System.Drawing.Color.FromArgb(123, 0, 0);//Bruno
                }

                if (contrato.mutuario.dataFalecimento.HasValue)
                    labelDataFalecimento.Text = contrato.mutuario.dataFalecimento.Value.ToString("dd/MM/yyyy");

                #region Aba Dados do Contrato

                labelTipoContrato.Text = contrato.tipo.descricao;
                labelIndexador.Text = contrato.indexador.sigla;
                labelResponsavel.Text = contrato.nomeResponsavel;
                labelDataAssinatura.Text = contrato.dataAssinatura.obterString();
                labelDataSolicitacao.Text = contrato.dataSolicitacao.obterString();
                labelDataCredito.Text = contrato.dataCredito.obterString();
                labelDataPrimeiraParcela.Text = contrato.dataPrimeiraParcela.obterString();

                //William Moreira da Silva - SOL 235175 PPM
                //labelQuitadoPor.Text = contrato.contratoQuitacao.ToString();
                labelQuitadoPor.Text = (contrato.contratoQuitacao != 0) ? contrato.contratoQuitacao.ToString() : "";
                //William Moreira da Silva - SOL 235175 PPM

                labelDataCancelamentoQuitacao.Text = contrato.dataCancelamento.obterString();
                lblProcoloCRMCancelamento.Text = contrato.ProtocoloCRM;
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

                #region Outras Informações

                labelTipoSuspensao.Text = contrato.suspensao.descricao;
                labelDataInicio.Text = contrato.dataInicioSuspensao.obterString();
                labelDataFinal.Text = contrato.dataFimSuspensao.obterString();
                labelIDPessoa.Text = contrato.mutuario.id.ToString();
                labelIDBeneficiario.Text = contrato.beneficiario.id.ToString();
                labelAutoEmprestimo.Text = contrato.codigoAutoEmprestimo.ToString();
                labelMesesSuspensao.Text = contrato.mesesSuspencao.ToString();
                labelvlrMaxPrestacao.Text = contrato.valorMaxPrestacao.ToString("N2");

                //William Moreira da Silva
                labelDataFinalvlrMax.Text = contrato.dataFinalVlrMax.obterString();
                labelDataIniciovlrMax.Text = contrato.dataInicioVlrMax.obterString();
                //William Moreira da Silva

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

                #region Aba Histórico

                // Preenche o Combo de Eventos de Histórico
                UtilidadeSistema.preencherDropDown<TipoEvento>(comboEventos, true, EnumeradorItemPreenchimento.Todos);
                comboEventos.Items.RemoveAt(1);


                #endregion

                #region Aba Valor para Quitação

                //Carregar o label Valor Total da Aba "Valor para Quitação"
                labelValorTotalQuitacao.Text = labelValorTotalItens.Text;
                caixaTextoDataQuitacao.valorData = DateTime.Now;

                #endregion
            }
        }

        /// <summary>
        /// Carrega a aba de "Beneficiários de Seguro".
        /// </summary
        private void carregarBeneficiariosSeguro()
        {
            List<Beneficiario> beneficiarios = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                beneficiarios = cliente.contrato.consultarBeneficiarios(this.numeroContrato);
                if (!beneficiarios.Count.Equals(0))
                    gridBeneficiarioSeguro.DataSource = beneficiarios;
                else
                    gridBeneficiarioSeguro.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridBeneficiarioSeguro.DataBind();
            }
        }

        //Bruno.silva PPM:984370 SOL:255322/17559 - Início
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
                labelExcepcional.Visible = false;
            }
            else
            {
                chklistExcepcional.Visible = true;
                labelExcepcional.Visible = true;
                fdsExcepcional.Visible = true;

                chklistExcepcional.Items[0].Selected = (tiposExcepcional[1] == 1);
                chklistExcepcional.Items[1].Selected = (tiposExcepcional[2] == 1);
                chklistExcepcional.Items[2].Selected = (tiposExcepcional[3] == 1);
                chklistExcepcional.Items[3].Selected = (tiposExcepcional[4] == 1);
            }
        }
        //Bruno.silva PPM:984370 SOL:255322/17559 - FIm

        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Inicio
        /// <summary>
        /// Verificar as permissoes do sistema para acesso
        /// </summary
        private void verificarPermissoes()
        {
            this.botaoAjustarSaldo.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.ajustarSaldo.ToString());
            this.botaoAjustarSituacao.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.ajustarSituacao.ToString());
            this.BotaoChaveMestre.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.chaveMestre.ToString());
        }
        //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Fim
        /// <summary>
        /// Contratos Contratos Quitados
        /// </summary
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


        /// <summary>
        /// Carrega informações de Integração(Conta Bancária).
        /// </summary
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

        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// <summary>
        /// Carrega informações de Integração(Conta Bancária).
        /// </summary
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
        // Fernando Francisco Xavier - SOL 238824 PPM 508902

        private string ordenarPor()
        {
            string ordenarPorCampo = string.Empty;

            if (comboOrdenacao.SelectedValue != "0")
            {
                switch (comboOrdenacao.SelectedValue)
                {
                    case "1":
                        ordenarPorCampo = "H.HMEANOCOBRANCA, H.HMEMESCOBRANCA";
                        break;
                    case "2":
                        ordenarPorCampo = "H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA";
                        break;
                    case "3":
                        ordenarPorCampo = "H.HMEPARCELA";
                        break;
                    case "4":
                        ordenarPorCampo = "H.HMESALDODEV";
                        break;
                    case "5":
                        ordenarPorCampo = "H.HMEDATAPREVISTA";
                        break;
                }
            }

            return ordenarPorCampo;
        }

        private void carregarGridLog()
        {
            int quantLinhas;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                List<LogContrato> listaLogContrato = new List<LogContrato>();
                LogContrato logContrato = new LogContrato();
                logContrato.numeroContrato = this.numeroContrato;

                //William Moreira da Silva - SOL 219785 KTN 2052123
                //Essa implementação visa corrigir o erro que acontecia 
                //quando a lista retornada do serviço era muito grande
                quantLinhas = cliente.contrato.consultarQuantLog(logContrato);
                if (quantLinhas > 3500)
                {
                    for (int i = 0; i < quantLinhas; i = i + 3500)
                    {
                        listaLogContrato.AddRange(cliente.contrato.consultarLogParticionado(logContrato, i));
                    }
                }
                else
                {
                    listaLogContrato = cliente.contrato.consultarLog(logContrato);
                }

                //listaLogContrato = cliente.contrato.consultarLog(logContrato);
                //William Moreira da Silva - SOL 219785 KTN 2052123

                if (!listaLogContrato.Count.Equals(0))
                    gridLog.DataSource = listaLogContrato;
                else
                    gridLog.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridLog.DataBind();
            }
        }

        private void consultaHistoricoInicial()
        {
            comboOrdenacao.ClearSelection();
            comboOrdenacao.Items.FindByValue("5").Selected = true;

            opcoesItensEmAberto.Items[0].Selected = true;
            opcoesItensEstorno.Items[1].Selected = true;

            caixaSelecaoItensEnvio.Checked = true;
            caixaSelecaoAtualizacaoDiaria.Checked = true;

            gridHistorico.DataSourceID = dataSourceHistorico.ID;
        }

        //William Moreira da Silva - SOL 220732 KTN 2053571
        /// <summary>
        /// Método Sobreposto, pois ao atualizar a tela a grid historico não era atualizada
        /// </summary>
        /// <param name="isPostBack"></param>
        private void consultaHistoricoInicial(bool isPostBack)
        {

            if (isPostBack)
            {
                comboOrdenacao.ClearSelection();
                comboOrdenacao.Items.FindByValue("5").Selected = true;

                opcoesItensEmAberto.Items[0].Selected = true;
                opcoesItensEstorno.Items[1].Selected = true;

                caixaSelecaoItensEnvio.Checked = true;
                caixaSelecaoAtualizacaoDiaria.Checked = true;
            }

            gridHistorico.DataSourceID = dataSourceHistorico.ID;
        }
        //William Moreira da Silva - SOL 220732 KTN 2053571

        protected void BotaoImprimir_Click(object sender, EventArgs e)
        {
            ImprimirContratoAntigo();
        }

        protected void ImprimirContratoAntigo()
        {
            try
            {
                int  Porcentagem = 0;
                int itemAtual = 0;
                int totalItens = 0;
                int regraAtual = 0;
                int totalRegras = 0;
                RelatorioContrato relatorio = new RelatorioContrato();
                ObjetoContrato Contrato = new ObjetoContrato(this.numeroContrato);

                if (!Contrato.internet)
                {
                    this.registrarAlerta("O contrato não poderá ser gerado, pois não foi concedido por meio do sistema Auto Atendimento.");
                    return;
                }

                //DadosBancarios dadosBancarios = null;

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    //relatorio = cliente.contrato.buscaInfoImpressaoContrato(Contrato.mutuario.id);
                    relatorio = cliente.contrato.buscaInfoImpressaoEmprestimoSemContrato(this.numeroContrato);
                    Porcentagem = 50;
                    if (string.IsNullOrEmpty(relatorio.numero))
                    {
                        this.registrarAlerta("Alguns dados do mutuário não foram encontrados.");
                        return;
                    }

                    ////Campanha Desconto
                    //using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
                    //{
                    //    relatorio.tipoContrato = client.contrato.ConsultarTipoContrato(Contrato.idTipoContratoEmpto);
                    //}
                    //relatorio.numeroContrato = Contrato.numero;

                    //relatorio.mutuario = Contrato.mutuario;       
                    //relatorio.valorMaximo = Contrato.valorMaximo;
                    //relatorio.prazo = Contrato.totalParcelas;
                    //relatorio.valorSolicitado = (double)Contrato.valorContrato;
                    //relatorio.DataCredito = Convert.ToDateTime(labelDataCredito.Text);
                    //relatorio.dataAssinatura = (DateTime)Contrato.dataAssinatura;
                    //relatorio.conta = cliente.contrato.consultarContaBancaria(0, relatorio.conta.id, 0)[0];
                    //relatorio.fiadores = new Avalistas[] { new Avalistas() { id = 0 }, new Avalistas() { id = 0 } };  
                    //relatorio.ContratoAntigoSemMinuta = true; // SIG 129005 - Identifica na impressão que a chamada da impressão parte daqui e não há minuta gravada na base

                    ////Antes de abrir a pasta que exibe o contrato, vamos verificar se existe minuta para o contrato.
                    //LeioutContrato leiout = new LeioutContrato();
                    //using (Cliente<IServicoContrato> client = new Cliente<IServicoContrato>())
                    //{
                    //    leiout = client.contrato.consultarleiout(relatorio.tipoContrato.id, relatorio.dataAssinatura);

                    //    List<Contrato> listContratosQuitados = null;                       
                    //    listContratosQuitados = client.contrato.consultarContratosQuitados(this.numeroContrato);
                    //    if (!listContratosQuitados.Count.Equals(0))

                    //    {                           
                    //       listContratosQuitados.ForEach(x =>
                    //        {                               
                    //            relatorio.contratosQuitados += ", " + x.numero.ToString();                               
                    //        });
                    //        relatorio.contratosQuitados = relatorio.contratosQuitados.Substring(2, relatorio.contratosQuitados.Length-2);
                    //    }
                         
                    //}
                    //if (leiout.leioutContrato == null)
                    //{
                    //    registrarAlerta("Não foi encontrada minuta para o contrato " + this.numeroContrato.ToString() + ". Verifique a modalidade e data de assinatura.");
                    //    return;
                    //}

                    string guidImpressao = Guid.NewGuid().ToString();
                    this.proxyEstado.manterEstadoSincrono(guidImpressao, this.numeroContrato);
                    //this.proxyEstado.manterEstadoSincrono(guidImpressao, relatorio);       

                    String strurl = String.Format("../../CicloNormal/Emprestimo/ImpressaoContrato.aspx?guidImpressao={0}", guidImpressao);                          
                    String strscript = "window.open('" + strurl + "', '_blank','toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,modal=no')";        
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Contrato", strscript, true);
                }
            }
            catch (Exception ex)
            {
                throw new Planus.Componentes.ExcecaoPlanus(ex.Message);
            }
            finally
            {
                //Porcentagem = 100;
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
                return PermissoesSistema.consultar.ToString();
            }
        }


        #endregion


    }
}
