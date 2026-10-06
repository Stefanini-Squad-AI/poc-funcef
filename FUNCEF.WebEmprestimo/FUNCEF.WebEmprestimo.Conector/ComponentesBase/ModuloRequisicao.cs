using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.Configuration;

namespace FUNCEF.Planus.WebEmprestimo.Conector.ComponentesBase
{
    /// <summary>
    /// Representa um módulo de requisição do sistema.
    /// </summary>
    public class ModuloRequisicao : IHttpModule
    {
        #region IHttpModule Members

        /// <summary>
        /// Libera recursos utilizados pelo módulo.
        /// </summary>
        public void Dispose()
        {
        }

        /// <summary>
        /// Inicializa o módulo.
        /// </summary>
        /// <param name="context">Aplicação em que o módulo é executado.</param>
        public void Init(HttpApplication context)
        {
            context.AuthenticateRequest += new EventHandler(context_AuthenticateRequest);
        }

       

        #endregion

        private void context_AuthenticateRequest(object sender, EventArgs e)
        {
            HttpApplication app = sender as HttpApplication;

            if (app != null && app.Context != null && app.Context.Request != null)
            {
                string chaveConector = ConfigurationManager.AppSettings["conector.chave"];

                IIdentity identity = new GenericIdentity(String.Format("conector[{0}]", chaveConector));
                IPrincipal principal = new GenericPrincipal(identity, new string[] { });

                app.Context.User = principal;
            }
        }
    }
}
