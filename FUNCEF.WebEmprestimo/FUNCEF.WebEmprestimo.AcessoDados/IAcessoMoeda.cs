using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados da Moeda.
    /// </summary>
    public interface IAcessoMoeda : IObjetoAcesso
    {
        /// <summary>
        /// Lista os Tipos de Moeda do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Moeda"/> com o(s) tipo(s) Moeda(s) encontrada(s).</returns>
        List<Moeda> listar();
    }
}
