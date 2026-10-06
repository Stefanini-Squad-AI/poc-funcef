using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Inadimplencia.Consultas
{
    public partial class viewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Relatorio.rdlc");
                //ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}