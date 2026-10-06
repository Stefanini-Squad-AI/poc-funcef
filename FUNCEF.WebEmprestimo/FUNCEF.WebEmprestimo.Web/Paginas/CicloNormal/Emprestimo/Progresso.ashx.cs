using System.Web;
using FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    public class Progresso : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";

            int porcentagemAtual = Visualizacao.Porcentagem;

            context.Response.Write(porcentagemAtual.ToString()+".");

            //barraProgresso
            byte totalRegras = Visualizacao.totalRegras;
            byte regraAtual = Visualizacao.regraAtual;
            byte totalItem = Visualizacao.totalItens;
            byte itemAtual = Visualizacao.itemAtual;
            string mensagem = Visualizacao.mensagem;

            context.Response.Write(totalRegras.ToString() + ".");
            context.Response.Write(regraAtual.ToString() + ".");
            context.Response.Write(totalItem.ToString() + ".");
            context.Response.Write(itemAtual.ToString() + ".");
            context.Response.Write(mensagem);


            //barraProgresso

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
