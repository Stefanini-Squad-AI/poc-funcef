using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Reflection;

namespace FUNCEF.Planus.WebEmprestimo.Web.Componentes.Versao
{
    /// <summary>
    /// Representa um Label contendo a versão da aplicação.
    /// </summary>
    public sealed class VersaoAplicacao : Control
    {
        /// <summary>
        /// Efetua o "render" do controle.
        /// </summary>
        /// <param name="writer">Escritor HTML.</param>
        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write(Assembly.GetExecutingAssembly().GetName().Version.ToString());
        }
    }
}
