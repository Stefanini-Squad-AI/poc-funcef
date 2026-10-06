using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.Componentes.Web;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Home
{
    /// <summary>
    /// Representa a página padrão do sistema.
    /// </summary>
    public partial class Default : PaginaBase
    {
        /// <summary>
        /// Indica se uma saída do sistema foi solicitada.
        /// </summary>
        protected bool saidaSolicitada
        {
            get
            {
                string valorQueryString = this.Request.QueryString["saidaSolicitada"];

                if (String.IsNullOrEmpty(valorQueryString))
                {
                    return false;
                }

                bool saida;

                if (!Boolean.TryParse(valorQueryString, out saida))
                {
                    return false;
                }
                return saida;
            }
        }

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                try
                {
                    string banco = cliente.contrato.ObterAmbienteBancoDados();
                    var configuration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                    configuration.AppSettings.Settings["ambiente"].Value = banco.ToUpper();
                    configuration.Save(ConfigurationSaveMode.Modified);
                }
                catch (Exception)
                {                   
                }
            }
                       

            if (saidaSolicitada)
            {
                UtilidadesSeguranca.efetuarSignOut(this);
            }
        }
    }
}
