using FUNCEF.Planus.GlobalWeb.Web.IU;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Boleto
{
    public partial class Pdf : System.Web.UI.Page
    {       
        private IProxyEstado atributoProxyEstado;

        protected IProxyEstado proxyEstado
        {
            get
            {
                if (this.atributoProxyEstado == null)
                {
                    try
                    {
                        this.atributoProxyEstado = (IProxyEstado)Activator.CreateInstance(Type.GetType(ConfigurationManager.AppSettings["proxyEstado"]));
                    }
                    catch
                    {
                        throw new Exception("O proxy de máquina de estado não foi informado ou está incorreto.");
                    }
                }

                return atributoProxyEstado;
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

        protected void Page_Load(object sender, EventArgs e)
        {

            Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);
            long numeroContrato = Convert.ToInt64(parametrosItens["numeroContrato"]);
            DateTime dataVencimento = (DateTime)parametrosItens["dataVencimento"];
            double numDocumento = (double)parametrosItens["numeroDocumento"];
            int portadorForma = (int)parametrosItens["portadorForma"];
            int tipoMovimento = (int)parametrosItens["tipoMovimento"];
            string infoAdicionaisBoleto = parametrosItens["infoAdicionaisBoleto"].ToString();          

            //docFinanceiro.portadorForma = 20;
            //docFinanceiro.numDocumento = 7195441;

            var boleto = new BoletoEmprestimo(numDocumento, portadorForma, tipoMovimento);
            boleto.ObservacoesAdicionais = infoAdicionaisBoleto;
            GerarBoletoPDF(boleto);           

        }

        public void GerarBoletoPDF(BoletoEmprestimo BoletoEmprestimo)
        {
            try
            {
                var boletoDTO = BoletoEmprestimo.GetDTO();
         
                this.GetType().Assembly.GetManifestResourceNames();     
                Assembly.GetExecutingAssembly().GetManifestResourceNames();

                LocalReport report = new LocalReport();
                Assembly _assembly = Assembly.GetExecutingAssembly();
                Stream reportStream = _assembly.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Boleto.BoletoEmprestimo.rdlc");
                report.LoadReportDefinition(reportStream);
                report.DataSources.Add(new ReportDataSource("boleto", new List<FUNCEF.Planus.WebEmprestimo.Tipos.Boleto>() { boletoDTO }));
                byte[] bytes = report.Render("PDF");


                Response.Buffer = true;
                Response.ClearHeaders();
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "Boleto_" + boletoDTO.NumeroContrato, "pdf"));
                Response.BinaryWrite(bytes);  

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //Response.End();
                //Sends the response buffer
                Response.Flush();
                // Prevents any other content from being sent to the browser
                Response.SuppressContent = true;
                //Directs the thread to finish, bypassing additional processing
                System.Web.HttpContext.Current.ApplicationInstance.CompleteRequest();
                //Suspends the current thread
                System.Threading.Thread.Sleep(1);
            }

        }

    }
}