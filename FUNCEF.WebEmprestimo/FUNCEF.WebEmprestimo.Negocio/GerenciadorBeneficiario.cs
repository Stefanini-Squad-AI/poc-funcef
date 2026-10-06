using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa Beneficiário
    /// </summary>
    public class GerenciadorBeneficiario : ObjetoNegocioSistema
    {
        #region Atributos

        private IAcessoBeneficiario acesso = FabricaObjetos.instancia.obterAcessoBeneficiarios();

        #endregion

        #region Consultas

        /// <summary>
        /// Consulta os beneficiários do contrato.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Beneficiario"/> com o(s) beneficiário(s) encontrado(s).</returns>
        public List<Beneficiario> consultarBeneficiarios(long numero)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Beneficiario> beneficiarios = acesso.consultarBeneficiarios(numero);

                //Completa a transação
                transacao.Complete();

                return beneficiarios;
            }
        }

        #endregion
    }
}