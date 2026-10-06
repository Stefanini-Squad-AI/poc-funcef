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
using Microsoft.Reporting.WebForms;
using FUNCEF.Planus.WebEmprestimo.Web.Reports;
using System.Globalization;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.Consultas
{
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

        private int idPessoa
        {
            get
            {
                string queryString = Request.QueryString["idPessoa"];
                int numero = 0;

                int.TryParse(queryString, out numero);

                return numero;
            }
        }

 
        private string matricula
        {
            get
            {
                string matricula = Request.QueryString["matricula"];
                return matricula;
            }
        }

        private string deviceInfo
        {
            get
            {
                return "<DeviceInfo>" +
              "  <OutputFormat>PDF</OutputFormat>" +
              "  <PageWidth>21cm</PageWidth>" +
              "  <PageHeight>29cm</PageHeight>" +
              "  <MarginTop>0.1in</MarginTop>" +
              "  <MarginLeft>0in</MarginLeft>" +
              "  <MarginRight>0in</MarginRight>" +
              "  <MarginBottom>0.1in</MarginBottom>" +
              "</DeviceInfo>";
            }
        }

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //caixaDataCalculo.valorData = DateTime.Today;
                //if (this.numeroContrato > 0) { 
                //    this.carregarDetalhesAplicacao(this.numeroContrato);
                //    recipienteAbaContratoSecundario.Visible = true;
                //}

                //if (!string.IsNullOrEmpty(this.matricula))
                //    CarregaDadosMutuario();

                //BuscarInadimplenciaContratos((DateTime) caixaDataCalculo.valorData);
                caixaDataCalculo.valorData = DateTime.Today;
                IniciarCarregamentoPagina(this.numeroContrato);
                chkTodaInadimplencia.Visible = false;  
            }
        }

        private void IniciarCarregamentoPagina(long NumeroContrato)
        {
            //caixaDataCalculo.valorData = DateTime.Today;
            if (NumeroContrato > 0)
            {
                recipienteAbaContratoSecundario.Visible = true;
                this.carregarDetalhesAplicacao(NumeroContrato);                
            }

            //ScriptManager.RegisterClientScriptBlock(this, typeof(string), "exibirLoading", "exibirLoading();", true);
            if (!string.IsNullOrEmpty(this.matricula))
                CarregaDadosMutuario();

            BuscarInadimplenciaContratos(NumeroContrato, (DateTime)caixaDataCalculo.valorData);
            ScriptManager.RegisterClientScriptBlock(this, typeof(string), "Loading", "FechaLoading();", true);
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

        //protected void gridHistorico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    recipienteAbaContratoPrincipal.ActiveTabIndex = 2;
        //}

        protected void gridItens_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            recipienteAbaContratoPrincipal.ActiveTabIndex = 3;
        }

        protected void botaoAjustarSituacao_Click(object sender, EventArgs e)
        {
            try
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    cliente.contrato.ajustarSituacao(this.numeroContrato, DateTime.Today);
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }
        }
        #endregion

        #region Métodos de Apoio


        private void carregarDetalhesAplicacao(long NumeroContrato)
        {
            ObjetoContrato contrato = new ObjetoContrato(NumeroContrato);
            List<ItemContrato> itensEmAberto = null;
            TipoContrato tipoContrato = new TipoContrato();

            string saldoDevedor = string.Empty;       

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //Consultar o saldo devedor do contrato.
                saldoDevedor = cliente.contrato.obterSaldoDevedor(NumeroContrato, DateTime.Today).ToString("N2");

                List<ItemContrato> lista = cliente.contrato.listarItens();

                #region Carregar Grid de Itens em Aberto

                ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                double valorTotalItens = 0;

                #endregion

                #region Carregar Grid de Log

                #endregion

                #region Aba Cobranças

                List<Historico> historicos = cliente.contrato.consultarEventoCobranca(NumeroContrato, null);

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

                if (!string.IsNullOrEmpty(contrato.numProtocolo))
                {
                    string NUP = contrato.numProtocolo.PadLeft(15, '0');                   

                }
                     
                
                labelMutuario.Text = contrato.mutuario.nome;
                labelInscricaoPrevidenciara.Text = contrato.mutuario.inscricaoPrevidenciaria.ToString();
                labelMatriculaEmpresa.Text = contrato.mutuario.matricula;               
                labelPlanoPrevidenciario.Text = contrato.plano.descricao;         
                labelSituacaoParticipante.Text = contrato.mutuario.situacao;
                labelPatrocinadora.Text = contrato.patrocinadora.nome;             
                //labelSituacaoFuncional.Text = contrato.patrocinadora.situacaoFuncional;
                labelSituacaoPlano.Text = contrato.plano.situacao;                
                labelDataFalecimento.Text = contrato.mutuario.dataFalecimento == null ? string.Empty : contrato.mutuario.dataFalecimento.Value.ToString("dd/MM/yyyy");           
                            



                #region Aba Dados do Contrato

                labelTipoContrato.Text = contrato.tipo.descricao;
                labelIndexador.Text = contrato.indexador.sigla;
                labelDataAssinatura.Text = contrato.dataAssinatura.obterString();
                labelDataSolicitacao.Text = contrato.dataSolicitacao.obterString();
                labelDataCredito.Text = contrato.dataCredito.obterString();
                labelDataPrimeiraParcela.Text = contrato.dataPrimeiraParcela.obterString();
                //labelQuitadoPor.Text = (contrato.contratoQuitacao != 0) ? contrato.contratoQuitacao.ToString() : "";

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
          
                labelDataFinalvlrMax.Text = contrato.dataFinalVlrMax.obterString();
                labelDataIniciovlrMax.Text = contrato.dataInicioVlrMax.obterString();
        

                #endregion

                #endregion     
            }
        }

        //private void carregarContaBancariaDebito()
        //{
        //    DadosBancarios dadosBancarios = null;

        //    using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
        //    {
        //        dadosBancarios = cliente.contrato.consultarContaBancariaDebito(this.numeroContrato);
        //    }

        //}

        #endregion

        #region Contexto da Página / Permissões

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


        private void CarregaDadosMutuario() 
        {
            Mutuario mutuario = new Mutuario();
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                mutuario = cliente.contrato.obterDadosMutuario(this.matricula);

                labelMutuario.Text = mutuario.nome;
                labelInscricaoPrevidenciara.Text = mutuario.inscricaoPrevidenciaria.ToString();
                labelMatriculaEmpresa.Text = mutuario.matricula;       
                labelPlanoPrevidenciario.Text = mutuario.plano.descricao;          
                labelSituacaoParticipante.Text = mutuario.situacao;
                labelPatrocinadora.Text = mutuario.patrocinadora.nome;   
                //labelSituacaoFuncional.Text = mutuario.patrocinadora.situacaoFuncional;
                labelSituacaoPlano.Text = mutuario.plano.situacao;

                if (mutuario.dataFalecimento.HasValue)
                    labelDataFalecimento.Text = mutuario.dataFalecimento.Value.ToString("dd/MM/yyyy");

            }
        }

        protected void caixaDataCalculo_TextChanged(object sender, EventArgs e)
        {
            //if (caixaDataCalculo.valorData != null)
            //BuscarInadimplenciaContratos((DateTime)  caixaDataCalculo.valorData);
            IniciarCarregamentoPagina(this.numeroContrato);
        }

        private void BuscarInadimplenciaContratos(long NumeroContrato, DateTime DataCalculo) 
        {

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {   
                List<itemPrestacaoDTO> dto = new List<itemPrestacaoDTO>();
                List<long> contratos = new List<long>();

                if (NumeroContrato == 0)
                {
                    contratos = cliente.contrato.BuscarContratosInadimplentes(this.idPessoa);                    
                }
                else
                {
                    contratos.Add(NumeroContrato);
                    labelUltimaDataAtualizacao.Text = cliente.contrato.diaUltimaAtualizacao(NumeroContrato).ToShortDateString();
                }

                foreach (var contrato in contratos)
                {
                    //executa atualização diária...
                    //cliente.contrato.executarAtualizacaoDiaria(contrato);

                    itemPrestacaoDTO item = new itemPrestacaoDTO();
                    //item = cliente.contrato.BuscarResumoInadimplencia(contrato, DataCalculo);     
                    item =  BuscarItensEmAbertosSintetico(contrato);
                    
                    dto.Add(item);
                }

                if (!dto.Count.Equals(0))
                    gridContratosInadimplentes.DataSource = dto;
                else
                    gridContratosInadimplentes.EmptyDataText = "Não foi encontrado nenhum contrato inadimplente para o participante.";

                gridContratosInadimplentes.DataBind();

            }

        }
        //protected void botaoGerarPDF_Click(object sender, EventArgs e)
        //{           
        //    if (caixaDataCalculo.valorData != null) {
        //        //GerarPDFContratosInadimplentes((DateTime)caixaDataCalculo.valorData);
        //        registrarAlerta("Geração de relatório concluída.");
        //    }
        //}

        private void GerarPDFContratosInadimplentes(long NumeroContrato, DateTime DataCalculo)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {               
                List<long> contratos = new List<long>();

                if (NumeroContrato == 0)
                {
                    contratos = cliente.contrato.BuscarContratosInadimplentes(this.idPessoa);
                }
                else
                {
                    contratos.Add(NumeroContrato);
                }

                foreach (var contrato in contratos)
                {
                    var headerContrato =  MontarHeaderDadosContrato(contrato, DataCalculo);
                    var itensRelatorio = MontaItensRelatorio(contrato, DataCalculo);
                    //var itensRelatorio = MontaItensEmAbertosAgrupado(contrato, DataCalculo);

                    try
                    {
                        string nomeArquivo = "Contrato_" + contrato + "_" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
                        LocalReport report = new LocalReport();
                        System.Reflection.Assembly dto = System.Reflection.Assembly.GetAssembly(typeof(testeDTO));
                        System.IO.Stream reportStream = dto.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Reports.Relatorio.rdlc");
                        report.LoadReportDefinition(reportStream);
                        report.DataSources.Add(new ReportDataSource("dsHeaderMutuario", headerContrato));
                        report.DataSources.Add(new ReportDataSource("dsHeaderContrato", headerContrato));
                        report.DataSources.Add(new ReportDataSource("dsItensPrestacao", itensRelatorio));

                        if (radioExcel.Checked)
                        {
                            exportacaoExcel(nomeArquivo, report);
                        }
                        if (radioPDF.Checked)
                        {
                            exportacaoPDF(nomeArquivo, report);
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
               
                }
            }
        }

        private List<Header_Realatorio_Dados_do_Contrato> MontarHeaderDadosContrato(long NumeroContrato, DateTime DataCalculo)
        {
            List<Header_Realatorio_Dados_do_Contrato> lista = new List<Header_Realatorio_Dados_do_Contrato>();  

            ObjetoContrato contrato = new ObjetoContrato(NumeroContrato); 

            Header_Realatorio_Dados_do_Contrato dto = new Header_Realatorio_Dados_do_Contrato();
            dto.NumeroContrato = NumeroContrato.ToString();
            dto.Nome = labelMutuario.Text;
            dto.Matricula = labelMatriculaEmpresa.Text;
            dto.CPF = contrato.mutuario.cpf;
            dto.Patrocinadora = labelPatrocinadora.Text;
            dto.Plano = labelPlanoPrevidenciario.Text;
            //dto.SitPatro = labelSituacaoFuncional.Text;
            dto.SitFundacao = labelSituacaoPlano.Text;
            dto.Modalidade = contrato.tipo.descricao;
            dto.DataCredito = Convert.ToDateTime(contrato.dataCredito.obterString()).ToShortDateString();
            dto.DataAssinatura = Convert.ToDateTime(contrato.dataAssinatura.obterString()).ToShortDateString();
            dto.ValorSolicitado = contrato.valorContrato.HasValue ? contrato.valorContrato.Value.ToString("N2") : "";
            dto.PrazoMeses = contrato.totalParcelas.ToString();
            dto.TaxaJuros = contrato.taxaJuros.HasValue ? contrato.taxaJuros.Value.ToString("N2") : "";
            dto.IndiceCorrecaoSaldo = contrato.indexador.sigla;
            dto.QuantidadeDeParcelas = contrato.parcelasRestantes.ToString();
            dto.IdTipoContrato = contrato.tipo.id;
            dto.DataCalculo = DataCalculo.ToShortDateString();

            lista.Add(dto);

            return lista;
        }

        private List<Item_Relatorio> MontaItensRelatorio(long NumeroContrato, DateTime DataCalculo)
        {
            List<Item_Relatorio> itens = new List<Item_Relatorio>();
            Item_Relatorio ItemRelatorio = new Item_Relatorio();
            double SaldoDevedor = 0;
            double correcaoMonetaria = 0;
            double multa = 0;
            double jurosMoratorios = 0;
            double jurosRemuneratorios = 0;
            double iofComplementar = 0;
            double ValorParcelas = 0;
            double ValorFGQC = 0;
            double totaisEncargos = 0;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())            
            {
                SaldoDevedor = cliente.contrato.obterSaldoDevedor(NumeroContrato, (DateTime)caixaDataCalculo.valorData);
                List<Historico> ItensHistorico = cliente.contrato.ConsultarItensAbertosAgrupados(NumeroContrato, 5, 0, 0, 0, 0);

                foreach (var item in ItensHistorico)
                {
                    //itens.NumeroContrato = item.numeroContrato;
                    ValorParcelas += item.item.id == 13 ?  Convert.ToDouble(item.valorPrevisto) : 0;
                    correcaoMonetaria += item.item.id == 42 ? Convert.ToDouble(item.valorPrevisto) : 0;
                    jurosRemuneratorios += item.item.id == 43 ? Convert.ToDouble(item.valorPrevisto) : 0;
                    multa += item.item.id == 44 ? Convert.ToDouble(item.valorPrevisto) : 0;
                    jurosMoratorios += item.item.id == 46 ? Convert.ToDouble(item.valorPrevisto) : 0;
                    iofComplementar += item.item.id == 121 ? Convert.ToDouble(item.valorPrevisto) : 0;
                    ValorFGQC += item.item.id == 99 ? Convert.ToDouble(item.valorPrevisto) : 0;
                    //if (item.item.id == 99)
                    //    ItemRelatorio.Parcela = ItemRelatorio.Parcela + ItemRelatorio.FGQC;

                    totaisEncargos += Convert.ToDouble(item.valorPrevisto);
                }

                //double TotalEncargos = Convert.ToDouble(ItemRelatorio.CorrecaoMonetaria) 
                //                    + Convert.ToDouble(ItemRelatorio.JurosRemuneratorios) 
                //                    + Convert.ToDouble(ItemRelatorio.Multa) + Convert.ToDouble(ItemRelatorio.JurosMora) 
                //                    + Convert.ToDouble(ItemRelatorio.IofComplementar);

            ItemRelatorio.Parcela = string.Format(new CultureInfo("pt-BR"), "{0:C}", ValorParcelas).Replace("R$", "");
            ItemRelatorio.FGQC = string.Format(new CultureInfo("pt-BR"), "{0:C}", ValorFGQC).Replace("R$", "");
            ItemRelatorio.CorrecaoMonetaria = string.Format(new CultureInfo("pt-BR"), "{0:C}", correcaoMonetaria).Replace("R$", "");
            ItemRelatorio.JurosMora = string.Format(new CultureInfo("pt-BR"), "{0:C}", jurosMoratorios).Replace("R$", "");
            ItemRelatorio.JurosRemuneratorios = string.Format(new CultureInfo("pt-BR"), "{0:C}", jurosRemuneratorios).Replace("R$", "");
            ItemRelatorio.Multa = string.Format(new CultureInfo("pt-BR"), "{0:C}", multa).Replace("R$", "");
            ItemRelatorio.IofComplementar = string.Format(new CultureInfo("pt-BR"), "{0:C}", iofComplementar).Replace("R$", "");
            ItemRelatorio.TotalEncargos = string.Format(new CultureInfo("pt-BR"), "{0:C}", totaisEncargos).Replace("R$", "");
            ItemRelatorio.ValorTotal = string.Format(new CultureInfo("pt-BR"), "{0:C}", (totaisEncargos + ValorParcelas + ValorFGQC)).Replace("R$", ""); 
            ItemRelatorio.SaldoDevedor = string.Format(new CultureInfo("pt-BR"), "{0:C}", SaldoDevedor).Replace("R$", "");
            ItemRelatorio.SaldoDevedorVencido = string.Format(new CultureInfo("pt-BR"), "{0:C}", ValorParcelas + ValorFGQC + totaisEncargos).Replace("R$", "");
            ItemRelatorio.SaldoDevedorTotal = string.Format(new CultureInfo("pt-BR"), "{0:C}", SaldoDevedor+ValorParcelas + ValorFGQC + totaisEncargos).Replace("R$", "");




            //itemPrestacaoDTO itemPrestacao = new itemPrestacaoDTO();
            //itemPrestacao = cliente.contrato.BuscarResumoInadimplencia(NumeroContrato, DataCalculo);
            //Item_Relatorio item   = new Item_Relatorio();

            //item.CorrecaoMonetaria = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.CorrecaoMonetaria);
            //    item.Multa = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.Multa).Replace("R$ ","");
            //    item.JurosMora = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.JurosMora);
            //    item.JurosRemuneratorios = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.JurosRemuneratorios);
            //    item.IofComplementar = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.IofComplementar);
            //    item.TotalEncargos = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.TotalEncargos);
            //    item.Parcela = string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.Parcela);
            //    item.FGQC = itemPrestacao.FGQC > 0 ? string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.FGQC) : "0";
               
            //item.ValorTotal = string.Format(new CultureInfo("pt-BR"), "{0:C}", (itemPrestacao.TotalEncargos + itemPrestacao.Parcela + itemPrestacao.FGQC));                
            //    item.SaldoDevedor = itemPrestacao.SaldoDevedor > 0 ? string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.SaldoDevedor) : "";
            //    item.SaldoDevedorVencido = itemPrestacao.SaldoDevedorVencido > 0 ? string.Format(new CultureInfo("pt-BR"), "{0:C}", itemPrestacao.SaldoDevedorVencido) : "";
                itens.Add(ItemRelatorio);                
            }
            return itens;
        }
        
        private itemPrestacaoDTO BuscarItensEmAbertosSintetico(long NumeroContrato)
        {
            itemPrestacaoDTO itens = new itemPrestacaoDTO();

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                double SaldoDevedor = cliente.contrato.obterSaldoDevedor(NumeroContrato, (DateTime) caixaDataCalculo.valorData);
               
                if (SaldoDevedor <= 0)
                {
                    cliente.contrato.executarAtualizacaoDiaria(NumeroContrato);
                    DateTime DataUltimaAtualizacao = cliente.contrato.diaUltimaAtualizacao(NumeroContrato);
                    SaldoDevedor = cliente.contrato.obterSaldoDevedor(NumeroContrato, DataUltimaAtualizacao);
                }
                double correcaoMonetaria = 0;
                double multa = 0;
                double jurosMoratorios = 0;
                double jurosRemuneratorios = 0;
                double iofComplementar = 0;
                double ValorParcelas = 0;
                double ValorFGQC = 0;
                double totaisEncargos = 0;

                if (DropTipoRelatorio.SelectedValue == "RelatorioDemonstrativoValoresAberto") { 
                    List<ItemContrato> Parcelas = cliente.contrato.ObterParcelasEmAberto(NumeroContrato, DateTime.Today);

                    foreach (var parcela in Parcelas)
                    {
                        //ParametrosConsulta parametrosConsulta = new ParametrosConsulta();                    

                        List<ItemContrato> ItensEmAberto = cliente.contrato.obterItensEmAberto(NumeroContrato, parcela.parcela);
                        foreach (ItemContrato item in ItensEmAberto)
                        {
                            Dictionary<string, double> valorEncargos = cliente.contrato.EncargosDaParcela(parcela, NumeroContrato, (DateTime)caixaDataCalculo.valorData, false);
                            correcaoMonetaria += item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Correcao_Monetaria").Value;
                            multa += item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Multa").Value;
                            jurosMoratorios += item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Moratorios").Value;
                            jurosRemuneratorios += item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Remuneratorios").Value;
                            iofComplementar += item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "IOF_Complementar").Value;                      
                            ValorParcelas += item.descricao == "FGQC" ? 0d : item.valor;
                            ValorFGQC += item.descricao == "FGQC" ? valorEncargos.Single(x => x.Key == "FGQC").Value : 0d;

                            //Soma dos encargos                       
                            totaisEncargos = item.descricao == "FGQC" ? 0 : (correcaoMonetaria + multa + jurosMoratorios + jurosRemuneratorios + iofComplementar);
                        }
                    }

                    itens.NumeroContrato = NumeroContrato;
                    itens.Parcela += ValorParcelas + ValorFGQC;
                    itens.CorrecaoMonetaria += correcaoMonetaria;
                    itens.JurosRemuneratorios += jurosRemuneratorios;
                    itens.Multa += multa;
                    itens.JurosMora += jurosMoratorios;
                    itens.IofComplementar += iofComplementar;
                    itens.FGQC += ValorFGQC;
                    itens.TotalEncargos += totaisEncargos;
                }
                else {
                    List<Historico> ItensHistorico = cliente.contrato.ConsultarItensAbertosAgrupados(NumeroContrato, 5, 0, 0, 0, 0);

                    foreach (var item in ItensHistorico)
                    {
                        itens.NumeroContrato = item.numeroContrato;
                        itens.Parcela += item.item.id == 13 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        itens.CorrecaoMonetaria += item.item.id == 42 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        itens.JurosRemuneratorios += item.item.id == 43 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        itens.Multa += item.item.id == 44 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        itens.JurosMora += item.item.id == 46 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        itens.IofComplementar += item.item.id == 121 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        itens.FGQC += item.item.id == 99 ? Convert.ToDouble(item.valorPrevisto) : 0;
                        if (item.item.id == 99)
                            itens.Parcela = itens.Parcela + itens.FGQC;
                        itens.TotalEncargos += Convert.ToDouble(item.valorPrevisto);
                    }
                    ValorFGQC = itens.FGQC;
                    ValorParcelas = itens.Parcela;
                }
                itens.SaldoDevedor = SaldoDevedor;
                itens.ValorTotal = ValorParcelas + ValorFGQC + itens.TotalEncargos + SaldoDevedor;
            }
            
            return itens;
        }

        private List<Item_Relatorio> MontaItensEmAbertosAgrupado(long NumeroContrato, DateTime DataCalculo)
        {
            List<Item_Relatorio> itens = new List<Item_Relatorio>();
            double TotalEncargos = 0;
            int Parcela = 0;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                string SaldoDevedor = cliente.contrato.obterSaldoDevedor(NumeroContrato, DateTime.Today).ToString("N2");
                List<Historico> ItensHistorico = cliente.contrato.ConsultarItensAbertosAgrupadosPorParcela(NumeroContrato, DataCalculo);

                Item_Relatorio Linha = new Item_Relatorio();
                foreach (var item in ItensHistorico)
                {
                    if (item.item.id == 13 || item.item.id == 99) 
                    { 
                        Item_Relatorio itemRelatorio = new Item_Relatorio();
                        itemRelatorio.NumParcela = (int)item.parcela;
                        itemRelatorio.Item = item.item.descricao;
                        itemRelatorio.SaldoDevedor = item.saldoDevedor > 0 ? item.saldoDevedor.ToString("N2") : "0,00";
                        itemRelatorio.DataVencimento =item.dataVencimento?.ToString("dd/MM/yyyy");
                        itemRelatorio.NumUltimaParcela = item.numeroParcelas;
                        itemRelatorio.SaldoDevedor = item.saldoDevedor.ToString("N2");
                        itemRelatorio.FormaDeCobranca = item.formaCobranca;

                        itemRelatorio.FGQC = item.item.id == 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 99).FirstOrDefault().valorPrevisto.ToString("N2") : "0,00";
                        itemRelatorio.Parcela = item.item.id != 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 13).FirstOrDefault().valorPrevisto.ToString("N2") : "0,00";                        
                        itemRelatorio.CorrecaoMonetaria = item.item.id != 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 42).Sum(x=> x.valorPrevisto).ToString() != null ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 42).Sum(x => x.valorPrevisto).ToString("N2") : "0,00" : "0,00";
                        itemRelatorio.JurosRemuneratorios = item.item.id != 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 43).Sum(x => x.valorPrevisto).ToString() != null ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 43).Sum(x => x.valorPrevisto).ToString("N2") : "0,00" : "0,00";
                        itemRelatorio.Multa = item.item.id != 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 44).Sum(x => x.valorPrevisto).ToString() != null ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 44).Sum(x => x.valorPrevisto).ToString("N2") : "0,00" : "0,00";
                        itemRelatorio.JurosMora = item.item.id != 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 46).Sum(x => x.valorPrevisto).ToString() != null ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 46).Sum(x => x.valorPrevisto).ToString("N2") : "0,00" : "0,00";
                        itemRelatorio.IofComplementar = item.item.id != 99 ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 121).Sum(x => x.valorPrevisto).ToString() != null ? ItensHistorico.Where(x => x.parcela == item.parcela && x.item.id == 121).Sum(x => x.valorPrevisto).ToString("N2") : "0,00" : "0,00";
                        itemRelatorio.Valor = item.item.id == 13 ? itemRelatorio.Parcela : itemRelatorio.FGQC;

                        TotalEncargos = Convert.ToDouble(itemRelatorio.Valor) + 
                                        Convert.ToDouble(itemRelatorio.CorrecaoMonetaria) + 
                                        Convert.ToDouble(itemRelatorio.JurosRemuneratorios) + 
                                        Convert.ToDouble(itemRelatorio.Multa) + 
                                        Convert.ToDouble(itemRelatorio.JurosMora) +                                        
                                        Convert.ToDouble(itemRelatorio.IofComplementar);
                        itemRelatorio.TotalEncargos =  TotalEncargos.ToString("N2");

                        itens.Add(itemRelatorio);
                    }
                }               
            }
            return itens;
        }

        protected void gridContratosInadimplentes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string strURL = string.Empty;

            if (string.IsNullOrEmpty(DropTipoRelatorio.SelectedValue)) 
            { 
                    this.registrarAlerta("Por favor, selecione o tipo de relatório.");
                return;
            }



            if (e.CommandName == "Select")
            {
                DataKey dataKey = gridContratosInadimplentes.DataKeys[Convert.ToInt32(e.CommandArgument)];

                switch (DropTipoRelatorio.SelectedValue)
                 {
                    case "RelatorioDemonstrativoValoresAberto":
                        string TipoArquivo = string.Empty;
                        if (radioExcel.Checked)
                            TipoArquivo = "excel";
                        if (radioPDF.Checked)
                            TipoArquivo = "pdf";

                        strURL = string.Format("~/Paginas/Inadimplencia/RelatorioDemonstrativoValorAberto/RelDemonstrativoValorAberto.aspx?&Numero={0}&Matricula={1}&Data={2}&TipoArquivo={3}", dataKey[0].ToString(), labelMatriculaEmpresa.Text, String.Format("{0:dd/MM/yyyy}", caixaDataCalculo.valorData), TipoArquivo);
                        Response.Redirect(strURL);
                        break;
                    case "RelatorioInadimplencia":                        
                        IniciarCarregamentoPagina(Convert.ToInt64(dataKey[0]));          
                        GerarPDFRelatorioInadimplencia(Convert.ToInt64(dataKey[0]), (DateTime)caixaDataCalculo.valorData); 
                        break;
                    case "RelatoriosOutros":                      
                        IniciarCarregamentoPagina(Convert.ToInt64(dataKey[0]));
                        if (caixaDataCalculo.valorData != null)
                        {
                            GerarPDFContratosInadimplentes(Convert.ToInt64(dataKey[0]), (DateTime)caixaDataCalculo.valorData);
                            registrarAlerta("Geração de relatório concluída.");
                        }

                        break;
                    default:
                        break;
                 }  
            }
        }

        protected void gridContratosInadimplentes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Attributes["onClick"] = ClientScript.GetPostBackClientHyperlink(this.gridContratosInadimplentes, "Select$" + e.Row.RowIndex);

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink link = e.Row.Cells[0].Controls[0] as HyperLink;

                link.Style[HtmlTextWriterStyle.Cursor] = "pointer";            

                if (link != null)
                {                   
                    link.Style[HtmlTextWriterStyle.Cursor] = "pointer";
                }
            }
        }

        private void GerarPDFRelatorioInadimplencia(long NumeroContrato, DateTime DataCalculo)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                List<long> contratos = new List<long>();

                if (NumeroContrato == 0 && chkTodaInadimplencia.Checked == false)
                {
                    contratos = cliente.contrato.BuscarContratosInadimplentes(this.idPessoa);
                }
                else
                {
                    contratos.Add(NumeroContrato);
                }

                //teste para o Rogerio Vitorino COPART-----------------------
                if (chkTodaInadimplencia.Checked == true)
                {
                    contratos = cliente.contrato.BuscarContratosAtivosEncerrados();
                }
                //fim teste para o Rogerio Vitorino COPART-----------------------

                DataTable DataSet = new DataTable();
                CriarEstruturaDataSet(ref DataSet);
                //foreach (var contrato in contratos)
                for (int i = 0; i < contratos.Count(); i++)    
                {   
                    var itensRelatorio = MontaItensEmAbertosAgrupado(contratos[0], DataCalculo);       
                  
                    PreparaDataSetItensInadimplentes(contratos[0], DataCalculo, itensRelatorio, ref DataSet);
                }

                try
                {
                    string nomeArquivo = "RelatorioInadimplencia_" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xls";
                    //string nomeArquivo = "RelatorioInadimplencia_" + contrato + "_" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xls";
                    LocalReport report = new LocalReport();
                    System.Reflection.Assembly dto = System.Reflection.Assembly.GetAssembly(typeof(testeDTO));
                    System.IO.Stream reportStream = dto.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Relatorio.Inadimplencia.RelatorioInadimplencia.rdlc");
                    report.LoadReportDefinition(reportStream);

                    report.DataSources.Add(new ReportDataSource("DataSetRenegociacao", DataSet));

                    if (radioExcel.Checked)
                    {
                        exportacaoExcel(nomeArquivo, report);
                    }
                    if (radioPDF.Checked)
                    {
                        exportacaoPDF(nomeArquivo, report);
                    }
                    
                    //byte[] file = report.Render("Excel");

                    //Response.Clear();
                    //Response.AddHeader("content-disposition", "attachment;filename=" + nomeArquivo);
                    //Response.AddHeader("Content-Length", file.Length.ToString());
                    //Response.ContentType = "application/pdf";
                    //Response.BinaryWrite(file);
                    //Response.Flush();
                    //Response.End();
                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }
        }

        public void PreparaDataSetDadosContrato(long NumeroContrato, DateTime DataCalculo, ref DataTable DataSet)
        {
            var dtSet = MontarHeaderDadosContrato(NumeroContrato, DataCalculo);

            DataSet.Columns.Add("nome_mutuario", typeof(string));
            DataSet.Columns.Add("cpf_mutuario", typeof(string));
            DataSet.Columns.Add("matricula_mutuario", typeof(string));
            DataSet.Columns.Add("patrocinadora_mutuario", typeof(string));
            DataSet.Columns.Add("plano_mutuario", typeof(string));
            DataSet.Columns.Add("situacao_mutuario", typeof(string));
            DataSet.Columns.Add("nr_contrato", typeof(string));
            DataSet.Columns.Add("modalidade_contrato", typeof(string));
            DataSet.Columns.Add("juros_contrato", typeof(string));
            DataSet.Columns.Add("icsd_contrato", typeof(string));
            DataSet.Columns.Add("prazo_contrato", typeof(string));
            DataSet.Columns.Add("dtcredito_contrato", typeof(string));
            DataSet.Columns.Add("dataProjecao", typeof(string));
            DataSet.Columns.Add("Suspensao", typeof(string));

            DataSet.Rows.Add(dtSet.FirstOrDefault().Nome,
                           dtSet.FirstOrDefault().CPF,
                           dtSet.FirstOrDefault().Matricula,
                           dtSet.FirstOrDefault().Patrocinadora,
                           dtSet.FirstOrDefault().Plano,
                           dtSet.FirstOrDefault().SitFundacao,
                           NumeroContrato,
                           dtSet.FirstOrDefault().Modalidade,
                           dtSet.FirstOrDefault().TaxaJuros,
                           dtSet.FirstOrDefault().IndiceCorrecaoSaldo,
                           dtSet.FirstOrDefault().PrazoMeses,
                           dtSet.FirstOrDefault().DataCredito,
                           DataCalculo.ToString("dd/MM/yyyy"),
                           labelTipoSuspensao.Text
                           ); 
        }


        public void CriarEstruturaDataSet(ref DataTable DataSet) 
        {
            DataSet.Columns.Add("nome_mutuario", typeof(string));
            DataSet.Columns.Add("cpf_mutuario", typeof(string));
            DataSet.Columns.Add("matricula_mutuario", typeof(string));
            DataSet.Columns.Add("patrocinadora_mutuario", typeof(string));
            DataSet.Columns.Add("plano_mutuario", typeof(string));
            DataSet.Columns.Add("situacao_mutuario", typeof(string));
            DataSet.Columns.Add("nr_contrato", typeof(string));
            DataSet.Columns.Add("modalidade_contrato", typeof(string));
            DataSet.Columns.Add("juros_contrato", typeof(string));
            DataSet.Columns.Add("icsd_contrato", typeof(string));
            DataSet.Columns.Add("prazo_contrato", typeof(string));
            DataSet.Columns.Add("dtcredito_contrato", typeof(string));
            //DataSet.Columns.Add("dataProjecao", typeof(string));
            DataSet.Columns.Add("Suspensao", typeof(string));
            DataSet.Columns.Add("DataConcessao", typeof(string));

            DataSet.Columns.Add("mes_ano_ref_itens", typeof(string));
            DataSet.Columns.Add("item_itens", typeof(string));
            DataSet.Columns.Add("parcela_itens", typeof(string));
            DataSet.Columns.Add("dtvencimento_itens", typeof(string));
            DataSet.Columns.Add("vlrnominal_itens", typeof(string));
            DataSet.Columns.Add("vlrcorrecao_monetaria_itens", typeof(string));
            DataSet.Columns.Add("vlrmulta_itens", typeof(string));
            DataSet.Columns.Add("vlrjuros_mora_itens", typeof(string));
            DataSet.Columns.Add("vlrjuros_remun_itens", typeof(string));
            DataSet.Columns.Add("vlriof_compl_itens", typeof(string));
            DataSet.Columns.Add("vlrtot_encargos_itens", typeof(string));
            DataSet.Columns.Add("dataProjecao", typeof(DateTime));
            DataSet.Columns.Add("SaldoDevedor", typeof(string));
            DataSet.Columns.Add("FormaCobranca", typeof(string));            

            DataSet.Columns.Add("TotalValorNominal", typeof(string));
            DataSet.Columns.Add("TotalValorCorrecaoMonetaria", typeof(string));
            DataSet.Columns.Add("TotalValorMulta", typeof(string));
            DataSet.Columns.Add("TotalValorJurosMora", typeof(string));
            DataSet.Columns.Add("TotalValorJurosRemuneratorios", typeof(string));
            DataSet.Columns.Add("TotalValorIOF", typeof(string));
            DataSet.Columns.Add("TotalValorTotalEncargos", typeof(string));
            DataSet.Columns.Add("TotalValorTotalItens", typeof(string));
        }

        public void PreparaDataSetItensInadimplentes(long NumeroContrato, DateTime DataCalculo, List<Item_Relatorio> ItensInadimplentes, ref DataTable DataSet)
        {
            double SaldoDevedor = 0;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                SaldoDevedor = cliente.contrato.obterSaldoDevedor(NumeroContrato, DataCalculo);
            }
            var dtSet = MontarHeaderDadosContrato(NumeroContrato, DataCalculo);                   

            double TotalValorNominal = 0;
            double TotalValorCorrecaoMonetaria = 0;
            double TotalValorMulta = 0;
            double TotalValorJurosMora = 0;
            double TotalValorJurosRemuneratorios = 0;
            double TotalValorIOF = 0;
            double TotalValorTotalEncargos = 0;
            double TotalValorTotalItens = 0;

            for (int i = 0; i < ItensInadimplentes.Count; i++)         

            //foreach (var item in ItensInadimplentes)
            {
                TotalValorNominal += ItensInadimplentes[i].Valor == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].Valor);
                TotalValorCorrecaoMonetaria += ItensInadimplentes[i].CorrecaoMonetaria == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].CorrecaoMonetaria);
                TotalValorMulta += ItensInadimplentes[i].Multa == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].Multa);
                TotalValorJurosMora += ItensInadimplentes[i].JurosMora == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].JurosMora);
                TotalValorJurosRemuneratorios += ItensInadimplentes[i].JurosRemuneratorios == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].JurosRemuneratorios);
                TotalValorIOF += ItensInadimplentes[i].IofComplementar == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].IofComplementar);
                TotalValorTotalEncargos += ItensInadimplentes[i].TotalEncargos == string.Empty ? 0d : Convert.ToDouble(ItensInadimplentes[i].TotalEncargos);

                DataSet.Rows.Add(dtSet.FirstOrDefault().Nome,
                          dtSet.FirstOrDefault().CPF,
                          dtSet.FirstOrDefault().Matricula,
                          dtSet.FirstOrDefault().Patrocinadora,
                          dtSet.FirstOrDefault().Plano,
                          dtSet.FirstOrDefault().SitFundacao,
                          NumeroContrato,
                          dtSet.FirstOrDefault().Modalidade,
                          dtSet.FirstOrDefault().TaxaJuros,
                          dtSet.FirstOrDefault().IndiceCorrecaoSaldo,
                          dtSet.FirstOrDefault().PrazoMeses,
                          dtSet.FirstOrDefault().DataCredito,                         
                          labelTipoSuspensao.Text,
                          dtSet.FirstOrDefault().DataAssinatura,

                          ItensInadimplentes[i].DataVencimento,
                          ItensInadimplentes[i].Item,
                          string.Format("{0}/{1}", ItensInadimplentes[i].NumParcela, ItensInadimplentes[i].NumUltimaParcela),
                          ItensInadimplentes[i].DataVencimento,
                          string.Format("{0:C}", ItensInadimplentes[i].Valor).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          string.Format("{0:C}", ItensInadimplentes[i].CorrecaoMonetaria).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          string.Format("{0:C}", ItensInadimplentes[i].Multa).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          string.Format("{0:C}", ItensInadimplentes[i].JurosMora).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          string.Format("{0:C}", ItensInadimplentes[i].JurosRemuneratorios).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          string.Format("{0:C}", ItensInadimplentes[i].IofComplementar).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          string.Format("{0:C}", ItensInadimplentes[i].TotalEncargos).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          DataCalculo.ToString("dd/MM/yyyy"),                         
                          string.Format("{0:C}", ItensInadimplentes[i].SaldoDevedor).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                          ItensInadimplentes[i].FormaDeCobranca,                          
                          //string.Format("{0:C}", SaldoDevedor).Replace("R$", "").Replace("$", "").Replace("0", ""),

                          string.Format("{0:C}", TotalValorNominal).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", TotalValorCorrecaoMonetaria).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", TotalValorMulta).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", TotalValorJurosMora).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", TotalValorJurosRemuneratorios).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", TotalValorIOF).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", TotalValorTotalEncargos).Replace("R$", "").Replace("$", ""),
                          string.Format("{0:C}", SaldoDevedor).Replace("R$", "").Replace("$", "").Replace("0,00", "")

                        );
                
            }
        }
        public void exportacaoExcel(string NomeRelatorio, LocalReport Report)
        {
            Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            byte[] bytes = Report.Render("Excel", null, out mimeType, out encoding, out extension, out streamids, out warnings);

            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", NomeRelatorio, "xls"));
            HttpContext.Current.Response.ContentType = mimeType;
            HttpContext.Current.Response.BinaryWrite(bytes);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        public void exportacaoPDF(string NomeRelatorio, LocalReport Report)
        {
            Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            byte[] bytes = Report.Render("PDF", this.deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);

            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = mimeType;
            //HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "DemonstrativoValorAberto-" + NumeroContrato.ToString(), "pdf"));
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", NomeRelatorio, "pdf"));            
            HttpContext.Current.Response.BinaryWrite(bytes);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        protected void DropTipoRelatorio_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, typeof(string), "exibirLoading", "validaCampo(this);", true);
            IniciarCarregamentoPagina(this.numeroContrato);
            if (DropTipoRelatorio.SelectedValue == "RelatorioInadimplencia")
            {
                chkTodaInadimplencia.Visible = true;
            }
            else
            {
                chkTodaInadimplencia.Visible = false;
            }
        }
    }
}
