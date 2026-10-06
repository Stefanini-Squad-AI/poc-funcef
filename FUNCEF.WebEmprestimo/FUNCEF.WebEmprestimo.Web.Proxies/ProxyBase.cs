using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    /// <summary>
    /// Representa a classe base para proxies.
    /// </summary>
    public abstract class ProxyBase
    {
        /// <summary>
        /// Obtém o contexto da ação efetuada.
        /// </summary>
        /// <param name="funcionalidade">Funcionalidade.</param>
        /// <param name="acao">Ação.</param>
        /// <returns><see cref="System.String"/> formatada, contendo a funcionalidade e a ação.</returns>
        protected string obterContextoAcao(string funcionalidade, string acao)
        {
            return UtilidadesSeguranca.obterCabecalhoContexto(funcionalidade, acao);
        }
    }
}
