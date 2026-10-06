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
using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;

using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual
{
    public partial class Parcelas : PaginaSegura
    {
        #region propriedades
        const int abonar = 1;
        const int desviar = 2;
        const int baixarManualmente = 3;
        const int desfazerBaixaManual = 4;
        const int suspender = 5;
        const int liberarSuspensao = 6;
        const int alterarVencimento = 7;
        const int alterarVencimentoSemEncargo = 8;

        const int chkCampanhaDescontos = 16;

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

        public List<Historico> itensTratados
        {
            get
            {
                if (ViewState["vListaItensTratados"] == null)
                    ViewState["vListaItensTratados"] = new List<Historico>();

                return (List<Historico>)ViewState["vListaItensTratados"];
            }
            set
            {
                ViewState["vListaItensTratados"] = value;
            }
        }

        public List<ItemContrato> itensEncargos
        {
            get
            {
                if (ViewState["vListaItensEncargos"] == null)
                    ViewState["vListaItensEncargos"] = new List<ItemContrato>();

                return (List<ItemContrato>)ViewState["vListaItensEncargos"];
            }
            set
            {
                ViewState["vListaItensEncargos"] = value;
            }
        }

        public List<int> parcelas
        {
            get
            {
                if (ViewState["vListaParcelas"] == null)
                    ViewState["vListaParcelas"] = new List<int>();

                return (List<int>)ViewState["vListaParcelas"];
            }
            set
            {
                ViewState["vListaParcelas"] = value;
            }
        }

        public DateTime dataEvento
        {
            get
            {
                if (ViewState["vdataEvento"] == null)
                    ViewState["vdataEvento"] = new DateTime();

                return (DateTime)ViewState["vdataEvento"];
            }
            set
            {
                ViewState["vdataEvento"] = value;
            }
        }

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

        private List<ContaCaixa> listaContaCaixa
        {
            get
            {
                if (this.ViewState["contaCaixa"] != null)
                    return (List<ContaCaixa>)this.ViewState["contaCaixa"];
                else
                    return new List<ContaCaixa>();
            }
            set
            {
                this.ViewState["contaCaixa"] = value;
            }
        }
        private List<TipoRecurso> tiposRecurso
        {
            get
            {
                if (this.ViewState["tiposRecurso"] != null)
                    return (List<TipoRecurso>)this.ViewState["tiposRecurso"];
                else
                    return new List<TipoRecurso>();
            }
            set
            {
                this.ViewState["tiposRecurso"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);

                DateTime dataVencimento;
                DateTime dataAbono;
                DateTime? dataEfetiva;

                botaoContinuar.Visible = true;

                string opcao = "";
                float? valorEfetivo;

                Historico itemCentralizador;

                this.numeroContrato = (long)parametrosItens["numeroContrato"];
                int funcionalidade = (int)parametrosItens["funcionalidade"];
                this.idTipoContrato = (int)parametrosItens["idTipoContrato"];
                this.checks = (int)parametrosItens["checksBox"];
                //Campanha Desconto
                this.CampanhaDescontos = ((chkCampanhaDescontos & checks) == chkCampanhaDescontos) ? true : false;


                if (parametrosItens["itens"] != null)
                {
                    this.itensTratados = (List<Historico>)parametrosItens["itens"];
                }
                this.parcelas = (List<int>)parametrosItens["parcelas"];
                if (itensTratados != null && itensTratados.Count > 0)
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        rblDebito.Items[0].Selected = true;
                        contaCaixaxRecebimento.Enabled = false;

                        switch (funcionalidade)
                        {
                            #region Abono
                            case abonar:
                                opcao = "Abono";
                                dataAbono = (DateTime)parametrosItens["dataAbono"];
                                dataEvento = (DateTime)parametrosItens["dataEvento"];

                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    itensTratados[i].abonado = 1;
                                    itensTratados[i].dataAbonoQuitacao = dataAbono;
                                    itensTratados[i].observacao = parametrosItens["motivoAbono"].ToString();
                                }
                                break;
                            #endregion

                            #region desvio Financeiro
                            case desviar:
                                opcao = "Desvio Financeiro";
                                pnlDebito.Enabled = true;
                                //if (itensTratados[0].formaCobranca == "Financeiro")
                                //{
                                rblDebito.Items[0].Selected = true;
                                contaCaixaxRecebimento.Enabled = true;
                                //}
                                //else
                                //{
                                // rblDebito.Items[1].Selected = true;
                                //  contaCaixaxRecebimento.Enabled = false;
                                //}
                                break;
                            #endregion

                            #region baixa Manual
                            case baixarManualmente:
                                opcao = "Baixa manual";
                                dataEfetiva = (DateTime)parametrosItens["dataEfetiva"];

                                valorEfetivo = (float)parametrosItens["valorEfetivo"];

                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    if (valorEfetivo != 0)
                                    {
                                        itensTratados[i].valorEfetivo = valorEfetivo;
                                    }
                                    else
                                    {
                                        itensTratados[i].valorEfetivo = itensTratados[i].valorPrevisto;
                                    }
                                    itensTratados[i].dataEfetiva = dataEfetiva;
                                    itensTratados[i].baixaManual = 1;
                                }
                                break;
                            #endregion

                            #region Desfaz Baixa Manual
                            case desfazerBaixaManual:
                                opcao = "Desfaz baixa manual";
                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    itensTratados[i].valorEfetivo = null;
                                    itensTratados[i].dataEfetiva = null;
                                    itensTratados[i].baixaManual = 0;
                                }
                                break;
                            #endregion

                            #region suspender
                            case suspender:
                                opcao = "Suspender";
                                TipoSuspensao tipoSuspensao = (TipoSuspensao)parametrosItens["suspensao"];
                                dataEvento = (DateTime)parametrosItens["dataEvento"];
                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    itensTratados[i].tipoSuspensao = tipoSuspensao;
                                    itensTratados[i].idTipoSusp = tipoSuspensao.id;
                                    itensTratados[i].suspenso = 1;
                                    itensTratados[i].mesSuspensao = dataEvento.Month.ToString();
                                    itensTratados[i].anoSuspensao = dataEvento.Year.ToString();
                                }
                                break;
                            #endregion

                            #region liberar suspensão
                            case liberarSuspensao:
                                opcao = "Liberar suspensão";
                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    //WO4481 -
                                    // itensTratados[i].tipoSuspensao = null;
                                    itensTratados[i].idTipoSusp = null;
                                    itensTratados[i].suspenso = 0;
                                    itensTratados[i].mesSuspensao = "";
                                    itensTratados[i].anoSuspensao = "";
                                }
                                break;
                            #endregion

                            #region Alterar Vencimento
                            case alterarVencimento:
                                opcao = "Mudança de vencimento";
                                dataVencimento = (DateTime)parametrosItens["dataVencimento"];
                                dataEvento = (DateTime)parametrosItens["dataEvento"];

                                itensTratados.RemoveAll(t1 => t1.calculado == true);

                                int tipoProposta = this.CampanhaDescontos ? 2 : 0;
                                itensEncargos = cliente.contrato.calcularEncargosVencimento(itensTratados, numeroContrato, true, parcelas, dataVencimento, dataEvento, tipoProposta);
                                itemCentralizador = itensTratados.Find(t1 => t1.centraliza == 1);

                                //William Moreira da Silva - SOL 260829 PPM 1045813
                                if (itemCentralizador == null)
                                {
                                    itemCentralizador = itensTratados[0];
                                }
                                //William Moreira da Silva - SOL 260829 PPM 1045813

                                rblDebito.Items[0].Selected = true;
                                contaCaixaxRecebimento.Enabled = true;

                                double saldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, dataVencimento);

                                if (itensEncargos != null && itensEncargos.Count > 0)
                                {
                                    for (int i = 0; i < itensEncargos.Count; i++)
                                    {
                                        itensEncargos[i].tipoTratamento = opcao;
                                        itensEncargos[i].dataCobranca = String.Format("{0}/{1}", dataVencimento.Year.ToString(), dataVencimento.Month.ToString());
                                        Historico historico = new Historico()
                                        {
                                            valorPrevisto = itensEncargos[i].valor,
                                            parcela = itensEncargos[i].parcela,
                                            parcelaAlternativa = itensEncargos[i].parcelaAlternativa,
                                            dataVencimento = dataVencimento,
                                            item = itensEncargos[i],
                                            tipoMovimento = TipoEvento.atualizacaoDebito,
                                            numeroContrato = this.numeroContrato,
                                            origem = Origem.individual,
                                            data = dataVencimento,
                                            mesCobranca = dataVencimento.Month,
                                            anoCobranca = dataVencimento.Year,
                                            anoCompetencia = dataVencimento.Year,
                                            mesCompetencia = dataVencimento.Month,
                                            taxaJuros = itemCentralizador.taxaJuros,
                                            usuarioInclusao = this.contextoSistema.loginUsuarioAtual,
                                            eventoCobranca = new TipoEventoCobranca { id = 4 },
                                            saldoDevedor = saldoDevedor,
                                            centraliza = itensEncargos[i].centraliza,
                                            destacado = itensEncargos[i].destacado,
                                            baixaManual = 0,
                                            baixado = 0,
                                            envio = 0,
                                            itemCentraliza = itemCentralizador.itemCentraliza,
                                            //William Moreira da Silva - SIG29791
                                            sequenciaCobranca = 1,
                                            //sequenciaCobranca = itemCentralizador.sequenciaCobranca,
                                            //William Moreira da Silva - SIG29791
                                            dataPrevista = dataVencimento,
                                            numeroParcelas = itensEncargos[i].numeroParcelas,
                                            gravaZero = itensEncargos[i].gravaZero,
                                            calculado = true,
                                            //William Moreira da Silva - SOL 250843
                                            enviado = 0,
                                            prioridade = 1,
                                            pagarReceber = "R",
                                            //William Moreira da Silva - SOL 250843
                                            flgCampanhaDesconto = itensEncargos[i].flgCampanhaDesconto
                                        };
                                        this.itensTratados.Add(historico);
                                    }
                                }

                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    itensTratados[i].dataVencimento = dataVencimento;
                                    itensTratados[i].mesCobranca = dataVencimento.Month;
                                    itensTratados[i].anoCobranca = dataVencimento.Year;

                                    //William Moreira da Silva - SOL 250843
                                    itensTratados[i].envio = 0;
                                    itensTratados[i].codigoDocumento = null;
                                    itensTratados[i].idTMPDesc = null;
                                    itensTratados[i].divergencia = 0;
                                    itensTratados[i].divergenciaTratada = 1;
                                    //William Moreira da Silva - SOL 250843

                                    if (itensTratados[i].id != 0)
                                    {
                                        itensTratados[i].eventoCobranca = new TipoEventoCobranca();
                                    }
                                }
                                pnlDebito.Enabled = true;
                                tipoRecurso.Enabled = true;
                                origemRecurso.Enabled = true;
                                //divTipoRecurso.Visible = true;
                                break;
                            #endregion

                            #region Alterar Vencimento sem encargos
                            case alterarVencimentoSemEncargo:
                                opcao = "Mudança de vencimento";
                                dataVencimento = (DateTime)parametrosItens["dataVencimento"];
                                for (int i = 0; i < itensTratados.Count; i++)
                                {
                                    itensTratados[i].dataVencimento = dataVencimento;
                                    itensTratados[i].mesCobranca = dataVencimento.Month;
                                    itensTratados[i].anoCobranca = dataVencimento.Year;
                                    if (itensTratados[i].id != 0)
                                    {
                                        itensTratados[i].eventoCobranca = new TipoEventoCobranca();
                                    }
                                }
                                itemCentralizador = itensTratados.Find(t1 => t1.centraliza == 1);
                                //if (itemCentralizador.formaCobranca == "Financeiro")
                                //{
                                rblDebito.Items[0].Selected = true;
                                contaCaixaxRecebimento.Enabled = true;
                                //}
                                //else
                                //{
                                // rblDebito.Items[1].Selected = true;
                                //  contaCaixaxRecebimento.Enabled = false;
                                //}
                                pnlDebito.Enabled = true;
                                tipoRecurso.Enabled = true;
                                origemRecurso.Enabled = true;
                                //divTipoRecurso.Visible = true;
                                break;
                            #endregion
                        }
                    }
                }

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    this.listaContaCaixa = cliente.contrato.listarContaCaixa();
                    UtilidadesPagina.preencherDropDown(contaCaixaxRecebimento, listaContaCaixa.Where(t1 => t1.recPagamento == "R"), FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                    contaCaixaxRecebimento.Items.Insert(0, new ListItem("Selecione", "0"));

                    this.tiposRecurso = cliente.contrato.listarTipoRecurso();
                    UtilidadesPagina.preencherDropDown(tipoRecurso, tiposRecurso, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                    tipoRecurso.Items.Insert(0, new ListItem("Selecione", "0"));
                }


                gridParcelaTratada.DataSource = null;
                //SIG 67808 - Campanha Descontos - Matias 
                if (funcionalidade != suspender)
                {
                    gridParcelaTratada.EmptyDataText = "Não há itens de encargos a serem inseridos.";
                }
                else
                {
                    if (itensTratados.Count == 0)
                    {
                        botaoContinuar.Visible = false;
                        gridParcelaTratada.EmptyDataText = "Não há itens a serem suspensos.";
                    }
                }

                if (funcionalidade != alterarVencimento && funcionalidade != alterarVencimentoSemEncargo)
                {
                    for (int i = 0; i < itensTratados.Count; i++)
                    {
                        DateTime dataPrevista = (DateTime)itensTratados[i].dataPrevista;
                        itensEncargos.Add(new ItemContrato
                        {
                            tipoTratamento = opcao,
                            dataCobranca = String.Format("{1}/{0}", dataPrevista.Year.ToString(), dataPrevista.Month.ToString("D2")),
                            parcela = (int)itensTratados[i].parcela,
                            descricao = itensTratados[i].item.descricao,
                            valor = itensTratados[i].valorPrevisto
                        });
                    }
                }

                gridParcelaTratada.DataSource = itensEncargos;
                gridParcelaTratada.DataBind();

            }
        }

        protected void gridParcelaTratada_RowDataBound(object sender, GridViewRowEventArgs e)
        {
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

        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);
            ObjetoContrato contrato = new ObjetoContrato(numeroContrato);

            if (int.Parse(tipoRecurso.SelectedValue) == 0 && ((int)parametrosItens["funcionalidade"] == alterarVencimento || (int)parametrosItens["funcionalidade"] == alterarVencimentoSemEncargo))
            {
                this.registrarAlerta("O campo tipo de origem do recurso é de preenchimento obrigatório.");
                return;
            }

            if (string.IsNullOrEmpty(origemRecurso.Text) && ((int)parametrosItens["funcionalidade"] == alterarVencimento || (int)parametrosItens["funcionalidade"] == alterarVencimentoSemEncargo))
            {
                this.registrarAlerta("O campo origem do recurso é de preenchimento obrigatório.");
                return;
            }

            if (contaCaixaxRecebimento.SelectedIndex == 0 && rblDebito.SelectedIndex == 0 && ((int)parametrosItens["funcionalidade"] == alterarVencimento || (int)parametrosItens["funcionalidade"] == alterarVencimentoSemEncargo || (int)parametrosItens["funcionalidade"] == desviar) )
            {
                this.registrarAlerta("É obrigatório selecionar a Forma de Recebimento.");
                return;
            }

            TipoCobranca tipoCobranca = new TipoCobranca();
            if ((int)parametrosItens["funcionalidade"] == alterarVencimento || (int)parametrosItens["funcionalidade"] == alterarVencimentoSemEncargo || (int)parametrosItens["funcionalidade"] == desviar)
            {
                if (rblDebito.SelectedIndex == 0)
                {
                    ContaCaixa contaCaixa = listaContaCaixa.Single(x => x.id == Convert.ToInt32(contaCaixaxRecebimento.SelectedValue));
                    if (contaCaixa.configBarras.HasValue)
                        tipoCobranca = TipoCobranca.Boleto;
                    else
                        tipoCobranca = TipoCobranca.DebitoConta;
                }
                else
                {
                    TipoRecurso tpRecurso = tiposRecurso.Single(x => x.id == Convert.ToInt32(tipoRecurso.SelectedValue));
                    if (tpRecurso.descricao.Equals("RESGATE"))
                        tipoCobranca = TipoCobranca.Resgate;
                    else
                        tipoCobranca = TipoCobranca.Folha;
                }
            }
            parametrosItens["tipoCobranca"] = tipoCobranca;

            for (int i = 0; i < itensTratados.Count; i++)
            {
                itensTratados[i].tipoRecurso = new TipoRecurso { id = int.Parse(tipoRecurso.SelectedValue), descricao = tipoRecurso.Text };
                itensTratados[i].origemRecurso = origemRecurso.Text;
                itensTratados[i].tratamentoIndividual = 1;
                itensTratados[i].data = (DateTime)parametrosItens["dataEvento"];
                if (rblDebito.SelectedIndex == 0)
                {
                    itensTratados[i].formaCobranca = "C";
                    itensTratados[i].pagarReceber = "R";
                    itensTratados[i].tipoFolha = string.Empty;
                }
                else
                {
                    itensTratados[i].formaCobranca = "F";
                    itensTratados[i].pagarReceber = "R";
                    //itensTratados[i].pagarReceber = "";
                    using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                    {
                        if ((int)parametrosItens["funcionalidade"] == desviar && cliente.contrato.verificarBeneficioAtivo(contrato.mutuario.id, contrato.mutuario.idTitular))
                        {
                            itensTratados[i].tipoFolha = "B";
                        }
                        else
                        {
                            itensTratados[i].tipoFolha = "P";
                        }
                    }
                }
            }

            parametrosItens["itens"] = itensTratados;

            this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);

            Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Valores.aspx?guidItens={0}", guidItens));
        }

        protected void voltar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Itens.aspx?guidItens={0}", guidItens));
        }

        protected void gridParcelaTratada_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridParcelaTratada.PageIndex = e.NewPageIndex;
            gridParcelaTratada.DataSource = itensEncargos;
            gridParcelaTratada.DataBind();
        }
    }
}