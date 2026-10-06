using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using Oracle.ManagedDataAccess.Types;
using Oracle.ManagedDataAccess.Client;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes.AcessoDados;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Objeto de acesso a dados de tipo de contrato.
    /// </summary>
    public class AcessoMoeda : ObjetoAcessoDados, IAcessoMoeda
    {
        #region Constantes

        private const int MOECODIGO_LISTA = 0;
        private const int MOESIGLA_LISTA = 1;

        #endregion

        #region Consultas

        /// <summary>
        /// Lista os Tipos de Moeda do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Moeda"/> com o(s) tipo(s) Moeda(s) encontrada(s).</returns>
        public List<Moeda> listar()
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT MOECODIGO, MOESIGLA FROM MOEDA WHERE MOEINATIVO = 'A' ORDER BY MOESIGLA ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Popula objeto resultante
            List<Moeda> listaMoeda = new List<Moeda>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Moeda moeda = new Moeda()
                    {
                      id = leitor.GetInt32(MOECODIGO_LISTA),
                      sigla = leitor.GetString(MOESIGLA_LISTA)
                    };
                    listaMoeda.Add(moeda);
                }
            }

            return listaMoeda;
        }
        #endregion
    }
}
