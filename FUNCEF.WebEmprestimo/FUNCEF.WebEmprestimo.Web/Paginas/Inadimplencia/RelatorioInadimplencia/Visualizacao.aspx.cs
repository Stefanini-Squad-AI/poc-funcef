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


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.RelatorioInadimplencia
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
                string queryString = Request.QueryString["matricula"];

                return queryString;
            }
        }

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                caixaDataCalculo.valorData = DateTime.Today;
                if (this.numeroContrato > 0) { 
                    this.carregarDetalhesAplicacao(this.numeroContrato);
                    recipienteAbaContratoSecundario.Visible = true;
                }


                if (!string.IsNullOrEmpty(this.matricula))
                    CarregaDadosMutuario();

                BuscarInadimplenciaContratos((DateTime) caixaDataCalculo.valorData);
            }
        }

        //protected void BotaoChaveMestre_Click(object sender, EventArgs e)
        //{
        //    String strurl = String.Format("PopupChaveMestre.aspx?nrContrato={0}&acao={1}", numeroContrato, "I");
        //    String strscript = "window.open('" + strurl + "', 'name','height=150,width=380,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup Chave Mestra", strscript, true);
        //}


        //protected void botaoContratoQuitado_Click(object sender, EventArgs e)
        //{
        //    Server.Transfer(String.Format("Visualizacao.aspx?Numero={0}", labelQuitadoPor.Text));
        //}

        //protected void dataSourceItens_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        //{
        //    if (e.InputParameters.Count == 0)
        //    {
        //        e.InputParameters.Add("numero", this.numeroContrato);
        //    }
        //}


        //protected void gridHistorico_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        if (DataBinder.Eval(e.Row.DataItem, "valorEfetivoTexto").ToString() == "(estornado)")
        //        {
        //            e.Row.Cells[11].ForeColor = System.Drawing.Color.Red;
        //        }

        //        e.Row.Cells[1].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[1].Text);
        //        e.Row.Cells[2].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[2].Text);
        //        e.Row.Cells[17].ToolTip = HttpUtility.HtmlDecode(e.Row.Cells[17].Text);

        //        string auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[1].Text);

        //        if (auxiliar.Length > 16)
        //        {
        //            e.Row.Cells[1].Text = auxiliar.Substring(0, 16);
        //        }

        //        auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[2].Text);

        //        if (auxiliar.Length > 16)
        //        {
        //            e.Row.Cells[2].Text = auxiliar.Substring(0, 16);
        //        }

        //        auxiliar = HttpUtility.HtmlDecode(e.Row.Cells[17].Text);

        //        if (auxiliar.Length > 10)
        //        {
        //            e.Row.Cells[17].Text = auxiliar.Substring(0, 10);
        //        }
        //    }

        //    if (e.Row.RowType == DataControlRowType.Header)
        //    {
        //        e.Row.Cells[1].Attributes.Add("Title", e.Row.Cells[1].Text);
        //        e.Row.Cells[2].Attributes.Add("Title", e.Row.Cells[2].Text);
        //        e.Row.Cells[3].Attributes.Add("Title", e.Row.Cells[3].Text);
        //        e.Row.Cells[4].Attributes.Add("Title", "Sequencial");
        //        e.Row.Cells[5].Attributes.Add("Title", "Mês/Ano Competência");
        //        e.Row.Cells[6].Attributes.Add("Title", "Mês/Ano Cobrança");
        //        e.Row.Cells[7].Attributes.Add("Title", "Data Prevista");
        //        e.Row.Cells[8].Attributes.Add("Title", "Data Vencimento");
        //        e.Row.Cells[9].Attributes.Add("Title", "Valor Previsto");
        //        e.Row.Cells[10].Attributes.Add("Title", "Data Efetiva");
        //        e.Row.Cells[11].Attributes.Add("Title", "Valor Efetivo");
        //        e.Row.Cells[12].Attributes.Add("Title", "Saldo Devedor");
        //        e.Row.Cells[13].Attributes.Add("Title", "Envio");
        //        e.Row.Cells[14].Attributes.Add("Title", "Data envio");
        //        e.Row.Cells[15].Attributes.Add("Title", "Data Recebimento");
        //        e.Row.Cells[16].Attributes.Add("Title", "Taxa de Juros");
        //        e.Row.Cells[17].Attributes.Add("Title", "Tipo de Suspensão");
        //    }            
        //}

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
                labelSituacaoFuncional.Text = contrato.patrocinadora.situacaoFuncional;
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
                labelSituacaoFuncional.Text = mutuario.patrocinadora.situacaoFuncional;
                labelSituacaoPlano.Text = mutuario.plano.situacao;

                if (mutuario.dataFalecimento.HasValue)
                    labelDataFalecimento.Text = mutuario.dataFalecimento.Value.ToString("dd/MM/yyyy");

            }
        }

        protected void caixaDataCalculo_TextChanged(object sender, EventArgs e)
        {
            if (caixaDataCalculo.valorData != null)
                BuscarInadimplenciaContratos((DateTime)  caixaDataCalculo.valorData);
        }

        private void BuscarInadimplenciaContratos(DateTime DataCalculo) 
        {

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {   
                List<itemPrestacaoDTO> dto = new List<itemPrestacaoDTO>();
                List<long> contratos = new List<long>();

                if (this.numeroContrato == 0)
                {
                    contratos = cliente.contrato.BuscarContratosInadimplentes(this.idPessoa);                    
                }
                else
                {
                    contratos.Add(this.numeroContrato);
                    labelUltimaDataAtualizacao.Text = cliente.contrato.diaUltimaAtualizacao(this.numeroContrato).ToShortDateString();
                }

                foreach (var contrato in contratos)
                {
                    //executa atualização diária...
                    cliente.contrato.executarAtualizacaoDiaria(contrato);

                    itemPrestacaoDTO item = new itemPrestacaoDTO();
                    item = cliente.contrato.BuscarResumoInadimplencia(contrato, DataCalculo);                 

                    dto.Add(item);
                }

                if (!dto.Count.Equals(0))
                    gridContratosInadimplentes.DataSource = dto;
                else
                    gridContratosInadimplentes.EmptyDataText = "Não foi encontrado nenhum contrato inadimplente para o participante.";

                gridContratosInadimplentes.DataBind();

            }

        }
        protected void botaoGerarPDF_Click(object sender, EventArgs e)
        {           
            if (caixaDataCalculo.valorData != null) {
                GerarPDFContratosInadimplentes((DateTime)caixaDataCalculo.valorData);
                registrarAlerta("Geração de relatório concluída.");
            }
        }

        private void GerarPDFContratosInadimplentes(DateTime DataCalculo)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {               
                List<long> contratos = new List<long>();

                if (this.numeroContrato == 0)
                {
                    contratos = cliente.contrato.BuscarContratosInadimplentes(this.idPessoa);
                }
                else
                {
                    contratos.Add(this.numeroContrato);
                }

                foreach (var contrato in contratos)
                {
                    var headerContrato =  MontarHeaderDadosContrato(contrato, DataCalculo);
                    var itensRelatorio = MontaItensRelatorio(contrato, DataCalculo);

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
                        byte[] file = report.Render("PDF");
              
                        
                        Response.Clear();
                        Response.AddHeader("content-disposition", "attachment;filename=" + nomeArquivo);
                        Response.AddHeader("Content-Length", file.Length.ToString());
                        Response.ContentType = "application/pdf";
                        Response.BinaryWrite(file);
                        Response.Flush();
                        Response.End();
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
            dto.SitPatro = labelSituacaoFuncional.Text;
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

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())            
            {
                itemPrestacaoDTO itemPrestacao = new itemPrestacaoDTO();
                itemPrestacao = cliente.contrato.BuscarResumoInadimplencia(NumeroContrato, DataCalculo);

                Item_Relatorio item   = new Item_Relatorio();

                item.CorrecaoMonetaria = itemPrestacao.CorrecaoMonetaria.ToString("N2");
                item.Multa = itemPrestacao.Multa.ToString("N2");
                item.JurosMora = itemPrestacao.JurosMora.ToString("N2");
                item.JurosRemuneratorios = itemPrestacao.JurosRemuneratorios.ToString("N2");
                item.IofComplementar = itemPrestacao.IofComplementar.ToString("N2");
                item.TotalEncargos = itemPrestacao.TotalEncargos.ToString("N2");
                item.Parcela = itemPrestacao.Parcela.ToString("N2");
                item.FGQC = itemPrestacao.FGQC > 0 ? itemPrestacao.FGQC.ToString("N2") : "0,00";
                item.ValorTotal = (itemPrestacao.TotalEncargos + itemPrestacao.Parcela + itemPrestacao.FGQC).ToString("N2");                
                item.SaldoDevedor = itemPrestacao.SaldoDevedor > 0 ? itemPrestacao.SaldoDevedor.ToString("N2") : "0,00";
                item.SaldoDevedorVencido = itemPrestacao.SaldoDevedorVencido > 0 ? itemPrestacao.SaldoDevedorVencido.ToString("N2"): "0,00";
                itens.Add(item);                
            }
            return itens;
        }


    }
}
