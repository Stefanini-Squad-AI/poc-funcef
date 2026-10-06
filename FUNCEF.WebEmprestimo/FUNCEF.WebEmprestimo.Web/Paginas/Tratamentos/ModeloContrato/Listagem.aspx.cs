#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// Criação de fucionalidade para importar modelos de contratos de empréstimo.
///
#endregion


using System;
using System.Web.UI.WebControls;
using FUNCEF.Planus.Componentes.Web;
using System.Collections.Generic;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.Web.UI;
using Novacode;


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ModeloContrato
{
    public partial class Listagem : PaginaSeguraComEstado
    {

        #region Contexto da Página / Permissões

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.modelocontrato;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridModContratos.EmptyDataText = "Não foi encontrado modelo de contrato para a modalidade";
                carregarComboTipoContrato();
                botaoIncluir.Visible = false;
            }
            else
            {
                gridModContratos.DataSourceID = dataSourceModelos.ID;
            }

        }

        private void carregarComboTipoContrato()
        {
            List<TipoContrato> listaTipoContrato = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //SIG  129005
                //listaTipoContrato = cliente.contrato.listarTipoContrato();  
                listaTipoContrato = cliente.contrato.ListarTodas();
            }

            UtilidadesPagina.preencherDropDown(caixaSelecaoTipoContrato, listaTipoContrato, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "descricao", "id");
        }


        protected void gridModContratos_DataBound(object sender, EventArgs e)
        {
            botaoIncluir.Visible = false;
            if (gridModContratos.Rows.Count == 0)
            {
                botaoIncluir.Visible = true;
            }
        }

        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridModContratos.DataSourceID = dataSourceModelos.ID;
                        
        }

        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            caixaSelecaoTipoContrato.SelectedValue = null;
            gridModContratos.limpar();
            botaoIncluir.Visible = false;
        }

        protected void botaoIncluir_Click(object sender, EventArgs e)
        {
            String strurl = String.Format("~/Paginas/Tratamentos/ModeloContrato/Alteracao.aspx?IdTipoContr={0}&DataInicioVigencia={1}", caixaSelecaoTipoContrato.SelectedValue.ToString(), DataInicioVigencia.valorData.ToString());

            Response.Redirect(strurl);
        }

        protected void btnPDf_Command(object sender, CommandEventArgs e)
        {

            string IdContrEmptmo = Convert.ToString(e.CommandArgument);

            String strurl = String.Format("ImpressaoModelo.aspx?IdTipo={0}", IdContrEmptmo);

            String strscript = "window.open('" + strurl + "', '_blank','toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,modal=no');";

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Modelo", strscript, true);

        }

    }
}