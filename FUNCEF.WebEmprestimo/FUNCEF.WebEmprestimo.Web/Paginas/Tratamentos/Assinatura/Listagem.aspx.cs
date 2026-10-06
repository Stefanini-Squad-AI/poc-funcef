#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do arquivo
///
#endregion

using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Assinatura
{
    public partial class Listagem : PaginaSeguraComEstado
    {
        #region Eventos
        protected void Page_Init(object sender, EventArgs e)
        {
            this.atualizarEstado += new EventHandler(botaoProcurar_Click);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridAssinaturas.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
            }
        }

        protected void gridAssinaturas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var item = e.Row.DataItem as Tipos.Assinatura;
                var linkPdf = e.Row.FindControl("hplPdf") as HyperLink;
                var linkDescricao = e.Row.FindControl("linkCampo") as HyperLink;

                if (item == null)
                {
                    return;
                }

                if (linkPdf != null)
                {
                    bool encontrado = false;
                    
                    linkPdf.Visible = !string.IsNullOrEmpty(item.numProtocolo);
                    
                    if (!string.IsNullOrEmpty(item.numProtocolo))
                    {
                        linkPdf.NavigateUrl = Edicao.obterCaminhoPdf(item.numProtocolo, out encontrado);
                    }
                }

                if (linkDescricao != null)
                {
                    linkDescricao.NavigateUrl = ResolveUrl(string.Format("~/Paginas/Tratamentos/Assinatura/Edicao.aspx?chave={0}", CriptografiaHelper.Encrypt(item.chave)));
                }
            }
        }

        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridAssinaturas.EmptyDataText = string.Empty;
            gridAssinaturas.DataSourceID = dataSourceMutuarios.ID;
        }

        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            caixaTextoCPF.Text = String.Empty;
            caixaTextoNumMatricula.Text = String.Empty;

            gridAssinaturas.limpar();
        }

        protected void dataSourceMutuario_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            tratarFiltros(ref e);
        }

        protected void dataSourceMutuarios_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.OutputParameters.Contains("mensagemExcecao"))
            {
                var msg = Convert.ToString(e.OutputParameters["mensagemExcecao"]);

                if (!string.IsNullOrEmpty(msg))
                {
                    gridAssinaturas.EmptyDataText = msg;
                }
            }
            else if (e.Exception != null)
            {
                e.ExceptionHandled = true;

                if (e.Exception.InnerException != null)
                    gridAssinaturas.EmptyDataText = e.Exception.InnerException.Message;
                else
                    gridAssinaturas.EmptyDataText = e.Exception.Message;
            }
            else
            {
                gridAssinaturas.EmptyDataText = string.Empty;
            }

            bool possuiRegistros = false;
            bool naoEncontrado = gridAssinaturas.EmptyDataText.Equals("O participante não foi encontrado.", StringComparison.InvariantCultureIgnoreCase);
            
            if (e.ReturnValue is List<Tipos.Assinatura>)
            {
                possuiRegistros = ((List<Tipos.Assinatura>)e.ReturnValue).Count > 0;
            }

            botaoIncluir.Visible = possuiRegistros || !naoEncontrado;

            if (botaoIncluir.Visible && botaoIncluir.Controls.Count == 0)
            {
                Image imagemBotao = new Image
                {
                    ImageUrl = EstiloConfiguravel.obterImagemConfiguravel(TagImagem.botaoIncluir),
                    ImageAlign = ImageAlign.AbsMiddle
                };

                botaoIncluir.Controls.Add(imagemBotao);
                botaoIncluir.Controls.Add(new Literal { Text = string.Concat("&nbsp;", botaoIncluir.Text) });

                if (e.OutputParameters.Contains("queryString"))
                {
                    string qs = Convert.ToString(e.OutputParameters["queryString"]);
                    
                    if (!string.IsNullOrEmpty(qs))
                    {
                        string urlInclusao = string.Concat("~/Paginas/Tratamentos/Assinatura/Edicao.aspx?chave=", CriptografiaHelper.Encrypt(qs));
                        
                        botaoIncluir.OnClientClick = String.Concat("window.location.replace('", botaoIncluir.ResolveClientUrl(urlInclusao), "'); return false;");
                    }
                }
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
                return "COASP";
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
    }
}