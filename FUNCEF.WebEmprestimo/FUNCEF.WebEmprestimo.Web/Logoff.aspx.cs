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
using FUNCEF.Planus.Componentes.Web;

namespace FUNCEF.Planus.WebEmprestimo.Web
{
    /// <summary>
    /// Representa uma página de Logoff.
    /// </summary>
    public partial class Logoff : System.Web.UI.Page
    {
        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Sender.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GerenciadorSessao.abandonarSessao();
                FormsAuthentication.SignOut();
                Response.Redirect(FormsAuthentication.LoginUrl);
            }
        }
    }
}
