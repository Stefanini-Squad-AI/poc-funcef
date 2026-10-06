using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.Negocio.Estado
{
    /// <summary>
    /// Representa uma máquina que mantém estado da aplicação
    /// </summary>
    public class MaquinaEstado : ObjetoNegocioSistema
    {
        #region Singleton

        private static MaquinaEstado instancia = new MaquinaEstado();

        /// <summary>
        /// Obtém uma instância única da máquina de estados da aplicação.
        /// </summary>
        /// <returns></returns>
        public static MaquinaEstado obterInstancia()
        {
            return MaquinaEstado.instancia;
        }

        #endregion

        #region Propriedades

        private IAcessoEstado atributoObjetoAcessoDados;

        /// <summary>
        /// Obtém o objeto de acesso a dados da máquina de estado.
        /// </summary>
        protected IAcessoEstado objetoAcessoDados
        {
            get
            {
                if (this.atributoObjetoAcessoDados == null)
                {
                    this.atributoObjetoAcessoDados = FabricaObjetos.instancia.obterAcessoEstado();
                }
                return this.atributoObjetoAcessoDados;
            }
        }

        #endregion

        /// <summary>
        /// Adiciona uma nova entrada à máquina de estado.
        /// </summary>
        /// <param name="chave">Chave da entrada.</param>
        /// <param name="dados">Dados que devem ser mantidos.</param>
        public void adicionarEntrada(string chave, byte[] dados)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                this.objetoAcessoDados.adicionarEntrada(
                    new EntradaEstado { chave = chave, dados = dados, dataEntrada = DateTime.Now });

                transacao.Complete();
            }
        }

        /// <summary>
        /// Recupera uma entrada da máquina de estado do sistema.
        /// </summary>
        /// <param name="chave">Chave da entrada que deve ser recuperado.</param>
        /// <returns>Array de <see cref="System.Byte"/> com os dados que devem ser mantidos.</returns>
        public byte[] recuperarEntrada(string chave)
        {
            EntradaEstado entrada = null;

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                entrada = this.objetoAcessoDados.recuperarEntrada(chave);
                transacao.Complete();
            }

            if (entrada != null)
            {
                return entrada.dados;
            }
            return null;
        }
    }
}
