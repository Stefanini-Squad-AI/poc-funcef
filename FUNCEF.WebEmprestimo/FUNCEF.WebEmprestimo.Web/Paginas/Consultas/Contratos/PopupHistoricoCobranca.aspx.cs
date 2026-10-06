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
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Collections.Generic;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    public partial class PopupHistoricoCobranca : PaginaSeguraComEstado
    {
        #region Propriedades

        private long numeroContrato
        {
            get
            {
                if (Request.QueryString["numeroContrato"] != null)
                    return long.Parse(Request.QueryString["numeroContrato"]);
                else
                    return 0L;
            }
        }

        private int idTipoEvento
        {
            get
            {
                if (Request.QueryString["tipoEvento"] != null)
                    return int.Parse(Request.QueryString["tipoEvento"]);
                else
                    return 0;
            }
        }

        private DateTime dataEvento
        {
            get
            {
                if (Request.QueryString["dataEvento"] != null)
                {
                    string[] sData = Request.QueryString["dataEvento"].Split('/');

                    return new DateTime(int.Parse(sData[2]), int.Parse(sData[1]), int.Parse(sData[0]));
                }
                else
                    return DateTime.Today;
            }

        }

        private long idEvento
        {
            get
            {
                if (Request.QueryString["idEvento"] != null)
                    return long.Parse(Request.QueryString["idEvento"]);
                else
                    return 0L;
            }
        }

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Response.Expires = -1;
                this.Carregar();
            }
        }

        #endregion

        #region Contexto da Página / Permissões


        public override string identificacaoContexto
        {
            get { return IdentificacaoContexto.contrato; }
        }

        public override string permissoesExigidas
        {
            get { return PermissoesSistema.consultar.ToString(); }
        }

        #endregion

        #region Métodos

        private void Carregar()
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                List<Historico> historicos = new List<Historico>();

                historicos = cliente.contrato.consultarEventoCobranca(this.numeroContrato, this.idEvento);

                if (historicos.Count > 0)
                    caixaTextoObservacaoCobranca.Text = historicos[0].observacao;

                historicos = cliente.contrato.consultarParcelaCobranca(this.numeroContrato, this.idTipoEvento, this.dataEvento);

                if (historicos.Count > 0)
                    gridPrestacoesCobranca.DataSource = historicos;
                else
                    gridPrestacoesCobranca.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                gridPrestacoesCobranca.DataBind();
            }
        }

        #endregion

    }
}
