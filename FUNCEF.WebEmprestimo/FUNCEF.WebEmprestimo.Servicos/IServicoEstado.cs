using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;

namespace FUNCEF.Planus.WebEmprestimo.Servicos
{
    /// <summary>
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ServiceContract(Namespace = ConstantesServico.namespaceServicos)]
    public interface IServicoEstado : IServicoBase
    {
        /// <summary>
        /// Mantém determinado estado para futuro acesso.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica os dados mantidos.</param>
        /// <param name="estado">Dados a serem mantidos.</param>
        [OperationContract(IsOneWay = true)]
        void manterEstado(string chaveEstado, byte[] estado);

        /// <summary>
        /// Mantém determinado estado para futuro acesso de forma síncrona.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica os dados mantidos.</param>
        /// <param name="estado">Dados a serem mantidos.</param>
        [OperationContract()]
        void manterEstadoSincrono(string chaveEstado, byte[] estado);

        /// <summary>
        /// Obtém dados mantidos pelo motor de estado do sistema.
        /// </summary>
        /// <param name="chave">Chave que identifica os dados a serem obtidos.</param>
        /// <returns>Array de <see cref="System.Byte"/> com os dados preservados.</returns>
        [OperationContract()]
        byte[] obterEstado(string chave);
    }
}
