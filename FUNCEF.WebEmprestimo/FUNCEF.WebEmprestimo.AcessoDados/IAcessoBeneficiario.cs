using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados
{
    /// <summary>
    /// Oferece uma interface para acessar dados dos contratos.
    /// </summary>
    public interface IAcessoBeneficiario : IObjetoAcesso
    {
        /// <summary>
        /// Consulta os beneficiários do contrato.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Beneficiario"/> com o(s) beneficiário(s) encontrado(s).</returns>
        List<Beneficiario> consultarBeneficiarios(long numero);
    }
}
