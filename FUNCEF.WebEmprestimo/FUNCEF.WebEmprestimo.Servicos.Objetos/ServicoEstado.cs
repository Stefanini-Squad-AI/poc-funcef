using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
using FUNCEF.Planus.Componentes.ServicoWeb;
using FUNCEF.Planus.WebEmprestimo.Negocio.Estado;

namespace FUNCEF.Planus.WebEmprestimo.Servicos.Objetos
{
    /// <summary>
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ExceptionShielding("Politica Sistema")]
    [InspecaoRequisicao()]
    public class ServicoEstado : ServicoBase, IServicoEstado
    {
        #region IServicoEstado Members

        /// <summary>
        /// Mantém determinado estado para futuro acesso.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica os dados mantidos.</param>
        /// <param name="estado">Dados a serem mantidos.</param>
        public void manterEstado(string chaveEstado, byte[] estado)
        {
            MaquinaEstado.obterInstancia().adicionarEntrada(chaveEstado, estado);
        }

        /// <summary>
        /// Mantém determinado estado para futuro acesso de forma síncrona.
        /// </summary>
        /// <param name="chaveEstado">Chave que identifica os dados mantidos.</param>
        /// <param name="estado">Dados a serem mantidos.</param>
        public void manterEstadoSincrono(string chaveEstado, byte[] estado)
        {
            this.manterEstado(chaveEstado, estado);
        }

        /// <summary>
        /// Obtém dados mantidos pelo motor de estado do sistema.
        /// </summary>
        /// <param name="chave">Chave que identifica os dados a serem obtidos.</param>
        /// <returns>Array de <see cref="System.Byte"/> com os dados preservados.</returns>
        public byte[] obterEstado(string chave)
        {
            return MaquinaEstado.obterInstancia().recuperarEntrada(chave);
        }

        #endregion
    }
}
