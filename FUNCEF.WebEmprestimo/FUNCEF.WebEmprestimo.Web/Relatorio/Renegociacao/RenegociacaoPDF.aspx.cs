using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Relatorio
{
    public partial class RenegociacaoPDF : System.Web.UI.Page
    {
        #region propriedades
        private string TipoExportacao
        {
            get
            {
                return Request.QueryString["TipoArquivo"] != null ? Request.QueryString["TipoArquivo"] : "P";
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


        protected void Page_Load(object sender, EventArgs e)
        {
            exportarRelatorio();
        }

        private void exportarRelatorio()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["RelReneg"];            
                                  
            ReportDataSource RDS = new ReportDataSource("DataSetRenegociacao", dt);

            ReportViewer1.Visible = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.Reset();
            ReportViewer1.LocalReport.ReportPath = "Relatorio/Renegociacao/Renegociacao.rdlc";
            ReportViewer1.LocalReport.DataSources.Add(RDS);
            ReportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(RenegociacaoResumoGerador);
            ReportViewer1.LocalReport.Refresh();

            if (TipoExportacao.Equals("E"))
            {
                exportacaoExcel();
            }
            else
            {
                exportacaoPDF();
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
            dtResumo.Columns.Add("vlrtotal_prestacoes_resumo", typeof(double));
            dtResumo.Columns.Add("vlrtotal_fgqc_resumo", typeof(double));

            dtResumo.Columns.Add("valorSaldoDevedorVencido", typeof(double));
            dtResumo.Columns.Add("valorSaldoDevedoraVencer", typeof(double));
            dtResumo.Columns.Add("valorSaldoDevedorTotal", typeof(double));
            dtResumo.Columns.Add("valorItensConcessao", typeof(double));            

            #endregion

            for (int i = 0; i < modalidades.Length; i++)
            {
                var linha = dtRel.AsEnumerable()
                                .Where(m => m.Field<string>("matricula_mutuario") == matricula)
                                .Where(m => m.Field<string>("modalidade_contrato") == modalidades[i]).ToList();
                
                var linhaParc = linha.Where(c => c.Field<string>("item_itens").ToLower() == "prestação").ToList();
                var linhaFGQC = linha.Where(c => c.Field<string>("item_itens").ToUpper() == "FGQC").ToList();
                                                               
                double? vlrParc = linhaParc.Sum(v => v.Field<double?>("vlrtotal_itens"));
                double? vlrFGQC = linhaFGQC.Sum(v => v.Field<double?>("vlrtotal_itens"));

                double? valorSaldoDevedorVencido = linhaParc.Sum(v => v.Field<double?>("valorSaldoDevedorVencido"));
                double? valorSaldoDevedoraVencer = linhaFGQC.Sum(v => v.Field<double?>("valorSaldoDevedoraVencer"));
                double? valorSaldoDevedorTotal = linhaFGQC.Sum(v => v.Field<double?>("valorSaldoDevedorTotal"));

                dtResumo.Rows.Add(matricula, modalidades[i], linhaParc.Count(), linhaFGQC.Count(), vlrParc, vlrFGQC, valorSaldoDevedorVencido, valorSaldoDevedoraVencer, valorSaldoDevedorTotal);
            }           

            ReportDataSource RDS = new ReportDataSource("DataSetResumo", dtResumo);
            e.DataSources.Add(RDS);
        }

        #region tipos de exportações
        public void exportacaoExcel()
        {
            Warning[] warnings = null;
            string[] streamids = null;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            byte[] bytes = ReportViewer1.LocalReport.Render("Excel", null, out mimeType, out encoding, out extension, out streamids, out warnings);

            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "ExportToExcel", "xls"));
            HttpContext.Current.Response.ContentType = mimeType;
            HttpContext.Current.Response.BinaryWrite(bytes);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        public void exportacaoPDF()
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
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "ExportToPDF", "pdf"));
            HttpContext.Current.Response.BinaryWrite(bytes);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        #endregion
        
        private void GerarTesteDadosResumo(ref DataTable dt, string matricula)
        {
            dt.Rows.Add(matricula, "NOVO CREDINÂMICO - VARIÁVEL", 2, 2, 27.15, 830.49);
            dt.Rows.Add(matricula, "NOVO CREDINÂMICO - FIXO", 2, 2, 113.03, 3199.33);
        }       
        
    }
}