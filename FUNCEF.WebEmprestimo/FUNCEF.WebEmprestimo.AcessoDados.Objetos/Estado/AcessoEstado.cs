using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using Oracle.ManagedDataAccess.Client;
using FUNCEF.Planus.Componentes.AcessoDados;
using Oracle.ManagedDataAccess.Types;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos.Estado
{
    /// <summary>
    /// Objeto de acesso a dados de estado do sistema.
    /// </summary>
    public class AcessoEstado : ObjetoAcessoDados, IAcessoEstado
    {
        #region IAcessoEstadoSistema Members

        /// <summary>
        /// Adiciona uma nova entrada de estado do sistema.
        /// </summary>
        /// <param name="chave">Chave da entrada.</param>
        /// <param name="dados">Dados associados.</param>
        public void adicionarEntrada(EntradaEstado entrada)
        {
            string query = null, query2 = null;

            #region Query

            query = $@"
                MERGE INTO CM.TB_EMP_ESTADO_SISTEMA ES 
                USING (SELECT '{entrada.chave.ToUpper()}' AS CD_CHAVE FROM DUAL) T
                ON (ES.CD_ESTADO_SISTEMA = T.CD_CHAVE)
                WHEN MATCHED THEN
                    UPDATE SET ES.DT_ESTADO_SISTEMA = :DT_ESTADO_SISTEMA
                WHEN NOT MATCHED THEN
                    INSERT (CD_ESTADO_SISTEMA, DT_ESTADO_SISTEMA, DS_ESTADO_SISTEMA) 
                    VALUES (T.CD_CHAVE, :DT_ESTADO_SISTEMA, EMPTY_BLOB())";

            if(entrada.dados == null)
            {
                query2 = $@"UPDATE CM.TB_EMP_ESTADO_SISTEMA SET DS_ESTADO_SISTEMA = NULL WHERE UPPER(CD_ESTADO_SISTEMA) = '{entrada.chave.ToUpper()}'";
            }else
            {
                query2 = $@"UPDATE CM.TB_EMP_ESTADO_SISTEMA SET DS_ESTADO_SISTEMA = :DS_ESTADO_SISTEMA WHERE UPPER(CD_ESTADO_SISTEMA) = '{entrada.chave.ToUpper()}'";
            }

            #endregion

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbConnection conexao = bancoDeDados.CreateConnection())
            {
                conexao.Open();

                using (DbTransaction transacao = conexao.BeginTransaction())
                {
                    try
                    {
                        
                        
                        using (OracleCommand comando = new OracleCommand(query, conexao as OracleConnection))
                        {
                            comando.Transaction = transacao as OracleTransaction;
                            comando.Parameters.Add("DT_ESTADO_SISTEMA", OracleDbType.Date).Value = entrada.dataEntrada;
                            comando.ExecuteNonQuery();
                        }

                        using (OracleCommand comando2 = new OracleCommand(query2, conexao as OracleConnection))
                        {
                            comando2.Transaction = transacao as OracleTransaction;
                            if (entrada.dados != null)
                            {
                                OracleParameter paramBlob = new OracleParameter("DS_ESTADO_SISTEMA", OracleDbType.Blob);
                                paramBlob.Value = entrada.dados;
                                comando2.Parameters.Add(paramBlob);
                            }
                            comando2.ExecuteNonQuery();
                        }

                        transacao.Commit();
                    }
                    catch (Exception ex)
                    {
                        transacao.Rollback();
                        throw;
                    }
                }
            }
        }

        /// <summary>
        /// Recupera uma entrada de estado do sistema.
        /// </summary>
        /// <param name="chave">Chave da entrada que deve ser recuperado.</param>
        /// <returns>Array de <see cref="System.Byte"/> com os dados que devem ser mantidos.</returns>
        public EntradaEstado recuperarEntrada(string chave)
        {
            string query = null;
            EntradaEstado retorno = null;
            const int posicaoChave = 0;
            const int posicaoDados = 1;
            const int posicaoData = 2;

            #region Query

            query = "SELECT CD_ESTADO_SISTEMA, DS_ESTADO_SISTEMA, DT_ESTADO_SISTEMA FROM CM.TB_EMP_ESTADO_SISTEMA WHERE UPPER(CD_ESTADO_SISTEMA) = :CD_ESTADO_SISTEMA";

            #endregion

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbConnection conexao = bancoDeDados.CreateConnection())
            {
                conexao.Open();

                using (OracleCommand comando = new OracleCommand(query, conexao as OracleConnection))
                {
                    comando.Parameters.Add("CD_ESTADO_SISTEMA", OracleDbType.Varchar2).Value = chave.ToUpper();

                    using (OracleDataReader leitor = comando.ExecuteReader())
                    {
                        if (leitor.Read())
                        {
                            retorno = new EntradaEstado
                            {
                                chave = leitor.obterString(posicaoChave),
                                dataEntrada = leitor.GetDateTime(posicaoData)
                            };

                            if (!leitor.IsDBNull(posicaoDados))
                            {
                                OracleBlob blob = leitor.GetOracleBlob(posicaoDados);
                                if (blob != null && !blob.IsNull)
                                {
                                    retorno.dados = new byte[blob.Length];
                                    blob.Read(retorno.dados, 0, (int)blob.Length);
                                }
                                else
                                {
                                    retorno.dados = null;
                                }
                            }
                            return retorno;
                        }
                    }
                }
            }
            return null;
        }

        #endregion
    }
}
