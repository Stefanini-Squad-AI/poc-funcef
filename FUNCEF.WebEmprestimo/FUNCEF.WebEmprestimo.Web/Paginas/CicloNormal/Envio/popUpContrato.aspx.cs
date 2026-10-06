using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;

using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using Org.BouncyCastle.Asn1.Cms;
using Novacode;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Envio
{
    public partial class popUpContrato : PaginaSeguraComEstado
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            gridContratos.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
            UtilidadeSistema.preencherDropDown<InstrucaoLike>(comboLike, true, EnumeradorItemPreenchimento.Nenhum);
        }

        public override string identificacaoContexto
        {
            get { return IdentificacaoContexto.emprestimo; }
        }

        public override string permissoesExigidas
        {
            get { return PermissoesSistema.mascaraVazia.ToString(); }
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceContratos_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            tratarFiltros(ref e);
        }

        /// <summary>
        /// Evento para procurar os contratos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridContratos.DataSourceID = dataSourceContratos.ID;
        }

        /// <summary>
        /// Evento para limpar os dados já preenchidos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            caixaTextoNumMatricula.Text = String.Empty;
            caixaTextoNumContrato.Text = String.Empty;
            caixaTextoNomeMutuario.Text = String.Empty;
            caixaTextoCPF.Text = String.Empty;

            gridContratos.limpar();
        }

        protected void gridContratos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
                e.Row.Cells[0].Attributes["onClick"] = string.Format("obtemContrato({0})", e.Row.Cells[0].Text);              
                
            //}
        }

        protected void botaoOcultoFecharModal_Click(object sender, EventArgs e)
        {

        }
    }
}