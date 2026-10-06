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
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    /// <summary>
    /// Representa a página de listagem de usuários da aplicação.
    /// </summary>
    public partial class PopupHistorico : PaginaSeguraComEstado
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
                Response.Expires = -1;
                this.carregarDetalhesHistorico();
                this.carregarGridHistorico(0);// Xavier SOL 219195
            }
            else
            {
                if (!string.IsNullOrEmpty(hdnObservacao.Value))
                {
                    caixaTextoObservacao.Text = hdnObservacao.Value;
                }
            }

            this.verificarPermissoes();//Marcio Sanches Spinosa - SOL 187154/13964
            string url = string.Format("PopUpObservacaoHistorico.aspx?idHistorico={0}&observacao={1}&numeroContrato={2}", this.idHistorico, HttpUtility.UrlEncodeUnicode(caixaTextoObservacao.Text), this.numeroContrato);
            string script = string.Format("abrirAlteracao('{0}');", url);

            botaoAlterarObservacao.OnClientClick = script;
            this.carregarGridLog();

            //Popup Chave mestre
            //string scpt = String.Format("exibirDialogo('PopupChaveMestre.aspx?nrContrato={0}&idHistorico={1}&acao={2}', 320, 120); return false;", numeroContrato, this.idHistorico, "U");
            //BotaoChaveMestre.OnClientClick = scpt;

        }

        #endregion

        #region Métodos de Apoio

        /// <summary>
        /// Carrega os detalhes do usuário.
        /// </summary>
        private void carregarDetalhesHistorico()
        {
            Historico historico = null;
            int parcelasRestantes = 0;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                historico = cliente.contrato.consultarDetalheContrato(this.idHistorico);
                parcelasRestantes = cliente.contrato.obterParcelasRestantes(this.numeroContrato, DateTime.Today);
            }

            #region Carregar Grid de Log

            this.carregarGridLog();

            #endregion

            if (historico != null)
            {
                #region Aba Geral

                labelIdItem.Text = historico.item.id.ToString();
                labelItemEmprestimo.Text = historico.item.descricao;

                //William Moreira da Silva - SOL 262601 - PPM 1129625
                if (historico.tipoMovimento.chave == 3 && historico.origem.chave == 8)
                {
                    labelEvento.Text = "Quitação por Falecimento";
                }
                else
                {
                    labelEvento.Text = historico.tipoMovimento.descricao;
                }
                //William Moreira da Silva - SOL 262601 - PPM 1129625

                labelOrigem.Text = historico.origem.descricao;
                labelUsuario.Text = historico.usuarioInclusao;
                labelDataInclusao.Text = historico.dataInclusao.ToString("dd/MM/yyyy HH:mm");//William Moreira da Silva
                labelVersao.Text = historico.versao;
                labelDataPrevista.Text = historico.dataPrevista.HasValue ? historico.dataPrevista.Value.ToString("dd/MM/yyyy") : "-";
                labelDataVencimento.Text = historico.dataVencimento.HasValue ? historico.dataVencimento.Value.ToString("dd/MM/yyyy") : "-";
                labelDataEfetiva.Text = historico.dataEfetiva.HasValue ? historico.dataEfetiva.Value.ToString("dd/MM/yyyy") : "-";
                labelCompetencia.Text = (historico.anoCompetencia.HasValue && historico.mesCompetencia.HasValue) ? historico.mesCompetencia.Value.ToString("00") + "/" + historico.anoCompetencia.Value : "-";
                labelCobranca.Text = (historico.anoCobranca.HasValue && historico.mesCobranca.HasValue) ? historico.mesCobranca.Value.ToString("00") + "/" + historico.anoCobranca.Value : "-";
                labelValorPrevisto.Text = historico.valorPrevisto.ToString("N2");
                labelValorEfetivo.Text = historico.valorEfetivo.HasValue ? historico.valorEfetivo.Value.ToString("N2") : "-";
                labelParcelas.Text = historico.parcela.ToString();
                labelParcelasRestantes.Text = historico.numeroParcelas.ToString();
                labelTaxaJuros.Text = historico.taxaJuros.HasValue ? historico.taxaJuros.Value.ToString("N2") : "-";
                labelSaldoDevedor.Text = historico.saldoDevedor.ToString("N2");
                labelDataAtualizacao.Text = historico.dataAtualizacao.ToString("dd/MM/yyyy");
                caixaTextoObservacao.Text = historico.observacao;

                #endregion

                #region Aba Status

                checkSuspenso_status.Checked = 
                checkSuspenso.Checked = historico.suspenso == 1;
                checkEnviado_status.Checked = 
                checkEnviado.Checked = historico.envio == null;
                if (historico.baixado == null)
                {
                    checkBaixado_status.Checked = 
                    checkBaixado.Checked = true;
                    checkBaixaManual.Checked = historico.baixaManual == 1;
                }
                checkDivergencia.Checked = historico.divergencia == 1;
                checkDivergenciaTratada.Checked = historico.divergenciaTratada == 1;
                checkEstornado_status.Checked = 
                checkEstornado.Checked = historico.estorno == 1;
                checkAbonado_status.Checked = 
                checkAbonado.Checked = historico.abonado == 1;
                checkQuitado_status.Checked =
                checkQuitado.Checked = historico.quitado == 1;
                checkEntradaManual.Checked = historico.entradaManual == 1;

                checkCentraliza.Checked = historico.centraliza == 1;
                checkDestacado.Checked = historico.destacado == 1;

                labelTipoSuspensao.Text = historico.tipoSuspensao.descricao;
                labelDataUltimoEnvio.Text = historico.dataEnvio.HasValue ? historico.dataEnvio.Value.ToString("dd/MM/yyyy") : String.Empty;
                labelDataEfetivaStatus.Text = historico.dataEfetiva.HasValue ? historico.dataEfetiva.Value.ToString("dd/MM/yyyy") : String.Empty;
                labelDataRecebimento.Text = historico.dataRecebimento.HasValue ? historico.dataRecebimento.Value.ToString("dd/MM/yyyy") : String.Empty;
                labelDataParaEstorno.Text = historico.dataParaEstorno.HasValue ? historico.dataParaEstorno.Value.ToString("dd/MM/yyyy") : String.Empty;
                labelDataDoEstorno.Text = historico.dataDoEstorno.HasValue ? historico.dataDoEstorno.Value.ToString("dd/MM/yyyy") : String.Empty;
                labelChave.Text = historico.id != 0 ? historico.id.ToString() : string.Empty;
                labelUsuarioEstorno.Text = historico.usuario;
                labelValorBase.Text = historico.valorBase.HasValue ? historico.valorBase.Value.ToString("N2") : String.Empty;

                labelDataQuitacaoAbono.Text = historico.quitado == 1 || historico.abonado == 1 ? ((DateTime)historico.dataAbonoQuitacao).ToShortDateString() : String.Empty;
                //labelQuitacaoAbono.Text = historico.quitado == 1 || historico.abonado == 1 ? "Sim" : "Não";

                labelCentraliza.Text = historico.centraliza == 1 ? "Sim" : "Não";
                labelDestacado.Text = historico.destacado == 1 ? "Sim" : "Não";
                labelEntradaManual.Text = historico.entradaManual == 1 ? "Sim" : "Não";

                switch (historico.tipoDivergencia)
                {
                    case 0:
                        labelTipoDivergencia.Text = String.Empty;
                        break;
                    case 1:
                        labelTipoDivergencia.Text = "Valores ainda não recebidos";
                        break;
                    case 2:
                        labelTipoDivergencia.Text = "Recebimentos Inesperados";
                        break;
                    case 3:
                        labelTipoDivergencia.Text = "Valores recebidos a menor";
                        break;
                    case 4:
                        labelTipoDivergencia.Text = "Valores recebidos a maior";
                        break;
                    case 5:
                        labelTipoDivergencia.Text = "Divergência de datas";
                        break;
                    case 6:
                        labelTipoDivergencia.Text = "Valores não recebidos";
                        break;
                    default:
                        labelTipoDivergencia.Text = String.Empty;
                        break;
                }

                labelDataTratamento.Text = historico.dataTratamento.ToString();
                labelTipoTratamentoDado.Text = historico.tipoTratamento;

                if (!String.IsNullOrEmpty(historico.pagarReceber))
                {
                    radioPagar.Checked = historico.pagarReceber.Equals("P");
                    radioReceber.Checked = !historico.pagarReceber.Equals("P");
                }


                #endregion

                #region Aba Integração

                //William Moreira da Silva SOL 220958 KTN 2053543
                //labelDestinoEnvio.Text = historico.envio.ToString();
                if (historico.formaCobranca.Equals("Folha"))
                    labelDestinoEnvio.Text = String.Format("{0} / {1}", historico.formaCobranca, historico.tipoFolha);
                else
                    labelDestinoEnvio.Text = historico.formaCobranca;
                //historico.formaCobranca;
                //historico.tipoFolha;
                labelRubricaFolha.Text = historico.rubrica != 0 ? historico.rubrica.ToString() : String.Empty;
                labelDataUltimoEnvioIntegracao.Text = historico.dataEnvio.HasValue ? historico.dataEnvio.Value.ToString("dd/MM/yyyy HH:mm:ss") : String.Empty;
                //labelChaveFolha.Text = historico.idTMPDesc != 0 ? historico.idTMPDesc.ToString() : String.Empty;
                labelChaveFolha.Text = historico.idTMPDesc != 0 ? String.Format("{0} ({1})", historico.idTMPDesc.ToString(), historico.sitEnvio) : String.Empty;

                //William Moreira da Silva - SOL 235176
                //labelDocumentoCaP.Text = historico.codigoDocumento != 0 ? historico.codigoDocumento.ToString() : String.Empty;
                //labelDocumentoCaR.Text = historico.numeroDocumento != 0 ? String.Format("{0} {1}",historico.numeroDocumento.ToString(), historico.statusDocumento) : String.Empty;
                if (historico.codigoDocumento.HasValue || historico.numeroDocumento.HasValue)
                    labelDocumentoCaPCaR.Text = String.Format("{0}/{1}", historico.codigoDocumento.ToString(), historico.numeroDocumento.ToString());
                else
                    labelDocumentoCaPCaR.Text = String.Empty;
                labelStatusDoc.Text = historico.statusDocumento;

                if (!String.IsNullOrEmpty(historico.statusDocumento))
                {

                }
                //William Moreira da Silva - SOL 235176
                if (historico.planilha.HasValue || historico.plnPlanil != 0)
                    labelPlanilhaApropriacao.Text = String.Format("{0} / {1}", historico.planilha.ToString(), historico.plnPlanil.ToString());
                else
                    labelPlanilhaApropriacao.Text = String.Empty;
                labelContaContabilDebito.Text = historico.cContabilDebito;
                labelContaContabilCredito.Text = historico.cContabilCredito;
                if (historico.plnCodEstorno.HasValue || historico.plnPlanilEstorno != 0)
                    labelPlanilhaEstorno.Text = String.Format("{0} / {1}", historico.plnCodEstorno.ToString(), historico.plnPlanilEstorno.ToString());
                else
                    labelPlanilhaEstorno.Text = String.Empty;
                //William Moreira da Silva SOL 220958 KTN 2053543
                    #endregion

                    #region Aba Log



                    #endregion
            }
        }

        private void carregarGridLog()
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                LogContrato logContrato = new LogContrato();
                logContrato.idHistorico = this.idHistorico;
                List<LogContrato> listaLogContrato = null;

                listaLogContrato = cliente.contrato.consultarLog(logContrato);

                if (!listaLogContrato.Count.Equals(0))
                    gridLog.DataSource = listaLogContrato;
                else
                    gridLog.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridLog.DataBind();
            }
        }

        private void carregarGridHistorico(int pageindex)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                List<Historico> lista = cliente.contrato.consultarHistoricoEnvio(this.idHistorico);

                if (lista.Count > 0)
                {
                    gridHistorico.DataSource = lista;
                    gridHistorico.PageIndex = pageindex; // Xavier SOL 219195
                }
                else
                {
                    gridHistorico.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                }

                gridHistorico.DataBind();
            }

        }

        //William Moreira da Silva - SOL 199847 KINTANA 1926357
        protected void gridHistorico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            carregarGridHistorico(e.NewPageIndex); // Xavier SOL 219195
            recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        }
        //William Moreira da Silva - SOL 199847 KINTANA 1926357

        //Marcio Sanches Spinosa - SOL 187154/13964 - Inicio
        private void verificarPermissoes()
        {
            this.BotaoChaveMestre.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.chaveMestre.ToString());
        }
        //Marcio Sanches Spinosa - SOL 187154/13964 - Fim
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

        protected void BotaoChaveMestre_Click(object sender, EventArgs e)
        {
            
            String strurl = String.Format("PopupEditHistorico.aspx?idHistorico={0}&numeroContrato={1}&acao={2}", this.idHistorico, this.numeroContrato, "U");
            String strscript = "window.open('" + strurl + "', '_self','height=500,width=1000,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes');";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup Edição do Histórico", strscript, true);
        }
    }
}
