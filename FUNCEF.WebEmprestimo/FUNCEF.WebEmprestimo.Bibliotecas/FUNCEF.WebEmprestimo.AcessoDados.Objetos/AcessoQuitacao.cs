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
    public class AcessoQuitacao : ObjetoAcessoDados, IAcessoQuitacao
    {
        #region Constantes

        #region Consultar parcela atrasada em aberto

        private const int QTDE_QUITACAO_LANCADA = 0;

        #endregion

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
        /// Verifica se existe quitação lançada para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarQuitacaoLancada(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            bool existeQuitacaoLancada = false;

            // Consulta
            query.Append(" SELECT count(IDHISTMOVEMPTMO) QTDE ");
            query.Append("   FROM HISTMOVEMPTMO HME ");
            query.Append("  WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("    AND HME.HMETIPOMOV = 3 ");
            query.Append("    AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append("    AND (HME.HMEVLREFETIVO IS NULL) "); 
            query.Append("    AND HME.HMEDATAEFETIVA IS NULL ");  
            query.Append("    AND HME.HMECENTRALIZA = 1 ");       
            query.Append("    AND HME.FLGBAIXADO = 0 ");


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                    existeQuitacaoLancada = (leitor.GetInt32(QTDE_QUITACAO_LANCADA) != 0);
            }

            return existeQuitacaoLancada;
        }
        // SOL 201048
        /// <summary>
        /// Verifica se existe quitação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool existeQuitacao(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            bool existeQuitacaoLancada = false;

            // Consulta
            query.Append(" SELECT count(IDHISTMOVEMPTMO) QTDE ");
            query.Append("   FROM HISTMOVEMPTMO HME ");
            query.Append("  WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ");
            query.Append("    AND HME.HMETIPOMOV = 3 ");
            query.Append("    AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append("    AND (HME.HMEVLREFETIVO IS NULL OR HME.HMEVLREFETIVO = HME.HMEVLRPREVISTO) ");


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                    existeQuitacaoLancada = (leitor.GetInt32(QTDE_QUITACAO_LANCADA) != 0);
            }

            return existeQuitacaoLancada;
        }
        // SOL 201048

        // SOL 201048
        /// <summary>
        /// Verifica menor data vencimento.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public DateTime dataMinVencto(long numeroContrato)
        {
            StringBuilder query = new StringBuilder();

            DateTime dataMinVencto = DateTime.Today;

            // Consulta
            query.Append(" SELECT MIN(HME.HMEDATAVENCTO) AS HMEDATAVENCTO FROM  HISTMOVEMPTMO HME  ");
            query.Append(" WHERE HME.IDCONTRATOEMPTMO  = :NUMEROCONTRATO_P   ");
            query.Append(" AND HME.HMETIPOMOV    NOT IN (0, 5, 8)  AND HME.FLGBAIXADO  = 0  ");
            query.Append(" AND HME.HMEDATAEFETIVA  IS NULL  AND HME.HMEVLREFETIVO   IS NULL  ");
            query.Append(" AND HME.HMEVLRPREVISTO  <> 0   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)  ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0   AND NVL(HME.FLGSUSPENSAO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGQUITADO, 0)   = 0   AND NVL(HME.FLGABONADO, 0)   = 0 ");
            query.Append(" AND (NULL IS NULL OR (NULL IS NOT NULL AND HME.HMEDATAVENCTO + 7 < NULL))  ");
            query.Append(" AND (NULL  IS NULL OR (NULL  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < NULL || NULL))) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    dataMinVencto = leitor.GetDateTime(0);
                }
                else
                {
                    dataMinVencto = DateTime.MinValue;
                }
            }

            return dataMinVencto;
        }
        // SOL 201048

        #endregion

        //BRUNO AZEVEDO
        /// <summary>
        /// PROCEDIMENTO QUE CARREGA TODOS OS ITENS DO CONTRATO PASSADO
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public string carregaHistoricosQuitar(long numeroContrato)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            StringBuilder query = new StringBuilder();

            query.Append(" SELECT ");
            query.Append("    HME.IDHISTMOVEMPTMO ");
            query.Append(" FROM ");
            query.Append("    HISTMOVEMPTMO  HME, ");
            query.Append("    CONTRATOEMPTMO CON, ");
            query.Append("    ITEMEMPTMO     ITE ");
            query.Append(" WHERE ");
            query.Append("        HME.IDCONTRATOEMPTMO = :P_IDCONTRATO ");
            query.Append("   AND ITE.IDITEMEMPTMO       > 0 ");
            query.Append("   AND HME.HMETIPOMOV         NOT IN (5, 8, 3) ");
            query.Append("   AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append("   AND NVL(HME.FLGQUITADO, 0)   = 0 ");
            query.Append("   AND NVL(HME.FLGABONADO, 0)   = 0 ");
            query.Append("   AND NVL(HME.FLGBAIXADO, 1)   = 0 ");
            query.Append("   AND HME.HMEDATAEFETIVA IS NULL  ");
            query.Append("   AND HME.HMECENTRALIZA + HME.HMEDESTACADO = 1 ");
            query.Append("   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO ");
            query.Append("   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO ");
            query.Append(" ORDER BY ");
            query.Append("    HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "P_IDCONTRATO", DbType.Int64, numeroContrato);
            bancoDeDados.ExecuteNonQuery(comando);

            string sRetorno = "";
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    sRetorno = sRetorno + leitor.GetDouble(0).ToString() + ',';
                }

                if (sRetorno != string.Empty)
                {
                    sRetorno = sRetorno.Substring(0, sRetorno.Length - 1);
                }
            }

            return sRetorno;
        }
        //BRUNO AZEVEDO

        /// <summary>
        /// Quitar itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="usuarioLogado">Usuário logado.</param>
        /// <param name="usuarioLogado">Lista de históricos que deverão ser quitados.</param>  
        public void quitarItensEmAberto(long numeroContrato, DateTime dataQuitacao, string usuarioLogado, List<string> historicosQuitar) // Thiago Melo SOL 218914 Kintana 2050631
        {                        
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            foreach (string hist in historicosQuitar) 
            {
                query.Remove(0, query.Length); // Thiago Melo SOL 218914 Kintana 2050631
                

                //BRUNO AZEVEDO - A QUITAÇÃO IRÁ OCORRER APENAS DOS ID PASSADOS NO PARÂMETRO "historicosQuitar"
                query.Append(" UPDATE HISTMOVEMPTMO HME SET HME.FLGQUITADO = 1, ");
                query.Append(" HME.HMEDATAQUITABONO = :DATAQUITACAO_P ");
                // Thiago Melo SOL 218914 Kintana 2050631
                //query.Append(" WHERE HME.IDHISTMOVEMPTMO IN (" + historicosQuitar + ")");
                query.Append(" WHERE HME.IDHISTMOVEMPTMO = " + hist); 
                // Thiago Melo SOL 218914 Kintana 2050631
                //BRUNO AZEVEDO - A QUITAÇÃO IRÁ OCORRER APENAS DOS ID PASSADOS NO PARÂMETRO "historicosQuitar"

                DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());
//                comando.Parameters.Clear();
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);
                bancoDeDados.ExecuteNonQuery(comando);
            }            
        }

        /// <summary>
        /// Estorna itens a vencer.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="usuarioLogado">Usuário logado.</param>
        public void estornarItensAVencer(long numeroContrato, DateTime dataQuitacao, string usuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE HISTMOVEMPTMO HME SET HME.FLGESTORNADO = 1,");
            query.Append("                               HME.HMEDATAESTORNO = HME.HMEDATAATUALIZA,");
            query.Append("                               HME.HMEDATAESTORNOALT = SYSDATE,");
            query.Append("                               HME.IDUSUARIOESTORNO = :IDUSUARIOLOGADO_P");
            query.Append("        WHERE HME.IDHISTMOVEMPTMO IN (");
            query.Append("  SELECT HME.IDHISTMOVEMPTMO");
            query.Append("  FROM");
            query.Append("    HISTMOVEMPTMO  HME, TIPOSUSPEMPTMO TSE");
            query.Append("  WHERE  HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P");
            query.Append("    AND HME.HMEDATAPREVISTA  > :DATAQUITACAO_P");
            //query.Append("    AND ( HME.HMECENTRALIZA  = 1 OR HME.HMEDESTACADO = 1 )"); SOL 200707 - KTN 1939237 - NILTON
            query.Append("    AND  HME.HMETIPOMOV     IN  (1, 2, 3, 4, 7)");
            query.Append("    AND HME.FLGBAIXADO      = 0");
            query.Append("    AND HME.FLGENVIO        = 0");
            query.Append("    AND HME.HMEVLREFETIVO   IS NULL");
            query.Append("    AND HME.HMEDATAEFETIVA  IS NULL");
            query.Append("    AND NVL(HME.FLGQUITADO, 0)   = 0");
            query.Append("    AND NVL(HME.FLGABONADO, 0)   = 0");
            query.Append("    AND NVL(HME.FLGESTORNADO, 0) = 0");
            query.Append("    AND ( NVL(HME.FLGSUSPENSAO, 0)  = 0 OR(NVL(HME.FLGSUSPENSAO, 0) <> 0 AND");
            query.Append("    NVL(TSE.FLGEMABERTO, 0) = 1) )");
            query.Append("    AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)");
            //INICIO - SOL 200707 - KTN 1939237 - NILTON
            query.Append("    AND EXISTS (SELECT 1 FROM HISTMOVEMPTMO H");
            query.Append("                  WHERE H.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO");
            query.Append("                  AND   H.HMETIPOMOV = HME.HMETIPOMOV");
            query.Append("                  AND   H.IDITEMEMPTMO = HME.IDITEMCENTRALIZA");
            query.Append("                  AND   H.HMEDATAPREVISTA = HME.HMEDATAPREVISTA");
            query.Append("                  AND   H.FLGBAIXADO = 0");
            query.Append("                  AND   H.FLGENVIO = 0");
            query.Append("                  AND   H.HMEVLREFETIVO IS NULL");
            query.Append("                  AND   H.HMEDATAEFETIVA IS NULL");
            query.Append("                  AND   NVL(H.FLGABONADO,0) = 0");
            query.Append("                  AND   NVL(H.FLGQUITADO,0) = 0");
            query.Append("                  AND   NVL(H.FLGESTORNADO,0) = 0");
            query.Append("                  AND   (NVL(H.FLGSUSPENSAO,0) = 0 OR 1 = (SELECT TS.FLGEMABERTO FROM TIPOSUSPEMPTMO TS");
            query.Append("                                                           WHERE TS.IDTIPOSUSPEMPTMO = H.IDTIPOSUSPEMPTMO)))");
            //FINAL - SOL 200707 - KTN 1939237 - NILTON
            query.Append("  )");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        /// <summary>
        /// Estorna Itens a Vencer Atualização diária.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="usuarioLogado">Usuário logado.</param>
        public void estornarItensAtualizacao(long numeroContrato, DateTime dataQuitacao, string usuarioLogado)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            StringBuilder query = new StringBuilder();

            query.Append(" UPDATE HISTMOVEMPTMO HME SET HME.FLGESTORNADO = 1,");
            query.Append("                               HME.HMEDATAESTORNO = HME.HMEDATAATUALIZA,");
            query.Append("                               HME.HMEDATAESTORNOALT = SYSDATE,");
            query.Append("                               HME.IDUSUARIOESTORNO = :IDUSUARIOLOGADO_P");
            query.Append("        WHERE HME.IDHISTMOVEMPTMO IN (");
            query.Append("  SELECT HME.IDHISTMOVEMPTMO");
            query.Append("  FROM");
            query.Append("    HISTMOVEMPTMO  HME");
            query.Append("  WHERE  HME.IDCONTRATOEMPTMO  = :NUMEROCONTRATO_P");
            query.Append("    AND HME.HMEDATAPREVISTA > :DATAQUITACAO_P");
            query.Append("    AND HME.HMETIPOMOV = 5");
            query.Append("  )");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

            bancoDeDados.ExecuteNonQuery(comando);
        }

        #region Metodos Auxiliares

        private long obterIdPlanus(string loginUsuario)
        {
            StringBuilder query = new StringBuilder();

            query.Append("SELECT IDUSUARIO FROM USUARIOSISTEMA WHERE TRIM(UPPER(NOMEUSUARIO)) = :NOMEUSUARIO_P");

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "NOMEUSUARIO_P", DbType.String, loginUsuario.ToUpper());

            long idPlanus = 0;

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    idPlanus = leitor.GetInt64(0);
                }
            }

            return idPlanus;
        }

        #endregion
    }
}
