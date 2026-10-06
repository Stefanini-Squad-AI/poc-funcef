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
using FUNCEF.Planus.WebEmprestimo.Web.Boleto;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual
{
    public partial class Valores : PaginaSegura
    {
        #region Propriedades
        const int abonar = 1;
        const int desviar = 2;
        const int baixarManualmente = 3;
        const int desfazerBaixaManual = 4;
        const int suspender = 5;
        const int liberarSuspensao = 6;
        const int alterarVencimento = 7;
        const int alterarVencimentoSemEncargo = 8;
        //Campanha Desconto
        const int chkCampanhaDescontos = 16;

        private string guidItens
        {
            get
            {
                string queryString = Request.QueryString["guidItens"];

                return queryString;
            }
        }

        private int funcionalidade
        {
            get
            {
                if (ViewState["vFuncionalidade"] == null)
                    ViewState["vFuncionalidade"] = new int();

                return (int)ViewState["vFuncionalidade"];
            }
            set
            {
                ViewState["vFuncionalidade"] = value;
            }
        }

        protected List<Historico> itensTratados
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

        protected List<Historico> itensTratadosParcela
        {
            get
            {
                if (ViewState["vListaItensTratadosParcela"] == null)
                    ViewState["vListaItensTratadosParcela"] = new List<Historico>();

                return (List<Historico>)ViewState["vListaItensTratadosParcela"];
            }
            set
            {
                ViewState["vListaItensTratadosParcela"] = value;
            }
        }

        private List<int> parcelasTratar
        {
            get
            {
                if (ViewState["vListaParcelasTratar"] == null)
                    ViewState["vListaParcelasTratar"] = new List<int>();

                return (List<int>)ViewState["vListaParcelasTratar"];
            }
            set
            {
                ViewState["vListaParcelasTratar"] = value;
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

        private DateTime dataVencimento
        {
            get
            {
                if (this.ViewState["dataVencimento"] != null)
                    return (DateTime)this.ViewState["dataVencimento"];
                else
                    return DateTime.MinValue;
            }
            set
            {
                this.ViewState["dataVencimento"] = value;
            }
        }
        
        //Campanha Desconto
        private RelatorioContrato DadosImpressao
        {
            get
            {
                if (this.ViewState["dadosimpressao"] == null)
                    return new RelatorioContrato();
                else
                    return (RelatorioContrato)this.ViewState["dadosimpressao"];
            }
            set
            {
                this.ViewState["dadosimpressao"] = value;
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
        private TipoCobranca tipoCobranca
        {
            get
            {
                if (this.ViewState["tipoCobranca"] != null)
                    return (TipoCobranca)this.ViewState["tipoCobranca"];
                else
                    return TipoCobranca.Indefinido;
            }
            set
            {
                this.ViewState["tipoCobranca"] = value;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //Campanha Desconto
            if (!IsPostBack)
            {
                this.renderizaBotao();

                Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);

                this.itensTratadosParcela = (List<Historico>)parametrosItens["itens"];
                this.numeroContrato = (long)parametrosItens["numeroContrato"];
                this.funcionalidade = (int)parametrosItens["funcionalidade"];
                //Campanha Desconto
                this.dataVencimento = this.funcionalidade == alterarVencimento || this.funcionalidade == alterarVencimentoSemEncargo ? (DateTime)parametrosItens["dataVencimento"] : DateTime.Now.Date;
                int checks = (int)parametrosItens["checksBox"];
                this.tipoCobranca = (TipoCobranca)parametrosItens["tipoCobranca"];
                this.CampanhaDescontos = ((chkCampanhaDescontos & checks) == chkCampanhaDescontos) ? true : false;
                if (this.CampanhaDescontos)
                    this.descontoCampanha = (List<ItemDescontoContrato>)parametrosItens["itensDescontoCampanha"];

                //Separa as parcelas que deverão ser tratadas
                List<Historico> parcelas = itensTratadosParcela.FindAll(x => x.tipoMovimento == TipoEvento.prestacao && x.centraliza == 1);
                this.parcelasTratar = new List<int>();
                foreach (var parc in parcelas)
                {
                    parcelasTratar.Add((int)parc.parcela);
                }

                //Separa apenas o que foi calculado para exibir no grid
                this.itensTratados = itensTratadosParcela.FindAll(x => x.calculado);
                totalSelecionado.Text = String.Format("{0:N2}", itensTratados.Sum(t1 => t1.flgCampanhaDesconto ? t1.valorPrevisto * -1 : t1.valorPrevisto));
                gridItensGerados.DataSource = itensTratados;
                gridItensGerados.DataBind();
            }
        }

        private void renderizaBotao()
        {
            botaoConfirmar.Visible = UtilidadesSeguranca.deveRenderizar(Convert.ToString(Convert.ToInt64(PermissoesSistema.confirmar) * 1024));
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

        #region Metodos
        private string obtemNomeOpcao(int funcionalidade)
        {
            switch (funcionalidade)
            {
                case 1:
                    return "Abono";
                case 2:
                    return "Desvio financeiro";
                case 3:
                    return "Baixa manual";
                case 4:
                    return "Desfaz baixa manual";
                case 5:
                    return "Suspender";
                case 6:
                    return "Liberar suspensão";
                case 7:
                    return "Mudança de vencimento";
                case 8:
                    return "Mudança de vencimento";
            }
            return "";
        }
        #endregion

        #region Eventos

        protected void botaoConfirmar_Click(object sender, EventArgs e)
        {
            string msgRetorno = "";
            try
            {
                msgRetorno = "Operação Realizada com Sucesso.";
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    if (this.funcionalidade == alterarVencimento)
                    {
                        int tipoProposta;
                        List<int> tratarParcelas;
                        string origemRecurso = itensTratados.FirstOrDefault().origemRecurso;

                        if (this.CampanhaDescontos)
                        {
                            tipoProposta = 2;
                            tratarParcelas = new List<int>() { -1 }; //A procedure interpreta -1 como tratar todas as parcelas (obrigatório tratar todas as parcelas na Campanha).
                        }
                        else
                        {
                            tipoProposta = 0;
                            tratarParcelas = this.parcelasTratar;
                        }

                        foreach (int parcela in tratarParcelas)
                        {
                            bool sucessoTrataParcela = cliente.contrato.efetivarTratamentoParcelas(this.numeroContrato, this.dataVencimento, parcela, origemRecurso, tipoProposta);
                            if (!sucessoTrataParcela)
                            {
                                throw new Planus.Componentes.ExcecaoPlanus(String.Format("Erro ao realizar o tratamento da parcela: {0}", parcela));
                            }
                        }
                    }
                    else
                    {
                        List<Historico> itensaAlterar = itensTratados.Where(t1 => t1.id != 0).ToList();

                        if (itensaAlterar.Count != 0)
                        {
                            foreach (var item in itensaAlterar)
                            {
                                if ((item.centraliza == 1) && (funcionalidade == 5 || funcionalidade == 6))
                                    cliente.contrato.atualizarHistoricoSuspensaoItensCentralizados(item);
                                else
                                    cliente.contrato.atualizarHistorico(item);
                            }
                        }

                        if ((funcionalidade == suspender) && itensaAlterar[0].tipoSuspensao.atualizaSaldoDevedor == 0)
                        {
                            cliente.contrato.executarAtualizacaoDiaria(numeroContrato);
                        }

                        if (this.funcionalidade == liberarSuspensao)
                        {
                            if (cliente.contrato.liberarSuspensao(this.itensTratadosParcela))
                                msgRetorno = "Suspensão liberada com sucesso.";
                            else
                                msgRetorno = "Erro ao liberar suspensão. Entre em contato com a GETIF.";
                        }

                        LogContrato logContrato = new LogContrato()
                        {
                            descricao = this.obtemNomeOpcao(funcionalidade),
                            numeroContrato = this.numeroContrato,
                            origem = Origem.individual
                        };

                        cliente.contrato.incluirLog(logContrato);

                        //WO4481 - 
                        var TipoSuspensao = this.itensTratadosParcela.Select(x => x.tipoSuspensao).FirstOrDefault();
                        if (new string[] { "5", "8", "9", "11" }.Where(x => x.Contains(TipoSuspensao.id.ToString())).FirstOrDefault() != null)
                        {
                            int qtdParcelasSuspensas = cliente.contrato.BuscarQtdParcelasSuspensas(this.numeroContrato);
                            if (qtdParcelasSuspensas == 0)
                            {
                                cliente.contrato.retirarSuspensaoParcelaContrato(this.numeroContrato, this.contextoSistema.loginUsuarioAtual);
                            }

                            var historicoSuspensao = cliente.contrato.consultarHistoricoSuspensao(this.numeroContrato, 0);

                            var suspensao = historicoSuspensao.Where(x => x.status.Contains("Ativa")).FirstOrDefault();
                            //WO12132 - Incluído IF
                            if (suspensao != null)
                            {
                                if (qtdParcelasSuspensas == 0)
                                {
                                    suspensao.status = "C";
                                    suspensao.dataLiberacao = DateTime.Now;
                                    suspensao.usuarioLogado = this.contextoSistema.loginUsuarioAtual;
                                    suspensao.observacao = suspensao.observacao + " | Cancelamento da suspensão pela funcionalidade de liberação de suspensão.";
                                    cliente.contrato.alterarHistoricoSuspensao(suspensao);
                                }
                            }
                            else
                            {
                                this.registrarAlerta($"Não existe suspensão ativa para o contrato {this.numeroContrato}. Se for possível, ative a suspensão novamente.");
                                return;
                            }

                        }                        
                    }
                }
                
                this.confirmarOperacao(msgRetorno, string.Format("~/Paginas/Tratamentos/Individual/Visualizacao.aspx?Numero={0}", this.numeroContrato));
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
            }
        }

        protected void gridItensGerados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridItensGerados.PageIndex = e.NewPageIndex;
            gridItensGerados.DataSource = itensTratados;
            gridItensGerados.DataBind();
        }

        protected void voltar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Parcelas.aspx?guidItens={0}", guidItens));
        }

        protected void BotaoImprimirTermo_Click(object sender, EventArgs e)
        {
            try
            {
                string guidImpressao = Guid.NewGuid().ToString();
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    ContratoDTO dadosContrato = cliente.contrato.BuscarDadosContratoImpressao(this.numeroContrato);
                    dadosContrato.SaldoInadimplente = cliente.contrato.buscaSaldoInadimplente(this.numeroContrato, this.dataVencimento);
                    dadosContrato.SaldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, this.dataVencimento);
                    dadosContrato.DataSaldo = this.dataVencimento;
                    DadosImpressao = ToImpressaoContrato(dadosContrato);
                }

                this.proxyEstado.manterEstadoSincrono(guidImpressao, DadosImpressao);

                String strurl = String.Format("../../CicloNormal/Emprestimo/ImpressaoContrato.aspx?guidImpressao={0}", guidImpressao);
                String strscript = "window.open('" + strurl + "', '_blank','toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,modal=no')";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Contrato", strscript, true);

            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
            }
        }

        private RelatorioContrato ToImpressaoContrato(ContratoDTO contrato)
        {
            RelatorioContrato contratoDTO = new RelatorioContrato();

            contratoDTO.numeroContrato = (long)contrato.NumeroContrato;
            contratoDTO.prazo = contrato.NumParcelas;
            contratoDTO.valorMaximo = (double)contrato.ValorMaxPermitido;
            contratoDTO.valorSolicitado = (double)contrato.ValorSolicitado;
            contratoDTO.DataCredito = contrato.DataCredito;
            contratoDTO.dataAssinatura = (contrato.DataAssinatura.HasValue ? contrato.DataAssinatura.Value : DateTime.Now.Date);
            contratoDTO.contratosQuitados = contrato.ContratoQuitaAnterior;

            contratoDTO.SaldoInadimplente = (double)contrato.SaldoInadimplente;
            contratoDTO.SaldoDevedor = (double)contrato.SaldoDevedor;

            using (Cliente<IServicoMutuario> client = new Cliente<IServicoMutuario>())
            {
                contratoDTO.mutuario = client.contrato.obterDadosMutuario(contrato.Matricula);
            }

            contratoDTO.identidade = contrato.Rg;
            contratoDTO.emailComercial = contrato.Emails;
            contratoDTO.numeroCelular = contrato.TelCelular;
            contratoDTO.numeroResidencial = contrato.TelResidencial;
            contratoDTO.numeroComercial = contrato.TelComercial;
            contratoDTO.logradouro = contrato.Logradouro;
            contratoDTO.bairro = contrato.Bairro;
            contratoDTO.cidade = new Cidade() { nome = contrato.Cidade };
            contratoDTO.uf = new UF() { nome = contrato.Uf };
            contratoDTO.cep = contrato.Cep;

            using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
            {
                contratoDTO.tipoContrato = client.contrato.ConsultarTipoContrato(contrato.IdTipoContrato);
            }

            DescontoInadimplencia itemDesconto = new DescontoInadimplencia();
            itemDesconto.item = new string[7];
            itemDesconto.valor = new double[7];
            itemDesconto.valorComDesconto = new double[7];
            itemDesconto.percDesconto = new double[7];
            itemDesconto.VlrDividaDesconto = 0;
            itemDesconto.numeroContrato = (long)contrato.NumeroContrato;
            itemDesconto.modalidadeEmprestimo = contratoDTO.tipoContrato.descricao;
            itemDesconto.dataCredito = (DateTime)contrato.DataCredito;
            for (int i = 0; i < this.descontoCampanha.Count; i++)
            {
                itemDesconto.item[i] = this.descontoCampanha[i].descItem;
                itemDesconto.valor[i] = this.descontoCampanha[i].valorNominal;
                itemDesconto.valorComDesconto[i] = this.descontoCampanha[i].valorComDesconto;
                itemDesconto.percDesconto[i] = this.descontoCampanha[i].percentualDesconto;

                itemDesconto.VlrDividaDesconto += this.descontoCampanha[i].valorComDesconto;
            }
            contratoDTO.descontoInadimplencia = new List<DescontoInadimplencia>() { itemDesconto };

            contratoDTO.conta = new DadosBancarios()
            {
                agencia = contrato.Agencia,
                operacao = contrato.Operacao,
                contaCorrente = contrato.Conta
            };

            contratoDTO.fiadores = new Avalistas[0];
            contratoDTO.financiamento = false;
            contratoDTO.valorFinanciamento = 0;
            contratoDTO.PropostaCampanha = 2;
            contratoDTO.CampanhaDesconto = true;
            contratoDTO.tipoCobranca = this.tipoCobranca;
            contratoDTO.DataVencimento = contrato.DataSaldo;
            return contratoDTO;
        }


        #endregion
    }
}