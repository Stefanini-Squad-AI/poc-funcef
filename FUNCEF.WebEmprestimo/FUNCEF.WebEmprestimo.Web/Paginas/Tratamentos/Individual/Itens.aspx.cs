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
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual
{
    public partial class Itens : PaginaSegura
    {
        #region propriedades

        const int itensBaixadosManualmente = 1;
        const int apenasItensSuspensos = 2;
        const int naoItensSuspensos = 4;
        const int itensPrestacaoEncargos = 8;
        const int campanhaDescontos = 16;

        const int tipoProposta = 2;

        const int abonar = 1;
        const int desviar = 2;
        const int baixarManualmente = 3;
        const int desfazerBaixaManual = 4;
        const int suspender = 5;
        const int liberarSuspensao = 6;
        const int alterarVencimento = 7;
        const int alterarVencimentoSemEncargo = 8;

        private bool CampanhaDescontos
        {
            get
            {
                if (this.ViewState["boolCampanhaDescontos"] != null)
                    return (bool)this.ViewState["boolCampanhaDescontos"];
                else
                    return false;
            }
            set
            {
                this.ViewState["boolCampanhaDescontos"] = value;
            }
        }

        private List<ItemDescontoContrato> descontoCampanha
        {
            get
            {
                if (this.ViewState["itensDescontoCampanha"] != null)
                    return (List<ItemDescontoContrato>)this.ViewState["itensDescontoCampanha"];
                else
                    return new List<ItemDescontoContrato>();
            }
            set
            {
                this.ViewState["itensDescontoCampanha"] = value;
            }
        }

        private string guidItens
        {
            get
            {
                string queryString = Request.QueryString["guidItens"];

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

        public List<TipoSuspensao> listaTipoSuspensao
        {
            get
            {
                if (ViewState["vListaTipoSuspensao"] == null)
                    ViewState["vListaTipoSuspensao"] = new List<TipoSuspensao>();

                return (List<TipoSuspensao>)ViewState["vListaTipoSuspensao"];
            }
            set
            {
                ViewState["vListaTipoSuspensao"] = value;
            }
        }

        public List<Historico> itensemAberto
        {
            get
            {
                if (ViewState["vListaItensAberto"] == null)
                    ViewState["vListaItensAberto"] = new List<Historico>();

                return (List<Historico>)ViewState["vListaItensAberto"];
            }
            set
            {
                ViewState["vListaItensAberto"] = value;
            }
        }

        public List<ParcelaDescontoCampanha> itensDesconto
        {
            get
            {
                if (ViewState["vListaItensDesconto"] == null)
                    ViewState["vListaItensDesconto"] = new List<ParcelaDescontoCampanha>();

                return (List<ParcelaDescontoCampanha>)ViewState["vListaItensDesconto"];
            }
            set
            {
                ViewState["vListaItensDesconto"] = value;
            }
        }

        public Int32 checks
        {
            get
            {
                if (ViewState["vchecks"] == null)
                    ViewState["vchecks"] = new Int32();

                return (Int32)ViewState["vchecks"];
            }
            set
            {
                ViewState["vchecks"] = value;
            }
        }

        public Int32 idTipoContrato
        {
            get
            {
                if (ViewState["vidTipoContrato"] == null)
                    ViewState["vidTipoContrato"] = new Int32();

                return (Int32)ViewState["vidTipoContrato"];
            }
            set
            {
                ViewState["vidTipoContrato"] = value;
            }
        }

        //Campanha Desconto
        public Int32 IdMutuario
        {
            get
            {
                if (ViewState["IdMutuario"] == null)
                    ViewState["IdMutuario"] = new Int32();

                return (Int32)ViewState["IdMutuario"];
            }
            set
            {
                ViewState["IdMutuario"] = value;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.renderizaBotoes();

                dataProcesso.Text = DateTime.Today.ToString();
                valorRecebido.Text = "0";
                totalSelecionado.Text = "0";

                gridItensEmAberto.DataSource = null;
                gridItensEmAberto.DataBind();

                Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);

                this.numeroContrato = (long)parametrosItens["numeroContrato"];
                this.idTipoContrato = (int)parametrosItens["idTipoContrato"];
                this.checks = (int)parametrosItens["checksBox"];
                //Campanha Desconto
                this.IdMutuario = (int)parametrosItens["IdMutuario"];

                //Tratamento dos checkBox selecionados na tela anterior
                int iItensBaixadosManualmente = ((itensBaixadosManualmente & checks) == itensBaixadosManualmente) ? 1 : 0;
                int iApenasItensSuspensos = ((apenasItensSuspensos & checks) == apenasItensSuspensos) ? 1 : 0;
                int iNaoItensSuspensos = ((naoItensSuspensos & checks) == naoItensSuspensos) ? 1 : 0;
                int iItensPrestacaoEncargos = ((itensPrestacaoEncargos & checks) == itensPrestacaoEncargos) ? 1 : 0;
                this.CampanhaDescontos = ((campanhaDescontos & checks) == campanhaDescontos) ? true : false;

                lblNumContrato.Text = this.numeroContrato.ToString();

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    dataVenctoEfetivaAbono.valorData = cliente.contrato.calcularDataLimite(DateTime.Now);

                    if (this.CampanhaDescontos)
                    {
                        calculaCampanhaDesconto();
                        ListaDropDowntipoSuspensao.Enabled = false;
                        valorRecebido.Enabled = false;
                    }
                    else
                    {
                        int quantItens = cliente.contrato.consultaQuantItensAberto(numeroContrato, idTipoContrato, iItensBaixadosManualmente, iApenasItensSuspensos, iItensPrestacaoEncargos, iNaoItensSuspensos);
                        if (quantItens > 400)
                        {
                            for (int i = 0; i < quantItens; i = i + 400)
                            {
                                itensemAberto.AddRange(cliente.contrato.consultarItensAbertoParticionado(numeroContrato, idTipoContrato, iItensBaixadosManualmente, iApenasItensSuspensos, iItensPrestacaoEncargos, iNaoItensSuspensos, i));
                            }
                        }
                        else
                        {
                            itensemAberto = cliente.contrato.consultarItensAberto(numeroContrato, idTipoContrato, iItensBaixadosManualmente, iApenasItensSuspensos, iItensPrestacaoEncargos, iNaoItensSuspensos);
                        }
                        listaTipoSuspensao = cliente.contrato.consultarTipoSuspensao(idTipoContrato, null);
                        if(listaTipoSuspensao == null || listaTipoSuspensao.Count() <= 0)
                        {
                            this.registrarAlerta("O contrato não possui tipo de suspensão cadastrado.");
                        }

                        UtilidadesPagina.preencherDropDown(ListaDropDowntipoSuspensao, listaTipoSuspensao, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                        ListaDropDowntipoSuspensao.Items.Insert(0, new ListItem("Selecione", "0"));//Inserindo um item em branco na lista de suspensões

                        gridItensEmAberto.EmptyDataText = "Não há itens a processar.";
                        gridItensEmAberto.DataSource = itensemAberto;
                        gridItensEmAberto.DataBind();
                    }
                }
            }
        }

        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.tratamentoIndividualdeParcelas;
            }
        }

        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }

        private void renderizaBotoes()
        {
            divAbonar.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString((Convert.ToInt64(PermissoesSistema.abonar) - 1) * 1024));
            divDesviar.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString(Convert.ToInt64(PermissoesSistema.desvio) * 1024));
            divLiberarSuspensao.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString(Convert.ToInt64(PermissoesSistema.liberarSuspensao) * 1024));
            divSuspeder.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString(Convert.ToInt64(PermissoesSistema.suspender) * 1024));
            divAlterarVencimento.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString((Convert.ToInt64(PermissoesSistema.alterarDataVencimentoComEncargos) - 1) * 1024));
            divAlterarVencimentoSemEncargos.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString((Convert.ToInt64(PermissoesSistema.alterarDataVencimentoSemEncargos) - 1) * 1024));
            divBaixaManual.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString(Convert.ToInt64(PermissoesSistema.baixarManualmente) * 1024));
            divBesfazerBaixa.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString(Convert.ToInt64(PermissoesSistema.desfazerBaixaManual) * 1024));
            //divAbonar.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.abonar.ToString());
            //divDesviar.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.desvio.ToString());
            //divLiberarSuspensao.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.liberarSuspensao.ToString());
            //divSuspeder.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.suspender.ToString());
            //divAlterarVencimento.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.alterarDataVencimentoComEncargos.ToString());
            //divAlterarVencimentoSemEncargos.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.alterarDataVencimentoSemEncargos.ToString());
            //divBaixaManual.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.baixarManualmente.ToString());
            //divBesfazerBaixa.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.desfazerBaixaManual.ToString());
        }

        protected void gridItensEmAberto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var chk = e.Row.FindControl("CheckBoxButton") as CheckBox;
                if (chk != null)
                {
                }
            }
        }

        protected void botaoAbonar_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(abonar);
        }

        protected void botaoDesviar_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(desviar);
        }

        protected void botaoBaixarManualmente_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(baixarManualmente);
        }

        protected void botaoDesfazerBaixaManual_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(desfazerBaixaManual);
        }

        protected void botaoSuspender_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(suspender);
        }

        protected void botaoLiberarSuspensao_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(liberarSuspensao);
        }

        protected void botaoAlterarVencimento_Click(object sender, EventArgs e)
        {
            //RetornoPopup retorno = (RetornoPopup)Session["confirmacaoAlterarVencimento"];
            //if (retorno.retorno)
            //{
            //    if (CampanhaDescontos)
            //        efetivaCampanhaDesconto();
            //    else
            //        proximaPagina(alterarVencimento);
            //}
            proximaPagina(alterarVencimento);
        }

        protected void botaoAlterarVenctoSemEncargos_Click(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                naoDisponivel();
            else
                proximaPagina(alterarVencimentoSemEncargo);
        }

        private List<Historico> buscaItensSelecionados(int funcionalidade, ref List<int> parcelas)
        {
            List<Historico> histItensSelecionados = new List<Historico>();

            //Se for Campanha de Descontos é necessário transformar os itens de desconto em itens de histórico
            if (this.CampanhaDescontos)
            {
                foreach (var prestacao in itensDesconto)
                {
                    parcelas.Add(prestacao.numParcela);
                }
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    itensemAberto = cliente.contrato.buscarHistoricoDePrestacoesEmAberto(this.numeroContrato, parcelas);
                }
                gridItensEmAberto.DataSource = itensemAberto;
                gridItensEmAberto.DataBind();
                //Marca todos os itens
                for (int i = 0; i < gridItensEmAberto.Rows.Count; i++)
                {
                    string movimentacao = Server.HtmlDecode(gridItensEmAberto.Rows[i].Cells[1].Text).TrimEnd();
                    if (movimentacao.Equals(TipoEvento.prestacao.descricao))
                        ((CheckBox)gridItensEmAberto.Rows[i].FindControl("CheckBoxButton")).Checked = true;
                }
            }

            Historico hist = new Historico();
            if (gridItensEmAberto.Rows.Count > 0)
            {
                for (int i = 0; i < gridItensEmAberto.Rows.Count; i++)
                {
                    if (gridItensEmAberto.Rows[i].RowType == DataControlRowType.DataRow)//William Moreira da Silva - SOL 262198 - PPM 1091970
                    {
                        var chk = gridItensEmAberto.Rows[i].FindControl("CheckBoxButton") as CheckBox;
                        if (chk != null && chk.Checked)
                        {
                            DataKey dataKey = gridItensEmAberto.DataKeys[i];

                            itensemAberto.Find(t1 => t1.id == Int64.Parse(dataKey.Values["id"].ToString())).selecionado = true;
                            hist = itensemAberto.Find(t1 => t1.id == Int64.Parse(dataKey.Values["id"].ToString()));
                            hist.selecionado = true;
                            //Para cada item selecionado, se a opção selecionado for de alteração de vencimento o sistema verifica
                            //se a data escolhida para a alteração, é maior que a data prevista de cada item.
                            if (funcionalidade == alterarVencimento || funcionalidade == alterarVencimentoSemEncargo)
                            {
                                if (hist.dataPrevista >= DateTime.Parse(dataVenctoEfetivaAbono.Text))
                                {
                                    this.registrarAlerta("A data de vencimento deverá ser posterior a data prevista dos itens.");
                                    return new List<Historico>();
                                }
                            }
                            if (funcionalidade == abonar || funcionalidade == baixarManualmente)
                            {
                                if (string.IsNullOrEmpty(dataVenctoEfetivaAbono.Text))
                                {
                                    this.registrarAlerta("É necessário indicar a Data de Abono.");
                                    return new List<Historico>();
                                }
                                if (hist.dataPrevista >= DateTime.Parse(dataVenctoEfetivaAbono.Text))
                                {
                                    this.registrarAlerta("A data de abono ou efetiva não poderá ser anterior a data prevista do item.");
                                    return new List<Historico>();
                                }
                            }
                            //Busca as parcelas selecionadas
                            if (parcelas != null)
                            {
                                if (parcelas.Count != 0)
                                {
                                    if (parcelas.Count(t1 => t1 == hist.parcela) == 0)
                                    {
                                        parcelas.Add(int.Parse(hist.parcela.ToString()));
                                    }
                                }
                                else
                                {
                                    parcelas.Add(int.Parse(hist.parcela.ToString()));
                                }
                            }
                            histItensSelecionados.Add(hist);
                        }
                    }
                }
            }
            else
            {
                this.registrarAlerta("Não há itens a processar.");

            }

            if (histItensSelecionados.Count == 0)
            {
                this.registrarAlerta("Selecione ao menos um item.");
            }

            return histItensSelecionados;
        }

        private void proximaPagina(int funcionalidade)
        {
            bool flagApenasEncargos = false;
            try
            {
                List<Historico> histItensSelecionados = new List<Historico>();
                List<int> listParcelas = new List<int>();
                TipoSuspensao tipoSuspensao = new TipoSuspensao();

                histItensSelecionados = this.buscaItensSelecionados(funcionalidade, ref listParcelas);

                Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);

                if (histItensSelecionados.Count > 0)
                {
                    if (histItensSelecionados.Count(t1 => t1.baixado == 1 || t1.baixaManual == 1) > 0 && !(funcionalidade == liberarSuspensao || funcionalidade == baixarManualmente || funcionalidade == desfazerBaixaManual))
                    {
                        this.registrarAlerta("Não é permitido realizar alterações em itens baixados.");
                        return;
                    }

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {

                        switch (funcionalidade)
                        {
                            #region Abonar
                            case abonar:
                                if (Session["motivoAbono"] == null || Session["motivoAbono"] == "")
                                {
                                    return;
                                }
                                if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, DateTime.Parse(dataVenctoEfetivaAbono.Text)))
                                {
                                    this.registrarAlerta("A contabilidade está bloqueada para o período da data indicada. Não será possível continuar o processo.");
                                    return;
                                }
                                if (histItensSelecionados.Count(t1 => t1.tipoMovimento.chave == 1) > 0)
                                {
                                    this.registrarAlerta("Só é permitido o abono de encargos.");
                                    return;
                                }
                                parametrosItens["dataAbono"] = DateTime.Parse(dataVenctoEfetivaAbono.Text);
                                parametrosItens["motivoAbono"] = Session["motivoAbono"].ToString();

                                //if (histItensSelecionados.Count(t1 => t1.centraliza == 1) > 0)
                                //{
                                //  histItensSelecionados = this.obterItensInternos(histItensSelecionados);
                                //}
                                break;
                            #endregion

                            #region Desvio
                            case desviar:
                                if (!cliente.contrato.verificaVinculoEmpregaticio(this.numeroContrato) && !cliente.contrato.situacaoPatrocianadora(this.numeroContrato))
                                {
                                    this.registrarAlerta("O mutuário não possui folha, a cobrança deverá ser feita no financeiro.");
                                    return;
                                }
                                break;
                            #endregion

                            #region Baixa Manual
                            case baixarManualmente:
                                if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, DateTime.Parse(dataVenctoEfetivaAbono.Text)))
                                {
                                    this.registrarAlerta("A contabilidade está bloqueada para o período da data indicada. Não será possível continuar o processo.");
                                    return;
                                }
                                if (histItensSelecionados.Count(t1 => t1.suspenso != null && t1.suspenso == 1) > 0)
                                {
                                    this.registrarAlerta("Não é permitido baixar itens suspensos.");
                                    return;
                                }
                                if (histItensSelecionados.Count(t1 => t1.baixaManual != null && t1.baixaManual == 1) > 0)
                                {
                                    this.registrarAlerta("Não é possível realizar a baixa de itens já baixados manualmente. Para realizar alterações no valor efetivo ou data efetiva desfaça a baixa manual.");
                                    return;
                                }
                                parametrosItens["dataEfetiva"] = DateTime.Parse(dataVenctoEfetivaAbono.Text);
                                parametrosItens["valorEfetivo"] = float.Parse(valorRecebido.Text);

                                break;
                            #endregion

                            #region Defazer Baixa Manual
                            case desfazerBaixaManual:
                                if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, DateTime.Parse(dataVenctoEfetivaAbono.Text)))
                                {
                                    this.registrarAlerta("A contabilidade está bloqueada para o período da data indicada. Não será possível continuar o processo.");
                                    return;
                                }
                                if (histItensSelecionados.Count(t1 => t1.baixaManual != 1) > 0)
                                {
                                    this.registrarAlerta("Não é possível desfazer a baixa manual porque esse item não foi baixado manuamente.");
                                    return;
                                }
                                break;
                            #endregion

                            #region suspender
                            case suspender:
                                int parcelaAtual = cliente.contrato.obterParcelaAtual(this.numeroContrato);

                                //if (histItensSelecionados.Count(t1 => t1.centraliza == 1) > 0)
                                //{
                                //  histItensSelecionados = this.obterItensInternos(histItensSelecionados);
                                //}

                                if (histItensSelecionados.Count(t1 => t1.suspenso != null && t1.suspenso == 1) > 0)
                                {
                                    this.registrarAlerta("Não é permitido lançar suspensão em itens suspensos.");
                                    return;
                                }

                                if (int.Parse(ListaDropDowntipoSuspensao.SelectedValue) == 0)
                                {
                                    this.registrarAlerta("É necessário indicar o Tipo de Suspensão.");
                                    return;
                                }

                                tipoSuspensao = listaTipoSuspensao.Single(t1 => t1.id == int.Parse(ListaDropDowntipoSuspensao.SelectedValue));
                                parametrosItens["suspensao"] = tipoSuspensao;

                                if (tipoSuspensao.percentual != null && tipoSuspensao.percentual < 100)
                                {
                                    this.registrarAlerta("Suspensões parciais não podem ser lançadas individualmente em itens.");
                                    return;
                                }

                                //WO24257 - Retirada da validação de bloqueio contábil
                                //if (tipoSuspensao.atualizaSaldoDevedor == 0)
                                //{
                                //    for (int i = 0; i < histItensSelecionados.Count; i++)
                                //    {
                                //        if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, (DateTime)histItensSelecionados[i].dataPrevista))
                                //        {
                                //            this.registrarAlerta("A data prevista do item encontra-se em um período bloqueado pela contabilidade. Não será possível lançar a suspensão devido a um ajuste de saldo necessário para o tipo selecionado.");
                                //            return;
                                //        }
                                //    }
                                //}

                                if (tipoSuspensao.atualizaSaldoDevedor == 0 && histItensSelecionados.Count(t1 => t1.parcela != parcelaAtual) > 0)
                                {
                                    this.registrarAlerta("Não é permitido o lançamento de suspensão que não afeta o saldo em prestações anteriores.");
                                    return;
                                }

                                break;
                            #endregion

                            #region liberar Suspensao
                            case liberarSuspensao:
                                //if (histItensSelecionados.Count(t1 => t1.centraliza == 1) > 0)
                                //{
                                //  histItensSelecionados = this.obterItensInternos(histItensSelecionados);
                                //}

                                if (histItensSelecionados.Count(t1 => t1.tipoSuspensao.id == 0) > 0)
                                {
                                    this.registrarAlerta("Não é possível liberar a suspensão porque esse item não está suspenso.");
                                    return;
                                }
                                if (listaTipoSuspensao == null || listaTipoSuspensao.Count() <= 0)
                                {
                                    this.registrarAlerta("É necessário informar um Tipo de Suspensão.");
                                    return;
                                }

                                //WO24257 - Retirada da validação de bloqueio contábil
                                //tipoSuspensao = listaTipoSuspensao.Single(t1 => t1.id == histItensSelecionados[0].tipoSuspensao.id);

                                //if (tipoSuspensao.atualizaSaldoDevedor == 0)
                                //{
                                //    for (int i = 0; i < histItensSelecionados.Count; i++)
                                //    {
                                //        if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, (DateTime)histItensSelecionados[i].dataPrevista))
                                //        {
                                //            this.registrarAlerta("A data prevista do item encontra-se em um período bloqueado pela contabilidade. Não será possível liberar a suspensão devido a um ajuste de saldo necessário para o tipo selecionado.");
                                //            return;
                                //        }
                                //    }
                                //}

                                break;
                            #endregion

                            //Opção de alteração de vencimento com encargos
                            #region Alterar vencimento com Encargos
                            case alterarVencimento:
                                //Verifica se a contabilidade esta bloqueado para essa nova data de vencimento
                                if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, DateTime.Parse(dataVenctoEfetivaAbono.Text)))
                                {
                                    this.registrarAlerta("A contabilidade está bloqueada para o período da data indicada. Não será possível continuar o processo.");
                                    return;
                                }
                                //Grava data de vencimendo no estado da página
                                parametrosItens["dataVencimento"] = DateTime.Parse(dataVenctoEfetivaAbono.Text);
                                //Recupera os istens do histórico
                                if (!this.CampanhaDescontos)
                                {
                                    //Se não for campanha é necessário separar os itens selecionados
                                    for (int i = 0; i < listParcelas.Count; i++)
                                    {
                                        histItensSelecionados.AddRange(itensemAberto.Where(t1 => t1.parcela == listParcelas[i]));
                                    }

                                    if (!histItensSelecionados.Exists(t1 => t1.tipoMovimento.chave == 1) && (funcionalidade == alterarVencimento))
                                    {
                                        flagApenasEncargos = true;
                                        funcionalidade = alterarVencimentoSemEncargo;
                                    }
                                }
                                //Se for campanha guarda os itens de desconto
                                else
                                {
                                    double saldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, DateTime.Parse(dataVenctoEfetivaAbono.Text));
                                    if (saldoDevedor <= 0)
                                    {
                                        this.registrarAlerta("Não há mais saldo a vencer para esse contrato, utilize o desconto da quitação (Proposta 1).");
                                        return;
                                    }

                                    if (this.descontoCampanha.Count == 0)
                                    {
                                        if (!atualizaItensDescontoCampanha())
                                        {
                                            this.registrarAlerta("Houve um problema ao atualizar os valores da campanha de desconto, não é possível continuar.");
                                        }
                                    }
                                }
                                break;
                            #endregion

                            #region Alterar vencimento sem encargos
                            case alterarVencimentoSemEncargo:
                                histItensSelecionados = new List<Historico>();
                                for (int i = 0; i < listParcelas.Count; i++)
                                {
                                    histItensSelecionados.AddRange(itensemAberto.Where(t1 => t1.parcela == listParcelas[i]));
                                }
                                if (!cliente.contrato.verificarBloqueioContabilPeriodo(numeroContrato, DateTime.Parse(dataVenctoEfetivaAbono.Text)))
                                {
                                    this.registrarAlerta("A contabilidade está bloqueada para o período da data indicada. Não será possível continuar o processo.");
                                    return;
                                }

                                parametrosItens["dataVencimento"] = DateTime.Parse(dataVenctoEfetivaAbono.Text);
                                break;
                            #endregion
                        }

                        //Verificar se algum dos itens pertence a um documento ainda não baixado
                        List<long> ids = new List<long>();
                        for (int i = 0; i < histItensSelecionados.Count; i++)
                        {
                            ids.Add(histItensSelecionados[i].id);
                        }
                        cliente.contrato.verificaSitEnvio(ids);
                        if (cliente.contrato.existeItensNaoRecebidos(ids) && (funcionalidade != desfazerBaixaManual))
                        {
                            this.registrarAlerta("Pelo menos um item pertence a um documento ainda não baixado. Não será possível realizar o processo.");
                            return;
                        }

                        //if (cliente.contrato.verificaItensRecebidoseBaixados(histItensSelecionados) && (funcionalidade != desfazerBaixaManual))
                        //{
                        if ((funcionalidade != desfazerBaixaManual))
                        {
                            for (int i = 0; i < histItensSelecionados.Count; i++)
                            {
                                if (cliente.contrato.verificaItemRecebidoseBaixados(histItensSelecionados[i]))
                                {
                                    this.registrarAlerta("Pelo menos um item pertence a um documento recebido e baixado. Realize o processo de recebimento automático antes de tentar realizar alterações no item.");
                                    return;
                                }
                            }
                        }
                        //}
                    }

                    parametrosItens["dataEvento"] = DateTime.Parse(dataProcesso.Text);
                    parametrosItens["itens"] = histItensSelecionados;
                    parametrosItens["parcelas"] = listParcelas;
                    parametrosItens["funcionalidade"] = funcionalidade;
                    parametrosItens["itensDescontoCampanha"] = this.descontoCampanha;

                    this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        DateTime dataAtualizacao = new DateTime();
                        DateTime dataVencimento = new DateTime();
                        if (cliente.contrato.verificaParcelaTratada(listParcelas, this.numeroContrato, ref dataAtualizacao, ref dataVencimento) && (funcionalidade == alterarVencimento || funcionalidade == alterarVencimentoSemEncargo))
                        {
                            if (!flagApenasEncargos)
                            {
                                this.redirecionarComConfirmacao(String.Format("Esta parcela já foi tratada em {0} e tem vencimento previsto para {1}. Deseja tratá-lo novamente?", dataAtualizacao.ToShortDateString(), dataVencimento.ToShortDateString()), String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                            }
                            else
                            {
                                this.redirecionarComDuplaConfirmacao(dataAtualizacao, dataVencimento);
                                //this.redirecionarComConfirmacao("Teste 1", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                //this.redirecionarComConfirmacao("Teste 2", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                            }
                        }
                        else
                        {
                            if (float.Parse(valorRecebido.Text) == 0 && funcionalidade == baixarManualmente)
                            {
                                this.redirecionarComConfirmacao("O valor recebido informado é zero. Isso implicará na baixa dos registros selecionados pelo valor previsto do item. Deseja prosseguir com a baixa manual?", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                            }
                            else
                            {
                                if (funcionalidade == suspender)
                                {
                                    if (histItensSelecionados.Count(t1 => t1.item.suspensao == 0) > 0 && !tipoSuspensao.cobrancaJudicial)
                                    {
                                        histItensSelecionados.RemoveAll(t1 => t1.item.suspensao == 0);
                                        parametrosItens["itens"] = histItensSelecionados;
                                        this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                        this.redirecionarComConfirmacao("Alguns itens não poderão ser suspensos pois não são passíveis de suspensão.", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                    }
                                    else
                                    {
                                        switch (tipoSuspensao.flgSuspensaoItem)
                                        {
                                            case 2:
                                                if (histItensSelecionados.Count(t1 => t1.centraliza == 1) > 0)
                                                {
                                                    for (int i = 0; i < listParcelas.Count; i++)
                                                    {
                                                        histItensSelecionados.RemoveAll(t1 => (t1.destacado == 0 && t1.centraliza == 0 && t1.parcela == listParcelas[i]) || (t1.centraliza == 1 && listParcelas[i] == t1.parcela));
                                                        parametrosItens["itens"] = histItensSelecionados;
                                                    }
                                                    this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                                    this.redirecionarComConfirmacao("A suspensão escolhida não pode suspender itens centralizadores e seus internos. Alguns itens não serão suspensos.", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));

                                                }
                                                else
                                                {
                                                    this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                                    Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                                }
                                                break;
                                            case 1:
                                                if (histItensSelecionados.Count(t1 => t1.destacado == 1) > 0)
                                                {
                                                    histItensSelecionados.RemoveAll(t1 => t1.destacado == 1);
                                                    parametrosItens["itens"] = histItensSelecionados;
                                                    this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                                    this.redirecionarComConfirmacao("A suspensão escolhida não pode suspender itens destacados. Alguns itens não serão suspensos.", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                                }
                                                else
                                                {
                                                    this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                                    Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                                }
                                                break;
                                            default:
                                                this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                                Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                                break;
                                        }
                                    }
                                }
                                else
                                {
                                    this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);
                                    if (flagApenasEncargos)
                                    {
                                        this.redirecionarComConfirmacao("A prestação não pode ser selecionada. Deseja apenas alterar o vencimento dos encargos? ", String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                    }
                                    else
                                    {
                                        Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }
            finally
            {
                if (this.CampanhaDescontos)
                {
                    gridItensEmAberto.DataSource = null;
                    gridItensEmAberto.DataBind();
                }
            }
        }

        public void redirecionarComDuplaConfirmacao(DateTime dataAtualizacao, DateTime dataVencimento)
        {
            string script = String.Format("redirecionarComConfirmacao('{0}', '{1}');", UtilidadeSistema.decodificarJavaScript(String.Format("Esta parcela já foi tratada em {0} e tem vencimento previsto para {1}. Deseja tratá-lo novamente?", dataAtualizacao.ToShortDateString(), dataVencimento.ToShortDateString())), this.ResolveClientUrl(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens)));

            this.registrarScript("redirecionar", script);

            script = String.Format("redirecionarComConfirmacao('{0}', '{1}');", UtilidadeSistema.decodificarJavaScript("A prestação não pode ser selecionada. Deseja apenas alterar o vencimento dos encargos?"), this.ResolveClientUrl(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", this.guidItens)));

            this.registrarScript("redirecionar2", script);

        }

        private List<Historico> obterItensInternos(List<Historico> itensSelecionados)
        {
            List<int> parcelas = new List<int>();

            for (int i = 0; i < itensSelecionados.Count; i++)
            {
                //parcelas.Add((int)itensSelecionados[i].parcela);
                if (parcelas.Count != 0)
                {
                    if (parcelas.Count(t1 => t1 == itensSelecionados[i].parcela) == 0)
                    {
                        parcelas.Add((int)itensSelecionados[i].parcela);
                    }
                }
                else
                {
                    parcelas.Add((int)itensSelecionados[i].parcela);
                }
            }

            itensSelecionados.Clear();

            for (int i = 0; i < parcelas.Count; i++)
            {
                itensSelecionados.AddRange(itensemAberto.Where(t1 => (t1.destacado == 0 && t1.centraliza == 0 && t1.parcela == parcelas[i]) || (t1.centraliza == 1 && parcelas[i] == t1.parcela) || (t1.selecionado == true)));
            }

            return itensSelecionados;
        }

        protected void voltar_OnClick(object sender, EventArgs e)
        {
            //Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Visualizacao.aspx?Numero={0}", numeroContrato));

            Dictionary<string, object> parametros = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);
            Int32 checks = (int)parametros["checksBox"]; ;

            Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Visualizacao.aspx?Numero={0}&checkBoxes={1}", numeroContrato, checks));
        }

        protected void BotaoDesconto_OnClick(object sender, EventArgs e)
        {
            if (!atualizaItensDescontoCampanha())
            {
                this.registrarAlerta("Valores da Campanha de Recuperção de Crédito não foram calculados.");
                return;
            }                

            string guidDesconto = Guid.NewGuid().ToString();
            this.proxyEstado.manterEstadoSincrono(guidDesconto, this.descontoCampanha);
            //Abrir o form em um popup
            String strurl = String.Format("PopupDesconto.aspx?guidDesconto={0}", guidDesconto);
            String strscript = "window.open('../../Popup/" + strurl + "', 'name','height=260,width=760,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup para exibição dos descontos", strscript, true);
        }

        protected void gridItensEmAberto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridItensEmAberto.PageIndex = e.NewPageIndex;
            gridItensEmAberto.DataSource = itensemAberto;
            gridItensEmAberto.DataBind();
        }

        //Campanha Desconto
        private bool atualizaItensDescontoCampanha()
        {
            if (this.itensDesconto.Count == 0)
            {
                return false;
            }
            else
            {
                this.descontoCampanha = new List<ItemDescontoContrato>();

                Dictionary<int, string> itensCampanha;
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    itensCampanha = cliente.contrato.obterItensDaCampanha(this.idTipoContrato);
                }

                foreach (var itemCampanha in itensCampanha)
                {
                    ItemDescontoContrato item = new ItemDescontoContrato() { idItem = itemCampanha.Key, descItem = itemCampanha.Value };
                    this.descontoCampanha.Add(item);
                }

                foreach (var parcela in this.itensDesconto)
                {
                    this.descontoCampanha.Single(x => x.idItem == 13).valorNominal += parcela.valorParcela;
                    this.descontoCampanha.Single(x => x.idItem == 13).valorComDesconto += parcela.valorParcela * (1 - parcela.percentualParcela);

                    if(this.descontoCampanha.Exists(x=> x.idItem == 99))
                    {
                        this.descontoCampanha.Single(x => x.idItem == 99).valorNominal += parcela.valorFGQC;
                        this.descontoCampanha.Single(x => x.idItem == 99).valorComDesconto += parcela.valorFGQC * (1 - parcela.percentualFGQC);
                    }                    

                    this.descontoCampanha.Single(x => x.idItem == 42).valorNominal += parcela.valorCorrMonet;
                    this.descontoCampanha.Single(x => x.idItem == 42).valorComDesconto += parcela.valorCorrMonet * (1 - parcela.percentualCorrMonet);

                    this.descontoCampanha.Single(x => x.idItem == 43).valorNominal += parcela.valorJurosRem;
                    this.descontoCampanha.Single(x => x.idItem == 43).valorComDesconto += parcela.valorJurosRem * (1 - parcela.percentualJurosRem);

                    this.descontoCampanha.Single(x => x.idItem == 44).valorNominal += parcela.valorMulta;
                    this.descontoCampanha.Single(x => x.idItem == 44).valorComDesconto += parcela.valorMulta * (1 - parcela.percentualMulta);

                    this.descontoCampanha.Single(x => x.idItem == 46).valorNominal += parcela.valorJurosMora;
                    this.descontoCampanha.Single(x => x.idItem == 46).valorComDesconto += parcela.valorJurosMora * (1 - parcela.percentualJurosMora);

                    this.descontoCampanha.Single(x => x.idItem == 121).valorNominal += parcela.valorIOFComplementar;
                    this.descontoCampanha.Single(x => x.idItem == 121).valorComDesconto += parcela.valorIOFComplementar * (1 - parcela.percentualIOFComplementar);
                }
                this.descontoCampanha.Single(x => x.idItem == 13).percentualDesconto = itensDesconto[0].percentualParcela;
                if (this.descontoCampanha.Exists(x => x.idItem == 99))
                {
                    this.descontoCampanha.Single(x => x.idItem == 99).percentualDesconto = itensDesconto[0].percentualFGQC;
                }
                this.descontoCampanha.Single(x => x.idItem == 42).percentualDesconto = itensDesconto[0].percentualCorrMonet;
                this.descontoCampanha.Single(x => x.idItem == 43).percentualDesconto = itensDesconto[0].percentualJurosRem;
                this.descontoCampanha.Single(x => x.idItem == 44).percentualDesconto = itensDesconto[0].percentualMulta;
                this.descontoCampanha.Single(x => x.idItem == 46).percentualDesconto = itensDesconto[0].percentualJurosMora;
                this.descontoCampanha.Single(x => x.idItem == 121).percentualDesconto = itensDesconto[0].percentualIOFComplementar;

                return true;
            }
        }

        private List<Historico> BuscaItensSelecionadosAgrupados(int funcionalidade, ref List<int> parcelas)
        {
            List<Historico> histItensSelecionados = new List<Historico>();

            Historico hist = new Historico();
            if (gridItensEmAberto.Rows.Count > 0)
            {
                for (int i = 0; i < gridItensEmAberto.Rows.Count; i++)
                {
                    if (gridItensEmAberto.Rows[i].RowType == DataControlRowType.DataRow)
                    {
                        var chk = gridItensEmAberto.Rows[i].FindControl("CheckBoxButton") as CheckBox;
                        if (chk != null && chk.Checked)
                        {
                            DataKey dataKey = gridItensEmAberto.DataKeys[i];

                            //itensemAberto.Find(t1 => t1.id == Int64.Parse(dataKey.Values["id"].ToString())).selecionado = true;
                            //hist = itensemAberto.Find(t1 => t1.id == Int64.Parse(dataKey.Values["id"].ToString()));                            
                            hist.selecionado = true;
                        }
                    }

                    histItensSelecionados.Add(hist);
                }
            }
            else
            {
                this.registrarAlerta("Não há itens a processar.");

            }

            if (histItensSelecionados.Count == 0)
            {
                this.registrarAlerta("Selecione ao menos um item.");
            }

            return histItensSelecionados;
        }

        protected void dataVenctoEfetivaAbono_TextChanged(object sender, EventArgs e)
        {
            if (CampanhaDescontos)
                calculaCampanhaDesconto();
        }

        private void calculaCampanhaDesconto()
        {
            DateTime dataCalculo = (DateTime)dataVenctoEfetivaAbono.valorData;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                bool campanhaJaLancada = cliente.contrato.verificaCampanhaPendente(this.numeroContrato, tipoProposta);
                if (campanhaJaLancada)
                    this.registrarAlerta("Já existe um lançamento da Campanha de Recuperção de Crédito para esse contrato. Nao é possível realizar novo cálculo.");
                else
                    itensDesconto = cliente.contrato.obterItensAbertoDesconto(this.numeroContrato, this.idTipoContrato, dataCalculo, 2, true);
            }
            //SIG84058
            foreach (var item in itensDesconto)
            {

                if (item.valorParcela == 0) 
                { 
                    item.valorIOFComplementar = 0;
                    item.valorTotal = 0;
                    item.valorTotalComDesconto = item.valorFGQC; 
                }
            }
            //-----
            gridCampanhaDesconto.EmptyDataText = "Não foram encontrados itens em aberto.";
            gridCampanhaDesconto.PageSize = 240;
            gridCampanhaDesconto.DataSource = itensDesconto;
            gridCampanhaDesconto.DataBind();

            double valorTotalCampanha = 0;
            foreach (var item in itensDesconto)
            {
                valorTotalCampanha += item.valorTotalComDesconto;
            }
            hiddenValorTotal.Value = String.Format("{0:N2}", Math.Round(valorTotalCampanha, 2));
        }

        private void naoDisponivel()
        {
            this.registrarAlerta("Funcionalidade não disponível para a Campanha de Recuperação de Crédito.");
        }
    }
}