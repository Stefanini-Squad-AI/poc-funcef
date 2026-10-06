#region SIG 57675
///
/// Autor:
/// Marcelo Valério Ferreira
///
/// Data da Alteração:
/// 09/01/2018 13:05:00
///
/// Descrição da Alteração:
/// Verificação de duplicidade de concessão de 13º salário para o participante.
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion

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

        /// SIG 57675 - Início
        /// <summary>
        /// Seleção de concessão de empréstimo de 13º salário do participante, não quitado.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa para filtro.</param>
        /// <param name="idMutuario">Identificação do mutuário para filtro.</param>
        /// <returns>Se existe concessão de 13º salário não quitado.</returns>
        public bool verificarConcessao13(int idPessoa, int idMutuario, DateTime? dtPrimeiraParcela)
        {

            string query;

            // Consulta
            query = @"SELECT COUNT(C.IDCONTRATOEMPTMO) EXISTECONTRATO
                        FROM CONTRATOEMPTMO C
                       WHERE C.IDBENEF = :IDPESSOA
                         AND C.IDPESSOA = :IDTITULAR
                         AND C.FLGSITUACAO = 'A'
                         AND C.IDTIPOCONTREMPTMO IN (92,93)
                         AND TO_CHAR(C.DATAPRIMPARC, 'YYYY') = 
                             DECODE(SIGN(TO_CHAR(TRUNC(:DTPRIMEIRAPARCELA1), 'YYYY') - TO_CHAR(TRUNC(SYSDATE), 'YYYY')),
                                    0,
                                    TO_CHAR(TRUNC(SYSDATE), 'YYYY'),
                                    1,
                                    TO_CHAR(TRUNC(:DTPRIMEIRAPARCELA2), 'YYYY'),
                                    -1,
                                    TO_CHAR(TRUNC(SYSDATE), 'YYYY'))
                         AND 0 <
                             (SELECT SUM(NVL(VLRPREVISTO, 0))
                                FROM HMECONCESSAO
                               WHERE IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO
                                 AND ((FLGESTORNADO = 0 AND FLGBAIXADO = 0) OR
                                     (ORIGEM = 13 AND FLGBAIXADO = 1))
                                 AND NOT EXISTS (SELECT 1
                                        FROM HMECONCESSAO
                                       WHERE IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO
                                         AND ORIGEM = 13
                                         AND FLGBAIXADO = 1))";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, idPessoa);
            bancoDeDados.AddInParameter(comando, "IDTITULAR", DbType.Int32, idMutuario);
            bancoDeDados.AddInParameter(comando, "DTPRIMEIRAPARCELA1", DbType.Date, dtPrimeiraParcela);
            bancoDeDados.AddInParameter(comando, "DTPRIMEIRAPARCELA2", DbType.Date, dtPrimeiraParcela);

            // Popula objeto resultante
            int resultado = 0;
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                if (leitor.Read())
                {
                    resultado = Convert.ToInt32(leitor.GetValue(0));
                }
            }

            comando.Connection.Close();
            comando.Dispose();

            return (resultado > 0);

        }
        /// SIG 57675 - Fim

        /// <summary>
        /// Pesquisa o dia da cobrança.
        /// </summary>
        /// <param name="idPatrocinadora">Identificação da Patrocinadora para filtro.</param>
        /// <param name="idPlanoPrevidenciario">Identificação do Plano Previdenciario para filtro.</param>
        /// <returns>Dia da Cobrança.</returns>
        public DateTime calcularPrimeiraParcela(int idPatrocinadora, int idPlanoPrevidenciario, DateTime dataCredito)
        {
            string query;

            // Consulta
            query = @" SELECT DIACOBN AS DIA_COBRANCA_NORMAL,
                   FLGUTILN,
                   FLGDIAPOSANTN,
                   FLGMESCOBN,
                   DIACOBA,
                   FLGUTILA,
                   FLGDIAPOSANTA,
                   FLGMESCOBA,
                   DIACOBD,
                   FLGUTILD,
                   FLGDIAPOSANTD,
                   FLGMESCOBD,
                   DIACOBC,
                   FLGUTILC,
                   FLGDIAPOSANTC,
                   FLGMESCOBC,
                   DIASAPOSD,
                   DIASAPOSC
              FROM CM.DATASPATROEMPTMO
              WHERE (IDPESSJUR = :ID_PATROCINADORA_P)
              AND (IDPLANOPREV = :ID_PLANO_PREVIDENCIARIO_P)
              AND (SITFUNDACAO = 'AS') ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
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
                        diaCobranca = Convert.ToInt32(leitor.GetValue(DIACOBN));
                        flgUtilN = leitor.obterString(FLGUTILN);//NILTON
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

            string query;

            // Consulta
            query = @" SELECT COUNT(CNT.IDCONTRATOEMPTMO) AS QTDE 
              FROM CM.CONTRATOEMPTMO CNT, HISTMOVEMPTMO HME 
             WHERE CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO 
               AND CNT.IDBENEF = :IDMUTUARIO_P 
               AND NVL(FLGESTORNADO, 0) = 0 
               AND CNT.FLGSITUACAO NOT IN ('C', 'Q') 
               AND HME.HMETIPOMOV = 0 
               AND HME.HMECENTRALIZA = 1 
               AND HME.HMEDATAPREVISTA >= :DATAREFERENCIA_P ";

            if (filtrarTipoContrato)
            {
                query = query + @" AND CNT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ";
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
                        quantidadeContrato = Convert.ToInt32(leitor.GetValue(0));
                    }
                }



                return (quantidadeContrato > 0);
            }
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

            pQry.Append(@" SELECT DESCMODEMP, SUCDATAINICIO FROM CM.SUSPCONCESSAO 
                           WHERE IDPESSOA = :IDPESSOA_P
                           ORDER BY SUCDATAINICIO");

            // Cria comando de consulta
            Database bancoDeDadosDescModEmp = this.obterBancoDeDados();
            using (DbCommand comandoDescModEmp = bancoDeDadosDescModEmp.GetSqlStringCommand(pQry.ToString()))
            {
                bancoDeDadosDescModEmp.AddInParameter(comandoDescModEmp, "IDPESSOA_P", DbType.Int32, idMutuario);

                // Popula objeto resultante
                using (IDataReader leitorSuspensao = bancoDeDadosDescModEmp.ExecuteReader(comandoDescModEmp))
                {
                    if (leitorSuspensao.Read())
                    {
                        idContrato = leitorSuspensao.obterString(0);
                        supDataInicio = Convert.ToDateTime(leitorSuspensao.GetValue(1));
                    }
                }
            }

            string query;
            // Consulta  
            // Xavier SOL 171546
            query = @" select tmp.IDPESSOA,
                    tmp.NOME, 
                    tmp.SUCDATAINICIO, 
                    tmp.SUCDATAFINAL, 
                    tmp.SUCMOTIVOSUSP, 
                    tmp.FLGSTATUS 

                    from (SELECT SUC.IDPESSOA, 
                                 min(SUC.SUCDATAINICIO) over() MENORDATA, 
                                 PES.NOME, 
                                 SUC.SUCDATAINICIO, 
                                 SUC.SUCDATAFINAL, 
                                 SUC.SUCMOTIVOSUSP, 
                                 SUC.FLGSTATUS 
                            FROM CM.PESSOA PES, CM.SUSPCONCESSAO SUC 
                           WHERE SUC.IDPESSOA = :IDMUTUARIO_P 
                             AND SUC.FLGSTATUS = 'A' 
                             AND ((:DATAREFERENCIA_P BETWEEN SUC.SUCDATAINICIO AND SUC.SUCDATAFINAL) OR ((SUC.SUCDATAINICIO < :DATAREFERENCIA_P) 
                             AND nvl(SUC.FLGPRAZOINDETERMINADO, 'N') = 'S')) 
                             AND PES.IDPESSOA = SUC.IDPESSOA 
                             AND (SUC.DESCMODEMP is null or SUC.DESCMODEMP = '') 
                           ORDER BY SUC.IDPESSOA, SUC.SUCDATAINICIO 
                         ) tmp 
             where tmp.SUCDATAINICIO = tmp.MENORDATA ";

            // Xavier SOL 171546

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.GetSqlStringCommand(query);

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, idMutuario);
            //Duas chamadas, adicionar duas vezes.
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.Date, dataReferencia.Date);
            bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.Date, dataReferencia.Date);

            //William Moreira da Silva - SOL 217182 KTN 2046516 - INICIO
            //Verifica se o update abaixo precisara ser feito
            string pQryValidacao;
            pQryValidacao = @" SELECT 1 FROM CM.SUSPCONCESSAO 
             WHERE TRUNC(SUSPCONCESSAO.SUCDATAFINAL) < TRUNC(:PDATAREFERENCIA_P)  
             AND SUSPCONCESSAO.SUCDATAFINAL IS NOT NULL 
             AND SUSPCONCESSAO.FLGSTATUS = 'A' 
             AND SUSPCONCESSAO.SUCDATAINICIO  = :PDATAINI_P 
             AND SUSPCONCESSAO.IDPESSOA  = :IDPESSOA_P ";

            //Criando o comando para a consulta
            Database bancoDadosValidacao = this.obterBancoDeDados();
            DbCommand comandoValidacao = bancoDadosValidacao.GetSqlStringCommand(pQryValidacao);

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
                    string pQryUpdate;
                    pQryUpdate = @" UPDATE CM.SUSPCONCESSAO 
                     SET SUSPCONCESSAO.FLGSTATUS = 'E' 
                     WHERE TRUNC(SUSPCONCESSAO.SUCDATAFINAL) < TRUNC(:PDATAREFERENCIA_P)
                     AND SUSPCONCESSAO.SUCDATAFINAL IS NOT NULL
                     AND SUSPCONCESSAO.FLGSTATUS = 'A' 
                     AND SUSPCONCESSAO.SUCDATAINICIO  = :PDATAINI_P
                     AND SUSPCONCESSAO.IDPESSOA  = :IDPESSOA_P ";

                    // Cria comando de Update
                    Database bancoDeDadosUpdate = this.obterBancoDeDados();

                    DbCommand comandoUpdate = bancoDeDadosUpdate.obterComandoPorSql(pQryUpdate);

                    bancoDeDadosUpdate.AddInParameter(comandoUpdate, "PDATAREFERENCIA_P", DbType.Date, dataReferencia);
                    bancoDeDadosUpdate.AddInParameter(comandoUpdate, "PDATAINI_P", DbType.Date, supDataInicio);
                    bancoDeDadosUpdate.AddInParameter(comandoUpdate, "IDPESSOA_P", DbType.Int32, idMutuario);
                    bancoDeDadosUpdate.ExecuteNonQuery(comandoUpdate);
                }
            }
            //William Moreira da Silva - SOL 217182 KTN 2046516 - FIM

            //if (idContrato.Contains(idTipoContratoEmpto.ToString()) || leitor.Read())
            //{
            //William Moreira da Silva - SOL 232068 PPM 383995
            string qryConcessao;

            qryConcessao = @" SELECT  SUC.IDPESSOA, PES.NOME, 
             SUC.SUCDATAINICIO, SUC.SUCDATAFINAL, 
             SUC.SUCMOTIVOSUSP, SUC.FLGSTATUS 
             FROM CM.PESSOA PES, CM.SUSPCONCESSAO SUC 
             WHERE SUC.IDPESSOA  = :IDPESSOA_P 
              AND SUC.SUCDATAINICIO >= :DATAINI_P 
             AND SUC.FLGSTATUS = 'A' 
             AND ((:DATA_P BETWEEN SUC.SUCDATAINICIO AND SUC.SUCDATAFINAL) 
             or  (SUC.SUCDATAINICIO < :DATA_P2 AND nvl(SUC.FLGPRAZOINDETERMINADO,'N') = 'S')) 
             AND PES.IDPESSOA = SUC.IDPESSOA 
             ORDER BY SUC.IDPESSOA, SUC.SUCDATAINICIO ";

            Database bancoDeDadosConcessao = this.obterBancoDeDados();

            using (DbCommand comandoConcessao = bancoDeDadosConcessao.GetSqlStringCommand(qryConcessao))
            {
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "IDPESSOA_P", DbType.Int32, idMutuario);
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "DATAINI_P", DbType.Date, supDataInicio);
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "DATA_P", DbType.Date, dataReferencia);
                bancoDeDadosConcessao.AddInParameter(comandoConcessao, "DATA_P2", DbType.Date, dataReferencia);

                //William Moreira da Silva - SOL 232068 PPM 383995
                using (IDataReader leitorConcessao = bancoDeDadosConcessao.ExecuteReader(comandoConcessao))
                {

                    if (leitorConcessao.Read())
                    {
                        suspensao = new Suspensao()
                        {
                            dataInicio = leitorConcessao.GetDateTime(2),
                            dataFinal = leitorConcessao.obterValorData(3),
                            motivosSuspensao = leitorConcessao.obterString(4)
                        };
                        //William Moreira da Silva - SOL 240118 PPM 528710
                        if (!String.IsNullOrEmpty(suspensao.motivosSuspensao))
                        {
                            suspensao.motivosSuspensao = suspensao.motivosSuspensao.Replace("\n", "\\n").Replace("\r", "\\r");
                        }
                        //William Moreira da Silva - SOL 240118 PPM 528710
                    }
                }

                //William Moreira da Silva - SOL 232068 PPM 383995
                //}
                //William Moreira da Silva - SOL 232068 PPM 383995
                return suspensao;
            }
        }
        //MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567 - fIM

        //Jessica Y. Oshiro - SOL 235314
        /// <summary>
        /// Verifica se data credito é dia util.
        /// </summary>
        /// <param name="dataCredito">Data credito como parametro</param>
        /// <returns>Se data credito é dia util.</returns>
        public bool verificaDataUtil(DateTime dataUtil)
        {
            string query;

            // Consulta
            query = @"SELECT cm.fn_verifica_dia_util2(:DATACREDITO) from DUAL";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "DATACREDITO", DbType.Date, dataUtil);

                // Popula objeto resultante
                int diaUtil = 0;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        diaUtil = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                comando.Connection.Close();
                comando.Dispose();
                if (diaUtil == 1)
                    return (true);
                else
                    return (false);
            }
        }

        // Thiago Melo SOL 202311 KINTANA 1956671 INI
        public bool primeiraRenovacao2006(int idPessoa, int idBenef, int idTipoContrato)
        {
            string qry;

            qry = @" SELECT 
              COUNT(IDCONTRATOEMPTMO) AS QUANT 
             FROM 
             CM.CONTRATOEMPTMO CON 
            WHERE 
                  CON.FLGSITUACAO      <> ('C') 
              AND CON.DATACREDITO       > TO_DATE('03/01/2006', 'DD/MM/YYYY') 
              AND CON.IDPESSOA          = :IDPESSOA_P 
              AND CON.IDBENEF           = :IDBENEF_P 
              AND CON.IDTIPOCONTREMPTMO = :IDTIPOCONTRATOEMPTMO_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand command = bancoDeDados.obterComandoPorSql(qry))
            {

                bancoDeDados.AddInParameter(command, "IDPESSOA_P", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(command, "IDBENEF_P", DbType.Int32, idBenef);
                bancoDeDados.AddInParameter(command, "IDTIPOCONTRATOEMPTMO_P", DbType.Int32, idTipoContrato);

                int qtd = 0;
                using (IDataReader reader = bancoDeDados.ExecuteReader(command))
                {
                    if (reader.Read())
                    {
                        qtd = Convert.ToInt32(reader.GetValue(0));
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
        }


        public Contrato consultarFlgPrazoTpQuitacao(int IdTipoContrato)
        {
            string qry;

            qry = @" SELECT 
            NVL(TCE.FLGVERPRAZOTIPOQUIT,0) AS FLGVERPRAZOTIPOQUIT, 
            TCE.TCEMINRENOVA 
            FROM 
               CM.TIPOCONTREMPTMO TCE, 
               CM.TIPOEMPTMO      TEP
            WHERE ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) 
              AND ( TCE.IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO_P) ) 
              AND ( TCE.FLGSITUACAO       = 'A' ) 
              AND ( :IDMODULO_P <> 19 OR TCE.FLGUSOCENTRAL = 1 )
              AND ( :IDMODULO_P <> 15 OR TCE.FLGUSOEMPTMO  = 1 )";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(qry))
            {

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTREMPTMO_P", DbType.Int32, IdTipoContrato);
                bancoDeDados.AddInParameter(comando, "IDMODULO_P", DbType.Int32, 15);
                bancoDeDados.AddInParameter(comando, "IDMODULO_P", DbType.Int32, 15);

                Contrato contratos = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        contratos = new Contrato()
                        {
                            flgPrazoQuitacao = Convert.ToInt32(leitor.GetValue(0)),
                            tcemirenova = Convert.ToInt32(leitor.GetValue(1))
                        };
                    }
                }

                return contratos;
            }
        }


        public List<Contrato> consultarContratosAnteriores(int idpessoa, int idMutuario, DateTime hmeData, int idTipoEmprestimo, int quitavel, int idTipoContrato, bool flgExcepcional, string contratosSelecionados = null)
        {
            //William Moreira da Silva - SOL 253185 - Consulta refatorada pelo projeto de segregação da HISTMOVEMPTMo
            string query = $@" SELECT CON.IDTIPOCONTREMPTMO,
             TCE.TCEMINRENOVA, 
                               NVL(PCK_EMPRESTIMO.FN_QUANTPARCELASPAGAS(CON.IDCONTRATOEMPTMO), 0) NUMPARCPAGAS,       
             NVL(TCXQ.FLGOBRIGATORIO, 0) AS FLGOBRIGATORIO
             FROM CM.CONTRATOEMPTMO  CON, 
             CM.TIPOCONTREMPTMO TCE, 
                               CM.TIPOCONTRXQUIT TCXQ
                         WHERE (CON.IDPESSOA = :PIDPESSOA)
             AND ( CON.IDBENEF             =  {idMutuario}) 
             AND ( TCE.IDTIPOEMPTMO        = :PIDTIPOEMPTMO ) 
             AND ( CON.FLGSITUACAO         NOT IN ('C', 'Q') ) 
             AND ( TCXQ.IDTIPOCONTREMPTMO  = :PIDTIPOCONTREMPTMO ) 
             {(string.IsNullOrEmpty(contratosSelecionados) ? $@"AND ( CON.IDTIPOCONTREMPTMO   = {idTipoContrato} )" : $@"AND ( CON.IDCONTRATOEMPTMO IN ({contratosSelecionados}))")}
             AND ( TCXQ.IDTIPOCONTRQUIT    = CON.IDTIPOCONTREMPTMO ) 
             AND ( CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO ) 
                          AND (NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPTMO, TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", hmeData)) + @"','dd/mm/yyyy')),1) >  0 OR
                               CM.PCK_EMPRESTIMO.FN_VALOREMABERTO_CONCESSAO(CON.IDCONTRATOEMPTMO, TO_DATE('" + Convert.ToString(String.Format("{0:dd/MM/yyyy}", hmeData)) + @"','dd/mm/yyyy'), 7) > 0)
             ORDER BY CON.IDCONTRATOEMPTMO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "PIDPESSOA", DbType.Int32, idpessoa);
                //bancoDeDados.AddInParameter(comando, "PIDPESSOA2", DbType.Int32, idpessoa);
                //bancoDeDados.AddInParameter(comando, "PIDPESSOA3", DbType.Int32, idpessoa);

                //bancoDeDados.AddInParameter(comando, "PIDBENEF", DbType.Int32, idMutuario);
                //bancoDeDados.AddInParameter(comando, "PIDBENEF2", DbType.Int32, idMutuario);
                //bancoDeDados.AddInParameter(comando, "PIDBENEF3", DbType.Int32, idMutuario);
                //bancoDeDados.AddInParameter(comando, "PIDBENEF4", DbType.Int32, idMutuario);//William Moreira da Silva SOL 229282 PPM 384002 / 229282/16227
                //William Moreira da Silva - SOL 239168

                bancoDeDados.AddInParameter(comando, "PIDTIPOEMPTMO", DbType.Int32, idTipoEmprestimo);
                //bancoDeDados.AddInParameter(comando, "PQUITAVEL", DbType.Int64, quitavel);//William Moreira da Silva SOL 229282 PPM 384002 / 229282/16227
                bancoDeDados.AddInParameter(comando, "PIDTIPOCONTREMPTMO", DbType.Int32, idTipoContrato);

                List<Contrato> listaContratos = new List<Contrato>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Contrato item = new Contrato()
                        {
                            idTipoContratoEmpto = Convert.ToInt32(leitor.GetValue(0)),
                            tcemirenova = Convert.ToInt32(leitor.GetValue(1)),
                            parcelasPagas = Convert.ToInt32(leitor.GetValue(2)),
                            flgObrigatorio = Convert.ToInt32(leitor.GetValue(3))//William Moreira da Silva SOL 229282 PPM 384002 / 229282/16227
                        };
                        listaContratos.Add(item);
                    }
                }
                return listaContratos;
            }
        }


        public int verContratoQuitavel(int tipoContrato, int tipoContratoQuitavel)
        {
            string qry;

            qry = @"SELECT
                NVL(FLGOBRIGATORIO,0) AS FLOBRIGATORIO 
            FROM 
               CM.TIPOCONTRXQUIT 
            WHERE 
                   IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO_P 
               AND IDTIPOCONTRQUIT   =:PIDTIPOCONTRQUIT_P ";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(qry))
            {

                bancoDeDados.AddInParameter(comando, "PIDTIPOCONTREMPTMO_P", DbType.Int32, tipoContrato);
                bancoDeDados.AddInParameter(comando, "PIDTIPOCONTRQUIT_P", DbType.Int32, tipoContratoQuitavel);

                int flgObrigatorio = 0;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        flgObrigatorio = Convert.ToInt32(leitor.GetValue(0));
                    }
                    else
                    {
                        flgObrigatorio = 0;
                    }
                }

                return flgObrigatorio;
            }
        }


        // Thiago Melo SOL 202311 KINTANA 1956671



        // Xavier SOL 178579

        /// <summary>
        /// Verficia se existe suspensão associada ao mutuário.
        /// </summary>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Suspensao"/> com os dados encontrados.</returns>
        public List<Grupoexcepcional> listarGrupoExcepcional()
        {
            string query;

            // Consulta  
            // Consulta
            query = @" select IDGRUPOEXCEPCIONAL, DESCRICAO from CM.GRUPOEXCEPCIONALEMPTMO ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros

                // Popula objeto resultante

                List<Grupoexcepcional> listarGrupoExcepcional = new List<Grupoexcepcional>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        Grupoexcepcional tipo = new Grupoexcepcional()
                        {
                            idgrupoexcepcional = leitor.obterInt(0),
                            descricao = leitor.obterString(1),
                        };

                        listarGrupoExcepcional.Add(tipo);
                    }
                }

                return listarGrupoExcepcional;
            }
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
            string query;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            query = @" SELECT COUNT(CNT.IDCONTRATOEMPTMO)
                      FROM CONTRATOEMPTMO CNT
                      INNER JOIN CM.HMECONCESSAO HME ON CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO
                     WHERE CNT.IDBENEF = :IDMUTUARIO_P 
             AND   NVL(FLGESTORNADO, 0)  = 0 
             AND   CNT.FLGSITUACAO IN ('A', 'P') 
                           AND HME.NATUREZAITEM = 2
             AND  HME.FLGBAIXADO = 0 ";

            //Se for 1, verifica mesmo tipo, senão verifica qualquer tipo
            if (tipoContrato.verificaContratoEfetivado == 1)
            {
                query = query + @" AND CNT.IDTIPOCONTREMPTMO = :IDTIPOCONTRATO_P ";
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
                        quantidadeContrato = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                return (quantidadeContrato > 0);
            }

        }

        // xavier SOL 178579

        // xavier SOL 178579
        /// <summary>
        /// Inclui Grupo Excepcional e IdContrato na estrutura tals
        /// </summary>
        public void incluirContratoEmptmoXExcepcional(Int64 idContrato, int idGrupoExcepcional)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" INSERT INTO CM.CONTRATOEMPTMOXEXCEPCIONAL(
             IDCONTRATOEMPTMO,
             IDGRUPOEXCEPCIONAL ) 
             VALUES( 
             :IDCONTRATOEMPTMO_P, 
             :IDGRUPOEXCEPCIONAL_P ) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);
                bancoDeDados.AddInParameter(comando, "IDGRUPOEXCEPCIONAL_P", DbType.Int32, idGrupoExcepcional);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }
        // xavier SOL 178579


        // SADI SOL213592_Kintana2040335 
        /// <summary>
        /// Inclui idContrato e IdPessoa na estrutura "Suspconcessao"
        /// </summary>
        public void incluirContratoEmptmoSuspconcessao(Int64 idContrato, int idPessoa, string Observacao, int IdTipoSuspensao, int QtdMesesSuspensao, string ModalidadesBloqueio)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = $@" INSERT INTO CM.suspconcessao(
                         IDPESSOA,
                         SUCDATAINICIO,
                         SUCDATAFINAL,
                         SUCMOTIVOSUSP,
                         TRGDTINCLUSAO,
                         TRGUSERINCLUSAO,
                         FLGSTATUS,
                         SUCUSERALTERACAO,
                         SUCDTALTERACAO,
                         FLGPRAZOINDETERMINADO,
                         IDSUCEMPTMO,
                         DESCMODEMP,
                         IDMOTIVOSUSPCONCESSAO,
                         IDCONTRATOEMPTMO ) 
                         VALUES( 
                         :IDPESSOA_P, 
                         TRUNC(SYSDATE), 
                         add_months(TRUNC(SYSDATE),{QtdMesesSuspensao}), 
                         '{Observacao}',
                         --'Bloqueio automático por renegociação de contrato baixado contabilmente devido a perda efetiva.', 
                         SYSDATE, 
                         USER, 
                         'A', 
                         NULL, 
                         NULL, 
                         'N', 
                         seqsuspconcessao.nextval, 
                         '{ModalidadesBloqueio}', 
                         {IdTipoSuspensao},
                         --21,  
                         :IDCONTRATOEMPTMO_P 
                         ) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO_P", DbType.Int64, idContrato);

                bancoDeDados.ExecuteNonQuery(comando);
            }


        }
        // SADI SOL 

        //William Moreira da Silva - SOL 247419
        //BarraProgresso
        /// <summary>
        /// Inseri o id na tabela que ira controlar a barraProgresso
        /// </summary>
        ///<param name="idBarraProgresso">Id do processo que esta sendo realizado</param>
        ///<param name="quantRegras">Quantidade de regras realizadas pelo o processo</param>
        public void incluirIdbarraProgresso(int? idBarraProgresso, string usuario, int quantRegras)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" INSERT INTO CM.TB_EMP_BARRAPROGRESSO 
                 (USUARIO, ID_BARRAPROGRESSO, quantregras, regrascalculadas) 
                 VALUES(:USUARIO_P, :ID_BARRAPROGRESSO_P, :IDQUANTREGRAS_P, 1) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, usuario);
                bancoDeDados.AddInParameter(comando, "ID_BARRAPROGRESSO_P", DbType.Int32, idBarraProgresso);
                bancoDeDados.AddInParameter(comando, "IDQUANTREGRAS_P", DbType.Int32, quantRegras);

                bancoDeDados.ExecuteNonQuery(comando);
            }


        }

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
                string query;

                query = @" INSERT INTO CM.TB_EMP_BARRAPROGRESSO 
                 (USUARIO, quantregras, regrascalculadas) 
                 VALUES(:USUARIO_P, :IDQUANTREGRAS_P, 1) ";

                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {

                    bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, usuario);
                    bancoDeDados.AddInParameter(comando, "IDQUANTREGRAS_P", DbType.Int32, quantRegras);

                    bancoDeDados.ExecuteNonQuery(comando);
                }


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
                string query;

                query = @" UPDATE CM.TB_EMP_BARRAPROGRESSO 
                   SET REGRASCALCULADAS = :REGRASCALCULADAS_P, 
                   QUANTITENS = :QUANTITENS_P,
                                     ITENSCALCULADOS = :ITENSCALCULADOS_P 
                 WHERE usuario LIKE(:usuario_P) ";

                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {

                    bancoDeDados.AddInParameter(comando, "REGRASCALCULADAS_P", DbType.Int32, regras);
                    bancoDeDados.AddInParameter(comando, "QUANTITENS_P", DbType.Int32, quantItens);
                    bancoDeDados.AddInParameter(comando, "ITENSCALCULADOS_P", DbType.Int32, itens);
                    bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);

                    bancoDeDados.ExecuteNonQuery(comando);
                }


            }
        }

        //William Moreira da Silva - SOL 247419
        /// <summary>
        /// 
        /// </summary>
        /// <param name="idBarraProgresso"></param>
        /// <param name="usuario"></param>
        /// <param name="regras"></param>
        /// <param name="quantItens"></param>
        /// <param name="itens"></param>
        public void atualizaBarraProgresso(int? idBarraProgresso, string usuario, int regras, int quantItens, int itens)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" UPDATE CM.TB_EMP_BARRAPROGRESSO 
                   SET REGRASCALCULADAS = :REGRASCALCULADAS_P, 
                   QUANTITENS = :QUANTITENS_P,
                   ITENSCALCULADOS = :ITENSCALCULADOS_P 
                   WHERE usuario LIKE(:usuario_P) AND 
                   ID_BARRAPROGRESSO = :ID_BARRAPROGRESSO_P ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "REGRASCALCULADAS_P", DbType.Int32, regras);
                bancoDeDados.AddInParameter(comando, "QUANTITENS_P", DbType.Int32, quantItens);
                bancoDeDados.AddInParameter(comando, "ITENSCALCULADOS_P", DbType.Int32, itens);
                bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);
                bancoDeDados.AddInParameter(comando, "ID_BARRAPROGRESSO_P", DbType.Int32, idBarraProgresso);

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
            string query;

            // Consulta  
            // Consulta
            query = @" select quantregras, REGRASCALCULADAS, quantitens, ITENSCALCULADOS
                          from CM.TB_EMP_BARRAPROGRESSO
                         WHERE usuario LIKE (:usuario_P) ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);

                // Popula objeto resultante

                List<Int32> regrasItens = new List<int>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(0)));
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(1)));
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(2)));
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(3)));
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
        }

        //William Moreira da Silva - SOL 247419
        /// <summary>
        /// 
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public List<Int32> obterStatusBarraProgresso(string usuario, int? idBarraProgresso)
        {
            string query;

            query = @" select quantregras, REGRASCALCULADAS, NVL(quantitens, 0) quantitens, NVL(ITENSCALCULADOS, 0) ITENSCALCULADOS
                          from CM.TB_EMP_BARRAPROGRESSO
                         WHERE usuario LIKE (:usuario_P) AND 
                   ID_BARRAPROGRESSO = :ID_BARRAPROGRESSO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Parâmetros
                bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);
                bancoDeDados.AddInParameter(comando, "ID_BARRAPROGRESSO_P", DbType.Int32, idBarraProgresso);

                // Popula objeto resultante

                List<Int32> regrasItens = new List<int>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(0)));
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(1)));
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(2)));
                        regrasItens.Add(Convert.ToInt32(leitor.GetValue(3)));
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
        }

        /// <summary>
        /// Deleta a instancia da barra de progresso
        /// </summary>
        /// <param name="usuario">Usúario que esta fazendo o processo</param>
        public void deletaStatusBarraProgresso(string usuario)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" DELETE CM.TB_EMP_BARRAPROGRESSO 
             WHERE usuario LIKE(:usuario_P) ";

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                bancoDeDados.AddInParameter(comando, "usuario_P", DbType.String, usuario);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }
        //William Moreira da Silva - barraprogresso

        //MARCIO SANCHES SPINOSA - SOL 204760 INI

        public List<long> obterContratoEmptmo(int idMutuario, int idBeneficiario, DateTime dataCredito)
        {

            string query;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            // Consulta
            query = $@" SELECT CON.IDCONTRATOEMPTMO, CON.IDTIPOCONTREMPTMO,
                           NVL(PCK_EMPRESTIMO.FN_VALOREMABERTO_CONCESSAO(CON.IDCONTRATOEMPTMO, TO_DATE('{dataCredito:dd/MM/yyyy}', 'DD/MM/YYYY'), 7),0) VLREMABERTO
                        FROM CM.CONTRATOEMPTMO CON
                        WHERE CON.IDPESSOA = {idMutuario}
                        AND CON.IDBENEF = {idBeneficiario}       
                        AND CON.FLGSITUACAO NOT IN ('C', 'Q') ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                // Parâmetros
                //bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int64, idMutuario);
                //bancoDeDados.AddInParameter(comando, "IDBENEF_P", DbType.Int64, idBeneficiario);
                //bancoDeDados.AddInParameter(comando, "HMEDATA_P", DbType.Date, dataCredito);
                //bancoDeDados.AddInParameter(comando, "HMEDATA1_P", DbType.Date, dataCredito);
                //bancoDeDados.AddInParameter(comando, "HMEDATA2_P", DbType.Date, dataCredito);
                //bancoDeDados.AddInParameter(comando, "IDPESSOA1_P", DbType.Int64, idMutuario);
                //bancoDeDados.AddInParameter(comando, "IDBENEF1_P", DbType.Int64, idBeneficiario);

                List<long> contratoEmptmo = new List<long>();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {

                    while (leitor.Read())
                    {
                        contratoEmptmo.Add(Convert.ToInt64(leitor.GetValue(0)));
                    }

                }

                return contratoEmptmo;
            }
        }


        public double existemItensEmAberto(long idcontratoemptmo, bool usaData, DateTime dataCredito, bool usaMes, int ano, int mes)
        {
            string query;

            //William Moreira da Silva - SOL 253185 - Segregação HISTMOVEMPTMO

            // Consulta
            query = @" SELECT 
             HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO, 
              HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, 
             HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO 
             FROM 
             HISTMOVEMPTMO HME 
             WHERE 
             HME.IDCONTRATOEMPTMO         = :IDCONTRATOEMPTMO_P 
             AND HME.HMETIPOMOV           NOT IN (0, 5, 8) 
             AND HME.FLGBAIXADO           = 0 
             AND HME.HMEDATAEFETIVA       IS NULL 
             AND HME.HMEVLREFETIVO        IS NULL 
             AND HME.HMEVLRPREVISTO       <> 0 
             AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) 
             AND NVL(HME.FLGESTORNADO, 0) = 0 
             AND NVL(HME.FLGSUSPENSAO, 0) = 0 
             AND NVL(HME.FLGQUITADO, 0)   = 0 AND NVL(HME.FLGABONADO, 0)   = 0 ";

            if (usaData)
            {
                query = query + @" AND (:FILTRODATA_P IS NULL OR (:FILTRODATA1_P IS NOT NULL AND HME.HMEDATAPREVISTA + 7 < :HMEDATAVENCTO_P)) ";
            }

            if (usaMes)
            {
                //William Moreira da Silva 241475
                //query = query + @" AND (:FILTROMES_P IS NULL OR (:FILTROMES1_P  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'0000')) || trim(TO_CHAR(HME.HMEMESCOBRANCA,'00')) < :HMEANOCOBRANCA1_P || :HMEMESCOBRANCA2_P))) ";
                query = query + @" AND (:FILTROMES_P IS NULL OR (:FILTROMES1_P  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,'0000')) || trim(TO_CHAR(HME.HMEMESCOMPETENCIA,'00')) < :HMEANOCOBRANCA1_P || :HMEMESCOBRANCA2_P))) ";
                //William Moreira da Silva 241475
            }

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

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
                        vlrResult = vlrResult + (double)leitor.obterDecimal(6);
                    }
                }

                return vlrResult;
            }
        }
        //MARCIO SANCHES SPINOSA - SOL 204760 FIM

        //William Moreira da Silva - SOL 199759 KINTANA

        public int? consultarUltimoIdTabela(string nomeSeqTabela)
        {
            StringBuilder query = new StringBuilder();

            int? IdSequence = 0;

            // Consulta
            query.Append("SELECT seq" + nomeSeqTabela + ".NEXTVAL AS IDCALCULO FROM DUAL ");

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query.ToString()))
            {

                // Executa consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        IdSequence = leitor.obterValorInteiro(0);
                    }
                }

                return IdSequence;
            }
        }

        /// <summary>
        /// Inclui endereço da pessoa
        /// </summary>
        public Int32 IncluirEndereco(Endereco endPessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            //StringBuilder query = new StringBuilder();
            string query;

            query = @" insert into CM.ENDPESS 
             (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, 
             CIDADE, NOME, CEP, TIPOENDERECO) 
             values 
             (:IDPESSOA_P, :IDENDERECO_P, :IDCIDADES_P, :LOGRADOURO_P, :NUMERO_P, :COMPLEMENTO_P, 
             :BAIRRO_P, :CIDADE_P, :NOME_P, :CEP_P, :TIPOENDERECO) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                int? idEndereco = 0;
                idEndereco = consultarUltimoIdTabela("ENDPESS");

                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, endPessoa.idPessoa);
                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, idEndereco);
                if (endPessoa.cidade.idCidade > 0)
                    bancoDeDados.AddInParameter(comando, "IDCIDADES_P", DbType.Int64, endPessoa.cidade.idCidade);
                else
                    bancoDeDados.AddInParameter(comando, "IDCIDADES_P", DbType.Int64, null);
                bancoDeDados.AddInParameter(comando, "LOGRADOURO_P", DbType.String, endPessoa.logradouro);
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.String, endPessoa.numero);
                bancoDeDados.AddInParameter(comando, "COMPLEMENTO_P", DbType.String, endPessoa.complemento);
                bancoDeDados.AddInParameter(comando, "BAIRRO_P", DbType.String, endPessoa.bairro);
                if (endPessoa.cidade.idCidade > 0)
                    bancoDeDados.AddInParameter(comando, "CIDADE_P", DbType.Int32, endPessoa.cidade.idCidade);
                else
                    bancoDeDados.AddInParameter(comando, "CIDADE_P", DbType.Int32, null);
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, endPessoa.local);
                bancoDeDados.AddInParameter(comando, "CEP_P", DbType.String, endPessoa.cep);
                bancoDeDados.AddInParameter(comando, "TIPOENDERECO", DbType.String, endPessoa.tipoEndereco);

                bancoDeDados.ExecuteNonQuery(comando);

                return Int32.Parse(idEndereco.ToString());
            }
        }

        /// <summary>
        /// Inclui endereço da pessoa
        /// </summary>
        public void alterarEndereco(Endereco endPessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            //StringBuilder query = new StringBuilder();
            string query;

            query = @" update CM.ENDPESS
            set 
            IDPESSOA = :IDPESSOA_P, 
            IDENDERECO = :IDENDERECO_P, 
            IDCIDADES = :IDCIDADES_P, 
            LOGRADOURO = :LOGRADOURO_P, 
            NUMERO = :NUMERO_P, 
            COMPLEMENTO = :COMPLEMENTO_P, 
            BAIRRO = :BAIRRO_P, 
            CIDADE = :CIDADE_P, 
            NOME = :NOME_P, 
            CEP = :CEP_P, 
            TIPOENDERECO = :TIPOENDERECO_P 
            where 
            IDENDERECO = :IDENDERECO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, endPessoa.idPessoa);
                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, endPessoa.idEndereco);

                if (endPessoa.cidade.idCidade > 0)
                    bancoDeDados.AddInParameter(comando, "IDCIDADES_P", DbType.Int64, endPessoa.cidade.idCidade);
                else
                    bancoDeDados.AddInParameter(comando, "IDCIDADES_P", DbType.Int64, null);

                bancoDeDados.AddInParameter(comando, "LOGRADOURO_P", DbType.String, endPessoa.logradouro);
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.String, endPessoa.numero);
                bancoDeDados.AddInParameter(comando, "COMPLEMENTO_P", DbType.String, endPessoa.complemento);
                bancoDeDados.AddInParameter(comando, "BAIRRO_P", DbType.String, endPessoa.bairro);

                if (endPessoa.cidade.idCidade > 0)
                    bancoDeDados.AddInParameter(comando, "CIDADE_P", DbType.Int32, endPessoa.cidade.idCidade);
                else
                    bancoDeDados.AddInParameter(comando, "CIDADE_P", DbType.Int32, null);

                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, endPessoa.local);
                bancoDeDados.AddInParameter(comando, "CEP_P", DbType.String, endPessoa.cep);
                bancoDeDados.AddInParameter(comando, "TIPOENDERECO_P", DbType.String, endPessoa.tipoEndereco);

                bancoDeDados.ExecuteNonQuery(comando);
            }


        }

        /// <summary>
        /// Excluir endereço da pessoa
        /// </summary>
        public void excluirEndereco(Int32 idEndereco)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;


            query = @" delete from CM.ENDPESS where  IDENDERECO = :IDENDERECO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, idEndereco);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Inclui a pessoa
        /// </summary>
        public void incluirDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.DOCPESSOA 
             (IDDOCUMENTO, IDPESSOA, IDESTADO, NUMDOCUMENTO, ORGAO, 
             DATAEMISSAO, DATAVALIDADE) 
             values 
             (:IDDOCUMENTO_P, :IDPESSOA_P, :IDESTADO_P, :NUMDOCUMENTO_P,  
             :ORGAO_P, :DATAEMISSAO_P, :DATAVALIDADE_P ) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                Int32 iExisteTipoDocInserido = 0;
                foreach (var item in documentoPessoa)
                {
                    iExisteTipoDocInserido = this.ExisteTipoDocInserido(item.idDocumento, idPessoa);
                    if (iExisteTipoDocInserido == 0)
                    {
                        bancoDeDados.AddInParameter(comando, "IDDOCUMENTO_P", DbType.Int32, item.idDocumento);
                        bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                        bancoDeDados.AddInParameter(comando, "IDESTADO_P", DbType.Int32, item.uf.idEstado);

                        if (!string.IsNullOrEmpty(item.numDocumento.ToString()))
                        {
                            bancoDeDados.AddInParameter(comando, "NUMDOCUMENTO_P", DbType.String, item.numDocumento);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "NUMDOCUMENTO_P", DbType.String, null);
                        }

                        if (!string.IsNullOrEmpty(item.orgao))
                        {
                            bancoDeDados.AddInParameter(comando, "ORGAO_P", DbType.String, null);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "ORGAO_P", DbType.String, item.orgao);
                        }


                        if (!string.IsNullOrEmpty(item.dataEmissao.ToString()))
                        {
                            bancoDeDados.AddInParameter(comando, "DATAEMISSAO_P", DbType.DateTime, item.dataEmissao);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "DATAEMISSAO_P", DbType.DateTime, null);
                        }

                        if (!string.IsNullOrEmpty(item.dataValidade.ToString()))
                        {
                            bancoDeDados.AddInParameter(comando, "DATAVALIDADE_P", DbType.DateTime, item.dataValidade);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "DATAVALIDADE_P", DbType.DateTime, null);
                        }
                    }
                }
                if (documentoPessoa.Count > 0)
                {
                    bancoDeDados.ExecuteNonQuery(comando);
                }
            }
        }

        public Int32 ExisteTipoDocInserido(Int32 idTipoDocumento, Int32 idPessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @"  select count(1) from  CM.DOCPESSOA 
              where IDDOCUMENTO = :IDDOCUMENTO_P 
              and IDPESSOA = :IDPESSOA_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDDOCUMENTO_P", DbType.Int32, idTipoDocumento);
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                Int32 iExisteTipoDoc = 0;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        iExisteTipoDoc = Convert.ToInt32(leitor.GetValue(0));
                    }
                }

                return iExisteTipoDoc;
            }

        }
        #endregion

        #region Atualização

        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - início
        public void IncluirBloqueioConcessaoAcordoJudicial(Contrato contrato, long ContratoConcedido)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            string query = @" INSERT INTO CM.SUSPCONCESSAO(
                                    IDPESSOA,
                                    SUCDATAINICIO,
                                    SUCDATAFINAL,
                                    SUCMOTIVOSUSP,
                                    FLGSTATUS,
                                    FLGPRAZOINDETERMINADO,
                                    IDSUCEMPTMO,
                                    IDMOTIVOSUSPCONCESSAO,
                                    IDCONTRATOEMPTMO
                                ) 
                                VALUES
                                (
                                :IDPESSOA,
                                :SUCDATAINICIO,
                                :SUCDATAFINAL,
                                :SUCMOTIVOSUSP,
                                :FLGSTATUS,
                                :FLGPRAZOINDETERMINADO,
                                :IDSUCEMPTMO,
                                :IDMOTIVOSUSPCONCESSAO,
                                :IDCONTRATOEMPTMO
                                )
                                ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                DateTime DataUltimaParcela = DateTime.MinValue;

                if (contrato.dataPrimeiraParcela.HasValue)
                {
                    DataUltimaParcela = (DateTime)contrato.dataPrimeiraParcela;
                    DataUltimaParcela = DataUltimaParcela.AddMonths(contrato.totalParcelas);
                }

                string MotivoSuspensao = "Mutuário (a) possui contrato de empréstimo com acordo judicial vigente, homologado nos autos do processo. A solicitação de Concessão/Novação deverá ser avaliada previamente pela COPART.";

                bancoDeDados.AddInParameter(comando, "IDPESSOA", DbType.Int32, contrato.mutuario.id);
                bancoDeDados.AddInParameter(comando, "SUCDATAINICIO", DbType.DateTime, contrato.dataCredito);
                bancoDeDados.AddInParameter(comando, "SUCDATAFINAL", DbType.String, contrato.dataPrimeiraParcela.HasValue ? DataUltimaParcela.ToString("dd/MM/yyyy") : null);
                bancoDeDados.AddInParameter(comando, "SUCMOTIVOSUSP", DbType.String, MotivoSuspensao);
                bancoDeDados.AddInParameter(comando, "FLGSTATUS", DbType.String, "A");
                bancoDeDados.AddInParameter(comando, "FLGPRAZOINDETERMINADO", DbType.String, "N");
                bancoDeDados.AddInParameter(comando, "IDSUCEMPTMO", DbType.Int32, UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQSUSPCONCESSAO"));
                bancoDeDados.AddInParameter(comando, "IDMOTIVOSUSPCONCESSAO", DbType.Int32, 23);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.String, ContratoConcedido);
                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        public int obterEventoJudicial()
        {
            Database bancoDeDados = this.obterBancoDeDados();

            string query = "SELECT IDEVENTOJUDICIAL FROM CM.PARAMEMPTMO";
            string IdEventoJudicial = "";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                // Recupera o evento judicial
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        IdEventoJudicial = leitor["IDEVENTOJUDICIAL"].ToString();
                    }
                }

                return String.IsNullOrEmpty(IdEventoJudicial) ? 0 : int.Parse(IdEventoJudicial);
            }
        }

        //INSERIR_EVENTO_COBRANCA(pIdContrEmptmo,
      	 //						 33,
      	 //						 'Evento automático por adesão à renegociação especial Reg/Replan.');

        public int IncluirEventoDeCobranca(double NumeroContrato, DateTime DataOperacao, int IdTipoEvento, string Observacao)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"INSERT INTO CM.HISTEVENTOCOBEMPTMO (
                    IDHISTEVENTOCOBEMPTMO,
                    IDTIPOEVENTOCOBEMPTMO,
                    IDCONTRATOEMPTMO,
                    DATAEVENTOCOB,
                    OBSCOB
                    )
                    VALUES
                    (
                    :IDHISTEVENTOCOBEMPTMO,
                    :IDTIPOEVENTOCOBEMPTMO,
                    :IDCONTRATOEMPTMO,
                    :DATAEVENTOCOB,
                    :OBSCOB
                    )";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                //string obsCob = "Evento inserido automaticamente por uma concessão por acordo judicial.";

                int IdHistEventoCobEmptmo = UtilidadesAcessoDados.obterValorSequencia(bancoDeDados, "SEQHISTEVENTOCOBEMPTMO");

                bancoDeDados.AddInParameter(comando, "IDHISTEVENTOCOBEMPTMO", DbType.Int32, IdHistEventoCobEmptmo);
                //bancoDeDados.AddInParameter(comando, "IDTIPOEVENTOCOBEMPTMO", DbType.Int32, this.obterEventoJudicial());
                bancoDeDados.AddInParameter(comando, "IDTIPOEVENTOCOBEMPTMO", DbType.Int32, IdTipoEvento);
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, NumeroContrato);
                bancoDeDados.AddInParameter(comando, "DATAEVENTOCOB", DbType.String, DataOperacao.ToString("dd/MM/yyyy"));
                bancoDeDados.AddInParameter(comando, "OBSCOB", DbType.String, Observacao);
                bancoDeDados.ExecuteNonQuery(comando);

                return IdHistEventoCobEmptmo;
            }
        }

        public List<long> ConsultarItensDeInadimplencia(long numeroContrato, DateTime dataCredito)
        {
            List<long> ListaIdHistMovEmptmo = new List<long>();

            Database bancoDeDados = this.obterBancoDeDados();

            string query = @"SELECT hp.idhistmovemptmo
                               FROM CM.hmeprestacao hp
                              WHERE hp.idcontratoemptmo = :IDCONTRATOEMPTMO
                                AND hp.dataquitabonoestorno = :DATACREDITO
                                AND hp.iditememptmo IN (13,99)
                                AND hp.vlrefetivo IS NULL
                                AND hp.dataefetiva IS NULL
                                AND hp.flgquitabonoestorno = 1";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "DATACREDITO", DbType.DateTime, dataCredito);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        ListaIdHistMovEmptmo.Add(Convert.ToInt64(leitor.GetValue(0)));
                    }
                }

                return ListaIdHistMovEmptmo;
            }
        }

        public void InserirItensEmAbertoAoEventoJudicial(List<long> ListaIdHistMovEmptmo, int IdHistEventoCobEmptmo)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            string query = "INSERT INTO CM.EVENTOCOBXHISTMOVEMPTMO ( " +
                           "    IDHISTEVENTOCOBEMPTMO, " +
                           "    IDHISTMOVEMPTMO " +
                           "    ) " +
                           " VALUES " +
                           "     ( " +
                           "     :IDHISTEVENTOCOBEMPTMO, " +
                           "     :IDHISTMOVEMPTMO " +
                                ")";


            foreach (long id in ListaIdHistMovEmptmo)
            {
                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {
                    bancoDeDados.AddInParameter(comando, "IDHISTEVENTOCOBEMPTMO", DbType.Int32, IdHistEventoCobEmptmo);
                    bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO", DbType.Int64, id);
                    bancoDeDados.ExecuteNonQuery(comando);
                }
            }

        }

        // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - fim

        /// <summary>
        /// alterar doc da pessoa
        /// </summary>
        public void alterarDocPessoa(List<Documento> documentoPessoa, Int32 idPessoa)
        {
            Int32 iExisteIdDocumento = 0;
            Int32 iNaoExisteIdDocumento = 0;

            foreach (var item in documentoPessoa)
            {
                Database bancoDeDados = this.obterBancoDeDados();
                string query;

                query = @" update CM.DOCPESSOA set
                 IDESTADO = :IDESTADO_P, 
                 NUMDOCUMENTO = :NUMDOCUMENTO_P, 
                 ORGAO = :ORGAO_P, 
                 DATAEMISSAO = :DATAEMISSAO_P, 
                 DATAVALIDADE = :DATAVALIDADE_P 
                 where 
                 IDDOCUMENTO = :IDDOCUMENTO_P and 
                 IDPESSOA = :IDPESSOA_P ";

                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {

                    iExisteIdDocumento = ExisteTipoDocInserido(item.idDocumento, idPessoa);
                    if (iExisteIdDocumento > 0)
                    {
                        bancoDeDados.AddInParameter(comando, "IDDOCUMENTO_P", DbType.Int32, item.idDocumento);
                        bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                        bancoDeDados.AddInParameter(comando, "IDESTADO_P", DbType.Int32, item.uf.idEstado);

                        if (!string.IsNullOrEmpty(item.numDocumento.ToString()))
                        {
                            bancoDeDados.AddInParameter(comando, "NUMDOCUMENTO_P", DbType.String, item.numDocumento);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "NUMDOCUMENTO_P", DbType.String, null);
                        }
                        bancoDeDados.AddInParameter(comando, "ORGAO_P", DbType.String, item.orgao);

                        if (!string.IsNullOrEmpty(item.dataEmissao.ToString()))
                        {
                            bancoDeDados.AddInParameter(comando, "DATAEMISSAO_P", DbType.DateTime, item.dataEmissao);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "DATAEMISSAO_P", DbType.DateTime, null);
                        }
                        if (!string.IsNullOrEmpty(item.dataValidade.ToString()))
                        {
                            bancoDeDados.AddInParameter(comando, "DATAVALIDADE_P", DbType.DateTime, item.dataValidade);
                        }
                        else
                        {
                            bancoDeDados.AddInParameter(comando, "DATAVALIDADE_P", DbType.DateTime, null);
                        }

                        bancoDeDados.ExecuteNonQuery(comando);
                    }
                    else
                    {
                        iNaoExisteIdDocumento = 1;
                    }

                    if (iNaoExisteIdDocumento > 0)
                    {
                        this.incluirDocPessoa(documentoPessoa.FindAll(x => x.idDocumento == item.idDocumento), idPessoa);
                    }
                }
            }
        }

        /// <summary>
        /// Inclui a pessoa
        /// </summary>
        public Int32 incluirPessoa(List<Pessoa> pessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.PESSOA  
            (IDPESSOA, NOME, TIPO, RAZAOSOCIAL, NUMDOCUMENTO,  
            IDDOCUMENTO, HOMEPAGE, EMAIL ";

            if (pessoa[0].idGrupo > 0)
            {

                query = query + @", IDGRUPO ";
            };
            if (pessoa[0].idEndComercial > 0)
            {
                query = query + @", IDENDCOMERCIAL ";
            };
            if (pessoa[0].idEndResidencial > 0)
            {
                query = query + @", IDENDRESIDENCIAL  ";
            };
            if (pessoa[0].idEndEntrega > 0)
            {
                query = query + @", IDENDENTREGA ";
            };
            if (pessoa[0].idEndCobranca > 0)
            {
                query = query + @", IDENDCOBRANCA ";
            };
            if (pessoa[0].idEndCorresp > 0)
            {
                query = query + @", IDENDCORRESP ";
            };
            if (pessoa[0].idModuloRespon > 0)
            {
                query = query + @", IDMODULORESPON ";
            };

            query = query + @" ) 
             values  
             (:IDPESSOA_P, :NOME_P, :TIPO_P, :RAZAOSOCIAL_P, :NUMDOCUMENTO_P,   
             :IDDOCUMENTO_P, :HOMEPAGE_P, :EMAIL_P ";

            if (pessoa[0].idGrupo > 0)
            {
                query = query + @", :IDGRUPO_P ";
            };
            if (pessoa[0].idEndComercial > 0)
            {
                query = query + @", :IDENDCOMERCIAL_P ";
            };
            if (pessoa[0].idEndResidencial > 0)
            {
                query = query + @", :IDENDRESIDENCIAL_P  ";
            };
            if (pessoa[0].idEndEntrega > 0)
            {
                query = query + @", :IDENDENTREGA_P ";
            };
            if (pessoa[0].idEndCobranca > 0)
            {
                query = query + @", :IDENDCOBRANCA_P ";
            };
            if (pessoa[0].idEndCorresp > 0)
            {
                query = query + @", :IDENDCORRESP_P ";
            };
            if (pessoa[0].idModuloRespon > 0)
            {
                query = query + @", :IDMODULORESPON_P ";
            };

            query = query + @" ) ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                int? idPessoa = consultarUltimoIdTabela("PESSOA");

                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, idPessoa);
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, pessoa[0].nome.ToUpper());
                bancoDeDados.AddInParameter(comando, "TIPO_P", DbType.String, pessoa[0].tipo);
                bancoDeDados.AddInParameter(comando, "RAZAOSOCIAL_P", DbType.String, pessoa[0].razaoSocial.ToUpper());
                bancoDeDados.AddInParameter(comando, "NUMDOCUMENTO_P", DbType.String, pessoa[0].numDocumento);
                bancoDeDados.AddInParameter(comando, "IDDOCUMENTO_P", DbType.Int32, pessoa[0].idDocumento);
                bancoDeDados.AddInParameter(comando, "EMAIL_P", DbType.String, pessoa[0].email);
                bancoDeDados.AddInParameter(comando, "HOMEPAGE_P", DbType.String, pessoa[0].homePage);
                if (pessoa[0].idGrupo > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDGRUPO_P", DbType.Int32, pessoa[0].idGrupo);
                };

                if (pessoa[0].idEndComercial > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDCOMERCIAL_P", DbType.Int32, pessoa[0].idEndComercial);
                };

                if (pessoa[0].idEndResidencial > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDRESIDENCIAL_P", DbType.Int32, pessoa[0].idEndResidencial);
                };

                if (pessoa[0].idEndEntrega > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDENTREGA_P", DbType.Int32, pessoa[0].idEndEntrega);
                };

                if (pessoa[0].idEndCobranca > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDCOBRANCA_P", DbType.Int32, pessoa[0].idEndCobranca);
                };

                if (pessoa[0].idEndCorresp > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDCORRESP_P", DbType.Int64, pessoa[0].idEndCorresp);
                };

                if (pessoa[0].idModuloRespon > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDMODULORESPON_P", DbType.Int32, pessoa[0].idModuloRespon);
                };

                bancoDeDados.ExecuteNonQuery(comando);

                comando.Connection.Close();
                comando.Dispose();

                if (pessoa[0].tipo == "F")
                {

                    Database bancoDeDadosPessoaFisica = this.obterBancoDeDados();
                    string queryPessoaFisica;

                    queryPessoaFisica = @" insert into CM.PESSOAFISICA
                 (IDPESSOA) 
                 values 
                 (:IDPESSOA_P) ";


                    using (DbCommand comandoPessoaFisica = bancoDeDadosPessoaFisica.obterComandoPorSql(queryPessoaFisica))
                    {

                        bancoDeDadosPessoaFisica.AddInParameter(comandoPessoaFisica, "IDPESSOA_P", DbType.Int32, idPessoa);

                        bancoDeDadosPessoaFisica.ExecuteNonQuery(comandoPessoaFisica);

                        comandoPessoaFisica.Connection.Close();
                        comandoPessoaFisica.Dispose();
                    }
                }

                return Int32.Parse(idPessoa.ToString());
            }
        }

        /// <summary>
        /// Alterar a pessoa
        /// </summary>
        public void alterarPessoa(List<Pessoa> pessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" update CM.PESSOA set
             NOME = :NOME_P, TIPO = :TIPO_P, RAZAOSOCIAL = :RAZAOSOCIAL_P, NUMDOCUMENTO = :NUMDOCUMENTO_P, 
             IDDOCUMENTO = :IDDOCUMENTO_P, EMAIL = :EMAIL_P,  HOMEPAGE = :HOMEPAGE_P ";

            if (pessoa[0].idGrupo > 0)
            {
                query = query + @", IDGRUPO = :IDGRUPO_P";
            }

            if (pessoa[0].idEndComercial > 0)
            {
                query = query + @", IDENDCOMERCIAL = :IDENDCOMERCIAL_P ";
            }
            else if (pessoa[0].idEndComercial == int.MinValue)
            {
                query = query + @", IDENDCOMERCIAL = NULL ";
            }

            if (pessoa[0].idEndResidencial > 0)
            {
                query = query + @", IDENDRESIDENCIAL = :IDENDRESIDENCIAL_P ";
            }
            else if (pessoa[0].idEndResidencial == int.MinValue)
            {
                query = query + @", IDENDRESIDENCIAL = NULL ";
            }

            if (pessoa[0].idEndEntrega > 0)
            {
                query = query + @", IDENDENTREGA = :IDENDENTREGA_P ";
            }
            else if (pessoa[0].idEndEntrega == int.MinValue)
            {
                query = query + @", IDENDENTREGA = NULL ";
            }

            if (pessoa[0].idEndCobranca > 0)
            {
                query = query + @", IDENDCOBRANCA = :IDENDCOBRANCA_P ";
            }
            else if (pessoa[0].idEndCobranca == int.MinValue)
            {
                query = query + @", IDENDCOBRANCA = NULL ";
            }

            if (pessoa[0].idEndCorresp > 0)
            {
                query = query + @", IDENDCORRESP = :IDENDCORRESP_P ";
            }
            else if (pessoa[0].idEndCorresp == int.MinValue)
            {
                query = query + @", IDENDCORRESP = NULL ";
            }

            if (pessoa[0].idModuloRespon > 0)
            {
                query = query + @", IDMODULORESPON = :IDMODULORESPON_P ";
            };

            query = query + @" where IDPESSOA = :IDPESSOA_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {                
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, pessoa[0].nome);
                bancoDeDados.AddInParameter(comando, "TIPO_P", DbType.String, pessoa[0].tipo);
                bancoDeDados.AddInParameter(comando, "RAZAOSOCIAL_P", DbType.String, String.IsNullOrEmpty(pessoa[0].razaoSocial) ? pessoa[0].nome : pessoa[0].razaoSocial);
                bancoDeDados.AddInParameter(comando, "NUMDOCUMENTO_P", DbType.String, pessoa[0].numDocumento);
                bancoDeDados.AddInParameter(comando, "IDDOCUMENTO_P", DbType.Int32, pessoa[0].idDocumento);
                bancoDeDados.AddInParameter(comando, "EMAIL_P", DbType.String, pessoa[0].email);
                bancoDeDados.AddInParameter(comando, "HOMEPAGE_P", DbType.String, pessoa[0].homePage);
                if (pessoa[0].idGrupo > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDGRUPO_P", DbType.Int32, pessoa[0].idGrupo);
                };

                if (pessoa[0].idEndComercial > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDCOMERCIAL_P", DbType.Int32, pessoa[0].idEndComercial);
                };

                if (pessoa[0].idEndResidencial > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDRESIDENCIAL_P", DbType.Int32, pessoa[0].idEndResidencial);
                };

                if (pessoa[0].idEndEntrega > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDENTREGA_P", DbType.Int32, pessoa[0].idEndEntrega);
                };

                if (pessoa[0].idEndCobranca > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDCOBRANCA_P", DbType.Int32, pessoa[0].idEndCobranca);
                };

                if (pessoa[0].idEndCorresp > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDENDCORRESP_P", DbType.Int64, pessoa[0].idEndCorresp);
                };

                if (pessoa[0].idModuloRespon > 0)
                {
                    bancoDeDados.AddInParameter(comando, "IDMODULORESPON_P", DbType.Int32, pessoa[0].idModuloRespon);
                };
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, pessoa[0].idPessoa);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// excluir a pessoa
        /// </summary>
        public void excluirPessoa(List<Pessoa> pessoa)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" delete from CM.PESSOA  where  IDPESSOA = :IDPESSOA_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, pessoa[0].idPessoa);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Inclui o Avalista
        /// </summary>
        public void incluirNovoAvalista(List<Avalistas> avalista)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.AVALISTA 
             (IDAVALISTA, ORIGEMREND, RENDACOMP, MARGEMCONSIG) 
             values 
             (:IDAVALISTA_P, :ORIGEMREND_P, :RENDACOMP_P, :MARGEMCONSIG_P) ";


            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, avalista[0].id);
                bancoDeDados.AddInParameter(comando, "ORIGEMREND_P", DbType.String, avalista[0].nome);
                bancoDeDados.AddInParameter(comando, "RENDACOMP_P", DbType.Double, avalista[0].renda);
                bancoDeDados.AddInParameter(comando, "MARGEMCONSIG_P", DbType.Double, avalista[0].margem);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Alterar o Avalista
        /// </summary>
        public void alterarNovoAvalista(List<Avalistas> avalista)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" update CM.AVALISTA set 
             ORIGEMREND = :ORIGEMREND_P, 
             RENDACOMP = :RENDACOMP_P, 
             MARGEMCONSIG = :MARGEMCONSIG_P 
             where IDAVALISTA = :IDAVALISTA_P ";


            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, avalista[0].id);
                bancoDeDados.AddInParameter(comando, "ORIGEMREND_P", DbType.String, avalista[0].nome);
                bancoDeDados.AddInParameter(comando, "RENDACOMP_P", DbType.Double, avalista[0].renda);
                bancoDeDados.AddInParameter(comando, "MARGEMCONSIG_P", DbType.Double, avalista[0].margem);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Excluir o Avalista
        /// </summary>
        public void excluirNovoAvalista(Int32 idAvalista)
        {
            Database bancoDeDadosCav = this.obterBancoDeDados();
            string queryCav;

            queryCav = @" delete from CM.CONTRATOXAVALISTA where IDAVALISTA = :IDAVALISTA_P ";

            using (DbCommand comandoCav = bancoDeDadosCav.obterComandoPorSql(queryCav))
            {

                bancoDeDadosCav.AddInParameter(comandoCav, "IDAVALISTA_P", DbType.Int32, idAvalista);

                bancoDeDadosCav.ExecuteNonQuery(comandoCav);
            }


            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" delete from CM.AVALISTA where IDAVALISTA = :IDAVALISTA_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDAVALISTA_P", DbType.Int32, idAvalista);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Inclui telefone
        /// </summary>
        public int? incluirTelefone(Telefone telefone)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.TELENDPESS 
             (IDTELEFONE, IDENDERECO, DDI, DDD, NUMERO, TIPO) 
             values 
             (:IDTELEFONE_P, :IDENDERECO_P, :DDI_P, :DDD_P, :NUMERO_P, :TIPO_P) ";


            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                int? idTelefone = consultarUltimoIdTabela("TELENDPESS");

                bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.Int32, idTelefone);
                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, telefone.idEndereco);
                bancoDeDados.AddInParameter(comando, "DDI_P", DbType.Int32, telefone.ddi);
                bancoDeDados.AddInParameter(comando, "DDD_P", DbType.Int32, telefone.ddd);
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int32, telefone.numero);
                bancoDeDados.AddInParameter(comando, "TIPO_P", DbType.String, telefone.tipo);

                bancoDeDados.ExecuteNonQuery(comando);


                return idTelefone;
            }
        }

        /// <summary>
        /// alterar telefone
        /// </summary>
        public void alterarTelefone(Telefone telefone)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            TelContato telContato = new TelContato()
            {
                id = telefone.idTelContato,
                idContato = telefone.idContato,
                idTelefone = telefone.idTelefone
            };

            query = @" update CM.TELENDPESS set
             IDTELEFONE = :IDTELEFONE_P, 
             IDENDERECO = :IDENDERECO_P, 
             DDI = :DDI_P, 
             DDD = :DDD_P, 
             NUMERO = :NUMERO_P, 
             TIPO = :TIPO_P 
             where 
             IDTELEFONE = :IDTELEFONE_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.Int32, telefone.idTelefone);
                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, telefone.idEndereco);
                bancoDeDados.AddInParameter(comando, "DDI_P", DbType.Int32, telefone.ddi);
                bancoDeDados.AddInParameter(comando, "DDD_P", DbType.Int32, telefone.ddd);
                bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int32, telefone.numero);
                bancoDeDados.AddInParameter(comando, "TIPO_P", DbType.String, telefone.tipo);

                bancoDeDados.ExecuteNonQuery(comando);
            }


            if (telContato.id != 0)
            {
                if (telContato.idContato == 0 || telContato.idTelefone == 0)
                {
                    this.excluirTelContato(telContato.id);
                }
                else
                {
                    this.alterarTelContato(telContato);
                }
            }
            else
            {
                if (telContato.idContato != 0 && telContato.idTelefone != 0)
                {
                    this.incluirTelContato(telContato);
                }
            }
        }

        /// <summary>
        /// Exclui os telefones associados ao endereço
        /// Alinhado com Bruno Santos e Saulo no dia 26/12/2013, pois apresentava erro ao excluir um endereço que tinha um telefone associado
        /// </summary>
        /// <param name="idEndereco"></param>
        public void excluirTelefoneEndereco(Int32 idEndereco)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" delete from CM.TELENDPESS where IDENDERECO = :IDENDERECO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, idEndereco);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// excluir telefone
        /// </summary>
        public void excluirTelefone(Telefone telefone)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            int idTelContato = telefone.idTelContato;

            this.excluirTelContatoPorId(telefone.idTelefone, 0);

            query = @" delete from CM.TELENDPESS where  IDTELEFONE = :IDTELEFONE_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.Int32, telefone.idTelefone);

                bancoDeDados.ExecuteNonQuery(comando);
            }


        }

        /// <summary>
        /// alterar contato
        /// </summary>
        public int? incluirContato(Contato contato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.CONTATOPESS 
             (IDCONTATO, IDENDERECO, NOME, EMAIL, CARGO, SETOR, NASCIMENTO, OBS) 
             values 
             (:IDCONTATO_P, :IDENDERECO_P, :NOME_P, :EMAIL_P, :CARGO_P, :SETOR_P, :NASCIMENTO_P, :OBS_P) ";


            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                Int32? idContato = consultarUltimoIdTabela("CONTATOPESS");

                bancoDeDados.AddInParameter(comando, "IDCONTATO_P", DbType.Int32, idContato);
                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, contato.idEndereco);
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, contato.nome);
                bancoDeDados.AddInParameter(comando, "EMAIL_P", DbType.String, contato.email);
                bancoDeDados.AddInParameter(comando, "CARGO_P", DbType.String, contato.cargo);
                bancoDeDados.AddInParameter(comando, "SETOR_P", DbType.String, contato.setor);
                bancoDeDados.AddInParameter(comando, "NASCIMENTO_P", DbType.DateTime, contato.nascimento);
                bancoDeDados.AddInParameter(comando, "OBS_P", DbType.String, contato.obs);

                bancoDeDados.ExecuteNonQuery(comando);


                return idContato;
            }

        }

        /// <summary>
        /// alterar contato
        /// </summary>
        public void alterarContato(Contato contato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            TelContato telContato = new TelContato()
            {
                id = contato.idTelContato,
                idContato = contato.idContato,
                idTelefone = contato.idTelefone
            };

            query = @" update CM.CONTATOPESS set 
             IDENDERECO = :IDENDERECO_P, 
             NOME = :NOME_P, 
             EMAIL = :EMAIL_P, 
             CARGO = :CARGO_P, 
             SETOR = :SETOR_P, 
             NASCIMENTO = :NASCIMENTO_P, 
             OBS = :OBS_P 
             where  IDCONTATO = :IDCONTATO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTATO_P", DbType.Int32, contato.idContato);
                bancoDeDados.AddInParameter(comando, "IDENDERECO_P", DbType.Int32, contato.idEndereco);
                bancoDeDados.AddInParameter(comando, "NOME_P", DbType.String, contato.nome);
                bancoDeDados.AddInParameter(comando, "EMAIL_P", DbType.String, contato.email);
                bancoDeDados.AddInParameter(comando, "CARGO_P", DbType.String, contato.cargo);
                bancoDeDados.AddInParameter(comando, "SETOR_P", DbType.String, contato.setor);
                bancoDeDados.AddInParameter(comando, "NASCIMENTO_P", DbType.DateTime, contato.nascimento);
                bancoDeDados.AddInParameter(comando, "OBS_P", DbType.String, contato.obs);

                bancoDeDados.ExecuteNonQuery(comando);
            }


            if (telContato.id != 0)
            {
                if (telContato.idContato == 0 || telContato.idTelefone == 0)
                {
                    this.excluirTelContato(telContato.id);
                }
                else
                {
                    this.alterarTelContato(telContato);
                }
            }
            else
            {
                if (telContato.idContato != 0 && telContato.idTelefone != 0)
                {
                    this.incluirTelContato(telContato);
                }
            }
        }

        /// <summary>
        /// excluir contato
        /// </summary>
        public void excluirContato(Contato contato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            int idTelContato = contato.idTelContato;

            this.excluirTelContatoPorId(contato.idContato, 1);

            query = @" delete from CM.CONTATOPESS where  IDCONTATO = :IDCONTATO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTATO_P", DbType.Int32, contato.idContato);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// incluir Telcontato
        /// </summary>
        public void incluirTelContato(TelContato telContato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" insert into CM.TELCONTATO
             (IDTELCONTATO, IDCONTATO ,IDTELEFONE) 
             values 
             (:IDTELCONTATO_P, :IDCONTATO_P, :IDTELEFONE_P) ";


            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                Int32? idTelContato = consultarUltimoIdTabela("TELCONTATO");

                bancoDeDados.AddInParameter(comando, "IDTELCONTATO_P", DbType.Int32, idTelContato);
                bancoDeDados.AddInParameter(comando, "IDCONTATO_P", DbType.Int32, telContato.idContato);
                bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.Int32, telContato.idTelefone);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// alterar telContato
        /// </summary>
        public void alterarTelContato(TelContato telContato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @"update CM.TELCONTATO set 
             IDCONTATO = :IDCONTATO_P, 
             IDTELEFONE = :IDTELEFONE_P 
             where  IDTELCONTATO = :IDTELCONTATO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDTELCONTATO_P", DbType.Int32, telContato.id);
                bancoDeDados.AddInParameter(comando, "IDCONTATO_P", DbType.Int32, telContato.idContato);
                bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.String, telContato.idTelefone);

                bancoDeDados.ExecuteNonQuery(comando);
            }

        }

        /// <summary>
        /// Excluir da tabela telContato usando como parametro para a deleção idTelefone e IdContato
        /// </summary>
        /// <param name="idTelContato"></param>
        /// <param name="telContato"> 0 se for deleção pelo idTelefone e 1 se for deleção pelo idContato</param>
        public void excluirTelContatoPorId(Int32 idTelContato, Int32 telContato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            //Se for IDTELEFONE
            if (telContato == 0)
            {
                query = @" delete from CM.TELCONTATO where  IDTELEFONE = :IDTELEFONE_P ";

                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {

                    bancoDeDados.AddInParameter(comando, "IDTELEFONE_P", DbType.Int32, idTelContato);

                    bancoDeDados.ExecuteNonQuery(comando);
                }

            }
            //Se for IDCONTATO
            if (telContato == 1)
            {
                query = @" delete from CM.TELCONTATO where  IDCONTATO = :IDCONTATO_P ";

                using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
                {

                    bancoDeDados.AddInParameter(comando, "IDCONTATO_P", DbType.Int32, idTelContato);

                    bancoDeDados.ExecuteNonQuery(comando);
                }

            }
        }

        /// <summary>
        /// excluir telContato
        /// </summary>
        public void excluirTelContato(Int32 idTelContato)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            string query;

            query = @" delete from CM.TELCONTATO where  IDTELCONTATO = :IDTELCONTATO_P ";

            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IDTELCONTATO_P", DbType.Int32, idTelContato);

                bancoDeDados.ExecuteNonQuery(comando);
            }
        }

        public bool VerificaExistenciaContratoInadimplente(double IdPessa)
        {
            string query;
            int QtdContratos = 0;
            bool Retorno = false;

            query = @"       
                      SELECT COUNT(c.idcontratoemptmo) 
                      FROM CM.contratoemptmo c
                      WHERE c.flgsituacao IN ('A','E')
                      AND   c.idbenef IN (SELECT p.idpessoa
                                          FROM CM.pessoa p
                                          WHERE p.numdocumento = (SELECT p1.numdocumento
                                                                  FROM CM.pessoa p1
                                                                  WHERE p1.idpessoa = :IdPessoa))
                      AND  cm.pck_emprestimo.FN_SALDOINADIMPLENTE(c.idcontratoemptmo, :dataAtual) > 0";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

                bancoDeDados.AddInParameter(comando, "IdPessoa", DbType.Double, IdPessa);
                bancoDeDados.AddInParameter(comando, "dataAtual", DbType.Date, DateTime.Now.Date);


                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        QtdContratos = (int)leitor.obterDecimal(0);
                    }
                }

                if (QtdContratos > 0)
                {
                    Retorno = true;
                }

                return Retorno;
            }
        }

        //Campanha Desconto
        public DateTime BuscarDataCredito(long idPessoa, long idTitular, int idPlano, int idPatrocinadora)
        {
            DateTime dataCredito = DateTime.MinValue.Date;
            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;

            try
            {
                using (OracleConnection conn = new OracleConnection(conexaoOracle))
                {
                    conn.Open();
                    using (OracleCommand cmd = new OracleCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "cm.pck_aa_funcao_emptmo.fn_busca_data_credito";

                        OracleParameter paramDataCredito = new OracleParameter("vDataCredito", OracleDbType.Date, ParameterDirection.Output);
                        cmd.Parameters.Add(paramDataCredito);

                        cmd.Parameters.Add("pIdPessoa", OracleDbType.Int32).Value = idPessoa;
                        cmd.Parameters.Add("pIdTitular", OracleDbType.Int32).Value = idTitular;
                        cmd.Parameters.Add("pIdPlano", OracleDbType.Int32).Value = idPlano;
                        cmd.Parameters.Add("pIdPatro", OracleDbType.Int32).Value = idPatrocinadora;
                        cmd.Parameters.Add("pIdTipoContr", OracleDbType.Int32).Value = 0;
                        cmd.Parameters.Add("pIdCalculo", OracleDbType.Int32).Value = 0;
                        cmd.Parameters.Add("pSitFundacao", OracleDbType.NVarchar2).Value = string.Empty;


                        cmd.ExecuteNonQuery();

                        object valor = cmd.Parameters["vDataCredito"].Value;

                        dataCredito = Convert.ToDateTime(valor);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataCredito;
        }

        public DescontoInadimplencia BuscaInadimplenciaDesconto(long NumeroContrato, long IdPessoa, DateTime DataCalculo, int TipoProposta, double saldoDevedor, List<ItemDescontoContrato> descontoQuitacao, long IdCalculo = 0)
        {
            DescontoInadimplencia descontoInadDTO = new DescontoInadimplencia();
            Database bancoDeDados = this.obterBancoDeDados();

            try
            {
                descontoInadDTO.qtdePrestacoesRestantes = BuscarQtdPrestacoesRestantes(NumeroContrato);

                if (descontoInadDTO.qtdePrestacoesRestantes > 0 || TipoProposta != 2)
                {
                    descontoInadDTO = BuscarSituacaoBoleto(NumeroContrato, TipoProposta, DataCalculo);

                    descontoInadDTO.numeroContrato = NumeroContrato;
                    descontoInadDTO.item = new string[7];
                    descontoInadDTO.valor = new double[7];
                    descontoInadDTO.valorComDesconto = new double[7];
                    descontoInadDTO.percDesconto = new double[7];
                    string descricaoItem;
                    double valorDesconto = 0;
                    for (int i = 0; i < descontoQuitacao.Count(); i++)
                    {
                        switch (descontoQuitacao[i].idItem)
                        {
                            case 13:
                                descricaoItem = "Parcela";
                                break;
                            case 99:
                                descricaoItem = "FGQC";
                                break;
                            case 42:
                                descricaoItem = "Correção monetária";
                                break;
                            case 43:
                                descricaoItem = "Juros remuneratórios";
                                break;
                            case 46:
                                descricaoItem = "Juros moratórios";
                                break;
                            case 44:
                                descricaoItem = "Multa por atraso";
                                break;
                            case 121:
                                descricaoItem = "IOF complementar";
                                break;
                            default:
                                descricaoItem = "Indefinido";
                                break;
                        }
                        descontoInadDTO.item[i] = descricaoItem;
                        double valor = descontoQuitacao[i].valorNominal;
                        descontoInadDTO.valor[i] = Math.Round(valor, 2);
                        descontoInadDTO.totalVlrDivida += descontoInadDTO.valor[i];
                        descontoInadDTO.percDesconto[i] = descontoQuitacao[i].percentualDesconto * 100;


                        valorDesconto = valor * descontoQuitacao[i].percentualDesconto;
                        descontoInadDTO.totalVlrDesconto += valorDesconto;
                        var valorComDesconto = valor - valorDesconto;
                        descontoInadDTO.valorComDesconto[i] = Math.Round(valorComDesconto, 2);
                        descontoInadDTO.VlrDividaDesconto += valorComDesconto;
                    }
                    descontoInadDTO.totalPercDesconto = Math.Round((descontoInadDTO.totalVlrDivida - descontoInadDTO.totalVlrDesconto) / descontoInadDTO.totalVlrDivida * 100, 2);
                    descontoInadDTO.VlrDividaDesconto = Math.Round(descontoInadDTO.VlrDividaDesconto, 2);
                    descontoInadDTO.totalVlrDivida = Math.Round(descontoInadDTO.totalVlrDivida, 2);
                    descontoInadDTO.totalVlrDesconto = Math.Round(descontoInadDTO.totalVlrDesconto, 2);
                    descontoInadDTO.VlrSaldoDevedor = saldoDevedor;
                }
            }
            catch (Exception ex)
            {
                descontoInadDTO.msgErro = ex.Message;
            }

            return descontoInadDTO;
        }

        public int BuscarQtdPrestacoesRestantes(long NumContrato)
        {
            DescontoInadimplencia descontoInadDTO = new DescontoInadimplencia();
            Database bancoDeDados = this.obterBancoDeDados();
            int qtdePrestacoesRestantes = 0;


            string query = @"SELECT MAX(he.numparcelas)
                                FROM hmeprestacao he
                                WHERE he.idcontratoemptmo = :numContrato
                                AND   he.parcela = cm.pck_emprestimo.FN_ULTIMAPRESTACAO(he.idcontratoemptmo)
                                AND   he.naturezaitem = 2";
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "numContrato", DbType.Int64, NumContrato);
                bancoDeDados.ExecuteNonQuery(comando);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        qtdePrestacoesRestantes = leitor.obterInt(0);
                    }
                }

                return qtdePrestacoesRestantes;
            }
        }

        public DescontoInadimplencia BuscarSituacaoBoleto(long NumContrato, int TipoProposta, DateTime DataCalculo)
        {
            DescontoInadimplencia descontoInadDTO = new DescontoInadimplencia();
            string situacaoBoleto = string.Empty;
            Database bancoDeDados = this.obterBancoDeDados();

            int tipoMovimento;
            switch (TipoProposta)
            {
                case 1:
                    tipoMovimento = 3; //quitação
                    break;
                case 2:
                    tipoMovimento = 1; //prestação
                    break;
                case 3:
                    tipoMovimento = 0; //concessão
                    break;
                default:
                    tipoMovimento = -1; //movimentação não mapeada
                    break;
            }

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("cm.PCK_AA_EMPTMO_FINANCEIRO.pr_verifica_sit_boleto"))
            {
                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Int64, NumContrato);
                bancoDeDados.AddInParameter(comando, "pTipoMovimento", DbType.Int32, tipoMovimento);
                bancoDeDados.AddInParameter(comando, "pDataVencimento", DbType.Date, null);

                bancoDeDados.AddOutParameter(comando, "pSitBoleto", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "pCodDocumento", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "pDataVenc", DbType.Date, 10);
                bancoDeDados.ExecuteNonQuery(comando);

                descontoInadDTO.sitBoleto = (int)bancoDeDados.GetParameterValue(comando, "pSitBoleto");

                if (descontoInadDTO.sitBoleto == 0)
                {
                    descontoInadDTO.dataVencto = DataCalculo;
                }
                else
                {
                    descontoInadDTO.dataVencto = (DateTime)bancoDeDados.GetParameterValue(comando, "pDataVenc");
                }

                return descontoInadDTO; 
            }
        }
        #endregion
    }
}
