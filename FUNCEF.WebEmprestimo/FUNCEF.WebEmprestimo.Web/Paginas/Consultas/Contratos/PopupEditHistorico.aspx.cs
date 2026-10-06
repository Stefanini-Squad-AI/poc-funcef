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
using System.ComponentModel;
using FUNCEF.Planus.Componentes.Web;
using System.Collections.Generic;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    public partial class PopupEditHistorico : PaginaSeguraComEstado
    {
        #region Constantes

        private const string EVENTO = "HMETIPOMOV";
        private const string ITEM = "IDITEMEMPTO";
        private const string PARCELA = "HMEPARCELA";
        private const string PARCELAALT = "HMEPARCELAALT";
        private const string SEQ = "HMESEQCOBRANCA";
        private const string NUMPARCELAS = "HMENUMPARCELAS";
        private const string MESCOMPETENCIA = "HMEMESCOMPETENCIA";
        private const string ANOCOMPETENCIA = "HMEANOCOMPETENCIA";
        private const string MESCOBRANCA = "HMEMESCOBRANCA";
        private const string ANOCOBRANCA = "HMEANOCOBRANCA";
        private const string FORMACOBRANCA = "HMEFORMACOBRANCA";
        private const string TIPOFOLHA = "HMETIPOFOLHA";
        private const string DATAPREVISTA = "HMEDATAPREVISTA";
        private const string DATAVENCTO = "HMEDATAVENCTO";
        private const string DATAEFETIVA = "HMEDATAEFETIVA";
        private const string SALDODEV = "HMESALDODEV";
        private const string DATAATUALIZA = "HMEDATAATUALIZA";
        private const string VLRPREVISTO = "HMEVLRPREVISTO";
        private const string VLREFETIVO = "HMEVLREFETIVO";
        private const string VLRBASE = "HMEVLRBASE";
        private const string TXJUROS = "HMETXJUROS";
        private const string PLANILHA = "PLNCODIGO";
        private const string ABONADO = "FLGABONADO";
        private const string QUITADO = "FLGQUITADO";
        private const string DATAQUITABONO = "HMEDATAQUITABONO";
        private const string BAIXADO = "FLGBAIXADO";
        private const string BAIXAMANUAL = "FLGBAIXAMANUAL";
        private const string DATAESTORNO = "HMEDATAESTORNO";
        private const string ESTORNADO = "FLGESTORNADO";
        private const string PLN = "PLNCODIGOESTORNO";
        private const string ENVIO = "FLGENVIO";
        private const string CODDOCUMENTO = "CODDOCUMENTO";
        private const string IDTMPDESC = "IDTMPDESC";
        private const string DIVERGPEND = "FLGDIVERGPEND";
        private const string TIPODIVERG = "FLGTIPODIVERG";
        private const string DIVERGTRAT = "FLGDIVERGTRAT";
        private const string ENTRADAMANUAL = "FLGENTRADAMANUAL";
        private const string SUSPENSAO = "FLGSUSPENSAO";
        private const string IDTIPOSUSPEMPTMO = "IDTIPOSUSPEMPTMO";
        private const string RECPAG = "HMERECPAG";
        private const string CENTRALIZA = "HMECENTRALIZA";
        private const string DESTACADO = "HMEDESTACADO";

        #endregion

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
                string queryString = Request.QueryString["nrContrato"];
                long numero = 0;

                long.TryParse(queryString, out numero);

                return numero;
            }
        }

        private string acao
        {
            get
            {
                string queryString = Request.QueryString["acao"];
                return queryString;
            }
        }

        private Historico historico;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            caixaTextoContrato.Text = numeroContrato.ToString();
            caixaTextoContrato.Enabled = false;
                                    
            if (!this.IsPostBack)
            {
                if (idHistorico != 0)
                {
                    historico = Consultar(idHistorico);
                    SalvarDadosCache(historico);

                    if (historico.dataPrevista.HasValue)
                    {
                        if (!ValidarContabilPeriodo(DateTime.Parse(historico.dataPrevista.ToString())))
                        {
                            TrataCampos(false);
                            this.registrarAlerta(String.Format("Contabilidade Bloqueada até '{0}'.", historico.dataPrevista.ToString()));
                        }
                    }

                    PreencherTela(historico);
                }
            }
        }

        protected void botaoOK_Click(object sender, EventArgs e)
        {
            Historico historicoOld;
            historico = CapturaDadosTela();
            historicoOld = RecuperarDadosCache();

            if (acao == "I")
            {
                this.Incluir(historico);
                this.registrarAlerta("Registro incluido com sucesso.");
            }
            else
            {
                this.Atualizar(historico);
                this.registrarAlerta("Registro atualizado com sucesso.");
            }

            retorna();
        }

        protected void botaoCancelar_Click(object sender, EventArgs e)
        {
            retorna();
        }

        private void retorna()
        {
            String strurl = String.Format("PopupHistorico.aspx?idHistorico={0}&numeroContrato={1}", this.idHistorico, this.numeroContrato);
            String strscript = "window.open('" + strurl + "', '_self','height=640,width=1120,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=yes')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup Histórico", strscript, true);
        }

        #endregion


        #region Metodos Auxiliar
        /// <summary>
        /// Gravar Historico.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Historico</param>
        private void Incluir(Historico historico)
        {
            List<Historico> listHistorico = new List<Historico>();
            listHistorico.Add(historico);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.incluirHistoricoNovo(listHistorico);
            }
        }

        private void Atualizar(Historico historico)
        {
            Historico historicoOld = RecuperarDadosCache();

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                GravarLogCamposAlterados(VerificarCamposAlterados(historicoOld, historico), cliente);

                cliente.contrato.atualizarHistorico(historico);
            }
        }

        /// <summary>
        /// Consultar Historico.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Consultar Historico</param>
        private Historico Consultar(long idHistorico)
        {
            Historico historicos = null;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                historicos = cliente.contrato.consultarHistoricoChaveMestre(idHistorico);
            }

            return historicos;
        }

        private Historico CapturaDadosTela()
        {
            Historico historico = new Historico();

            historico.id = idHistorico;

            if (!string.IsNullOrEmpty(caixaTextoContrato.Text))
                historico.numeroContrato = long.Parse(caixaTextoContrato.Text);

			//William Moreira da Silva - SOL 253185
            historico.eventoCobranca = new TipoEventoCobranca();
            if (!string.IsNullOrEmpty(caixaTextoEvento.Text))
            {
                historico.eventoCobranca.id = int.Parse(caixaTextoEvento.Text);
                historico.tipoMovimento = TipoEnumeradorBase<int>.obterItemPelaChave<TipoEvento>(historico.eventoCobranca.id);
            }
			//William Moreira da Silva - SOL 253185

            historico.item = new ItemContrato();
            if (!string.IsNullOrEmpty(caixaTextoItem.Text))
                historico.item.id = int.Parse(caixaTextoItem.Text);

            if (!string.IsNullOrEmpty(caixaNumericaParcelas.Text))
                historico.parcela = int.Parse(caixaNumericaParcelas.Text);

            if (!string.IsNullOrEmpty(caixaNumericaParcelaAlt.Text))
                historico.parcelaAlternativa = int.Parse(caixaNumericaParcelaAlt.Text);

            if (!string.IsNullOrEmpty(caixaNumericaSeq.Text))
                historico.sequenciaCobranca = int.Parse(caixaNumericaSeq.Text);

            if (!string.IsNullOrEmpty(caixaNumericaRestam.Text))
                historico.numeroParcelas = int.Parse(caixaNumericaRestam.Text);

            if (!string.IsNullOrEmpty(caixaNumericaMesCompetencia.Text))
                historico.mesCompetencia = int.Parse(caixaNumericaMesCompetencia.Text);

            if (!string.IsNullOrEmpty(caixaTextoAnoCompetencia.Text))
                historico.anoCompetencia = int.Parse(caixaTextoAnoCompetencia.Text);

            if (!string.IsNullOrEmpty(caixaNumericaMesCobranca.Text))
                historico.mesCobranca = int.Parse(caixaNumericaMesCobranca.Text);

            if (!string.IsNullOrEmpty(caixaTextoAnoCobranca.Text))
                historico.anoCobranca = int.Parse(caixaTextoAnoCobranca.Text);

            if (!string.IsNullOrEmpty(listaOpcoesBancoFolha.SelectedValue))
                historico.formaCobranca = listaOpcoesBancoFolha.SelectedValue;

            if (!string.IsNullOrEmpty(listaOpcoesBenefPatro.SelectedValue))
                historico.tipoFolha = listaOpcoesBenefPatro.SelectedValue;

            if (!string.IsNullOrEmpty(caixaDataPrevista.Text))
                historico.dataPrevista = DateTime.Parse(caixaDataPrevista.Text);

            if (!string.IsNullOrEmpty(caixaDataVencto.Text))
                historico.dataVencimento = DateTime.Parse(caixaDataVencto.Text);

            if (!string.IsNullOrEmpty(caixaDataEfetiva.Text))
                historico.dataEfetiva = DateTime.Parse(caixaDataEfetiva.Text);

            if (!string.IsNullOrEmpty(caixaNumericaSaldoDevedor.Text))
                historico.saldoDevedor = double.Parse(caixaNumericaSaldoDevedor.Text);

            if (!string.IsNullOrEmpty(caixaDataAtualizacao.Text))
                historico.dataAtualizacao = DateTime.Parse(caixaDataAtualizacao.Text);

            if (!string.IsNullOrEmpty(caixaNumericaValorPrevisto.Text))
                historico.valorPrevisto = double.Parse(caixaNumericaValorPrevisto.Text);

            if (!string.IsNullOrEmpty(caixaNumericaValorEfetivo.Text))
                historico.valorEfetivo = double.Parse(caixaNumericaValorEfetivo.Text);

            if (!string.IsNullOrEmpty(caixaNumericaValorBase.Text))
                historico.valorBase = double.Parse(caixaNumericaValorBase.Text);

            if (!string.IsNullOrEmpty(caixaNumericaTaxaJuros.Text))
                historico.taxaJuros = double.Parse(caixaNumericaTaxaJuros.Text);

            if (!string.IsNullOrEmpty(caixaAlfaNumericaPlanilha.Text))
                historico.planilha = long.Parse(caixaAlfaNumericaPlanilha.Text);

            if (!string.IsNullOrEmpty(caixaDataQuitAbono.Text))
                historico.dataAbonoQuitacao = DateTime.Parse(caixaDataQuitAbono.Text);

            historico.abonado = GetCaixaSelecao(CaixaSelecaoAbonado);
            historico.quitado = GetCaixaSelecao(CaixaSelecaoQuitado);
            historico.baixado = GetCaixaSelecao(CaixaSelecaoBaixado);
            historico.baixaManual = GetCaixaSelecao(CaixaSelecaoBaixaManual);

            if (!string.IsNullOrEmpty(caixaTextoCodDocumento.Text))
                historico.codigoDocumento = long.Parse(caixaTextoCodDocumento.Text);

            if (!string.IsNullOrEmpty(caixaAlfaNumericaIDTmpDesc.Text))
                historico.idTMPDesc = long.Parse(caixaAlfaNumericaIDTmpDesc.Text);

            if (!string.IsNullOrEmpty(caixaDataEstornado.Text))
                historico.dataDoEstorno = DateTime.Parse(caixaDataEstornado.Text);

            historico.estorno = GetCaixaSelecao(caixaSelecaEstornado);

            if (!string.IsNullOrEmpty(caixaAlfaNumericaPln.Text))
                historico.plnCodEstorno = long.Parse(caixaAlfaNumericaPln.Text);

            historico.enviado = GetCaixaSelecao(caixaSelecaoEnviado);
            historico.entradaManual = GetCaixaSelecao(caixaSelecaoEntradaManual);
            historico.divergencia = GetCaixaSelecao(caixaSelecaoDivergente);
            historico.divergenciaTratada = GetCaixaSelecao(caixaSelecaoDivirgenciaTratada);

            if (!string.IsNullOrEmpty(listaDropDownMotivoDivergencia.SelectedValue))
                historico.tipoDivergencia = int.Parse(listaDropDownMotivoDivergencia.SelectedValue);

            if (!string.IsNullOrEmpty(caixaAlfaNumericaIdTipoSusp.Text))
                historico.idTipoSusp = long.Parse(caixaAlfaNumericaIdTipoSusp.Text);

            historico.suspenso = GetCaixaSelecao(caixaSelecaoSuspenso);

            if (!string.IsNullOrEmpty(listaOpcoesApagarReceber.SelectedValue))
                historico.pagarReceber = listaOpcoesApagarReceber.SelectedValue;

            historico.centraliza = GetCaixaSelecao(caixaSelecaoCentraliza);
            historico.destacado = GetCaixaSelecao(caixaSelecaoDestacado);

            historico.usuarioInclusao = this.contextoSistema.loginUsuarioAtual;

            return historico;
        }

        private void PreencherTela(Historico historico)
        {
            caixaTextoContrato.Text = historico.numeroContrato.ToString();
            caixaTextoEvento.Text = historico.eventoCobranca.id.ToString();
            caixaTextoItem.Text = historico.item.id.ToString();
            caixaNumericaParcelas.Text = historico.parcela.ToString();
            caixaNumericaParcelaAlt.Text = historico.parcelaAlternativa.ToString();
            caixaNumericaSeq.Text = historico.sequenciaCobranca.ToString();
            caixaNumericaRestam.Text = historico.numeroParcelas.ToString();
            caixaNumericaMesCompetencia.Text = historico.mesCompetencia.ToString();
            caixaTextoAnoCompetencia.Text = historico.anoCompetencia.ToString();
            caixaNumericaMesCobranca.Text = historico.mesCobranca.ToString();
            caixaTextoAnoCobranca.Text = historico.anoCobranca.ToString();
            listaOpcoesBancoFolha.SelectedValue = historico.formaCobranca;
            listaOpcoesBenefPatro.SelectedValue = historico.tipoFolha;
            caixaDataPrevista.Text = historico.dataPrevista.ToString();
            caixaDataVencto.Text = historico.dataVencimento.ToString();
            caixaDataEfetiva.Text = historico.dataEfetiva.ToString();
            caixaNumericaSaldoDevedor.Text = historico.saldoDevedor.ToString();
            caixaDataAtualizacao.Text = historico.dataAtualizacao.ToString();
            caixaNumericaValorPrevisto.Text = historico.valorPrevisto.ToString();
            caixaNumericaValorEfetivo.Text = historico.valorEfetivo.ToString();
            caixaNumericaValorBase.Text = historico.valorBase.ToString();
            caixaNumericaTaxaJuros.Text = historico.taxaJuros.ToString();
            caixaAlfaNumericaPlanilha.Text = historico.planilha.ToString();
            caixaDataQuitAbono.Text = historico.dataAbonoQuitacao.ToString();
            CaixaSelecaoAbonado.Checked = TrataFlag(historico.abonado.ToString());
            CaixaSelecaoQuitado.Checked = TrataFlag(historico.quitado.ToString());
            CaixaSelecaoBaixado.Checked = TrataFlag(historico.baixado.ToString());
            CaixaSelecaoBaixaManual.Checked = TrataFlag(historico.baixaManual.ToString());
            caixaTextoCodDocumento.Text = historico.codigoDocumento.ToString();
            caixaAlfaNumericaIDTmpDesc.Text = historico.idTMPDesc.ToString();
            caixaDataEstornado.Text = historico.dataDoEstorno.ToString();
            caixaSelecaEstornado.Checked = TrataFlag(historico.estorno.ToString());
            caixaAlfaNumericaPln.Text = historico.plnCodEstorno.ToString();
            caixaSelecaoEnviado.Checked = TrataFlag(historico.enviado.ToString());
            caixaSelecaoEntradaManual.Checked = TrataFlag(historico.entradaManual.ToString());
            caixaSelecaoDivergente.Checked = TrataFlag(historico.divergencia.ToString());
            caixaSelecaoDivirgenciaTratada.Checked = TrataFlag(historico.divergenciaTratada.ToString());
            listaDropDownMotivoDivergencia.SelectedValue = historico.tipoDivergencia.ToString();
            caixaAlfaNumericaIdTipoSusp.Text = historico.idTipoSusp.ToString();
            caixaSelecaoSuspenso.Checked = TrataFlag(historico.suspenso.ToString());
            listaOpcoesApagarReceber.SelectedValue = historico.pagarReceber;
            caixaSelecaoCentraliza.Checked = TrataFlag(historico.centraliza.ToString());
            caixaSelecaoDestacado.Checked = TrataFlag(historico.destacado.ToString());
            historico.usuarioInclusao = this.contextoSistema.loginUsuarioAtual;

        }

        private int GetCaixaSelecao(FUNCEF.Planus.GlobalWeb.Web.IU.Controles.CaixaSelecao caixaSelecao)
        {
            int i;
            if (caixaSelecao.Checked)
            {
                i = 1;
            }
            else
            {
                i = 0;
            }

            return i;

        }

        private bool TrataFlag(string valor)
        {
            if (string.IsNullOrEmpty(valor))
            {
                return false;
            }
            else if (valor == "0")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Tratar campos (Habilitar e Desabilitar Campos na Tela).
        /// true - Habilitar
        /// false - Desabilitar
        /// </summary>        
        /// <param name="e">parametro</param>
        private void TrataCampos(bool parametro)
        {
            caixaTextoEvento.Enabled = parametro;
            caixaTextoItem.Enabled = parametro;
            caixaNumericaParcelas.Enabled = parametro;
            caixaNumericaParcelaAlt.Enabled = parametro;
            caixaNumericaSeq.Enabled = parametro;
            caixaNumericaRestam.Enabled = parametro;
            caixaNumericaMesCompetencia.Enabled = parametro;
            caixaTextoAnoCompetencia.Enabled = parametro;
            caixaNumericaMesCobranca.Enabled = parametro;
            caixaTextoAnoCobranca.Enabled = parametro;
            listaOpcoesBancoFolha.Enabled = parametro;
            listaOpcoesBenefPatro.Enabled = parametro;
            caixaDataPrevista.Enabled = parametro;
            caixaDataVencto.Enabled = parametro;
            caixaDataEfetiva.Enabled = parametro;
            caixaNumericaSaldoDevedor.Enabled = parametro;
            caixaDataAtualizacao.Enabled = parametro;
            caixaNumericaValorPrevisto.Enabled = parametro;
            caixaNumericaValorEfetivo.Enabled = parametro;
            caixaNumericaValorBase.Enabled = parametro;
            caixaNumericaTaxaJuros.Enabled = parametro;
            caixaAlfaNumericaPlanilha.Enabled = parametro;
            //caixaDataQuitAbono.Enabled = parametro;
            //CaixaSelecaoAbonado.Enabled = parametro;
            CaixaSelecaoQuitado.Enabled = parametro;
            CaixaSelecaoBaixado.Enabled = parametro;
            CaixaSelecaoBaixaManual.Enabled = parametro;
            caixaTextoCodDocumento.Enabled = parametro;
            caixaAlfaNumericaIDTmpDesc.Enabled = parametro;
            caixaDataEstornado.Enabled = parametro;
            caixaSelecaEstornado.Enabled = parametro;
            caixaAlfaNumericaPln.Enabled = parametro;
            caixaSelecaoEnviado.Enabled = parametro;
            caixaSelecaoEntradaManual.Enabled = parametro;
            caixaSelecaoDivergente.Enabled = parametro;
            caixaSelecaoDivirgenciaTratada.Enabled = parametro;
            listaDropDownMotivoDivergencia.Enabled = parametro;
            caixaAlfaNumericaIdTipoSusp.Enabled = parametro;
            caixaSelecaoSuspenso.Enabled = parametro;
            listaOpcoesApagarReceber.Enabled = parametro;
            caixaSelecaoCentraliza.Enabled = parametro;
            caixaSelecaoDestacado.Enabled = parametro;

        }

        private bool ValidarContabilPeriodo(DateTime dataPrevista)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                return cliente.contrato.verificarBloqueioContabilPeriodo(this.numeroContrato, dataPrevista);
            }
        }

        private void SalvarDadosCache(Historico historico)
        {
            try
            {
                Cache["HistoricoAtual"] = historico;
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus("Erro ao salvar Histórico em Cache.", ex);
            }

        }

        private Historico RecuperarDadosCache()
        {
            Historico hst = new Historico();

            if (Cache["HistoricoAtual"] != null)
            {
                hst = (Historico)Cache["HistoricoAtual"];
            }

            return hst;
        }

        private List<CamposAlterados> VerificarCamposAlterados(Historico historicoOld, Historico historico)
        {
            CamposAlterados camposAlterados;
            List<CamposAlterados> listaCamposAlterados = new List<CamposAlterados>();

            //Numero Contrato
            if (historicoOld.numeroContrato != historico.numeroContrato)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "IDCONTRATOEMPTMO";
                camposAlterados.informacaoAnterior = historicoOld.numeroContrato.ToString();
                camposAlterados.informacaoAtual = historico.numeroContrato.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Evento
            if (historicoOld.eventoCobranca.id != historico.eventoCobranca.id)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = EVENTO;
                camposAlterados.informacaoAnterior = historicoOld.eventoCobranca.id.ToString();
                camposAlterados.informacaoAtual = historico.eventoCobranca.id.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Item
            if (historicoOld.item.id != historico.item.id)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = ITEM;
                camposAlterados.informacaoAnterior = historicoOld.item.id.ToString();
                camposAlterados.informacaoAtual = historico.item.id.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Parcela
            if (historicoOld.parcela != historico.parcela)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = PARCELA;
                camposAlterados.informacaoAnterior = historicoOld.parcela.ToString();
                camposAlterados.informacaoAtual = historico.parcela.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Parcela Alt
            if (historicoOld.parcelaAlternativa != historico.parcelaAlternativa)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = PARCELAALT;
                camposAlterados.informacaoAnterior = historicoOld.parcelaAlternativa.ToString();
                camposAlterados.informacaoAtual = historico.parcelaAlternativa.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Seq
            if (historicoOld.sequenciaCobranca != historico.sequenciaCobranca)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = SEQ;
                camposAlterados.informacaoAnterior = historicoOld.sequenciaCobranca.ToString();
                camposAlterados.informacaoAtual = historico.sequenciaCobranca.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Nr. Parcelas
            if (historicoOld.numeroParcelas != historico.numeroParcelas)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = NUMPARCELAS;
                camposAlterados.informacaoAnterior = historicoOld.numeroParcelas.ToString();
                camposAlterados.informacaoAtual = historico.numeroParcelas.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Mes Competencia
            if (historicoOld.mesCompetencia != historico.mesCompetencia)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = MESCOMPETENCIA;
                camposAlterados.informacaoAnterior = historicoOld.mesCompetencia.ToString();
                camposAlterados.informacaoAtual = historico.mesCompetencia.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Ano Competencia
            if (historicoOld.anoCompetencia != historico.anoCompetencia)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = ANOCOMPETENCIA;
                camposAlterados.informacaoAnterior = historicoOld.anoCompetencia.ToString();
                camposAlterados.informacaoAtual = historico.anoCompetencia.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Mes Cobrança
            if (historicoOld.mesCobranca != historico.mesCobranca)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = MESCOBRANCA;
                camposAlterados.informacaoAnterior = historicoOld.mesCobranca.ToString();
                camposAlterados.informacaoAtual = historico.mesCobranca.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Ano Cobrança
            if (historicoOld.anoCobranca != historico.anoCobranca)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = ANOCOBRANCA;
                camposAlterados.informacaoAnterior = historicoOld.anoCobranca.ToString();
                camposAlterados.informacaoAtual = historico.anoCobranca.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Forma Cobrança
            if (historicoOld.formaCobranca != historico.formaCobranca)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = FORMACOBRANCA;
                camposAlterados.informacaoAnterior = historicoOld.formaCobranca.ToString();
                camposAlterados.informacaoAtual = historico.formaCobranca.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Tipo Folha
            if (!string.IsNullOrEmpty(historicoOld.tipoFolha))
            {
                if (historicoOld.tipoFolha != historico.tipoFolha)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = TIPOFOLHA;
                    camposAlterados.informacaoAnterior = historicoOld.tipoFolha;
                    camposAlterados.informacaoAtual = historico.tipoFolha;
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }
            
            //Data Prevista
            if (historicoOld.dataPrevista != historico.dataPrevista)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DATAPREVISTA;
                camposAlterados.informacaoAnterior = historicoOld.dataPrevista.ToString();
                camposAlterados.informacaoAtual = historico.dataPrevista.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Data Vencimento
            if (historicoOld.dataVencimento != historico.dataVencimento)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DATAVENCTO;
                camposAlterados.informacaoAnterior = historicoOld.dataVencimento.ToString();
                camposAlterados.informacaoAtual = historico.dataVencimento.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Data Efetiva
            if (historicoOld.dataEfetiva != historico.dataEfetiva)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DATAEFETIVA;
                camposAlterados.informacaoAnterior = historicoOld.dataEfetiva.ToString();
                camposAlterados.informacaoAtual = historico.dataEfetiva.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Saldo Devedor
            if (historicoOld.saldoDevedor != historico.saldoDevedor)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = SALDODEV;
                camposAlterados.informacaoAnterior = historicoOld.saldoDevedor.ToString();
                camposAlterados.informacaoAtual = historico.saldoDevedor.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Data Atualização
            if (historicoOld.dataAtualizacao != historico.dataAtualizacao)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DATAATUALIZA;
                camposAlterados.informacaoAnterior = historicoOld.dataAtualizacao.ToString();
                camposAlterados.informacaoAtual = historico.dataAtualizacao.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Valor Previsto
            if (historicoOld.valorPrevisto != historico.valorPrevisto)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = VLRPREVISTO;
                camposAlterados.informacaoAnterior = historicoOld.valorPrevisto.ToString();
                camposAlterados.informacaoAtual = historico.valorPrevisto.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Valor Efetivo
            if (historicoOld.valorEfetivo != historico.valorEfetivo)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = VLREFETIVO;
                camposAlterados.informacaoAnterior = historicoOld.valorEfetivo.ToString();
                camposAlterados.informacaoAtual = historico.valorEfetivo.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Valor Base
            if (historicoOld.valorBase != historico.valorBase)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = VLRBASE;
                camposAlterados.informacaoAnterior = historicoOld.valorBase.ToString();
                camposAlterados.informacaoAtual = historico.valorBase.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Taxa Juros
            if (historicoOld.taxaJuros != historico.taxaJuros)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = TXJUROS;
                camposAlterados.informacaoAnterior = historicoOld.taxaJuros.ToString();
                camposAlterados.informacaoAtual = historico.taxaJuros.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Planilha
            if (historicoOld.planilha != historico.planilha)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = PLANILHA;
                camposAlterados.informacaoAnterior = historicoOld.planilha.ToString();
                camposAlterados.informacaoAtual = historico.planilha.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Data Abono Quitação
            if (historicoOld.dataAbonoQuitacao != historico.dataAbonoQuitacao)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DATAQUITABONO;
                camposAlterados.informacaoAnterior = historicoOld.dataAbonoQuitacao.ToString();
                camposAlterados.informacaoAtual = historico.dataAbonoQuitacao.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Abonado
            if (historicoOld.abonado != null)
            {
                if (historicoOld.abonado != historico.abonado)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = ABONADO;
                    camposAlterados.informacaoAnterior = historicoOld.abonado.ToString();
                    camposAlterados.informacaoAtual = historico.abonado.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }
            
            //Quitado
            if (historicoOld.quitado != null)
            {
                if (historicoOld.quitado != historico.quitado)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = QUITADO;
                    camposAlterados.informacaoAnterior = historicoOld.quitado.ToString();
                    camposAlterados.informacaoAtual = historico.quitado.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }
            

            //Baixado
            if (historicoOld.baixado != null)
            {
                if (historicoOld.baixado != historico.baixado)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = BAIXADO;
                    camposAlterados.informacaoAnterior = historicoOld.baixado.ToString();
                    camposAlterados.informacaoAtual = historico.baixado.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }            
            
            //Baixa Manual
            if (historicoOld.baixaManual != null)
            {
                if (historicoOld.baixaManual != historico.baixaManual)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = BAIXAMANUAL;
                    camposAlterados.informacaoAnterior = historicoOld.baixaManual.ToString();
                    camposAlterados.informacaoAtual = historico.baixaManual.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }
            
            //Cod. Documento
            if (historicoOld.codigoDocumento != historico.codigoDocumento)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = CODDOCUMENTO;
                camposAlterados.informacaoAnterior = historicoOld.codigoDocumento.ToString();
                camposAlterados.informacaoAtual = historico.codigoDocumento.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //idTMPDesc
            if (historicoOld.idTMPDesc != historico.idTMPDesc)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = IDTMPDESC;
                camposAlterados.informacaoAnterior = historicoOld.idTMPDesc.ToString();
                camposAlterados.informacaoAtual = historico.idTMPDesc.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Data Estorno
            if (historicoOld.dataDoEstorno != historico.dataDoEstorno)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DATAESTORNO;
                camposAlterados.informacaoAnterior = historicoOld.dataDoEstorno.ToString();
                camposAlterados.informacaoAtual = historico.dataDoEstorno.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Estorno
            if (historicoOld.estorno != null)
            {
                if (historicoOld.estorno != historico.estorno)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = ESTORNADO;
                    camposAlterados.informacaoAnterior = historicoOld.estorno.ToString();
                    camposAlterados.informacaoAtual = historico.estorno.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }
            

            //PLN
            if (historicoOld.plnCodEstorno != historico.plnCodEstorno)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = PLN;
                camposAlterados.informacaoAnterior = historicoOld.plnCodEstorno.ToString();
                camposAlterados.informacaoAtual = historico.plnCodEstorno.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Envio
            if (historicoOld.enviado != null)
            {
                if (historicoOld.enviado != historico.enviado)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = ENVIO;
                    camposAlterados.informacaoAnterior = historicoOld.enviado.ToString();
                    camposAlterados.informacaoAtual = historico.enviado.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }            

            //Entrada Manual
            if (historicoOld.entradaManual != null)
            {
                if (historicoOld.entradaManual != historico.entradaManual)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = ENTRADAMANUAL;
                    camposAlterados.informacaoAnterior = historicoOld.entradaManual.ToString();
                    camposAlterados.informacaoAtual = historico.entradaManual.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }            

            //Divergencia
            if (historicoOld.divergencia != null)
            {
                if (historicoOld.divergencia != historico.divergencia)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = DIVERGPEND;
                    camposAlterados.informacaoAnterior = historicoOld.divergencia.ToString();
                    camposAlterados.informacaoAtual = historico.divergencia.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }            

            //Divergencia Tratada
            if (historicoOld.divergenciaTratada != null)
            {
                if (historicoOld.divergenciaTratada != historico.divergenciaTratada)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = DIVERGTRAT;
                    camposAlterados.informacaoAnterior = historicoOld.divergenciaTratada.ToString();
                    camposAlterados.informacaoAtual = historico.divergenciaTratada.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }                
            }
            
            //Tipo Divergencia
            if (historicoOld.tipoDivergencia != historico.tipoDivergencia)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = TIPODIVERG;
                camposAlterados.informacaoAnterior = historicoOld.tipoDivergencia.ToString();
                camposAlterados.informacaoAtual = historico.tipoDivergencia.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //idTipoSusp
            if (historicoOld.idTipoSusp != historico.idTipoSusp)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = IDTIPOSUSPEMPTMO;
                camposAlterados.informacaoAnterior = historicoOld.idTipoSusp.ToString();
                camposAlterados.informacaoAtual = historico.idTipoSusp.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Suspensão
            if (historicoOld.suspenso != null)
            {
                if (historicoOld.suspenso != historico.suspenso)
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = SUSPENSAO;
                    camposAlterados.informacaoAnterior = historicoOld.suspenso.ToString();
                    camposAlterados.informacaoAtual = historico.suspenso.ToString();
                    listaCamposAlterados.Add(camposAlterados);
                }               
            }
            
            //Pagar Receber
            if (historicoOld.pagarReceber != historico.pagarReceber)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = RECPAG;
                camposAlterados.informacaoAnterior = historicoOld.pagarReceber.ToString();
                camposAlterados.informacaoAtual = historico.pagarReceber.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Centraliza
            if (historicoOld.centraliza != historico.centraliza)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = CENTRALIZA;
                camposAlterados.informacaoAnterior = historicoOld.centraliza.ToString();
                camposAlterados.informacaoAtual = historico.centraliza.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            //Destacada
            if (historicoOld.destacado != historico.destacado)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = DESTACADO;
                camposAlterados.informacaoAnterior = historicoOld.destacado.ToString();
                camposAlterados.informacaoAtual = historico.destacado.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            return listaCamposAlterados;
        }

        private void GravarLogCamposAlterados(List<CamposAlterados> listaCamposAlterados, Cliente<IServicoContrato> cliente)
        {
            LogContrato log = new LogContrato();
            log.idHistorico = this.idHistorico;

            for (int i = 0; i < listaCamposAlterados.Count; i++)
            {
                log.descricao = "Campo: " + listaCamposAlterados[i].nome + " alterado de: " + listaCamposAlterados[i].informacaoAnterior +
                    " para: " + listaCamposAlterados[i].informacaoAtual;

                log.origem = Origem.consultaContratos;
                log.numeroContrato = historico.numeroContrato;
                cliente.contrato.incluirLog(log);
            }
        }

        #endregion

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
    }
}
