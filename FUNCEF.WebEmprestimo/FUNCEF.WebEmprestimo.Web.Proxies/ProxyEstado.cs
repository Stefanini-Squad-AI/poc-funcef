using Util = FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Servicos;

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    /// <summary>
    /// Representa um proxy do serviço de manutenção de estado da aplicação.
    /// </summary>
    public class ProxyEstado : ProxyBase, IProxyEstado
    {
        /// <summary>
        /// Mantém o estado de determinado objeto.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica o objeto.</param>
        /// <param name="estado">Objeto com o estado a ser mantido.</param>
        public void manterEstado(string chaveEstado, object estado)
        {
            //Obtendo o valor compactado do estado da página.
            byte[] estadoCompacto = Util.UtilidadesSerializacao.serializarBinario(estado);

            //Enviando ao serviço a solicitação de manutenção de estado.
            this.manterEstado(chaveEstado, estadoCompacto);
        }

        /// <summary>
        /// Mantém o estado de determinado objeto de forma síncrona.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica o objeto.</param>
        /// <param name="estado">Objeto com o estado a ser mantido.</param>
        public void manterEstadoSincrono(string chaveEstado, object estado)
        {
            //Obtendo o valor compactado do estado da página.
            byte[] estadoCompacto = Util.UtilidadesSerializacao.serializarBinario(estado);

            //Enviando ao serviço a solicitação de manutenção de estado.
            this.manterEstadoSincrono(chaveEstado, estadoCompacto);
        }

        /// <summary>
        /// Obtém o estado mantido pelo serviço de estados da aplicação.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica os dados.</param>
        /// <returns><see cref="System.Object"/> mantido.</returns>
        public object obterEstado(string chaveEstado)
        {
            //Obtendo o estado do serviço.
            byte[] estado = this.obterEstadoInterno(chaveEstado);

            //Descompactando seu valor.
            return Util.UtilidadesSerializacao.desserializar(estado);
        }

        #region Métodos Internos

        private void manterEstado(string chaveEstado, byte[] estado)
        {
            using (Cliente<IServicoEstado> cliente = new Cliente<IServicoEstado>())
            {
                cliente.contrato.manterEstado(chaveEstado, estado);
            }
        }

        private void manterEstadoSincrono(string chaveEstado, byte[] estado)
        {
            using (Cliente<IServicoEstado> cliente = new Cliente<IServicoEstado>())
            {
                cliente.contrato.manterEstadoSincrono(chaveEstado, estado);
            }
        }

        private byte[] obterEstadoInterno(string chaveEstado)
        {
            using (Cliente<IServicoEstado> cliente = new Cliente<IServicoEstado>())
            {
                return cliente.contrato.obterEstado(chaveEstado);
            }
        }

        #endregion
    }
}
