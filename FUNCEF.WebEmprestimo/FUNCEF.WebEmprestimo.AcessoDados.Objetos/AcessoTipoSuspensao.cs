using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
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
            //StringBuilder query = new StringBuilder();
            string query;

            // Consulta
            //query.Append(" SELECT TSE.IDTIPOSUSPEMPTMO, TSE.TSEDESCRICAO FROM TIPOSUSPEMPTMO TSE ");
            query = @"SELECT TSE.IDTIPOSUSPEMPTMO, TSE.TSEDESCRICAO  FROM CM.TIPOSUSPEMPTMO TSE";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            //DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());           
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objeto resultante
                List<TipoSuspensao> listaTipos = new List<TipoSuspensao>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        TipoSuspensao tipo = new TipoSuspensao()
                        {
                            id = Convert.ToInt32(leitor.GetValue(IDTIPOSUSPEMPTMO_LISTA)),
                            descricao = leitor.obterString(TSEDESCRICAO_LISTA)
                        };
                        listaTipos.Add(tipo);
                    }
                }

                return listaTipos;
            }
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

            //StringBuilder query = new StringBuilder();
            string query;

            // Consulta
            query = @" SELECT TCS.IDTIPOCONTREMPTMO, 
                   TSE.IDTIPOSUSPEMPTMO, 
                   NVL(TSE.IDREGRAVALIDSUSP, 0),
                   TSE.TSEDESCRICAO,
                   NVL(TSE.TSEMESES, 0),
                   NVL(TSE.PERCENTUAL, 0),
                   TSE.FLGFERIAS, 
                   TSE.FLGCOBRJUDICIAL, 
                   NVL(TSE.FLGSUSAPENASCONC, 0) FLGSUSAPENASCONC,
                   TSE.FLGATUALSALDOPARC,
                   TSE.FLGSUSPENSAOITEM 
              FROM CM.TIPOSUSPEMPTMO TSE, CM.TIPOCONTRXSUSP TCS 
             WHERE TSE.IDTIPOSUSPEMPTMO = TCS.IDTIPOSUSPEMPTMO 
               AND TCS.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ";

            if (filtrarTipoSuspensao)
                query = query + @"AND TCS.IDTIPOSUSPEMPTMO = :IDTIPOSUSPENSP_P";

            // Cria comando de consulta 
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
                            id = Convert.ToInt32(leitor.GetValue(1)),
                            descricao = leitor.obterString(3),
                            regraSuspensao = new Regra()
                            {
                                id = Convert.ToInt32(leitor.GetValue(2))
                            },
                            numeroMeses = Convert.ToInt32(leitor.GetValue(4)),
                            percentual = leitor.obterValorDecimal(5) != null ? (double?)leitor.obterValorDecimal(5) : null,
                            ferias = Convert.ToInt32(leitor.GetValue(6)) > 0,
                            cobrancaJudicial = Convert.ToInt32(leitor.GetValue(7)) > 0,
                            apenasConcessao = Convert.ToInt32(leitor.GetValue(8)) > 0,
                            atualizaSaldoDevedor = Convert.ToInt32(leitor.GetValue(9)),//William Moreira da Silva - SOL 207977
                            flgSuspensaoItem = Convert.ToInt32(leitor.GetValue(10))//William Moreira da Silva - SOL 207977
                        };
                        listaTipos.Add(tipo);
                    }
                }

                return listaTipos;
            }
        }

        #endregion
    }
}
