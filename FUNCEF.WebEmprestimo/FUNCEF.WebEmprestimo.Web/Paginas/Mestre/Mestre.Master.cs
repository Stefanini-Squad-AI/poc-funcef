using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using FUNCEF.Planus.GlobalWeb.Web.IU;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Mestre
{
    public partial class Mestre : PaginaMestreBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {
            
            // SIG 63057 --
            SiteMapNode node = e.Item.DataItem as SiteMapNode;
            if (node["type"] != null && node["type"].ToLower() == "nodesegundavia")
            {
                string url = ConfigurationSettings.AppSettings["LinkSegundaViaContrato"];
                e.Item.NavigateUrl = "javascript:window.open('"+url+"');";
            }
            //--------------
            if (this.Context.Items["efetuaAcaoSalvar"] != null && (bool)this.Context.Items["efetuaAcaoSalvar"])
                e.Item.NavigateUrl = "javascript:confirmarSaida('" + e.Item.NavigateUrl + "');";
        }
    }
}
