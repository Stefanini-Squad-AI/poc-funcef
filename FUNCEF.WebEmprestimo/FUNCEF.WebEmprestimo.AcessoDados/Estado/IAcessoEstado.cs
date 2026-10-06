using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado
{
    /// <summary>
    /// Oferece uma interface para acessar dados persistentes de estado do sistema.
    /// </summary>
    public interface IAcessoEstado : IObjetoAcesso
    {
        /// <summary>
        /// Adiciona uma nova entrada de estado do sistema.
        /// </summary>
        /// <param name="entrada">Entrada a ser adicionada.</param>
        void adicionarEntrada(EntradaEstado entrada);

        /// <summary>
        /// Recupera uma entrada de estado do sistema.
        /// </summary>
        /// <param name="chave">Chave da entrada que deve ser recuperado.</param>
        /// <returns>Array de <see cref="System.Byte"/> com os dados que devem ser mantidos.</returns>
        EntradaEstado recuperarEntrada(string chave);
    }
}
