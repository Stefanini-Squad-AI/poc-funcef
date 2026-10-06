using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.Componentes.AcessoDados;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using FUNCEF.Planus.Componentes;

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
            string query;

            bool existeAmortizacaoAnterior = false;

            // Consulta
            query = @" SELECT DISTINCT HMEDATAPREVISTA 
              FROM HISTMOVEMPTMO HME 
             WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
               AND HME.HMETIPOMOV = 2 
               AND TRUNC(HME.HMEDATAPREVISTA) < TRUNC(:DATAAMORTIZACAO_P) 
               AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1) 
               AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) 
               AND HME.FLGBAIXADO = 0 
               AND HME.HMEVLREFETIVO IS NULL ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
        }

        /// <summary>
        /// Verifica se existe quitação lançada para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarQuitacaoLancada(long numeroContrato)
        {
            string query;

            bool existeQuitacaoLancada = false;

            // Consulta
            query = @" SELECT count(IDHISTMOVEMPTMO) QTDE 
               FROM HISTMOVEMPTMO HME 
              WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
                AND HME.HMETIPOMOV = 3 
                AND NVL(HME.FLGESTORNADO, 0) = 0 
                AND (HME.HMEVLREFETIVO IS NULL)  
                AND HME.HMEDATAEFETIVA IS NULL   
                AND HME.HMECENTRALIZA = 1        
                AND HME.FLGBAIXADO = 0 ";


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                        existeQuitacaoLancada = (Convert.ToInt32(leitor.GetValue(QTDE_QUITACAO_LANCADA)) != 0);
                }

                return existeQuitacaoLancada;
            }
        }
        // SOL 201048
        /// <summary>
        /// Verifica se existe quitação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool existeQuitacao(long numeroContrato)
        {
            string query;

            bool existeQuitacaoLancada = false;

            // Consulta
            query = @" SELECT count(IDHISTMOVEMPTMO) QTDE 
               FROM HISTMOVEMPTMO HME 
              WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
                AND HME.HMETIPOMOV = 3 
                AND NVL(HME.FLGESTORNADO, 0) = 0 
                AND (HME.HMEVLREFETIVO IS NULL OR HME.HMEVLREFETIVO = HME.HMEVLRPREVISTO) ";


            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                        existeQuitacaoLancada = (Convert.ToInt32(leitor.GetValue(QTDE_QUITACAO_LANCADA)) != 0);
                }

                return existeQuitacaoLancada;
            }
        }
        // SOL 201048

        // SOL 201048
        /// <summary>
        /// Verifica menor data vencimento.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public DateTime dataMinVencto(long numeroContrato)
        {
            string query;

            DateTime dataMinVencto = DateTime.Today;

            // Consulta
            query = @" SELECT MIN(HME.HMEDATAVENCTO) AS HMEDATAVENCTO FROM  HISTMOVEMPTMO HME  
             WHERE HME.IDCONTRATOEMPTMO  = :NUMEROCONTRATO_P   
             AND HME.HMETIPOMOV    NOT IN (0, 5, 8)  AND HME.FLGBAIXADO  = 0  
             AND HME.HMEDATAEFETIVA  IS NULL  AND HME.HMEVLREFETIVO   IS NULL  
             AND HME.HMEVLRPREVISTO  <> 0   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)  
             AND NVL(HME.FLGESTORNADO, 0) = 0   AND NVL(HME.FLGSUSPENSAO, 0) = 0 
             AND NVL(HME.FLGQUITADO, 0)   = 0   AND NVL(HME.FLGABONADO, 0)   = 0 
             AND (NULL IS NULL OR (NULL IS NOT NULL AND HME.HMEDATAVENCTO + 7 < NULL))  
             AND (NULL  IS NULL OR (NULL  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < NULL || NULL))) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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

            string query;

            query = @" SELECT
                HME.IDHISTMOVEMPTMO 
             FROM 
                HISTMOVEMPTMO  HME, 
                CONTRATOEMPTMO CON, 
                CM.ITEMEMPTMO     ITE 
             WHERE 
                    HME.IDCONTRATOEMPTMO = :P_IDCONTRATO 
               AND ITE.IDITEMEMPTMO       > 0 
               AND HME.HMETIPOMOV         NOT IN (5, 8, 3) 
               AND NVL(HME.FLGESTORNADO, 0) = 0 
               AND NVL(HME.FLGQUITADO, 0)   = 0 
               AND NVL(HME.FLGABONADO, 0)   = 0 
               AND NVL(HME.FLGBAIXADO, 1)   = 0 
               AND HME.HMEDATAEFETIVA IS NULL  
               AND HME.HMECENTRALIZA + HME.HMEDESTACADO = 1 
               AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO 
               AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO 
             ORDER BY 
                HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "P_IDCONTRATO", DbType.Int64, numeroContrato);
                bancoDeDados.ExecuteNonQuery(comando);

                string sRetorno = "";
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        sRetorno = sRetorno + leitor.obterDecimal(0).ToString() + ',';
                    }

                    if (sRetorno != string.Empty)
                    {
                        sRetorno = sRetorno.Substring(0, sRetorno.Length - 1);
                    }
                }

                return sRetorno;
            }
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

                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
                {
                    //                comando.Parameters.Clear();
                    bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);
                    bancoDeDados.ExecuteNonQuery(comando);
                }
            }
        }

        public bool quitarItensEmAberto_Procedure(long numeroContrato, DateTime dataQuitacao, int operacao, int? idCalculo, out string msgErro)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PCK_EMPRESTIMO.PR_MARCA_ITENS_QUITADO"))
            {
                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "pIdOperacao", DbType.Int32, operacao); // alteração solicitada conforme e-mail 
                bancoDeDados.AddInParameter(comando, "pDataQuitacao", DbType.Date, dataQuitacao);
                bancoDeDados.AddInParameter(comando, "pIdCalculo", DbType.Int32, idCalculo);

                bancoDeDados.AddOutParameter(comando, "pSucesso", DbType.String, 5);
                bancoDeDados.AddOutParameter(comando, "pMsgErro", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                bool sucesso = Convert.ToBoolean(bancoDeDados.GetParameterValue(comando, "pSucesso").ToString());
                msgErro = Convert.ToString(bancoDeDados.GetParameterValue(comando, "pMsgErro"));

                return sucesso;
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

            string query;
            query = @" UPDATE CM.hmeprestacao hp
                        SET   hp.flgquitabonoestorno = 3,
                              hp.dataquitabonoestorno = hp.dataprevista,
                              hp.dataestornoalt = SYSDATE,
                              hp.idusuarioestorno = :IDUSUARIOLOGADO_P
                        WHERE hp.idcontratoemptmo = :NUMEROCONTRATO_P
                        AND   hp.dataprevista > :DATAQUITACAO_P
                        AND   hp.flgbaixado = 0
                        AND   hp.flgenvio = 0
                        AND   hp.vlrefetivo IS NULL
                        AND   hp.dataefetiva IS NULL
                        AND   hp.flgquitabonoestorno = 0
                        AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                   FROM CM.tiposuspemptmo ts
                                                                   WHERE ts.idtiposuspemptmo = hp.idtiposuspemptmo))
                        AND   EXISTS (SELECT 1 FROM CM.hmeprestacao hme
                                      WHERE hme.idcontratoemptmo = hp.idcontratoemptmo
                                      AND   hme.parcela = hp.parcela
                                      AND   hme.dataprevista = hp.dataprevista
                                      AND   hme.flgquitabonoestorno = 0
                                      AND   hme.vlrefetivo IS NULL
                                      AND   hme.dataefetiva IS NULL
                                      AND   hme.flgbaixado = 0
                                      AND   hme.flgenvio = 0
                                      AND   hme.iditememptmo = (SELECT ixt.iditememptmo
                                                                FROM CM.itemxtipocontr ixt
                                                                     JOIN CM.tipocontremptmo tc ON tc.idtipocontremptmo = ixt.idtipocontremptmo
                                                                     JOIN CONTRATOEMPTMO c ON c.idtipocontremptmo = tc.idtipocontremptmo
                                                                WHERE ixt.itcevento = 1
                                                                AND   ixt.idtipocontremptmo = tc.idtipocontremptmo
                                                                AND   ixt.flgcentraliza = 1
                                                                AND   c.idcontratoemptmo = hme.idcontratoemptmo)
                                      AND   (hme.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                                  FROM CM.tiposuspemptmo ts
                                                          WHERE ts.idtiposuspemptmo = hme.idtiposuspemptmo))) ";

            DbCommand comando = bancoDeDados.obterComandoPorSql(query);

            bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

            bancoDeDados.ExecuteNonQuery(comando);

            query = @"  UPDATE CM.hmeamortizacao ha
                        SET   ha.flgquitabonoestorno = 3,
                              ha.dataquitabonoestorno = ha.dataprevista,
                              ha.dataestornoalt = SYSDATE,
                              ha.idusuarioestorno = :IDUSUARIOLOGADO_P
                        WHERE ha.idcontratoemptmo = :NUMEROCONTRATO_P
                        AND   ha.dataprevista > :DATAQUITACAO_P
                        AND   ha.flgbaixado = 0
                        AND   ha.flgenvio = 0
                        AND   ha.vlrefetivo IS NULL
                        AND   ha.dataefetiva IS NULL
                        AND   ha.flgquitabonoestorno = 0
                        AND   EXISTS (SELECT 1 FROM CM.hmeamortizacao hme
                                      WHERE hme.idcontratoemptmo = ha.idcontratoemptmo
                                      AND   hme.dataprevista = ha.dataprevista
                                      AND   hme.flgquitabonoestorno = 0
                                      AND   hme.vlrefetivo IS NULL
                                      AND   hme.dataefetiva IS NULL
                                      AND   hme.flgbaixado = 0
                                      AND   hme.flgenvio = 0
                                      AND   hme.iditememptmo = (SELECT ixt.iditememptmo
                                                                FROM CM.itemxtipocontr ixt
                                                                     JOIN CM.tipocontremptmo tc ON tc.idtipocontremptmo = ixt.idtipocontremptmo
                                                                     JOIN CONTRATOEMPTMO c ON c.idtipocontremptmo = tc.idtipocontremptmo
                                                                WHERE ixt.itcevento = 2
                                                                AND   ixt.idtipocontremptmo = tc.idtipocontremptmo
                                                                AND   ixt.flgcentraliza = 1
                                        AND   c.idcontratoemptmo = hme.idcontratoemptmo)) ";

            comando = bancoDeDados.obterComandoPorSql(query);

            bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

            bancoDeDados.ExecuteNonQuery(comando);

            query = @" UPDATE CM.hmeencargos he
                        SET   he.flgquitabonoestorno = 3,
                              he.dataquitabonoestorno = he.dataprevista,
                              he.dataestornoalt = SYSDATE,
                              he.idusuarioestorno = :IDUSUARIOLOGADO_P
                        WHERE he.idcontratoemptmo = :NUMEROCONTRATO_P
                        AND   he.dataprevista > :DATAQUITACAO_P
                        AND   he.flgbaixado = 0
                        AND   he.flgenvio = 0
                        AND   he.vlrefetivo IS NULL
                        AND   he.dataefetiva IS NULL
                        AND   he.flgquitabonoestorno = 0 ";

            comando = bancoDeDados.obterComandoPorSql(query);

            bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

            bancoDeDados.ExecuteNonQuery(comando);

            query = @" UPDATE CM.hmeajustecobranca hac
                        SET   hac.flgquitabonoestorno = 3,
                              hac.dataquitabonoestorno = hac.dataprevista,
                              hac.dataestornoalt = SYSDATE,
                              hac.idusuarioestorno = :IDUSUARIOLOGADO_P
                        WHERE hac.idcontratoemptmo = :NUMEROCONTRATO_P
                        AND   hac.dataprevista > :DATAQUITACAO_P
                        AND   hac.flgbaixado = 0
                        AND   hac.flgenvio = 0
                        AND   hac.vlrefetivo IS NULL
                        AND   hac.dataefetiva IS NULL
                        AND   hac.flgquitabonoestorno = 0 ";

            comando = bancoDeDados.obterComandoPorSql(query);

            bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
            bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
            bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

            bancoDeDados.ExecuteNonQuery(comando);
            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

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

            string query;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO
            query = @"UPDATE CM.HMEATUDIARIA HME
                              SET HME.FLGESTORNADO      = 1,
                                  HME.DATAESTORNO    = HME.DATAPREVISTA,
                                  HME.DATAESTORNOALT = SYSDATE,
                                  HME.IDUSUARIOESTORNO  = :IDUSUARIOLOGADO_P
                            WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P
                                  AND HME.DATAPREVISTA > :DATAQUITACAO_P ";
            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDUSUARIOLOGADO_P", DbType.Int32, this.obterIdPlanus(usuarioLogado));
                bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, dataQuitacao);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        //Campanha Desconto
        public InformacoesQuitacao CalcularQuitacaoCampanhaDescontos(long numeroContrato, DateTime dataQuitacao, long idCalculo = 0, int tipoProposta = 0)
        {
            InformacoesQuitacao infoQuitacao = new InformacoesQuitacao();
            Double[] valorItens = new Double[7];
            Dictionary<string, double> itensQuitacao = new Dictionary<string, double>();
            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;

            Database bancoDeDados = this.obterBancoDeDados();

            try
            {
                //Busca quitação lançada aguardando baixa
                string query = $@"SELECT TO_CHAR(nvl(H.VLRITEMQUITACAO,0)),
                                       H.DTQUITACAO,
                                       H.ORIGEMQUITACAO,
                                       O.ORDEM,
                                       H.STATUS
                                FROM (SELECT ROWNUM-1 AS ORDEM FROM dual
                                      CONNECT BY LEVEL <= 8) O
                                LEFT JOIN (SELECT SUM(hq.vlrprevisto) AS VLRITEMQUITACAO,
                                                  hq.dataprevista AS DTQUITACAO,
                                                  hq.origem AS ORIGEMQUITACAO,
                                                  NVL((SELECT d.status FROM cm.documento d
                                                       WHERE d.coddocumento = hev.coddocumento),0) AS STATUS,
                                                  DECODE(hq.iditememptmo,17, 1,
                                                                         25, 6,
                                                                         35, 2,
                                                                         36, 3,
                                                                         37, 3,
                                                                         38, 3,
                                                                         39, 3,
                                                                         40, 3,
                                                                        113, 4,
                                                                        122, 3,
                                                                        124, 5, 
                                                                        139, 7, 
                                                                        140, 7,
                                                                        141, 7,
                                                                        142, 7,
                                                                        143, 7,
                                                                        144, 7,
                                                                        145, 7,
                                                                        0) AS ORDEM
                                           FROM  cm.hmequitacao hq
                                                 LEFT JOIN cm.hmeenvio hev ON hev.idhistmovemptmo = hq.idhistmovemptmo
                                           WHERE hq.idcontratoemptmo = {numeroContrato}
                                           AND   hq.vlrefetivo IS NULL
                                           AND   hq.dataefetiva IS NULL
                                           AND   hq.flgestornado = 0
                                           GROUP BY hq.dataprevista,
                                                    hq.origem,
                                                    hev.coddocumento,
                                                    DECODE(hq.iditememptmo, 17, 1,
                                                                            25, 6,
                                                                            35, 2,
                                                                            36, 3,
                                                                            37, 3,
                                                                            38, 3,
                                                                            39, 3,
                                                                            40, 3,
                                                                           113, 4,
                                                                           122, 3,
                                                                           124, 5, 
                                                                           139, 7, 
                                                                           140, 7,
                                                                           141, 7,
                                                                           142, 7,
                                                                           143, 7,
                                                                           144, 7,
                                                                           145, 7,
                                                                           0)) H ON h.ordem = o.ordem
                                WHERE EXISTS (SELECT 1 FROM cm.hmequitacao hst
                                              WHERE hst.idcontratoemptmo = {numeroContrato}
                                              AND   hst.iditememptmo = 17
                                              AND   hst.vlrefetivo IS NULL
                                              AND   hst.dataefetiva IS NULL
                                              AND   hst.flgestornado = 0)
                                ORDER BY ORDEM";



                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {

                    bancoDeDados.ExecuteNonQuery(comando);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            infoQuitacao.valorQuitacao = (double)leitor.obterDecimal(0);
                            infoQuitacao.dataQuitacao = leitor.obterValorData(1).Value;
                            infoQuitacao.origem = leitor.obterInt(2);
                            infoQuitacao.sitBoleto = leitor.obterInt(4);
                        }

                    }
                }


                if (infoQuitacao.valorQuitacao == 0)
                {
                    try
                    {
                        using (OracleConnection conn = new OracleConnection(conexaoOracle))
                        {
                            conn.Open();
                            using (OracleCommand cmd = new OracleCommand())
                            {
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.StoredProcedure;

                                cmd.CommandText = "CM.PCK_AA_EMPTMO_QUITACAO.pr_calcula_quitacao";

                                cmd.Parameters.Add("pIdContratoEmptmo", OracleDbType.Double).Value = numeroContrato;
                                cmd.Parameters.Add("pDataQuitacao", OracleDbType.Date).Value = dataQuitacao;
                                cmd.Parameters.Add("pIdCalculo", OracleDbType.Double).Value = idCalculo;
                                cmd.Parameters.Add("pTipoProposta", OracleDbType.Int32).Value = tipoProposta;

                                cmd.Parameters.Add("pValorQuitacao", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pQuitSaldoDev", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pQuitParcVencidas", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pFGQCVencidos", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pDevolFGQC", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pDevolSeguro", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pDescontoInad", OracleDbType.Double).Direction = ParameterDirection.Output;
                                cmd.Parameters.Add("pErro", OracleDbType.NVarchar2, UInt16.MaxValue).Direction = ParameterDirection.Output;

                                cmd.ExecuteNonQuery();

                                double valorQuitacao = Convert.ToDouble(cmd.Parameters["pValorQuitacao"].Value);
                                double valorSaldoDev = Convert.ToDouble(cmd.Parameters["pQuitSaldoDev"].Value);
                                double ParcelasVencidas = Convert.ToDouble(cmd.Parameters["pQuitParcVencidas"].Value);
                                double FgqcVencidos = Convert.ToDouble(cmd.Parameters["pFGQCVencidos"].Value);
                                double devolucaoFgqc = Convert.ToDouble(cmd.Parameters["pDevolFGQC"].Value);
                                double devolucaoSeguro = Convert.ToDouble(cmd.Parameters["pDevolSeguro"].Value);
                                double descInadimplencia = Convert.ToDouble(cmd.Parameters["pDescontoInad"].Value);

                                string mensagemErro = cmd.Parameters["pErro"].Value != null ? cmd.Parameters["pErro"].Value.ToString() : string.Empty;

                                infoQuitacao.origem = -1;
                                infoQuitacao.valorQuitacao = (double)valorQuitacao;


                                infoQuitacao.dataQuitacao = dataQuitacao;

                                for (int i = 0; i < 6; i++)
                                {
                                    valorItens[i] = (double)valorQuitacao;
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                }

                //Busca prestação já enviada que não será cobrada na quitação
                query = @"SELECT TO_CHAR(nvl(SUM(hp.vlrprevisto),0)) vlrprevisto
                            FROM cm.hmeprestacao hp
                            WHERE hp.idcontratoemptmo = :NUMEROCONTRATO_P
                            AND   hp.naturezaitem = 2
                            AND   hp.origem = 1
                            AND   hp.iditememptmo = 13
                            AND   hp.dataprevista > :dataQuitacao
                            AND   hp.flgenvio = 1
                            AND   hp.flgquitabonoestorno = 0
                            AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgenvia FROM cm.tiposuspemptmo ts
                                                                       WHERE ts.idtiposuspemptmo = hp.idtiposuspemptmo))";


                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {
                    bancoDeDados.AddInParameter(comando, "NUMEROCONTRATO_P", DbType.Int64, numeroContrato);
                    bancoDeDados.AddInParameter(comando, "dataQuitacao", DbType.DateTime, dataQuitacao);

                    bancoDeDados.ExecuteNonQuery(comando);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        while (leitor.Read())
                        {
                            infoQuitacao.devolPrestEnviada = (double)leitor.obterDecimal(0);

                        }

                    }
                }

                valorItens[0] += infoQuitacao.devolPrestEnviada;
                valorItens[6] = infoQuitacao.devolPrestEnviada;

                string dictKey;
                for (int i = 0; i < 7; i++)
                {
                    if (valorItens[i] > 0 || i == 0)
                    {
                        switch (i)
                        {
                            case 0:
                                dictKey = "Saldo devedor";
                                break;
                            case 1:
                                dictKey = "Parcelas vencidas";
                                break;
                            case 2:
                                dictKey = "FGQC vencidos";
                                break;
                            case 3:
                                dictKey = "Devolução de FGQC";
                                break;
                            case 4:
                                dictKey = "Devolução de Seguro";
                                break;
                            case 5:
                                dictKey = "Desconto";
                                break;
                            case 6:
                                dictKey = "Devolução prest. " + DateTime.Now.ToString(@"MMM/yyyy");
                                break;
                            default:
                                dictKey = "NaoDefinido";
                                break;
                        }
                        itensQuitacao.Add(dictKey, valorItens[i]);
                    }
                }
                infoQuitacao.itens = itensQuitacao;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return infoQuitacao;
        }


        #region Metodos Auxiliares

        private long obterIdPlanus(string loginUsuario)
        {
            string query;

            query = @" SELECT IDUSUARIO FROM CM.USUARIOSISTEMA WHERE TRIM(UPPER(NOMEUSUARIO)) = :NOMEUSUARIO_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "NOMEUSUARIO_P", DbType.String, loginUsuario.ToUpper());

                long idPlanus = 0;

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        idPlanus = leitor.obterValorInt64(0).Value;
                    }
                }

                return idPlanus;
            }
        }

        #endregion
    }
}
