using System;
using FUNCEF.Planus.WebEmprestimo.Tipos;


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual
{
    public partial class PopupConfirmacao : System.Web.UI.Page
    {
        private RetornoPopup retorno;

        protected void Page_Load(object sender, EventArgs e)
        {
            retorno = new RetornoPopup() { retorno = false, caixaTexto = "" };
        }

        protected void botaoOk_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(caixaTextoOrigemRecurso.Text))
            {
                retorno.caixaTexto = caixaTextoOrigemRecurso.Text;
                retorno.retorno = true;
                Session["confirmacaoAlterarVencimento"] = retorno;
                FecharPopUp();
            }
        }

        protected void botaoCancelar_Click(object sender, EventArgs e)
        {
            retorno.caixaTexto = "";
            retorno.retorno = false;

            Session["confirmacaoAlterarVencimento"] = retorno;
            FecharPopUp();
        }

        private void FecharPopUp()
        {
            this.ClientScript.RegisterStartupScript(GetType(), "Fechar", "fechar();", true);
        }
    }
}