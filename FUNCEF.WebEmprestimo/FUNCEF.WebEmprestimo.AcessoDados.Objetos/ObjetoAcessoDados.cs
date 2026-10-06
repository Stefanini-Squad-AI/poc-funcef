using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Classe base para os objetos de acesso a dados.
    /// </summary>
    public abstract class ObjetoAcessoDados : IObjetoAcesso
    {
        #region Atributos

        private Database oBancoDeDados;

        #endregion

        #region Métodos

        /// <summary>
        /// Obtém o objeto que representa o banco de dados a ser utilizado.
        /// </summary>
        /// <returns>Um objeto de tipo <see cref="Microsoft.Practices.EnterpriseLibrary.Data.Database"/>.</returns>
        protected virtual Database obterBancoDeDados()
        {
            if (this.oBancoDeDados == null)
            {
                this.oBancoDeDados = DatabaseFactory.CreateDatabase();
                
                //DbCommand comando;
                //comando = this.oBancoDeDados.GetSqlStringCommand("alter session set current_schema=CM");
                //oBancoDeDados.ExecuteNonQuery(comando);

                //DbCommand comando;
                //comando = this.oBancoDeDados.GetSqlStringCommand("alter session set nls_comp = ANSI");
                //comando.ExecuteNonQuery();

                //comando = this.oBancoDeDados.GetSqlStringCommand("alter session set nls_sort = GENERIC_BASELETTER");
                //comando.ExecuteNonQuery();

                //comando.Dispose();
            }

            return this.oBancoDeDados;
        }

        /// <summary>
        /// Obtém a estrutura de ordenação de uma query.
        /// </summary>
        /// <param name="alias">O alias do campo de ordenação</param>
        /// <param name="campoPadrao">Campo de ordenação padrão.</param>
        /// <param name="parametros">Parâmetros da consulta.</param>
        /// <returns>A estrutura de ordenação da query.</returns>
        protected virtual string obterQueryOrdenacao(string alias, string campoPadrao, ParametrosConsulta parametros)
        {
            string query = String.Concat("ORDER BY ", alias, ".{0}");

            if (parametros != null && parametros.ordenacao != null)
            {
                query = String.Format(query, Utilidades.textoVazio(parametros.ordenacao.criterio) ? campoPadrao : parametros.ordenacao.criterio);
            }
            else
            {
                query = String.Format(query, campoPadrao);
            }

            return query;
        }

        #endregion
    }
}
