using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual
{
    public partial class PopupMotivoAbono : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botaoOk_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(caixaTextoMotivo.Text))
            {
                Session["motivoAbono"] = caixaTextoMotivo.Text;
                FecharPopUp();
            }
        }

        protected void botaoVoltar_Click(object sender, EventArgs e)
        {
                Session["motivoAbono"] = "";
                FecharPopUp();
        }

        private void FecharPopUp()
        {
            this.ClientScript.RegisterStartupScript(GetType(), "Fechar", "fechar();", true);
        }
    }
}