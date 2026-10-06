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
    /// Objeto de acesso a dados de tipo de suspensão.
    /// </summary>
    public class AcessoTipoSuspensao : ObjetoAcessoDados, IAcessoTipoSuspensao
    {
        #region Constantes

        private const int IDTIPOSUSPEMPTMO_LISTA = 0;
        private const int TSEDESCRICAO_LISTA = 1;

        #endregion

        #region Consultas

        /// <summary>
        /// Lista todos tipos de suspensão.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        public List<TipoSuspensao> listar()
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT TSE.IDTIPOSUSPEMPTMO, TSE.TSEDESCRICAO FROM TIPOSUSPEMPTMO TSE ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Popula objeto resultante
            List<TipoSuspensao> listaTipos = new List<TipoSuspensao>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    TipoSuspensao tipo = new TipoSuspensao()
                    {
                        id = leitor.GetInt32(IDTIPOSUSPEMPTMO_LISTA),
                        descricao = leitor.GetString(TSEDESCRICAO_LISTA)
                    };
                    listaTipos.Add(tipo);
                }
            }

            return listaTipos;
        }

        /// <summary>
        /// Consulta os tipos de suspensão.
        /// </summary>
        /// <param name="idTipoContrato">Identificação do contrato a ser filtrado.</param>
        /// <param name="idTipoSuspensao">Identificação do tipo de suspensão a ser filtrado.</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        public List<TipoSuspensao> consultar(int idTipoContrato, int? idTipoSuspensao)
        {
            bool filtrarTipoSuspensao = idTipoSuspensao.HasValue && idTipoSuspensao.Value > 0;

            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT TCS.IDTIPOCONTREMPTMO, ");
            query.Append("       TSE.IDTIPOSUSPEMPTMO, ");
            query.Append("       TSE.IDREGRAVALIDSUSP ,");
            query.Append("       TSE.TSEDESCRICAO, ");
            query.Append("       TSE.TSEMESES, ");
            query.Append("       TSE.PERCENTUAL, ");
            query.Append("       TSE.FLGFERIAS, ");
            query.Append("       TSE.FLGCOBRJUDICIAL, ");
            query.Append("       NVL(TSE.FLGSUSAPENASCONC, 0) FLGSUSAPENASCONC ");
            query.Append("  FROM TIPOSUSPEMPTMO TSE, TIPOCONTRXSUSP TCS ");
            query.Append(" WHERE TSE.IDTIPOSUSPEMPTMO = TCS.IDTIPOSUSPEMPTMO ");
            query.Append("   AND TCS.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ");

            if (filtrarTipoSuspensao)
                query.Append("   AND TCS.IDTIPOSUSPEMPTMO = :IDTIPOSUSPENSP_P");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);

             if (filtrarTipoSuspensao)
                 bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSP_P", DbType.Int32, idTipoSuspensao);

            // Popula objeto resultante
            List<TipoSuspensao> listaTipos = new List<TipoSuspensao>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    TipoSuspensao tipo = new TipoSuspensao()
                    {
                        id = leitor.GetInt32(1),
                        descricao = leitor.GetString(3),
                        regraSuspensao = new Regra()
                        {
                            id = leitor.GetInt32(2)
                        },
                        numeroMeses = leitor.GetInt32(4),
                        percentual = leitor.obterValorDouble(5),
                        ferias =  leitor.GetInt32(6) > 0,
                        cobrancaJudicial = leitor.GetInt32(7) > 0,
                        apenasConcessao = leitor.GetInt32(8) > 0
                    };
                    listaTipos.Add(tipo);
                }
            }

            return listaTipos;
        }

        #endregion
    }
}
