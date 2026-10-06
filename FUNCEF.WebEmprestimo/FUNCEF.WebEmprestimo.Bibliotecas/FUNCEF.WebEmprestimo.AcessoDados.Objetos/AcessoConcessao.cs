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
    /// Objeto de acesso a dados de regra.
    /// </summary>
    public class AcessoConcessao : ObjetoAcessoDados, IAcessoConcessao
    {
        #region Constantes

        #region Calcular Primeira Parcela

        private const int DIACOBN = 0;
        private const int FLGUTILN = 1;

        #endregion

        #endregion

        #region Consultas

        /// <summary>
        /// Pesquisa o dia da cobrança.
        /// </summary>
        /// <param name="idPatrocinadora">Identificação da Patrocinadora para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Identificação do Plano Previdenciario para filtro.</param>
        /// <returns>Dia da Cobrança.</returns>
        public DateTime calcularPrimeiraParcela(int idPatrocinadora, int idPlanoPrevidenciario, DateTime dataCredito)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT DIACOBN AS DIA_COBRANCA_NORMAL,");
            query.Append("       FLGUTILN,");
            query.Append("       FLGDIAPOSANTN,");
            query.Append("       FLGMESCOBN,");
            query.Append("       DIACOBA,");
            query.Append("       FLGUTILA,");
            query.Append("       FLGDIAPOSANTA,");
            query.Append("       FLGMESCOBA,");
            query.Append("       DIACOBD,");
            query.Append("       FLGUTILD,");
            query.Append("       FLGDIAPOSANTD,");
            query.Append("       FLGMESCOBD,");
            query.Append("       DIACOBC,");
            query.Append("       FLGUTILC,");
            query.Append("       FLGDIAPOSANTC,");
            query.Append("       FLGMESCOBC,");
            query.Append("       DIASAPOSD,");
            query.Append("       DIASAPOSC");
            query.Append("  FROM DATASPATROEMPTMO");
            query.Append("  WHERE (IDPESSJUR = :ID_PATROCINADORA_P)");
            query.Append("  AND (IDPLANOPREV = :ID_PLANO_PREVIDENCIARIO_P)");
            query.Append("  AND (SITFUNDACAO = 'AS')");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "ID_PATROCINADORA_P", DbType.Int32, idPatrocinadora);
            bancoDeDados.AddInParameter(comando, "ID_PLANO_PREVIDENCIARIO_P", DbType.Int32, idPlanoPrevidenciario);

            // Popula objeto resultante
            int diaCobranca = 0;
            string flgUtilN = "";//NILTON

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    diaCobranca = leitor.GetInt32(DIACOBN);
                    flgUtilN = leitor.GetString(FLGUTILN);//NILTON
                }
            }

            // Cria a data completa da parcela com base no dia da cobrança e na data de crédito.
            DateTime dataPrimeiraParcela = new DateTime(dataCredito.Year, dataCredito.Month, diaCobranca);

            // Adiciona um mês.
            dataPrimeiraParcela = dataPrimeiraParcela.AddMonths(1);

            if (flgUtilN != "N")
            {
                // Verifica se for domingo adiciona um dia se sabado adiciona dois.
                if (dataPrimeiraParcela.DayOfWeek == DayOfWeek.Sunday)
                    dataPrimeiraParcela = dataPrimeiraParcela.AddDays(1);
                else if (dataPrimeiraParcela.DayOfWeek == DayOfWeek.Saturday)
                    dataPrimeiraParcela = dataPrimeiraParcela.AddDays(2);
            }

            return dataPrimeiraParcela;
        }

        /// <summary>
        /// Verifica se existe outras Concessões.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <param name="dataReferencia">Data de refêrencia para filtro.</param>
        /// <param name="idTipocontrato">Identificação do tipo do contrato para filtro.</param>
        /// <returns>Se existe Concessões associadas.</returns>
        public bool verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int? idTipoContrato)
        {
            bool filtrarTipoContrato = (idTipoContrato != null);

            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT COUNT(CNT.IDCONTRATOEMPTMO) AS QTDE ");
            query.Append("  FROM CONTRATOEMPTMO CNT, HISTMOVEMPTMO HME ");
            query.Append(" WHERE CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ");
            query.Append("   AND CNT.IDBENEF = :IDMUTUARIO_P ");
            query.Append("   AND NVL(FLGESTORNADO, 0) = 0 ");
            query.Append("   AND CNT.FLGSITUACAO NOT IN ('C', 'Q') ");
            query.Append("   AND HME.HMETIPOMOV = 0 ");
            query.Append("   AND HME.HMECENTRALIZA = 1 ");
            query.Append("   AND HME.HMEDATAPREVISTA >= :DATAREFERENCIA_P ");

            if (filtrarTipoContrato)
            {
                query.Append(" AND CNT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P "); 
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataReferencia);

            if (filtrarTipoContrato)
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, idTipoContrato);

            // Popula objeto resultante
            int quantidadeContrato = 0;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    quantidadeContrato = leitor.GetInt32(0);
                }
            }

            return (quantidadeContrato > 0);
        }

        /// <summary>
        /// Verficia se existe suspensão associada ao mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário a ser filtrada.</param>
        /// <param name="dataReferencia">Data de referência da suspensão a ser filtrada.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        /// 
        //MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567 - INICIO
        public Suspensao consultarSuspensao(int idMutuario, int idTipoContratoEmpto, DateTime dataReferencia)
        {
            string idContrato = "";
            DateTime supDataInicio = System.DateTime.Now;
            StringBuilder pQry = new StringBuilder();

            pQry.Append(@" SELECT DESCMODEMP, SUCDATAINICIO FROM SUSPCONCESSAO 
                           WHERE IDPESSOA = :IDPESSOA_P
                           ORDER BY SUCDATAINICIO");

            // Cria comando de consulta
            Database bancoDeDadosDescModEmp = this.obterBancoDeDados();
            DbCommand comandoDescModEmp = bancoDeDadosDescModEmp.GetSqlStringCommand(pQry.ToString());
            bancoDeDadosDescModEmp.AddInParameter(comandoDescModEmp, "IDPESSOA_P", DbType.Int32, idMutuario);

            // Popula objeto resultante
            using (IDataReader leitorSuspensao = bancoDeDadosDescModEmp.ExecuteReader(comandoDescModEmp))
            {
                if (leitorSuspensao.Read())
                {
                   idContrato = leitorSuspensao.GetString(0);
                   supDataInicio = leitorSuspensao.GetDateTime(1);
                }
            }

            StringBuilder query = new StringBuilder();            
            // Consulta  
            // Xavier SOL 171546
            query.Append(" select tmp.IDPESSOA, ");
            query.Append("        tmp.NOME, ");
            query.Append("        tmp.SUCDATAINICIO, ");
            query.Append("        tmp.SUCDATAFINAL, ");
            query.Append("        tmp.SUCMOTIVOSUSP, ");
            query.Append("        tmp.FLGSTATUS ");

            query.Append("        from (SELECT SUC.IDPESSOA, ");
            query.Append("                     min(SUC.SUCDATAINICIO) over() MENORDATA, ");
            query.Append("                     PES.NOME, ");
            query.Append("                     SUC.SUCDATAINICIO, ");
            query.Append("                     SUC.SUCDATAFINAL, ");
            query.Append("                     SUC.SUCMOTIVOSUSP, ");
            query.Append("                     SUC.FLGSTATUS ");
            query.Append("                FROM PESSOA PES, SUSPCONCESSAO SUC ");            
            query.Append("               WHERE SUC.IDPESSOA = :IDMUTUARIO_P ");
            query.Append("                 AND SUC.FLGSTATUS = 'A' ");
            query.Append("                 AND ((TO_DATE(:DATAREFERENCIA_P,'DD/MM/YYYY') BETWEEN SUC.SUCDATAINICIO AND SUC.SUCDATAFINAL) OR ((SUC.SUCDATAINICIO < TO_DATE(:DATAREFERENCIA_P,'DD/MM/YYYY')) ");
            query.Append("                 AND nvl(SUC.FLGPRAZOINDETERMINADO, 'N') = 'S')) ");
            query.Append("                 AND PES.IDPESSOA = SUC.IDPESSOA ");
            query.Append("                 AND (SUC.DESCMODEMP is null or SUC.DESCMODEMP = '') ");
            query.Append("               ORDER BY SUC.IDPESSOA, SUC.SUCDATAINICIO ");
            query.Append("             ) tmp ");
            query.Append(" where tmp.SUCDATAINICIO = tmp.MENORDATA ");
            // Xavier SOL 171546
            
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.Date, dataReferencia.Date);

            //William Moreira da Silva - SOL 217182 KTN 2046516 - INICIO
            //Verifica se o update abaixo precisara ser feito
            StringBuilder pQryValidacao = new StringBuilder();
            pQryValidacao.Append(" SELECT 1 FROM SUSPCONCESSAO ");
            pQryValidacao.Append(" WHERE TRUNC(SUSPCONCESSAO.SUCDATAFINAL) < TRUNC(TO_DATE(:PDATAREFERENCIA_P, 'DD/MM/YYYY'))  ");
            pQryValidacao.Append(" AND SUSPCONCESSAO.SUCDATAFINAL IS NOT NULL ");
            pQryValidacao.Append(" AND SUSPCONCESSAO.FLGSTATUS = 'A' ");
            pQryValidacao.Append(" AND SUSPCONCESSAO.SUCDATAINICIO  = :PDATAINI_P ");
            pQryValidacao.Append(" AND SUSPCONCESSAO.IDPESSOA  = :IDPESSOA_P ");

            //Criando o comando para a consulta
            Database bancoDadosValidacao = this.obterBancoDeDados();
            DbCommand comandoValidacao = bancoDadosValidacao.GetSqlStringCommand(pQryValidacao.ToString());

            //Populando os parâmetros
            bancoDadosValidacao.AddInParameter(comandoValidacao, "PDATAREFERENCIA_P", DbType.Date, dataReferencia);
            bancoDadosValidacao.AddInParameter(comandoValidacao, "PDATAINI_P", DbType.Date, supDataInicio);
            bancoDadosValidacao.AddInParameter(comandoValidacao, "IDPESSOA_P", DbType.Int32, idMutuario);

            // Popula objeto resultante
            Suspensao suspensao = null;
            IDataReader leitor = bancoDeDados.ExecuteReader(comando);
            using (IDataReader leitorValidacao = bancoDadosValidacao.ExecuteReader(comandoValidacao))
            {
                if (leitorValidacao.Read())
                {
                    StringBuilder pQryUpdate = new StringBuilder();
                    pQryUpdate.Append(" UPDATE SUSPCONCESSAO ");
                    pQryUpdate.Append(" SET SUSPCONCESSAO.FLGSTATUS = 'E' ");
                    pQryUpdate.Append(" WHERE TRUNC(SUSPCONCESSAO.SUCDATAFINAL) < TRUNC(TO_DATE(:PDATAREFERENCIA_P, 'DD/MM/YYYY'))");
                    pQryUpdate.Append(" AND SUSPCONCESSAO.SUCDATAFINAL IS NOT NULL");
                    pQryUpdate.Append(" AND SUSPCONCESSAO.FLGSTATUS = 'A' ");
                    pQryUpdate.Append(" AND SUSPCONCESSAO.SUCDATAINICIO  = :PDATAINI_P");
                    pQryUpdate.Append(" AND SUSPCONCESSAO.IDPESSOA  = :IDPESSOA_P ");

                    // Cria comando de Update
                    Database bancoDeDadosUpdate = this.obterBancoDeDados();
                    DbCommand comandoUpdate = bancoDeDadosUpdate.obterComandoPorSql(pQryUpdate.ToString());
                    bancoDeDadosUpdate.AddInParameter(comandoUpdate, "PDATAREFERENCIA_P", DbType.Date, dataReferencia);
                    bancoDeDadosUpdate.AddInParameter(comandoUpdate, "PDATAINI_P", DbType.Date, supDataInicio);
                    bancoDeDadosUpdate.AddInParameter(comandoUpdate, "IDPESSOA_P", DbType.Int32, idMutuario);
                    bancoDeDadosUpdate.ExecuteNonQuery(comandoUpdate);
                }
            }
            //William Moreira da Silva - SOL 217182 KTN 2046516 - FIM

            if (idContrato.Contains(idTipoContratoEmpto.ToString()) || leitor.Read())
            {
                StringBuilder qryConcessao = new StringBuilder();
                qryConcessao.Append("SELECT  SUC.IDPESSOA, PES.NOME, ");
                qryConcessao.Append(" SUC.SUCDATAINICIO, SUC.SUCDATAFINAL, ");
                qryConcessao.Append(" SUC.SUCMOTIVOSUSP, SUC.FLGSTATUS ");
                qryConcessao.Append(" FROM PESSOA PES, SUSPCONCESSAO SUC ");
                qryConcessao.Append(" WHERE SUC.IDPESSOA  = :IDPESSOA_P ");
                qryConcessao.Append("  AND SUC.SUCDATAINICIO >= :DATAINI_P ");
                qryConcessao.Append(" AND SUC.FLGSTATUS = 'A' ");
                qryConcessao.Append(" AND ((TO_DATE(:DATA_P,'DD/MM/YYYY') BETWEEN SUC.SUCDATAINICIO AND SUC.SUCDATAFINAL) ");
                qryConcessao.Append(" or  (SUC.SUCDATAINICIO < TO_DATE(:DATA_P2,'DD/MM/YYYY') and nvl(SUC.FLGPRAZOINDETERMINADO,'N') = 'S')) ");
                qryConcessao.Append(" AND PES.IDPESSOA = SUC.IDPESSOA ");
                qryConcessao.Append(" ORDER BY SUC.IDPESSOA, SUC.SUCDATAINICIO ");

                Database bancoDeDadosConcessao = this.obterBancoDeDados();
                DbCommand comandoConcessao = bancoDeDadosConcessao.GetSqlStringCommand(qryConcessao.ToString());

                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "IDPESSOA_P", DbType.Int32, idMutuario);
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "DATAINI_P", DbType.Date, supDataInicio);
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "DATA_P", DbType.Date, dataReferencia);
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "DATA_P2", DbType.Date, dataReferencia);
                
                IDataReader leitorConcessao = bancoDeDadosConcessao.ExecuteReader(comandoConcessao);

                if (leitorConcessao.Read())
                {
                    suspensao = new Suspensao()
                    {
                        dataInicio = leitorConcessao.GetDateTime(2),
                        dataFinal = leitorConcessao.obterValorData(3),
                        motivosSuspensao = leitorConcessao.GetString(4)
                    };
                }
            }

            return suspensao;
        }
        //MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567 - fIM



        // Thiago Melo SOL 202311 KINTANA 1956671 INI
        public bool primeiraRenovacao2006(int idPessoa, int idBenef, int idTipoContrato)
        {
            StringBuilder qry = new StringBuilder();

            qry.Append("SELECT ");
            qry.Append("   COUNT(IDCONTRATOEMPTMO) AS QUANT ");
            qry.Append("  FROM ");
            qry.Append("  CONTRATOEMPTMO CON ");
            qry.Append(" WHERE ");
            qry.Append("       CON.FLGSITUACAO      <> ('C') ");
            qry.Append("   AND CON.DATACREDITO       > TO_DATE('03/01/2006', 'DD/MM/YYYY') ");
            qry.Append("   AND CON.IDPESSOA          = :IDPESSOA_P ");
            qry.Append("   AND CON.IDBENEF           = :IDBENEF_P ");
            qry.Append("   AND CON.IDTIPOCONTREMPTMO = :IDTIPOCONTRATOEMPTMO_P ");
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand command = bancoDeDados.obterComandoPorSql(qry.ToString());

            bancoDeDados.AddInParameter(command, "IDPESSOA_P", DbType.Int32, idPessoa);
            bancoDeDados.AddInParameter(command, "IDBENEF_P", DbType.Int32, idBenef);
            bancoDeDados.AddInParameter(command, "IDTIPOCONTRATOEMPTMO_P", DbType.Int32, idTipoContrato);

            int qtd = 0;
            using (IDataReader reader = bancoDeDados.ExecuteReader(command))
            {
                if (reader.Read())
                {
                    qtd = reader.GetInt32(0);
                }
                else
                {
                    qtd = 0;
                }
            }
            if (qtd == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        public Contrato consultarFlgPrazoTpQuitacao(int idPlanoPrev)
        {
            StringBuilder qry = new StringBuilder();
            
            qry.Append("SELECT ");
            qry.Append("NVL(TCE.FLGVERPRAZOTIPOQUIT,0) AS FLGVERPRAZOTIPOQUIT, ");
            qry.Append("TCE.TCEMINRENOVA ");
            qry.Append("FROM ");
            qry.Append("   TIPOCONTREMPTMO TCE, ");
            qry.Append("   TIPOEMPTMO      TEP  ");
            qry.Append("WHERE ");
            qry.Append("       ( TCE.IDTIPOEMPTMO   = TEP.IDTIPOEMPTMO ) ");
            qry.Append("  AND ( (TCE.IDPLANOPREV IS NULL) OR (TCE.IDPLANOPREV =:IDPLANOPREV_P) ) ");
            qry.Append("  AND ( TCE.FLGSITUACAO    = 'A' ) ");
            qry.Append("  AND ( :IDMODULO_P <> 19 OR TCE.FLGUSOCENTRAL = 1 )");
            qry.Append("  AND ( :IDMODULO_P <> 15 OR TCE.FLGUSOEMPTMO  = 1 )");            

            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(qry.ToString());

            bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int32, idPlanoPrev);
            bancoDeDados.AddInParameter(comando, "IDMODULO_P", DbType.Int32, 15);

            Contrato contratos = null;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    contratos = new Contrato()
                    {
                        flgPrazoQuitacao = leitor.GetInt32(0),
                        tcemirenova = leitor.GetInt32(1)                       
                    };
                }
            }

            return contratos;                           
        }


        public List<Contrato> consultarContratosAnteriores(int idpessoa, int idMutuario, DateTime hmeData, int idTipoEmprestimo, int quitavel, int idTipoContrato, int flgExcepcional)
        {
            StringBuilder query = new StringBuilder();          

            query.Append("SELECT DISTINCT ");
            query.Append("   0 AS FLGESCOLHA, ");
            query.Append("   0 AS FLGOBRIGATORIO, ");
            query.Append("   CON.IDCONTRATOEMPTMO , CON.VLRCONTRATO, CON.DATACREDITO, CON.FLGFORMAREC, CON.DATAASSINATURA, ");
            query.Append("   CON.IDINSCRICAOEMPTMO, CON.NUMPARCELAS, CON.IDTIPOCONTREMPTMO, CON.VLRPARCELA,");
            query.Append("   CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUSP, CON.DATAFIMSUSP, CON.FLGSUSPENSAOAUTO, CON.DATALIBSUSP,");
            query.Append("   CON.MOECODIGO, MOE.MOESIGLA, CON.IDPATRO, CON.IDPESSOA, CON.IDPLANOPREV, CON.IDBENEF,");
            query.Append("   CON.DATAPRIMPARC, TCE.TCEDESCRICAO, TCE.IDTIPOEMPTMO, TCE.TCEMINRENOVA,");
            query.Append("   SLD.HMESALDODEV, CON.FLGSITUACAO, CON.TXJUROS, ");
            query.Append("   NVL(PAR.NUMPARCPAGAS, 0) AS NUMPARCPAGAS,");
            query.Append("   0 AS VLRATUAL,");
            query.Append("   0 AS VLRDEVSEG,");
            query.Append("   NVL(VAL.VLRTOTAL, 0) AS VLREMABERTO,");
            query.Append("   ATU.ULT_PARC,");
            query.Append("   CON.IDPLANOORIGEM, ");
            query.Append("   DECODE(VLP.HMEVLRPREVISTO,0,CON.VLRPARCELA,NVL(VLP.HMEVLRPREVISTO,CON.VLRPARCELA)) AS VLRULTPARCELA ");
            query.Append("FROM");
            query.Append("   CONTRATOEMPTMO  CON,");
            query.Append("   MOEDA           MOE,");
            query.Append("   TIPOCONTREMPTMO TCE,");
            query.Append("   (");
            query.Append("   SELECT");
            query.Append("      H.IDCONTRATOEMPTMO, MAX(H.HMEPARCELA) AS ULT_PARC");
            query.Append("   FROM");
            query.Append("      HISTMOVEMPTMO H,");
            query.Append("      CONTRATOEMPTMO C");
            query.Append("   WHERE");
            query.Append("          ( C.IDPESSOA         =:PIDPESSOA )");
            query.Append("      AND ( C.IDBENEF          =:PIDBENEF )");
            query.Append("      AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )");
            query.Append("   GROUP BY");
            query.Append("      H.IDCONTRATOEMPTMO");
            query.Append("   ) ATU,");
            query.Append("  (");
            query.Append("  SELECT");
            query.Append("    COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS,");
            query.Append("    C.IDCONTRATOEMPTMO");
            query.Append("  FROM");
            query.Append("    CONTRATOEMPTMO C,");
            query.Append("    (");
            query.Append("    SELECT");
            query.Append("      H.IDCONTRATOEMPTMO,");
            query.Append("      H.HMEPARCELA,");
            query.Append("         SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL");
            query.Append("    FROM");
            query.Append("      HISTMOVEMPTMO H,");
            query.Append("         CONTRATOEMPTMO C");
            query.Append("      WHERE");
            query.Append("             ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 )");
            query.Append("         AND ( C.IDPESSOA         =:PIDPESSOA2 )");
            query.Append("         AND ( C.IDBENEF          =:PIDBENEF2 )");
            query.Append("         AND ( C.FLGSITUACAO      NOT IN ('C', 'Q') )");
            query.Append("         AND ( H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO = 0 )");
            query.Append("         AND ( H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO = 0 )");
            query.Append("         AND ( H.FLGABONADO       IS NULL OR H.FLGABONADO = 0 )");
            query.Append("         AND ( H.HMETIPOMOV       = 1 )");
            query.Append("         AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )");
            query.Append("    GROUP BY");
            query.Append("      H.IDCONTRATOEMPTMO, H.HMEPARCELA");
            query.Append("    HAVING");
            query.Append("             ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) <= 0 )");
            query.Append("      AND ( HMEPARCELA <> 0 )");
            query.Append("    ) PAG");
            query.Append("   WHERE");
            query.Append("          ( C.IDPESSOA           =:PIDPESSOA3 )");
            query.Append("      AND ( C.IDBENEF            =:PIDBENEF3 )");
            query.Append("      AND ( C.FLGSITUACAO        NOT IN ('C', 'Q') )");
            query.Append("      AND ( C.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) )");
            query.Append("   GROUP BY");
            query.Append("      C.IDCONTRATOEMPTMO");
            query.Append("   ) PAR,");
            query.Append("  (");
            query.Append("  SELECT");
            query.Append("    H.IDHISTMOVEMPTMO, H.HMESALDODEV, H.IDCONTRATOEMPTMO");
            query.Append("  FROM");
            query.Append("    HISTMOVEMPTMO H,");
            query.Append("      (");
            query.Append("      SELECT");
            query.Append("         MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO");
            query.Append("      FROM");
            query.Append("         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,");
            query.Append("         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE");
            query.Append("      WHERE");
            query.Append("             ( CON.IDPESSOA           = :PIDPESSOA4 )");
            query.Append("         AND ( CON.IDBENEF            = :PIDBENEF4 )");
            query.Append("         AND ( HME.HMEDATAATUALIZA   <= TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", hmeData)) + "', 'DD/MM/YYYY') )");                                  
            query.Append("         AND ( ITC.ITCTRATASALDODEV  <> 0 )");
            query.Append("         AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) )");
            query.Append("         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )");
            query.Append("         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )");
            query.Append("         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )");
            query.Append("         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )");
            query.Append("         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )");
            query.Append("      GROUP BY");
            query.Append("         HME.IDCONTRATOEMPTMO");
            query.Append("      ) ULT");
            query.Append("  WHERE");
            query.Append("        ( H.HMEDATAATUALIZA <= TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", hmeData)) + "', 'DD/MM/YYYY') )");
            query.Append("    AND ( H.IDHISTMOVEMPTMO = ULT.IDHISTMOVEMPTMO )");
            query.Append("  ) SLD,");
            query.Append("  (");
            query.Append("  SELECT");
            query.Append("    SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, H.IDCONTRATOEMPTMO");
            query.Append("  FROM");
            query.Append("     HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOSUSPEMPTMO TSE");
            query.Append("  WHERE");
            query.Append("          ( C.IDPESSOA           =:PIDPESSOA5 )");
            query.Append("      AND ( C.IDBENEF            =:PIDBENEF5 )");
            query.Append("      AND ( H.HMEDATAVENCTO       <= TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", hmeData)) + "', 'DD/MM/YYYY') )");
            query.Append("      AND ( h.hmedataprevista + 7 <  TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", hmeData)) + "', 'DD/MM/YYYY') )");
            query.Append("      AND ( H.HMETIPOMOV        NOT IN (0, 5, 8) )");
            query.Append("      AND ( H.HMEDATAEFETIVA    IS NULL)");
            query.Append("      AND ( H.HMEVLREFETIVO     IS NULL)");
            query.Append("      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO   = 1) )");   
            query.Append("      AND ( (H.FLGQUITADO        IS NULL) OR (H.FLGQUITADO = 0) )");
            query.Append("      AND ( (H.FLGABONADO        IS NULL) OR (H.FLGABONADO = 0) )");
            query.Append("      AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0) )");
            query.Append("      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )");
            query.Append("      AND H.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+)");
            query.Append("      AND (");
            query.Append("          NVL(H.FLGSUSPENSAO, 0) = 0 OR");
            query.Append("          (NVL(H.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1)");
            query.Append("          )");
            query.Append("   GROUP BY");
            query.Append("      H.IDCONTRATOEMPTMO");
            query.Append("  ) VAL,");
            query.Append("  ( SELECT");
            query.Append("        H.IDCONTRATOEMPTMO, ABS(NVL(H.HMEVLRPREVISTO,0)) AS HMEVLRPREVISTO");
            query.Append("    FROM");
            query.Append("        HISTMOVEMPTMO H, CONTRATOEMPTMO C");
            query.Append("    WHERE");
            query.Append("          ( C.IDPESSOA           =:PIDPESSOA6 )");
            query.Append("      AND ( C.IDBENEF            =:PIDBENEF6 )");
            query.Append("      AND ( H.HMETIPOMOV         = 1 )");
            query.Append("      AND ( H.HMEORIGEM          = 1 )");
            query.Append("      AND ( H.HMECENTRALIZA      = 1 )");
            query.Append("      AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0) )");
            query.Append("      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )");
            query.Append("      AND H.HMEPARCELA = (SELECT");
            query.Append("                              MAX(HME.HMEPARCELA)");
            query.Append("                          FROM");
            query.Append("                              HISTMOVEMPTMO HME, CONTRATOEMPTMO CON");
            query.Append("                          WHERE");
            query.Append("                                ( CON.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )");
            query.Append("                            AND ( HME.HMETIPOMOV         = 1 )");
            query.Append("                            AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) )");
            query.Append("                            AND ( HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) )");
            query.Append("  ) VLP ");
            query.Append("WHERE");
            query.Append("       ( CON.IDPESSOA            =:PIDPESSOA7 )");
            query.Append("   AND ( CON.IDBENEF             =:PIDBENEF7 )");
            query.Append("   AND ( TCE.IDTIPOEMPTMO        =:PIDTIPOEMPTMO )");
            query.Append("   AND ( CON.FLGSITUACAO         NOT IN ('C', 'Q') )");
            query.Append("   AND ( VAL.VLRTOTAL > 0        OR SLD.HMESALDODEV > 0 )");
            query.Append("   AND ( :PQUITAVEL              IS NULL OR CON.IDTIPOCONTREMPTMO IN");
            query.Append("                                             (");
            query.Append("                                             SELECT");
            query.Append("                                                 IDTIPOCONTRQUIT");
            query.Append("                                             FROM");
            query.Append("                                                 TIPOCONTRXQUIT");
            query.Append("                                             WHERE");
            query.Append("                                                 IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO");
            query.Append("                                             )");
            query.Append("       )");
            query.Append("   AND ( CON.IDCONTRATOEMPTMO    = PAR.IDCONTRATOEMPTMO(+) )");
            query.Append("   AND ( CON.IDCONTRATOEMPTMO    = SLD.IDCONTRATOEMPTMO(+) )");
            query.Append("   AND ( CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+) )");
            query.Append("   AND ( CON.IDCONTRATOEMPTMO    = ATU.IDCONTRATOEMPTMO(+) )");
            query.Append("   AND ( CON.MOECODIGO           = MOE.MOECODIGO(+) )");
            query.Append("   AND ( CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO )");
            query.Append("   AND ( CON.IDCONTRATOEMPTMO    = VLP.IDCONTRATOEMPTMO(+) ) ");
            query.Append("ORDER BY CON.IDCONTRATOEMPTMO");           

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "PIDPESSOA", DbType.Int64, idpessoa);
            bancoDeDados.AddInParameter(comando, "PIDPESSOA2", DbType.Int64, idpessoa);
            bancoDeDados.AddInParameter(comando, "PIDPESSOA3", DbType.Int64, idpessoa);
            bancoDeDados.AddInParameter(comando, "PIDPESSOA4", DbType.Int64, idpessoa);
            bancoDeDados.AddInParameter(comando, "PIDPESSOA5", DbType.Int64, idpessoa);
            bancoDeDados.AddInParameter(comando, "PIDPESSOA6", DbType.Int64, idpessoa);
            bancoDeDados.AddInParameter(comando, "PIDPESSOA7", DbType.Int64, idpessoa);
            
            bancoDeDados.AddInParameter(comando, "PIDBENEF",  DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "PIDBENEF2", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "PIDBENEF3", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "PIDBENEF4", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "PIDBENEF5", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "PIDBENEF6", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "PIDBENEF7", DbType.Int64, idMutuario);                                                                     
            bancoDeDados.AddInParameter(comando, "PIDTIPOEMPTMO", DbType.Int64, idTipoEmprestimo);                                                  
            bancoDeDados.AddInParameter(comando, "PQUITAVEL", DbType.Int64, quitavel);                                                  
            bancoDeDados.AddInParameter(comando, "PIDTIPOCONTREMPTMO", DbType.Int64, idTipoContrato);     
                                                                                                                                                                
            List<Contrato> listaContratos = new List<Contrato>();            
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Contrato item = new Contrato()
                    {
                        parcelasPagas = leitor.GetInt32(29),
                        tcemirenova = leitor.GetInt32(25),
                        idTipoContratoEmpto =  leitor.GetInt32(9)
                    };
                    listaContratos.Add(item);
                }
            }
            return listaContratos;
        }


        public int verContratoQuitavel(int tipoContrato, int tipoContratoQuitavel)
        {
            StringBuilder qry = new StringBuilder();
            
            qry.Append("SELECT ");
            qry.Append("    NVL(FLGOBRIGATORIO,0) AS FLOBRIGATORIO ");
            qry.Append("FROM ");
            qry.Append("   TIPOCONTRXQUIT ");
            qry.Append("WHERE ");
            qry.Append("       IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO_P ");
            qry.Append("   AND IDTIPOCONTRQUIT   =:PIDTIPOCONTRQUIT_P ");
                   
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(qry.ToString());

            bancoDeDados.AddInParameter(comando, "PIDTIPOCONTREMPTMO_P", DbType.Int32, tipoContrato);
            bancoDeDados.AddInParameter(comando, "PIDTIPOCONTRQUIT_P", DbType.Int32, tipoContratoQuitavel);

            int flgObrigatorio = 0;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    flgObrigatorio = leitor.GetInt32(0);                                                               
                }
                else 
                {
                    flgObrigatorio = 0;
                }
            }
            return flgObrigatorio;                           
        }


        // Thiago Melo SOL 202311 KINTANA 1956671



        ///// <summary>
        ///// Verifica se existe concessao não efetivada
        ///// </summary>
        ///// <param name="tipoContrato"></param>
        ///// <param name="idMutuario"></param>
        ///// <returns></returns>
        //public bool verificarConcessaoNaoEfetivada(TipoContrato tipoContrato, int idMutuario)
        //{
        //    StringBuilder query = new StringBuilder();

        //    query.Append(" SELECT COUNT(CNT.IDCONTRATOEMPTMO) ");                                
        //    query.Append(" FROM CONTRATOEMPTMO CNT, HISTMOVEMPTMO  HME ");                                 
        //    query.Append(" WHERE CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ");
        //    query.Append(" AND   CNT.IDBENEF  = :IDMUTUARIO_P ");  
        //    query.Append(" AND   NVL(FLGESTORNADO, 0)  = 0 ");                       
        //    query.Append(" AND   CNT.FLGSITUACAO IN ('A', 'P') ");         
        //    query.Append(" AND   HME.HMETIPOMOV = 0 ");                                 
        //    query.Append(" AND   HME.HMECENTRALIZA = 1 ");                        
        //    query.Append(" AND  HME.FLGBAIXADO = 0 ");  

        //    //Se for 1, verifica mesmo tipo, senão verifica qualquer tipo
        //    if(tipoContrato.verificaContratoEfetivado == 1)
        //    {
        //        query.Append(" AND CNT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P " );
        //    }

        //    // Cria comando de consulta
        //    Database bancoDeDados = this.obterBancoDeDados();
        //    DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

        //    // Parâmetros
        //    bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);

        //    if (tipoContrato.verificaContratoEfetivado == 1)
        //    {
        //        bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, tipoContrato.id);
        //    }

        //    int quantidadeContrato = 0;
        //    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
        //    {
        //        if (leitor.Read())
        //        {
        //            quantidadeContrato = leitor.GetInt32(0);
        //        }
        //    }

        //    return (quantidadeContrato > 0);

        //}

        // Xavier SOL 178579

        /// <summary>
        /// Verficia se existe suspensão associada ao mutuário.
        /// </summary>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        public List<Grupoexcepcional> listarGrupoExcepcional()
        {
            StringBuilder query = new StringBuilder();

            // Consulta  
            // Consulta
            query.Append(" select IDGRUPOEXCEPCIONAL, DESCRICAO from GRUPOEXCEPCIONALEMPTMO ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros

            // Popula objeto resultante

            List<Grupoexcepcional> listarGrupoExcepcional = new List<Grupoexcepcional>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    Grupoexcepcional tipo = new Grupoexcepcional()
                    {
                        idgrupoexcepcional = leitor.GetInt32(0),
                        descricao = leitor.GetString(1),
                    };

                    listarGrupoExcepcional.Add(tipo);
                }
            }

            return listarGrupoExcepcional;
        }

        // Xavier SOL 178579

        /// <summary>
        /// Verifica se existe concessao não efetivada
        /// </summary>
        /// <param name="tipoContrato"></param>
        /// <param name="idMutuario"></param>
        /// <returns></returns>
        public bool verificarConcessaoNaoEfetivada(TipoContrato tipoContrato, int idMutuario)
        {
            StringBuilder query = new StringBuilder();

            query.Append(" SELECT COUNT(CNT.IDCONTRATOEMPTMO) ");
            query.Append(" FROM CONTRATOEMPTMO CNT, HISTMOVEMPTMO  HME ");
            query.Append(" WHERE CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ");
            query.Append(" AND   CNT.IDBENEF  = :IDMUTUARIO_P ");
            query.Append(" AND   NVL(FLGESTORNADO, 0)  = 0 ");
            query.Append(" AND   CNT.FLGSITUACAO IN ('A', 'P') ");
            query.Append(" AND   HME.HMETIPOMOV = 0 ");
            query.Append(" AND   HME.HMECENTRALIZA = 1 ");
            query.Append(" AND  HME.FLGBAIXADO = 0 ");

            //Se for 1, verifica mesmo tipo, senão verifica qualquer tipo
            if (tipoContrato.verificaContratoEfetivado == 1)
            {
                query.Append(" AND CNT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ");
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);

            if (tipoContrato.verificaContratoEfetivado == 1)
            {
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, tipoContrato.id);
            }

            int quantidadeContrato = 0;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    quantidadeContrato = leitor.GetInt32(0);
                }
            }

            return (quantidadeContrato > 0);

        }

        // xavier SOL 178579

        // xavier SOL 178579
        /// <summary>
        /// Inclui Grupo Excepcional e IdContrato na estrutura tals
        /// </summary>
        public void incluirContratoEmptmoXExcepcional(Int64 idContrato, int idGrupoExcepcional)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();            

            query.Append(" INSERT INTO CONTRATOEMPTMOXEXCEPCIONAL(");
            query.Append(" IDCONTRATOEMPTMO,");
            query.Append(" IDGRUPOEXCEPCIONAL ) ");
            query.Append(" VALUES( ");
            query.Append(" :IDCONTRATOEMPTMO_P, ");
            query.Append(" :IDGRUPOEXCEPCIONAL_P ) ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
            bancoDeDados.AddInParameter(comando, "IDGRUPOEXCEPCIONAL_P", DbType.Int32, idGrupoExcepcional);

            bancoDeDados.ExecuteNonQuery(comando);

        }
        // xavier SOL 178579


        // SADI SOL213592_Kintana2040335 
        /// <summary>
        /// Inclui idContrato e IdPessoa na estrutura "Suspconcessao"
        /// </summary>
        public void incluirContratoEmptmoSuspconcessao(Int64 idContrato, int idPessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append(" INSERT INTO suspconcessao(");
            query.Append(" IDPESSOA,");
            query.Append(" SUCDATAINICIO,");
            query.Append(" SUCDATAFINAL,");
            query.Append(" SUCMOTIVOSUSP,");
            query.Append(" TRGDTINCLUSAO,");
            query.Append(" TRGUSERINCLUSAO,");
            query.Append(" FLGSTATUS,");
            query.Append(" SUCUSERALTERACAO,");
            query.Append(" SUCDTALTERACAO,");
            query.Append(" FLGPRAZOINDETERMINADO,");
            query.Append(" IDSUCEMPTMO,");
            query.Append(" DESCMODEMP,");
            query.Append(" IDMOTIVOSUSPCONCESSAO,");
            query.Append(" IDCONTRATOEMPTMO ) ");
            query.Append(" VALUES( ");
            query.Append(" :IDPESSOA_P, ");
            query.Append(" TRUNC(SYSDATE), ");
            query.Append(" add_months(TRUNC(SYSDATE),6), ");
            query.Append(" 'Bloqueio automático por renegociação de contrato baixado contabilmente devido a perda efetiva.', ");
            query.Append(" SYSDATE, ");
            query.Append(" USER, ");
            query.Append(" 'A', ");
            query.Append(" NULL, ");
            query.Append(" NULL, ");
            query.Append(" 'N', ");
            query.Append(" seqsuspconcessao.nextval, ");
            query.Append(" NULL, ");
            query.Append(" 21,  ");
            query.Append(" :IDCONTRATOEMPTMO_P ");
            query.Append(" ) ");

            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
            bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);

            bancoDeDados.ExecuteNonQuery(comando);

        }
        // SADI SOL 






        //William Moreira da Silva - barraprogresso
        /// <summary>
        /// incluir o usuario que esta fazendo a concessão, para controle da barra de progresso
        /// </summary>
        /// <param name="usuario">Usúario que esta fazendo o processo</param>
        /// <param name="quantRegras">Quantidade de regras que serão processadas</param>
        public void incluirIdbarraProgresso(string usuario, int quantRegras)
        {
            if (usuario != "conector[]")//William Moreira da Silva - SOL 216279 KTN 2045726
            {
                Database bancoDeDados = this.obterBancoDeDados();
                StringBuilder query = new StringBuilder();

                query.Append(" INSERT INTO TB_EMP_BARRAPROGRESSO ");
                query.Append(" (USUARIO, quantregras, regrascalculadas) ");
                query.Append(" VALUES(:USUARIO_P, :IDQUANTREGRAS_P, 1) ");

                DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, usuario);
                bancoDeDados.AddInParameter(comando, "IDQUANTREGRAS_P", DbType.Int32, quantRegras);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        /// <summary>
        /// Atualiza a tabela que controla a barra de progresso
        /// </summary>
        /// <param name="usuario">Usúario que esta fazendo o processo</param>
        /// <param name="regras">Quantidade de regras já calculadas</param>
        /// <param name="itens">Quantidade de itens já calculados</param>
        public void atualizaBarraProgresso(string usuario, int regras, int quantItens, int itens)
        {
            if (usuario != "conector[]")//William Moreira da Silva - SOL 216279 KTN 2045726
            {
                Database bancoDeDados = this.obterBancoDeDados();
                StringBuilder query = new StringBuilder();

                query.Append("UPDATE TB_EMP_BARRAPROGRESSO ");
                query.Append("   SET REGRASCALCULADAS = :REGRASCALCULADAS_P, ");
                query.Append("   QUANTITENS = :QUANTITENS_P,");
                query.Append("                     ITENSCALCULADOS = :ITENSCALCULADOS_P ");
                query.Append(" WHERE usuario LIKE(:usuario_P) ");

                DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

                bancoDeDados.AddInParameter(comando, "REGRASCALCULADAS_P", DbType.Int32, regras);
                bancoDeDados.AddInParameter(comando, "QUANTITENS_P", DbType.Int32, quantItens);
                bancoDeDados.AddInParameter(comando, "ITENSCALCULADOS_P", DbType.Int32, itens);
                bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        /// <summary>
        /// Obtem o resultado de quantas regras e/ou itens já foram calculados
        /// </summary>
        /// <param name="usuario">Usuario que esta rodando o processo</param>
        /// <returns></returns>
        public List<Int32> obterStatusBarraProgresso(string usuario)
        {
            StringBuilder query = new StringBuilder();

            // Consulta  
            // Consulta
            query.Append(" select quantregras, REGRASCALCULADAS, quantitens, ITENSCALCULADOS from TB_EMP_BARRAPROGRESSO WHERE usuario LIKE(:usuario_P) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);

            // Popula objeto resultante

            List<Int32> regrasItens = new List<int>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    regrasItens.Add(leitor.GetInt32(0));
                    regrasItens.Add(leitor.GetInt32(1));
                    regrasItens.Add(leitor.GetInt32(2));
                    regrasItens.Add(leitor.GetInt32(3));
                }
                else
                {
                    regrasItens.Add(0);
                    regrasItens.Add(0);
                    regrasItens.Add(0);
                    regrasItens.Add(0);
                }
            }

            return regrasItens;
        }

        /// <summary>
        /// Deleta a instancia da barra de progresso
        /// </summary>
        /// <param name="usuario">Usúario que esta fazendo o processo</param>
        public void deletaStatusBarraProgresso(string usuario)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            StringBuilder query = new StringBuilder();

            query.Append("DELETE TB_EMP_BARRAPROGRESSO ");
            query.Append(" WHERE usuario LIKE(:usuario_P) ");

            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);

            bancoDeDados.ExecuteNonQuery(comando);
        }
        //William Moreira da Silva - barraprogresso

        //MARCIO SANCHES SPINOSA - SOL 204760 INI

        public List<long> obterContratoEmptmo(int idMutuario, int idBeneficiario, DateTime dataCredito)
        {
            
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append(" SELECT ");
            query.Append(" CON.IDCONTRATOEMPTMO, CON.IDTIPOCONTREMPTMO,  NVL(VAL.VLRTOTAL, 0) AS VLREMABERTO ");
            query.Append("  FROM ");
            query.Append(" CONTRATOEMPTMO CON, ");
            query.Append("  ( ");
            query.Append(" SELECT ");
            query.Append(" SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, H.IDCONTRATOEMPTMO ");
            query.Append("  FROM ");
            query.Append(" HISTMOVEMPTMO H, CONTRATOEMPTMO C ");
            query.Append(" WHERE ");
            query.Append("  ( C.IDPESSOA           = :IDPESSOA_P ) ");
            query.Append(" AND ( C.IDBENEF            = :IDBENEF_P )");
            query.Append(" AND ( H.HMEDATAPREVISTA    <=:HMEDATA_P ) ");
            query.Append(" AND ( H.HMETIPOMOV         NOT IN (0, 5, 8) )");
            query.Append(" AND ( (H.HMEDATAEFETIVA    IS NULL) OR (H.HMEDATAEFETIVA >:HMEDATA1_P) ) ");
            query.Append("  AND ( (H.HMEVLREFETIVO     IS NULL) OR (H.HMEDATAEFETIVA >:HMEDATA2_P) ) ");
            query.Append(" AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO   = 1) )");
            query.Append(" AND ( (H.FLGQUITADO        IS NULL) OR (H.FLGQUITADO = 0) ) ");
            query.Append(" AND ( (H.FLGABONADO        IS NULL) OR (H.FLGABONADO = 0) )");
            query.Append(" AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0) )");
            query.Append(" AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) ");
            query.Append("  AND ( ( C.IDTIPOSUSPEMPTMO   IS NULL AND (H.FLGSUSPENSAO IS NULL OR H.FLGSUSPENSAO = 0) ) )");
            query.Append(" GROUP BY ");
            query.Append(" H.IDCONTRATOEMPTMO ");
            query.Append(" ) VAL WHERE ");
            query.Append(" CON.IDPESSOA     = :IDPESSOA1_P ");
            query.Append(" AND CON.IDBENEF      =:IDBENEF1_P ");
            query.Append("  AND CON.FLGSITUACAO  NOT IN ('C', 'Q') ");
            query.Append(" AND CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+) ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int64, idBeneficiario);
            bancoDeDados.AddInParameter(comando, "HMEDATA_P", DbType.Date, dataCredito);
            bancoDeDados.AddInParameter(comando, "HMEDATA1_P", DbType.Date, dataCredito);
            bancoDeDados.AddInParameter(comando, "HMEDATA2_P", DbType.Date, dataCredito);
            bancoDeDados.AddInParameter(comando, "IDPESSOA1_P", DbType.Int64, idMutuario);
            bancoDeDados.AddInParameter(comando, "IDBENEF1_P", DbType.Int64, idBeneficiario);

            List<long> contratoEmptmo = new List<long>();
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                
                while (leitor.Read())
                {
                    contratoEmptmo.Add(leitor.GetInt64(0));
                }
                
            }

            return contratoEmptmo;
        }


        public double existemItensEmAberto(long idcontratoemptmo, bool usaData, DateTime dataCredito, bool usaMes, int ano, int mes)
        {
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ");
            query.Append(" HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO, ");
            query.Append("  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, ");
            query.Append(" HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO ");
            query.Append(" FROM ");
            query.Append(" HISTMOVEMPTMO HME ");
            query.Append(" WHERE ");
            query.Append(" HME.IDCONTRATOEMPTMO         = :IDCONTRATOEMPTMO_P ");
            query.Append(" AND HME.HMETIPOMOV           NOT IN (0, 5, 8) ");
            query.Append(" AND HME.FLGBAIXADO           = 0 ");
            query.Append(" AND HME.HMEDATAEFETIVA       IS NULL ");
            query.Append(" AND HME.HMEVLREFETIVO        IS NULL ");
            query.Append(" AND HME.HMEVLRPREVISTO       <> 0 ");
            query.Append(" AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) ");
            query.Append(" AND NVL(HME.FLGESTORNADO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGSUSPENSAO, 0) = 0 ");
            query.Append(" AND NVL(HME.FLGQUITADO, 0)   = 0 AND NVL(HME.FLGABONADO, 0)   = 0 ");

            if (usaData)
            {
                query.Append("AND (:FILTRODATA_P            IS NULL OR (:FILTRODATA1_P IS NOT NULL AND HME.HMEDATAPREVISTA + 7 < :HMEDATAVENCTO_P)) ");
            }

            if (usaMes)
            {
                query.Append("AND (:FILTROMES_P             IS NULL OR (:FILTROMES1_P  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < :HMEANOCOBRANCA1_P || :HMEMESCOBRANCA2_P))) ");
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idcontratoemptmo);

            if (usaData)
            {
                bancoDeDados.AddInParameter(comando, "FILTRODATA_P", DbType.Int64, 1);
                bancoDeDados.AddInParameter(comando, "FILTRODATA1_P", DbType.Int64, 1);
                bancoDeDados.AddInParameter(comando, "HMEDATAVENCTO_P", DbType.Date, dataCredito);
            }

            if (usaMes)
            {
                bancoDeDados.AddInParameter(comando, "FILTROMES1_P", DbType.Int64, 1);
                bancoDeDados.AddInParameter(comando, "FILTROMES_P", DbType.Int64, 1);
                //William Moreira da Silva - SOL 218057 KTN 2048785
                //bancoDeDados.AddInParameter(comando, "HMEMESCOBRANCA2_P", DbType.Int32, ano);
                bancoDeDados.AddInParameter(comando, "HMEANOCOBRANCA1_P", DbType.Int32, ano);
                //William Moreira da Silva - SOL 218057 KTN 2048785
                bancoDeDados.AddInParameter(comando, "HMEMESCOBRANCA2_P", DbType.Int32, mes);


                
            }

            double vlrResult = 0;

            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                while (leitor.Read())
                {
                    vlrResult = vlrResult + leitor.GetDouble(6);
                }
            }

            return vlrResult;
        }
        //MARCIO SANCHES SPINOSA - SOL 204760 FIM

        #endregion
    }
}
