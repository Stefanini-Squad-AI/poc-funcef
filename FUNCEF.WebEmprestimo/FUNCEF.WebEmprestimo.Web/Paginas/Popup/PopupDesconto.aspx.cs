using System;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.UI;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Microsoft.Reporting.WebForms;

using System.IO;
using Novacode;


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Popup
{
    /// <summary>
    /// Representa a página de listagem Novo avalista.
    /// </summary>
    public partial class PopupDesconto : PaginaSegura
    {
        private string guidDesconto
        {
            get
            {
                string queryString = Request.QueryString["guidDesconto"];

                return queryString;
            }
        }

        private double totalNominal;
        private double totalComDesconto;

        #region Eventos

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ItemDescontoContrato> itensDesconto = (List<ItemDescontoContrato>)this.proxyEstado.obterEstado(this.guidDesconto);
                itensDesconto.ForEach(x => x.percentualDesconto = x.percentualDesconto * 100);
                totalNominal = itensDesconto.Sum(x => x.valorNominal);
                totalComDesconto = itensDesconto.Sum(x => x.valorComDesconto);

                gridItens.DataSource = itensDesconto;
                gridItens.DataBind();
            }
        }

        #endregion

        #region Contexto da Página / Permissões

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.contrato;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }

        #endregion

        protected void gridItens_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            gridItens.Columns[0].FooterText = "Total";
            gridItens.Columns[1].FooterText = String.Format("{0:N2}",totalNominal);
            gridItens.Columns[2].FooterText = "-";
            gridItens.Columns[3].FooterText = String.Format("{0:N2}", totalComDesconto);

            gridItens.Columns[0].FooterStyle.HorizontalAlign = HorizontalAlign.Left;
            gridItens.Columns[1].FooterStyle.HorizontalAlign = HorizontalAlign.Right;
            gridItens.Columns[2].FooterStyle.HorizontalAlign = HorizontalAlign.Right;
            gridItens.Columns[3].FooterStyle.HorizontalAlign = HorizontalAlign.Right;
        }
    }
}
