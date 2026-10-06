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

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que gerencia tipo de suspensão.
    /// </summary>
    public class GerenciadorTipoSuspensao
    {
        #region Atributos

        private IAcessoTipoSuspensao acesso = FabricaObjetos.instancia.obterAcessoTipoSuspensao();

        #endregion

        /// <summary>
        /// Consulta os tipos de suspensão.
        /// </summary>
        /// <param name="idTipoContrato">Identificação do contrato a ser filtrado.</param>
        /// <param name="idTipoSuspensao">Identificação do tipo de suspensão a ser filtrado.</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        public List<TipoSuspensao> consultar(int idTipoContrato, int? idTipoSuspensao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<TipoSuspensao> listaTipos = acesso.consultar(idTipoContrato, idTipoSuspensao);

                //Completa a transação
                transacao.Complete();

                return listaTipos;
            }
        }

        /// <summary>
        /// Lista todos tipos de suspensão.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        public List<TipoSuspensao> listar()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<TipoSuspensao> listaTipos = acesso.listar();

                //Completa a transação
                transacao.Complete();

                return listaTipos;
            }
        }
    }
}