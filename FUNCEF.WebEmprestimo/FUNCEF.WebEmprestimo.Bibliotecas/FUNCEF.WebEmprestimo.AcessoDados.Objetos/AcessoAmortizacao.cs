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
    /// Objeto de acesso a dados de amortização.
    /// </summary>
    public class AcessoAmortizacao : ObjetoAcessoDados, IAcessoAmortizacao
    {
        #region Constantes

        #endregion

        #region Consultas

        /// <summary>
		/// Verificar se existe uma amortização anterior em aberto do contrato.
		/// </summary>
		/// <param name="numeroContrato">Número do cotrato.</param>
		/// <param name="dataAmortizacao">Data da amortização.</param>
        public bool verificarAmortizacaoAnterior(long numeroContrato, DateTime dataAmortizacao)
        {
            StringBuilder query = new StringBuilder();

            bool existeAmortizacaoAnterior = false;

            // Consulta
            query.Append("SELECT DISTINCT HMEDATAPREVISTA ");
            query.Append("  FROM HISTMOVEMPTMO HME ");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("   AND HME.HMETIPOMOV = 2 ");
            query.Append("   AND TRUNC(HME.HMEDATAPREVISTA) < TRUNC(:DATAAMORTIZACAO_P) ");
            query.Append("   AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1) ");
            query.Append("   AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) ");
            query.Append("   AND HME.FLGBAIXADO = 0 ");
            query.Append("   AND HME.HMEVLREFETIVO IS NULL ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, dataAmortizacao);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                existeAmortizacaoAnterior = leitor.Read();
            }

            return existeAmortizacaoAnterior;
        }

        /// <summary>
        /// Verifica se já existe uma amortização para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        public bool verificarAmortizacaoExistente(long numeroContrato, DateTime dataAmortizacao)
        {
            StringBuilder query = new StringBuilder();

            bool existeAmortizacao = false;

            // Consulta
            query.Append(" SELECT DISTINCT HMEDATAPREVISTA ");
            query.Append(" FROM HISTMOVEMPTMO HME ");
            query.Append("   WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("   AND HME.HMETIPOMOV = 2 ");
            query.Append("   AND TRUNC(HME.HMEDATAPREVISTA) >= TRUNC(:DATAAMORTIZACAO_P) ");
            query.Append("   AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, dataAmortizacao);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                existeAmortizacao = leitor.Read();
            }

            return existeAmortizacao;
        }

     #endregion
    }
}
