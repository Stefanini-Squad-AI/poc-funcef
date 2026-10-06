using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.RelatorioDemonstrativoValorAberto
{
    public partial class RelDemonstrativoValorAberto : System.Web.UI.Page
    {
        #region propriedades
        private long NumeroContrato
        {
            get
            {
                string queryString = Request.QueryString["Numero"];

                long numero = 0;
                long.TryParse(queryString, out numero);
                return numero;
            }
        }      

        private string TipoExportacao
        {
            get
            {
                return Request.QueryString["TipoArquivo"] != null ? Request.QueryString["TipoArquivo"] : "pdf";
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

        private string Matricula
        {
            get
            {
                return string.IsNullOrEmpty(Request.QueryString["matricula"]) ? string.Empty : Request.QueryString["matricula"];
            }
        }
        private DateTime DataLimite
        {
            get
            {
                if (Request.QueryString["Data"] != null)
                    this.ViewState["Data"] = Convert.ToDateTime(Request.QueryString["Data"]);
                return (DateTime)this.ViewState["Data"];
            }
            set
            {
                this.ViewState["Data"] = value;
            }
        }
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            //exportarRelatorio();
            ConvertToDataTable();
        }

        public void MontarColunasDT(ref DataTable dtRel)
        {
            dtRel.Columns.Add("nome_mutuario", typeof(string));
            dtRel.Columns.Add("cpf_mutuario", typeof(string));
            dtRel.Columns.Add("matricula_mutuario", typeof(string));
            dtRel.Columns.Add("patrocinadora_mutuario", typeof(string));
            dtRel.Columns.Add("plano_mutuario", typeof(string));
            dtRel.Columns.Add("situacao_mutuario", typeof(string));
            dtRel.Columns.Add("nr_contrato", typeof(string));
            dtRel.Columns.Add("modalidade_contrato", typeof(string));
            dtRel.Columns.Add("juros_contrato", typeof(string));
            dtRel.Columns.Add("icsd_contrato", typeof(string));
            dtRel.Columns.Add("prazo_contrato", typeof(string));
            dtRel.Columns.Add("dtcredito_contrato", typeof(string));
            dtRel.Columns.Add("mes_ano_ref_itens", typeof(string));
            dtRel.Columns.Add("item_itens", typeof(string));
            dtRel.Columns.Add("parcela_itens", typeof(string));
            dtRel.Columns.Add("dtvencimento_itens", typeof(string));
            dtRel.Columns.Add("vlrnominal_itens", typeof(string));
            dtRel.Columns.Add("vlrcorrecao_monetaria_itens", typeof(string));
            dtRel.Columns.Add("vlrmulta_itens", typeof(string));
            dtRel.Columns.Add("vlrjuros_mora_itens", typeof(string));
            dtRel.Columns.Add("vlrjuros_remun_itens", typeof(string));
            dtRel.Columns.Add("vlriof_compl_itens", typeof(string));
            dtRel.Columns.Add("vlrtot_encargos_itens", typeof(string));
            dtRel.Columns.Add("vlrtotal_itens", typeof(string));
            dtRel.Columns.Add("valorSaldoDevedorVencido", typeof(string));
            dtRel.Columns.Add("valorSaldoDevedoraVencer", typeof(string));
            dtRel.Columns.Add("valorSaldoDevedorTotal", typeof(string));
            dtRel.Columns.Add("dataProjecao", typeof(DateTime));
           // dtRel.Columns.Add("valorItensConcessao", typeof(string));

            dtRel.Columns.Add("TotalValorNominal", typeof(string));
            dtRel.Columns.Add("TotalValorCorrecaoMonetaria", typeof(string));
            dtRel.Columns.Add("TotalValorMulta", typeof(string));
            dtRel.Columns.Add("TotalValorJurosMora", typeof(string));
            dtRel.Columns.Add("TotalValorJurosRemuneratorios", typeof(string));
            dtRel.Columns.Add("TotalValorIOF", typeof(string));
            dtRel.Columns.Add("TotalValorTotalEncargos", typeof(string));            
            dtRel.Columns.Add("TotalValorTotalItens", typeof(string));
        }

        public void ConvertToDataTable()
        {
            Mutuario mutuario = new Mutuario();
            DataTable dtRel = new DataTable();
            MontarColunasDT(ref dtRel);
            string Modalidade = string.Empty;
            double?[] vEncargos = null;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {            
                    Dictionary<string, object> infoContrato = cliente.contrato.buscaInfoContrato(this.NumeroContrato); 
                    DateTime DataCredito = (DateTime)infoContrato["DATACREDITO"];
                    Modalidade = infoContrato["TCEDESCRICAO"].ToString();
                    int totalParcelasContrato = (int)infoContrato["NUMPARCELAS"];
                    DateTime dataProjecao =this.DataLimite;

                    string IndiceCorrecaoSaldoDevedor = cliente.contrato.DataCreditoPossuiINPC(DataCredito.ToString("dd/MM/yyyy")) ? "INPC" : string.Empty; 
                    double saldoDevedoraVencer = cliente.contrato.obterSaldoDevedor(Convert.ToInt64(this.NumeroContrato), this.DataLimite); 
                    if (saldoDevedoraVencer <= 0)
                    {
                        DateTime DataUltimaAtualizacao = cliente.contrato.diaUltimaAtualizacao(this.NumeroContrato);
                        saldoDevedoraVencer = cliente.contrato.obterSaldoDevedor(this.NumeroContrato, DataUltimaAtualizacao);
                    }

                    using (Cliente<IServicoMutuario> gerenciador = new Cliente<IServicoMutuario>())
                    {
                        mutuario = gerenciador.contrato.obterDadosMutuario(this.Matricula);
                    }

                    List<ItemContrato> Parcelas = cliente.contrato.ObterParcelasEmAberto(this.NumeroContrato, DateTime.Today);

                    double TotalValorNominal = 0;
                    double TotalValorCorrecaoMonetaria = 0;
                    double TotalValorMulta = 0;
                    double TotalValorJurosMora = 0;
                    double TotalValorJurosRemuneratorios = 0;
                    double TotalValorIOF = 0;
                    double TotalValorTotalEncargos = 0;
                    double TotalValorTotalItens = 0;

                    foreach (var parcela in Parcelas)
                    {
                        ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                        //double valorTotalItens = 0d;

                        List<ItemContrato> ItensEmAberto = cliente.contrato.obterItensEmAberto(this.NumeroContrato, parcela.parcela);

                        foreach (ItemContrato item in ItensEmAberto)
                        {
                            double correcaoMonetaria = 0;
                            double multa = 0;
                            double jurosMoratorios = 0;
                            double jurosRemuneratorios = 0;
                            double iofComplementar = 0;

                            if (dataProjecao > parcela.dataPrevista)
                            {
                                Dictionary<string, double> valorEncargos = cliente.contrato.EncargosDaParcela(item, this.NumeroContrato, this.DataLimite, false);
                                correcaoMonetaria = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Correcao_Monetaria").Value;
                                multa = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Multa").Value;
                                jurosMoratorios = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Moratorios").Value;
                                jurosRemuneratorios = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Remuneratorios").Value;
                                iofComplementar = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "IOF_Complementar").Value;
                            }
                       
                            //Soma dos encargos
                            double? totaisEncargos = item.descricao == "FGQC" ? 0 : (correcaoMonetaria + multa + jurosMoratorios + jurosRemuneratorios + iofComplementar);

                            TotalValorNominal += item.valor;
                            TotalValorCorrecaoMonetaria += correcaoMonetaria;
                            TotalValorMulta += multa;
                            TotalValorJurosMora += jurosMoratorios;
                            TotalValorJurosRemuneratorios += jurosRemuneratorios;
                            TotalValorIOF += iofComplementar;
                            TotalValorTotalEncargos += (double)totaisEncargos;
                            TotalValorTotalItens +=  (double)totaisEncargos + item.valor;

                        double saldoDevedorVencido = (double)totaisEncargos + item.valor; 

                            if ((item.descricao == "FGQC") || (item.descricao == "Prestação"))
                            {
                                dtRel.Rows.Add(mutuario.nome,
                                                mutuario.cpf,
                                                mutuario.matricula,
                                                mutuario.patrocinadora.nome,
                                                mutuario.plano.descricao,
                                                mutuario.situacao,
                                                this.NumeroContrato,
                                                Modalidade,
                                                string.Format("{0} % (ao ano)", item.taxaJuros),
                                                IndiceCorrecaoSaldoDevedor,
                                                totalParcelasContrato,                                            
                                                DataCredito.ToString("dd/MM/yyyy"),
                                                item.dataPrevista.ToString("MM/yyyy"),
                                                item.descricao,
                                                string.Format("{0}/{1}", item.parcela, item.numeroParcelas),                                             
                                                item.dataPrevista.ToString("dd/MM/yyyy"),
                                                string.Format("{0:C}", item.valor).Replace("R$", "").Replace("$", ""),                              
                                                string.Format("{0:C}", correcaoMonetaria).Replace("R$","").Replace("$", ""),
                                                string.Format("{0:C}", multa).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", jurosMoratorios).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", jurosRemuneratorios).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", iofComplementar).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", totaisEncargos).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", (totaisEncargos + item.valor)).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", saldoDevedorVencido).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", saldoDevedoraVencer).Replace("R$", "").Replace("$", ""),
                                                0,
                                                dataProjecao,
                                                string.Format("{0:C}", TotalValorNominal).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorCorrecaoMonetaria).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorMulta).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorJurosMora).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorJurosRemuneratorios).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorIOF).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorTotalEncargos).Replace("R$", "").Replace("$", ""),
                                                string.Format("{0:C}", TotalValorTotalItens).Replace("R$", "").Replace("$", "")
                                                );
                            }
                            
                        }                        
                    }              
            }
           
            Session["RelReneg"] = dtRel;
            exportarRelatorio(this.NumeroContrato);
        }

        private void exportarRelatorio(Int64 NumeroContrato)
        {            
            DataTable dt = new DataTable();
            dt = (DataTable)Session["RelReneg"];
            var cultura = new System.Globalization.CultureInfo("pt-BR");
            System.Threading.Thread.CurrentThread.CurrentCulture = cultura;
            System.Threading.Thread.CurrentThread.CurrentUICulture = cultura;

            ReportDataSource RDS = new ReportDataSource("DataSetRenegociacao", dt);

            ReportViewer1.Visible = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.Reset();
            ReportViewer1.LocalReport.ReportPath = "Relatorio/DemonstrativoValorEmAberto/DemonstrativoValorEmAberto.rdlc";

            var parameters = new List<ReportParameter> { new ReportParameter("ReportLanguage", "pt-BR") };
            //ReportViewer1.ServerReport.SetParameters(parameters);

            //ReportViewer1.LocalReport.SetParameters(new ReportParameter("ReportLanguage", "pt-BR"));
            ReportViewer1.LocalReport.DataSources.Add(RDS);
            
            //System.Reflection.Assembly dto = System.Reflection.Assembly.GetAssembly(typeof(Reports.testeDTO));
            //System.IO.Stream reportStream = dto.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Relatorio.DemonstrativoValorEmAberto.DemonstrativoValorEmAberto.rdlc");

            //ReportViewer1.LocalReport.LoadSubreportDefinition("Subreport1", reportStream);
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(RenegociacaoResumoGerador);
            ReportViewer1.LocalReport.Refresh();

            //try
            //{
            //    string nomeArquivo = "Contrato_" + NumeroContrato + "_" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
            //    LocalReport report = new LocalReport();
            //    System.Reflection.Assembly dto = System.Reflection.Assembly.GetAssembly(typeof(Reports.testeDTO));
            //    System.IO.Stream reportStream = dto.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Relatorios.Inadimplencia.RelInadimplencia.rdlc");
            //    report.LoadReportDefinition(reportStream);
            //    report.DataSources.Add(RDS);
            //    //report.DataSources.Add(new ReportDataSource("dsHeaderMutuario", headerContrato));
            //    //report.DataSources.Add(new ReportDataSource("dsHeaderContrato", headerContrato));
            //    //report.DataSources.Add(new ReportDataSource("dsItensPrestacao", itensRelatorio));

            //    report.SubreportProcessing += new SubreportProcessingEventHandler(RenegociacaoResumoGerador);
            //    report.Refresh();
            //    byte[] file = report.Render("PDF");


            //    Response.Clear();
            //    Response.AddHeader("content-disposition", "attachment;filename=" + nomeArquivo);
            //    Response.AddHeader("Content-Length", file.Length.ToString());
            //    Response.ContentType = "application/pdf";
            //    Response.BinaryWrite(file);
            //    Response.Flush();
            //    Response.End();
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}


            if (TipoExportacao.ToLower().Equals("excel"))
            {
                exportacaoExcel(this.NumeroContrato);
            }
            else
            {
                exportacaoPDF(this.NumeroContrato);
            }
        }
    
        void RenegociacaoResumoGerador(object sender, SubreportProcessingEventArgs e)
        {
            DataTable dtRel = new DataTable();
            dtRel = (DataTable)Session["RelReneg"];

            string matricula = e.Parameters["matricula_mutuario"].Values[0].ToString();
            //GerarDadosResumo(ref dt, matricula);
            //dt = (DataTable)Session["RelRenegResum"];

            var modalidades = dtRel.AsEnumerable()
                                .Where(m => m.Field<string>("matricula_mutuario") == matricula)
                                .Select(m => m.Field<string>("modalidade_contrato"))
                                .Distinct().ToArray();
            //.Select(m => m.Field<string>("nr_contrato") + " - " + m.Field<string>("modalidade_contrato"))
            DataTable dtResumo = new DataTable();
            #region colunas
            dtResumo.Columns.Add("matricula_mutuario", typeof(string));
            dtResumo.Columns.Add("tp_contrato_resumo", typeof(string));
            dtResumo.Columns.Add("qtde_prestacoes_resumo", typeof(int));
            dtResumo.Columns.Add("qtde_fgqc_resumo", typeof(int));
            dtResumo.Columns.Add("vlrtotal_prestacoes_resumo", typeof(string));
            dtResumo.Columns.Add("vlrtotal_fgqc_resumo", typeof(string));

            dtResumo.Columns.Add("valorSaldoDevedorVencido", typeof(string));
            dtResumo.Columns.Add("valorSaldoDevedoraVencer", typeof(string));
            dtResumo.Columns.Add("valorSaldoDevedorTotal", typeof(string));
            //dtResumo.Columns.Add("valorItensConcessao", typeof(string));            

            #endregion

            for (int i = 0; i < modalidades.Length; i++)
            {
                var linha = dtRel.AsEnumerable()
                                .Where(m => m.Field<string>("matricula_mutuario") == matricula)
                                .Where(m => m.Field<string>("modalidade_contrato") == modalidades[i]).ToList();
                
                var linhaParc = linha.Where(c => c.Field<string>("item_itens").ToLower() == "prestação").ToList();
                var linhaFGQC = linha.Where(c => c.Field<string>("item_itens").ToUpper() == "FGQC").ToList();

                var vlrParc = linhaParc.Sum(v => Convert.ToDouble(v.Field<string>("vlrtotal_itens").Replace(".", "").Replace(",", ".")));
                var vlrFGQC = linhaFGQC.Sum(v => Convert.ToDouble(v.Field<string>("vlrtotal_itens").Replace(".", "").Replace(",", ".")));
                //var vlrParc = linhaParc.Sum(v => Convert.ToDouble(v.Field<string>("vlrtotal_itens")));
                //var vlrFGQC = linhaFGQC.Sum(v => Convert.ToDouble(v.Field<string>("vlrtotal_itens")));
                //var valorSaldoDevedorVencido = linhaParc.Sum(v => Convert.ToDouble(v.Field<string>("valorSaldoDevedorVencido")));

                var valorSaldoDevedorVencidoParc = linhaParc.Sum(v => Convert.ToDouble(v.Field<string>("valorSaldoDevedorVencido").Replace(".", "").Replace(",", ".")));
                var valorSaldoDevedorVencidoFGQC = linhaFGQC.Sum(v => Convert.ToDouble(v.Field<string>("valorSaldoDevedorVencido").Replace(".", "").Replace(",", ".")));

                var valorSaldoDevedorVencido = linhaParc.Sum(v => Convert.ToDouble(v.Field<string>("valorSaldoDevedorVencido").Replace(".", "").Replace(",", ".")));
                valorSaldoDevedorVencido = valorSaldoDevedorVencido + valorSaldoDevedorVencidoFGQC;



                var valorSaldoDevedoraVencer = linhaParc.Select(v => Convert.ToDouble(v.Field<string>("valorSaldoDevedoraVencer").Replace(".", "").Replace(",", "."))).FirstOrDefault();
                //valorSaldoDevedoraVencer = valorSaldoDevedoraVencer == 0 ? 0 : valorSaldoDevedoraVencer;

                var valorSaldoDevedorTotal = Convert.ToDouble(valorSaldoDevedorVencidoParc) + Convert.ToDouble(valorSaldoDevedorVencidoFGQC) + Convert.ToDouble(valorSaldoDevedoraVencer);                                                                        

                dtResumo.Rows.Add(matricula, 
                                    modalidades[i], 
                                    linhaParc.Count(), 
                                    linhaFGQC.Count(),
                                    string.Format(new CultureInfo("pt-BR"), "{0:C}", vlrParc).Replace("R$", "").Replace("$", "").Replace("0,00", ""),
                                    string.Format(new CultureInfo("pt-BR"), "{0:C}", vlrFGQC).Replace("R$", "").Replace("$", ""),
                                    string.Format(new CultureInfo("pt-BR"), "{0:C}", valorSaldoDevedorVencido).Replace("R$", "").Replace("$", "").Replace("0,00", "").Replace("0.00", ""),
                                    string.Format(new CultureInfo("pt-BR"), "{0:C}", valorSaldoDevedoraVencer).Replace("R$", "").Replace("$", "").Replace("0,00", "").Replace("0.00", ""),
                                    string.Format(new CultureInfo("pt-BR"), "{0:C}", valorSaldoDevedorTotal).Replace("R$", "").Replace("$", ""));
            }           

            ReportDataSource RDS = new ReportDataSource("DataSetResumo", dtResumo);
            e.DataSources.Add(RDS);
        }

        #region tipos de exportações
        public void exportacaoExcel(long NumeroContrato)
        {
            Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            byte[] bytes = ReportViewer1.LocalReport.Render("Excel", null, out mimeType, out encoding, out extension, out streamids, out warnings);            

            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "DemonstrativoValorAberto-" + NumeroContrato.ToString(), "xls"));
            HttpContext.Current.Response.ContentType = mimeType;
            HttpContext.Current.Response.BinaryWrite(bytes);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        public void exportacaoPDF(long NumeroContrato)
        {
            Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            byte[] bytes = ReportViewer1.LocalReport.Render("PDF", this.deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);       

            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = mimeType;
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "DemonstrativoValorAberto-"+ NumeroContrato.ToString(), "pdf"));
            HttpContext.Current.Response.BinaryWrite(bytes);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        #endregion
        

    }
}