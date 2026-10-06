using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using System.Collections;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa o gerenciador de Moeda
    /// </summary>
    public class GerenciadorMoeda
    {
        #region Atributos

        private IAcessoMoeda acesso = FabricaObjetos.instancia.obterAcessoMoeda();

        #endregion

        #region Consultas

        /// <summary>
        /// Lista os Tipos de Moeda do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Moeda"/> com a(s) Moeda(s) encontrada(s).</returns>
        public List<Moeda> listar()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Moeda> listaMoeda = acesso.listar();

                //Completa a transação
                transacao.Complete();

                return listaMoeda;
            }
        }

        #endregion
    }
}