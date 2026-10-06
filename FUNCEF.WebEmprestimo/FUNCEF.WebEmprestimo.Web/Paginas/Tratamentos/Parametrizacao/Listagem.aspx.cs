using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parametrizacao
{
    public partial class Listagem : PaginaSeguraComEstado
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            this.atualizarEstado += new EventHandler(botaoProcurar_Click);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridParametros.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                try
                {
                    string usuarioLogado = this.contextoSistema.usuarioAtual.nomeCompleto.ToUpper();

                    //using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    //{
                    //    txtNumRemessa.Text = cliente.contrato.ObterNumeroRemessaArquivo().ToString();
                    //}
                }
                catch
                {
                }

            }
        }

        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridParametros.DataSourceID = dataSourceParametro.ID;
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            txtDataInicio.Text = String.Empty;
            txtDataFim.Text = String.Empty;

            gridParametros.limpar();
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceParametro_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //Verifica quais parametros usar.
            tratarFiltros(ref e);
        }

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

        //public void botaoIncluir_Click(object sender, EventArgs e)
        //{
        //    //try
        //    //{
        //    //    if (VerificarPreenchimentoCampos())
        //    //    {
        //    //        FUNCEF.Planus.WebEmprestimo.Tipos.Serasa dados = new FUNCEF.Planus.WebEmprestimo.Tipos.Serasa();
        //    //        dados.DataEventoCobranca = Convert.ToDateTime(txtDataInicial.Text);
        //    //        dados.NumRemessa = txtNumRemessa.Text;
        //    //        dados.NomeResponsavel = txtNomeResposavel.Text;
        //    //        dados.TelefoneResponsavel = txtNumTelefone.Text;
        //    //        dados.LogonSerasa = txtLogonSerasa.Text;

        //    //        using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
        //    //        {
        //    //            GerarArquivoInclusaoSerasa(dados);
        //    //        }
        //    //    }
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    ScriptManager.RegisterStartupScript(this, GetType(), "YourUniqueScriptKey", "alert('" + ex.Message + "');", true);
        //    //}
        //}
        

        //public void botaoCancela_Click(object sender, EventArgs e)
        //{
        //    botaoLimpar_Click(sender, e);
        //    SecaoParametro.Visible = false;
        //}

        protected void gridParametros_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                if (string.IsNullOrEmpty(lblTotalRegistros.Text))
                    lblTotalRegistros.Text = "Total de registros: " + gridParametros.Rows.Count.ToString();

                //e.Row.Cells[8].Text = "Total de registros";
                //e.Row.Cells[9].Text = gridContrato.Rows.Count.ToString();
            }
        }

        protected void botaoCancela_Click(object sender, EventArgs e)
        {
            botaoLimpar_Click(sender, e);
            
        }

        protected void gridParametros_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                ParametrosCampanha parametros = new ParametrosCampanha();
                parametros.IdCampanha = Convert.ToInt64(gridParametros.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
                parametros.IdTipoPropostaCampanha = Convert.ToInt32(gridParametros.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text);
                parametros.TipoPropostaCampanha = gridParametros.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text;
                parametros.DataInicio = Convert.ToDateTime(gridParametros.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text);
                parametros.DataFim = Convert.ToDateTime(gridParametros.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text);
                string guidItens = Guid.NewGuid().ToString();
                this.proxyEstado.manterEstadoSincrono(guidItens, parametros);
                Response.Redirect(String.Format("~/Paginas/Tratamentos/Parametrizacao/Inclusao.aspx?guidItens={0}", guidItens), false);
            }
            catch (Exception ex)
            {
            }
        }
    }
}