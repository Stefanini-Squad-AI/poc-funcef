#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SIG 27535
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação das regras 26921 e 26919
///
#endregion
#region SOL 225402  / PPM 1192509
///
/// Autor:
/// William Santana
///
/// Data da Alteração:
/// 21/12/2015
///
/// Descrição da Alteração:
/// Ajustar as mensagens de erro e de exibição de texto da regra
///
#endregion
#region SOL 208770 / Kintana 2016022
///
/// Autor:
/// Felipe Azevedo dos Santos
///
/// Data da Alteração:
/// 18/03/2015
///
/// Descrição da Alteração:
/// Alteração no parâmetro EXCEPCIONAL das regras 25731, 25523, 26405, 26063, 25730, 6170, 25662 
///
#endregion
#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 27/04/2016 09:12:00
///
/// Descrição da Alteração:
/// O valor de SALDODEVEDOR_P na regra 25209 está sendo passado errado
///
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
using FUNCEF.Planus.Componentes.Extensoes;
using FUNCEF.Planus.Componentes;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    /// <summary>
    /// Objeto de acesso a dados de regra.
    /// </summary>
    public class AcessoRegra : ObjetoAcessoDados, IAcessoRegra
    {
        #region Constantes

        #region Consultar Data Limite Bloqueio

        private const int DATALIM_BLOQUEIO = 0;

        #endregion

        #region Verificar Período

        private const int PERBLOQUE_PERIODO = 2;
        private const int PERBLOINT_PERIODO = 3;

        #endregion

        #region Consultar Parametro Sistema

        private const int FLGEXCEPCIONAL = 0;
        private const int HORAENCERRAMENTO = 1;
        private const int IDREGRATIPOCONTRATO = 2;
        // Thiago Melo SOL 204452 KTN 1976411
        private const int FLGTRATAASSINAT = 3;
        // Thiago Melo SOL 204452 KTN 1976411

        #endregion

        #endregion

        #region Consultas

        //BRUNO AZEVEDO - CRIAÇÃO CONSULTA DO ÚLTIMO IDCALCULO CONFORME EMAIL
        /// <summary>
        /// Consultar o último IdCalculo para passar de parâmetro para a regra.
        /// </summary>
        public int? consultarUltimoIdCalculo()
        {
            string query;

            int? IdCalculo = 0;

            // Consulta
            query = @" SELECT CM.SEQIDCALCULOWEBEMPRESTIMO.NEXTVAL AS IDCALCULO FROM DUAL ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Executa consulta
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        IdCalculo = leitor.obterValorInteiro(0);
                    }
                }
            }

            return IdCalculo;
        }
        //BRUNO AZEVEDO - CRIAÇÃO CONSULTA DO ÚLTIMO IDCALCULO CONFORME EMAIL

        /// <summary>
        /// Verifica se existe bloqueio contábil.
        /// </summary>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool consultarContabilidadeBloqueada(DateTime dataReferencia)
        {
            string query;

            bool contabilidadeBloqueada = false;

            // Consulta
            query = @" SELECT PACDATABLOQ FROM CM.PARAMCONTAB 
            WHERE IDPESSOA = 1 
              AND PACDATABLOQ IS NOT NULL 
              AND TRUNC(PACDATABLOQ) >= TRUNC(:DATAREFERENCIA_P) ";

            string strConn = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;

            using (OracleConnection conn = new OracleConnection(strConn))
            {
                conn.Open();

                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = query;

                    cmd.Parameters.Add("DATAREFERENCIA_P", OracleDbType.Date).Value = dataReferencia;

                    using (IDataReader leitor = cmd.ExecuteReader())
                    {
                        contabilidadeBloqueada = leitor.Read();
                    }
                }
            }

            return contabilidadeBloqueada;
        }

        /// <summary>
        /// Verifica se existe data limite para o bloqueio contábil.
        /// </summary>
        public DateTime? consultarDataLimiteBloqueio()
        {
            string query;

            // Consulta
            query = @" SELECT DECODE(NUMDIAS,0,DATABLOQUEIO,TRUNC(SYSDATE) - NUMDIAS) as DATALIM 
              FROM CM.DIASBLOQMOD 
             WHERE IDPESSOA = 1 
               AND IDMODULO = 15 ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {

                // Popula objetos resultantes
                DateTime? dataLimite = null;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                        dataLimite = leitor.obterValorData(DATALIM_BLOQUEIO);
                }
                return dataLimite;
            }
        }

        /// <summary>
        /// Verifica períodos.
        /// </summary>
        /// <param name="dataReferencia">Data de referência.</param>
        public int verificarPeriodo(DateTime dataReferencia)
        {
            string query;

            // Consulta
            query = @" SELECT PERNUMERO, PEREXERCICIO, PERBLOQUE, PERBLOINT 
              FROM CM.PERIODO 
             WHERE TRUNC(:DATAREFERENCIA_P) BETWEEN TRUNC(PERDATINI) AND TRUNC(PERDATFIM) 
               AND IDPESSOA = 1 
               AND PERESPECIAL = 'N' ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, dataReferencia);

                // Popula objetos resultantes
                int retorno = -1;
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        if (retorno != -1)
                        {
                            return 3;
                        }
                        else
                        {
                            if (leitor.obterString(PERBLOQUE_PERIODO).ToUpper() == "S" || leitor.obterString(PERBLOINT_PERIODO).ToUpper() == "S")
                            {
                                if (leitor.obterString(PERBLOQUE_PERIODO).ToUpper() == "S")
                                {
                                    return 1;
                                }
                                else
                                {
                                    if (leitor.obterString(PERBLOINT_PERIODO).ToUpper() == "S")
                                    {
                                        return 2;
                                    }
                                }
                            }
                            else
                            {
                                return -1;
                            }
                        }
                        retorno = -1;
                    }
                    return 0;
                }

            }

        }

        /// <summary>
        /// Consulta parametros do sistema.
        /// </summary>
        /// <returns>Hora de encerramenteo do sistema.</returns>
        public ParametroSistema consultarParametroSistema()
        {
            string query;

            // Consulta

            // Thiago Melo SOL 204452 KTN 1976411 INI 
            //SELECT FLGEXCEPCIONAL, HORAENCERRA, IDREGRATIPOCONTR FROM PARAMEMPTMO ");
            query = @" SELECT FLGEXCEPCIONAL, HORAENCERRA, IDREGRATIPOCONTR, FLGTRATAASSINAT, HORAENCERRADEBITO
                       FROM CM.PARAMEMPTMO ";
            // Thiago Melo SOL 204452 KTN 1976411     

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Popula objetos resultantes
                ParametroSistema parametros = new ParametroSistema();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        parametros.excepcional = leitor.obterValorInteiro(FLGEXCEPCIONAL);
                        parametros.horaEncerramento = leitor.obterString(HORAENCERRAMENTO);
                        parametros.idRegraTipoContrato = leitor.obterValorInteiro(IDREGRATIPOCONTRATO);
                        // Thiago Melo SOL 204452 KTN 1976411 INI
                        parametros.flgtrataassinat = leitor.obterValorInteiro(FLGTRATAASSINAT);
                        // Thiago Melo SOL 204452 KTN 1976411
                        parametros.horaEncerramentoDebito = leitor.obterString(4); //WO22861 - inclusão do horário de encerramento do débito
                    }
                }

                return parametros;
            }
        }


        /// <summary>
        /// Obtem propriedades da regra
        /// </summary>
        /// <param name="idRegra">Identificador da regra</param>
        /// <returns>Retorna regra com as propriedades</returns>
        public Regra obterPropriedades(int idRegra)
        {
            string query;

            //Consulta
            query = @" SELECT ID_REGRA, CD_CHAVE, DS_ENTIDADE FROM CM.TB_EMP_REGRA WHERE ID_REGRA = :IDREGRA_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                //Parâmetro
                bancoDeDados.AddInParameter(comando, "IDREGRA_P", DbType.Int32, idRegra);

                //Popula objetos resultantes
                Regra regra = new Regra();
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        regra.id = Convert.ToInt32(leitor.GetValue(0));
                        regra.chaveRegra = leitor.obterString(1);
                        regra.tipoMecanismoRegra = leitor.obterString(2);
                    }
                    else
                    {
                        throw new ExcecaoPlanus("Regra não está configurada.");
                    }
                }

                return regra;
            }

        }


        #endregion

        #region Procedures

        #region Regra Data Primeira Parcela

        public DateTime regra25837(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25837"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // alteração solicitada conforme e-mail 
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.DateTime, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25837: Não foi possível calcular data da primeira parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25837: " + retorno);


                return Convert.ToDateTime(valor);
            }

        }

        #endregion

        #region Regras Tipo Contrato

        public Boolean regra25789(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25789"))
            {
                //bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // Felipe A. Santos SOL 223534 Kintana 2057264
                bancoDeDados.AddInParameter(comando, "IDPESSOA_P", DbType.Int32, parametros.obterValor<int>("IDPESSOA_P")); // Felipe A. Santos SOL 223534 Kintana 2057264
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));  // xavier conforme solicitado em e-mail
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAATUALIZA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAATUALIZA_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOEMPRESTIMO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOEMPRESTIMO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.String, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);


                bancoDeDados.ExecuteNonQuery(comando);

                string status = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RESULTADO_P"));
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));


                return status.Equals("S");
            }
        }



        #endregion

        #region Regras Data de Crédito

        public DateTime regra6170(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6170"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // xavier alterar a assinatura da regra 6170 conforme e-mail            
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));  // xavier alterar a assinatura da regra 6170 conforme e-mail
                bancoDeDados.AddInParameter(comando, "SITFUNDACAO_P", DbType.String, parametros.obterValor<string>("SITFUNDACAO_P"));  // xavier alterar a assinatura da regra 6170 conforme e-mail
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));         // xavier alterar a assinatura da regra 6170 conforme e-mail          

                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P")); // Felipe A. Santos SOL 208770 Kintana 2016022


                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "DATACREDITO_P", DbType.DateTime, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object dataCredito = bancoDeDados.GetParameterValue(comando, "DATACREDITO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (dataCredito == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6170: Não foi possível calcular data de crédito.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6170: " + retorno);

                return Convert.ToDateTime(dataCredito);
            }

        }

        #endregion

        #region Regras Elegibilidade

        public Boolean regra25208(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25208"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddOutParameter(comando, "STATUS_P", DbType.String, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                string status = Convert.ToString(bancoDeDados.GetParameterValue(comando, "STATUS_P"));
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (!retorno.Trim().Equals("OK"))
                {
                    throw new ExcecaoPlanus("Regra 25208: " + retorno);
                }
                else if (!status.Trim().Equals("S"))
                {
                    throw new ExcecaoPlanus("Regra 25208: " + "Participante não atende a regra de Elegibilidade.");
                }

                return status.Equals("S");
            }

        }

        public Boolean regra25662(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25662"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "SITFUNDACAO_P", DbType.String, parametros.obterValor<string>("SITFUNDACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDSITPART_P", DbType.Int32, parametros.obterValor<int>("IDSITPART_P"));
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANOCONTABIL_P", DbType.Int32, parametros.obterValor<int?>("IDPLANOCONTABIL_P"));
                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALELEGIBILIDADE_P")); // Felipe A. Santos SOL 208770 Kintana 2016022

                //bancoDeDados.AddInParameter(comando, "FLGINTERNET_P", DbType.Int32, 0);
                bancoDeDados.AddInParameter(comando, "FLGINTERNET_P", DbType.Int32, parametros.obterValor<int>("FLGINTERNET_P"));
                //William Moreira da Silva - SOL 235470 PPM 450255

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA"));
                
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.String, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);



                bancoDeDados.ExecuteNonQuery(comando);

                string status = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RESULTADO_P"));
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (!retorno.Trim().Equals("OK"))
                {
                    throw new ExcecaoPlanus("Regra 25662: " + retorno);
                }
                else if (!status.Trim().Equals("S"))
                {
                    throw new ExcecaoPlanus("Regra 25662: " + "Participante não atende a regra de Elegibilidade.");
                }

                return status.Equals("S");
            }

        }

        #endregion

        #region Regras Prazo máximo

        /// <summary>
        /// Regra Prazo Máximo
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns></returns>
        public int regra25730(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25730"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // xavier SOL 171546
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                // bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object prazo = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (prazo == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25730: Não foi possível calcular prazo máximo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25730: " + retorno);


                return Convert.ToInt32(prazo);
            }

        }

        /// <summary>
        /// Regra Prazo Máximo
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns></returns>
        public int regra5204(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_5204"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object prazo = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (prazo == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 5204: Não foi possível calcular prazo máximo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 5204: " + retorno);


                return Convert.ToInt32(prazo);
            }
        }

        #endregion

        #region Regras Prazo Concessão

        public Boolean regra6346(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6346"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddOutParameter(comando, "STATUS_P", DbType.String, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                string status = Convert.ToString(bancoDeDados.GetParameterValue(comando, "STATUS_P"));
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (!status.Trim().Equals("S"))
                    throw new ExcecaoPlanus("Regra 6346: " + retorno);


                return status.Equals("S");
            }

        }

        #endregion

        #region Regras Sálario Base

        public double regra25207(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25207"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P")); // SOL 151964 Fernando Xavier
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object salarioBase = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (salarioBase == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25207: Não foi possível calcular salário base.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25207: " + retorno);


                return Convert.ToDouble(salarioBase);
            }

        }

        public double regra25485(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25485"))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<string>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25485: Não foi possível calcular salário base.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25485: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25816(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25816"))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<String>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25816: Não foi possível calcular salário base.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25816: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra26116(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26116"))
            {
                // assinatura da regra alterada conforme e-mail

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "SITFUNDACAO_P", DbType.String, parametros.obterValor<String>("SITFUNDACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int32, parametros.obterValor<int>("IDPLANOPREV_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);


                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26116: Não foi possível calcular salário base.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26116: " + retorno);


                return Convert.ToDouble(valor);
            }

        }


        #endregion

        #region Regra Valor Reserva

        public double regra6485(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6485"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64?>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.Date, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valorReserva = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valorReserva == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6485: Não foi possível calcular valor de reserva.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6485: " + retorno);


                return Convert.ToDouble(valorReserva);
            }

        }

        #endregion

        #region Regras Limites

        public Boolean regra24631(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24631"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                string status = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RESULTADO_P"));
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (!status.Trim().Equals("S"))
                    throw new ExcecaoPlanus("Regra 24631: " + retorno);


                return status.Equals("S");
            }

        }

        public Boolean regra5099(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_5099"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                string status = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RESULTADO_P"));
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (!status.Trim().Equals("S"))
                    throw new ExcecaoPlanus("Regra 5099: " + retorno);


                return status.Equals("S");
            }

        }

        #endregion

        #region Regras Taxas de Juros

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        public double regra2550(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_2550"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object taxaJuros = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (taxaJuros == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 2550: Não foi possível calcular taxa de juros.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 2550: " + retorno);


                return Convert.ToDouble(taxaJuros);
            }

        }

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        public double regra24800(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24800"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object taxaJuros = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (taxaJuros == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24800: Não foi possível calcular taxa de juros.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24800: " + retorno);


                return Convert.ToDouble(taxaJuros);
            }

        }

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        public double regra24801(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24801"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object taxaJuros = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (taxaJuros == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24801: Não foi possível calcular taxa de juros.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24801: " + retorno);

                return Convert.ToDouble(taxaJuros);
            }

        }

        /// <summary>
        /// Calcula Taxa de Juros
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns>Taxa de Juros</returns>
        public double regra25525(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25525"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // xavier alterado conforme e-mail
                bancoDeDados.AddInParameter(comando, "TXJUROS_P", DbType.Int32, 0); // xavier alterado conforme e-mail

                //William Moreira da Silva - SIG 27179 
                bancoDeDados.AddInParameter(comando, "INPRAZO_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                //William Moreira da Silva - SIG 27179 

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, 0); // xavier alterado conforme e-mail
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);


                bancoDeDados.ExecuteNonQuery(comando);

                object taxaJuros = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (taxaJuros == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25525: Não foi possível calcular taxa de juros.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25525: " + retorno);


                return Convert.ToDouble(taxaJuros);
            }

        }

        //William Moreira da Silva - SIG 27879 - Inicio
        #region Correção Monetaria
        public double regra26923(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26923"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "TXJUROS_P", DbType.Int32, 0);
                bancoDeDados.AddInParameter(comando, "INPRAZO_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "ORIGEM_P", DbType.Int32, 0);
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "MOECODIGO_P", DbType.Int32, parametros.obterValor<int>("MOECODIGO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object corrMonet = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (corrMonet == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26923: Não foi possível calcular a taxa de Correção Monetaria.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26923: " + retorno);


                return Convert.ToDouble(corrMonet);
            }
        }
        #endregion
        //William Moreira da Silva - SIG 27879 - FIM
        #endregion

        #region Regras Itens de Quitação

        public double regra6146(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6146"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                //bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6146: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6146: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6150(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6150"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6150: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6150: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        //NILTON - 19/12/12
        public double regra26543(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26543"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26543: Não foi possível calcular da devolução de FGQC.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26543: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6171(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6171"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6171: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6171: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6173(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6173"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6173: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6173: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6174(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6174"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6174: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6174: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6175(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6175"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6175: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6175: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6181(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6181"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                //William Moreira da Silva
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6181: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6181: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6214(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6214"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6214: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6214: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24498(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24498"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64?>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.Date, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24498: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24498: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24862(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24862"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORPREVISTO_P", DbType.Double, parametros.obterValor<double>("VALORPREVISTO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24862: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24862: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24863(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24863"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORPREVISTO_P", DbType.Double, parametros.obterValor<double>("VALORPREVISTO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24863: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24863: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24864(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24864"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORPREVISTO_P", DbType.Double, parametros.obterValor<double>("VALORPREVISTO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24864: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24864: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24865(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24865"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORPREVISTO_P", DbType.Double, parametros.obterValor<double>("VALORPREVISTO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24865: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24865: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24896(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24896"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64?>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.Date, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24896: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24896: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25080(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25080"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));

                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25080: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25080: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25081(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25081"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25081: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25081: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25082(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25082"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25082: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25082: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25083(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25083"))
            {

                //William Moreira da Silva - Conforme Email
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);
                //William Moreira da Silva - Conforme Email
                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25083: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25083: " + retorno);


                return Convert.ToDouble(valor);
            }
        }

        public double regra25833(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25833"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL            
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25833: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25833: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra25866(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25866"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25866: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25866: " + retorno);


                return Convert.ToDouble(valor);
            }
        }

        //SIG 67808 - Matias
        public double regra26998(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26998"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26998: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26998: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        //SIG 67808 - Matias
        public double regra27000(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27000"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27000: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27000: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        //SIG 67808 - Matias
        public double regra27001(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27001"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27001: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27001: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        //SIG 67808 - Matias
        public double regra27002(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27002"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27002: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27002: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        //SIG 67808 - Matias
        public double regra27003(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27003"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27003: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27003: " + retorno);

                //comando.Connection.Close();
                comando.Dispose();

                return Convert.ToDouble(valor);
            }
        }

        //SIG 67808 - Matias
        public double regra27004(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27004"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27004: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27004: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        //SIG 67808 - Matias
        public double regra27005(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27005"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.Int32, parametros.obterValor<int>("TIPOPROPOSTA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27005: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27005: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra24393(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24393"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24393: Não foi possível calcular o item.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24393: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra27091(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27091"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));

                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.Date, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int32, parametros.obterValor<int>("IDPLANOPREV_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27091: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27091: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        #endregion

        #region Regras Suspensão

        public DateTime regra24823(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            DateTime dataSuspensao = this.regra24823(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 24823: " + mensagem);
            }

            return dataSuspensao;
        }

        public DateTime regra24823(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24823"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAINICIOSUSP_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAINICIOSUSP_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int?>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "FLGINTERNO_P", DbType.String, parametros.obterValor<string>("FLGINTERNO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo());
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario());

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.DateTime, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object dataSuspensao = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (dataSuspensao == DBNull.Value)
                    return new DateTime(1900, 1, 1);
                //throw new ExcecaoPlanus("Regra 24823: Não foi possível calcular data de suspensão.");


                return Convert.ToDateTime(dataSuspensao);
            }

        }

        public DateTime regra25522(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            DateTime dataSuspensao = this.regra25522(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25522: " + mensagem);
            }

            return dataSuspensao;
        }

        public DateTime regra25522(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25522"))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<string>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAINICIOANT_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATAINICIOANT_P"));
                bancoDeDados.AddInParameter(comando, "DATAINICIO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATAINICIO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELASABERTO_P", DbType.Int32, parametros.obterValor<int?>("NUMPARCELASABERTO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.DateTime, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object dataSuspensao = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (dataSuspensao == DBNull.Value)
                    return new DateTime(1900, 1, 1);
                //throw new ExcecaoPlanus("Regra 25522: Não foi possível calcular meses de suspensão.");


                return Convert.ToDateTime(dataSuspensao);
            }

        }

        public DateTime regra25530(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            DateTime dataSuspensao = this.regra25530(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25530: " + mensagem);
            }

            return dataSuspensao;
        }

        public DateTime regra25530(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25530"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAINICIOSUSP_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAINICIOSUSP_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int?>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "FLGINTERNO_P", DbType.String, parametros.obterValor<string>("FLGINTERNO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo());
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario());

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.DateTime, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object dataSuspensao = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (dataSuspensao == DBNull.Value)
                    return new DateTime(1900, 1, 1);
                //throw new ExcecaoPlanus("Regra 25530: Não foi possível calcular data de suspensão.");


                return Convert.ToDateTime(dataSuspensao);
            }

        }

        public Double regra26490(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            Double retorno = this.regra26490(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 26490: " + mensagem);
            }

            return retorno;
        }

        public Double regra26490(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26490"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAINICIOSUSP_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAINICIOSUSP_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int?>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "FLGINTERNO_P", DbType.String, parametros.obterValor<string>("FLGINTERNO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo());
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario());

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26490: Não foi possível calcular prestação projetada.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26490: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public Double regra26491(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            Double retorno = this.regra26490(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 26491: " + mensagem);
            }

            return retorno;
        }

        public Double regra26491(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26491"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDPATRO_P", DbType.Int32, parametros.obterValor<int>("IDPATRO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAINICIOSUSP_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAINICIOSUSP_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int?>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "FLGINTERNO_P", DbType.String, parametros.obterValor<string>("FLGINTERNO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo());
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario());

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26491: Não foi possível apresentar a margem.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26491: " + retorno);


                return Convert.ToDouble(valor);
            }

        }


        public int regra26047(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26047"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "FLGQUITA_P", DbType.Int32, parametros.obterValor<int>("FLGQUITA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Int32, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object meses = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (meses == DBNull.Value || Convert.ToInt32(meses) == 0)
                    throw new ExcecaoPlanus("Suspensão não permitida.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26047: " + retorno);


                return Convert.ToInt32(meses);
            }

        }

        #endregion

        #region Regras Margem

        public double regra21710(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_21710"))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<string>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 21710: Não foi possível calcular margem.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 21710: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24578(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24578"))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<string>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddInParameter(comando, "SALARIOBASE_P", DbType.Double, parametros.obterValor<double>("SALARIOBASE_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24578: Não foi possível calcular margem.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24578: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25234(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25234"))
            {

                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<string>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddInParameter(comando, "SALARIOBASE_P", DbType.Double, parametros.obterValor<double>("SALARIOBASE_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25234: Não foi possível calcular margem.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25234: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25782(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25782"))
            {


                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "MATRICULA_P", DbType.String, parametros.obterValor<string>("MATRICULA_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "SITFUNDACAO_P", DbType.String, parametros.obterValor<string>("SITFUNDACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDPESSJUR_P", DbType.Int32, parametros.obterValor<int>("IDPESSJUR_P"));

                try//NILTON CORRECAO PALIATIVA
                {
                    bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                }
                catch (Exception)
                {
                    bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATOAQUITAR_P"));
                }


                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATASOLICITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATASOLICITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                try
                {
                    bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P"));
                }
                catch
                {
                    bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                }                
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25782: Não foi possível calcular margem.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25782: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        #endregion

        #region Regras Valor Máximo

        public double regra25210(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25210(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25210: " + mensagem);
            }

            return valor;
        }

        public double regra25210(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25210"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25210: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25307(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25307(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25307: " + mensagem);
            }

            return valor;
        }

        public double regra25307(IDictionary<string, object> parametros, ref string mensagem)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25307"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORMAXIMO_P", DbType.Double, parametros.obterValor<double?>("VALORMAXIMO_P"));
                bancoDeDados.AddInParameter(comando, "VALORMARGEM_P", DbType.Double, parametros.obterValor<double?>("VALORMARGEM_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int?>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "FINANCIAMENTO_P", DbType.Int32, parametros.obterValor<int?>("FINANCIAMENTO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int?>("EXCEPCIONAL_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25307: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25666(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25666(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25666: " + mensagem);
            }

            return valor;
        }

        public double regra25666(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25666"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOEMPRESTIMO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOEMPRESTIMO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "VALORMARGEM_P", DbType.Double, parametros.obterValor<double>("VALORMARGEM_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25666: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25762(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25762(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25762: " + mensagem);
            }

            return valor;
        }

        public double regra25762(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25762"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25762: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25763(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25763(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25763: " + mensagem);
            }

            return valor;
        }

        public double regra25763(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25763"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25763: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25764(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25764(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25764: " + mensagem);
            }

            return valor;
        }

        public double regra25764(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25764"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25764: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25773(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25773(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25773: " + mensagem);
            }

            return valor;
        }

        public double regra25773(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25773"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int32, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOEMPRESTIMO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOEMPRESTIMO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "VALORMARGEM_P", DbType.Double, parametros.obterValor<double>("VALORMARGEM_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25773: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra25835(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra25835(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 25835: " + mensagem);
            }

            return valor;
        }

        public double regra25835(IDictionary<string, object> parametros, ref string mensagem)
        {//NILTON - CORRECAO

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25835"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // alteração conforme e-mail
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "SITFUNDACAO_P", DbType.String, parametros.obterValor<string>("SITFUNDACAO_P")); // alteração conforme e-mail
                bancoDeDados.AddInParameter(comando, "SALARIOBASE_P", DbType.Double, parametros.obterValor<double>("SALARIOBASE_P"));

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25835: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        public double regra26063(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra26063(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 26063: " + mensagem);
            }

            return valor;
        }

        public double regra26063(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26063"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P")); // alteração solicitada conforme e-mail 
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOEMPRESTIMO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOEMPRESTIMO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "VALORMARGEM_P", DbType.Double, parametros.obterValor<double>("VALORMARGEM_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P")); // Felipe A. Santos SOL 208770 Kintana 2016022

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26063: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }

        }

        //William Moreira da Silva - SIG 27535
        public double regra26919(IDictionary<string, object> parametros)
        {
            string mensagem = string.Empty;

            double valor = this.regra26919(parametros, ref mensagem);

            if (!mensagem.Equals("OK"))
            {
                throw new ExcecaoPlanus("Regra 26919: " + mensagem);
            }

            return valor;
        }

        public double regra26919(IDictionary<string, object> parametros, ref string mensagem)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26919"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOEMPRESTIMO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOEMPRESTIMO_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANO_P", DbType.Int32, parametros.obterValor<int>("IDPLANO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                //William Moreira da Silva - SIG 27879 - INICIO
                bancoDeDados.AddInParameter(comando, "TAXACORRECAO_P", DbType.Double, parametros.obterValor<double?>("TAXACORRECAO_P"));
                //William Moreira da Silva - SIG 27879 - FIM
                bancoDeDados.AddInParameter(comando, "VALORMARGEM_P", DbType.Double, parametros.obterValor<double>("VALORMARGEM_P"));
                bancoDeDados.AddInParameter(comando, "QTDMESES_P", DbType.Int32, parametros.obterValor<int>("QTDMESES_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P"));

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                mensagem = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26919: Não foi possível calcular Valor Máximo.");


                return Convert.ToDouble(valor);
            }
        }


        //William Moreira da Silva - SIG 27535

        #endregion

        #region Regras Amortização

        public double regra5188(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_5188"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 5188: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 5188: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra5190(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_5190"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 5190: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 5190: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6044(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6044"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORAMORTIZACAO_P", DbType.Double, parametros.obterValor<double?>("VALORAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<int>("NOVOPRAZO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6044: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6044: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6193(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6193"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<Int32>("NOVOPRAZO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6193: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6193: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra21711(IDictionary<string, object> parametros)
        {

            Int32 itemChave = Origem.amortizacao.chave;

            if ((itemChave == 0) || (itemChave == 1))
            {
                itemChave = 13;
            }
            else if (itemChave == 2)
            {
                itemChave = 1;
            }


            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_21711"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORAMORTIZACAO_P", DbType.Double, parametros.obterValor<double?>("VALORAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPMO_P", DbType.Int32, itemChave);                             //NILTON CORREÇÃO
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo());         //NILTON CORREÇÃO
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario());                  //NILTON CORREÇÃO
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 21711: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 21711: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24363(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24363"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<int>("NOVOPRAZO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24363: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24363: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24392(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24392"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORAMORTIZACAO_P", DbType.Double, parametros.obterValor<double?>("VALORAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<int>("NOVOPRAZO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24392: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24392: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25235(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25235"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "VALORAMORTIZACAO_P", DbType.Double, parametros.obterValor<double?>("VALORAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<int>("NOVOPRAZO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25235: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25235: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25703(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25703"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<int>("NOVOPRAZO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25703: Não foi possível calcular item de amortização.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25703: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra26433(IDictionary<string, object> parametros)//NILTON
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26433"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "VLRAMORTIZACAO_P", DbType.Double, parametros.obterValor<double>("VLRAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAAMORTIZACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "NOVOPRAZO_P", DbType.Int32, parametros.obterValor<int>("NOVOPRAZO_P"));
                bancoDeDados.AddInParameter(comando, "PRAZOANT_P", DbType.Int32, parametros.obterValor<int>("PRAZOANT_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo());
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario());

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26433: Não foi possível calcular item de IOF .");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26433: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        #endregion

        #region Regras Itens Parcelas

        public double regra21701(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_21701"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "PARCELAATUAL_P", DbType.Int32, parametros.obterValor<int>("PARCELAATUAL_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 21701: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 21701: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra22550(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_22550"))
            {

                //William Moreira da Silva - Segundo Email
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);
                //William Moreira da Silva - Segundo Email

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 22550: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 22550: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        //William Moreira da Silva - SIG 27535
        public double regra26921(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26921"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                //William Moreira da Silva - SIG 27879 - INICIO
                bancoDeDados.AddInParameter(comando, "TAXACORRECAO_P", DbType.Double, parametros.obterValor<double?>("TAXACORRECAO_P"));
                //William Moreira da Silva - SIG 27879 - FIM
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26921: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26921: " + retorno);

                return Convert.ToDouble(valor);
            }
        }
        //William Moreira da Silva - SIG 27535

        public double regra22552(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_22552"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double?>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "DATAATUALIZA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAATUALIZA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 22552: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 22552: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra22554(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_22554"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 22554: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 22554: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra24637(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24637"))
            {

                //William Moreira da Silva - Conforme Email
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                //William Moreira da Silva - Conforme Email
                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24637: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24637: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra25674(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25674"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELAATUAL_P", DbType.Int32, parametros.obterValor<int?>("PARCELAATUAL_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25674: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25674: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra25739(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25739"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25739: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25739: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra25775(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25775"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25775: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25775: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra26055(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26055"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long?>("IDCONTRATOEMPTMO"));//Willamy Henrique SOL - 239238 PPM - 514531
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATAEVENTO_P"));//NILTON CORRECAO
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int?>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double?>("SALDODEVEDOR_P"));//NILTON CORRECAO
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));

                try //SOLUÇÃO PALIATIVA
                {
                    bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));//NILTON CORRECAO 08/01/13
                }
                catch (NullReferenceException)
                {
                    bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, this.consultarUltimoIdCalculo()); //NILTON CORRECAO 22/01/13  
                }

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, Contexto.obterUsuario()); //NILTON CORRECAO
                                                                                                           //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26055: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26055: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra27173(IDictionary<string, object> parametros)
        {
            //WO10934 - nova modalidade especial reg/replan
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27173"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));                
                bancoDeDados.AddInParameter(comando, "CARENCIA_P", DbType.Int32, parametros.obterValor<int>("CARENCIA_P"));                
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);
                
                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27173: Não foi possível calcular item de parcela.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27173: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27170(IDictionary<string, object> parametros)
        {
            //WO10934 - nova modalidade especial reg/replan
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27170"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<string>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));                
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime?>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));                
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27170: Não foi possível calcular a amortização da parcela com carência.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27170: " + retorno);

                return Convert.ToDouble(valor);
            }
        }


        #endregion

        #region Regras Itens Concessão

        public double regra6062(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6062"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int?>("IDMUTUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAILbancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                //Implementação Sadi Freire SOL 213592 e Kintana 2040335
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "VALORDESCONTO_P", DbType.Double, parametros.obterValor<double?>("VALORDESCONTO_P"));
                //bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.String, parametros.obterValor<string>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6062: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6062: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        //Implementação Sadi Freire SOL 213592 e Kintana 2040335
        public double regra26761(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26761"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64>("IDCONTRATO_P"));


                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));


                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));


                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));


                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26761: Não foi possível conceder concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26761: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6183(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6183"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "DATAATUALIZA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAATUALIZA_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double?>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6183: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6183: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6184(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6184"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6184: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6184: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra21712(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_21712"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 21712: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 21712: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24357(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24357"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24357: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24357: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24635(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24635"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24635: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24635: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24766(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24766"))
            {

                //William Moreira da Silva
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "FINANCIAMENTO_P", DbType.Int32, parametros.obterValor<int?>("FINANCIAMENTO_P"));
                bancoDeDados.AddInParameter(comando, "INPUT_P", DbType.Double, parametros.obterValor<double>("INPUTVALORAMORTIZACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //William Moreira da Silva

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24766: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24766: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra24768(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_24768"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //William Moreira da Silva - Conforme Email
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "FINANCIAMENTO_P", DbType.Int32, parametros.obterValor<int?>("FINANCIAMENTO_P"));
                bancoDeDados.AddInParameter(comando, "INPUT_P", DbType.Double, parametros.obterValor<double>("INPUTVALORQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 24768: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 24768: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25098(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25098"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATOANTERIOR_P", DbType.Int32, parametros.obterValor<int?>("IDTIPOCONTRATOANTERIOR_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25098: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25098: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25205(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25205"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERADO CONFORME EMAIL
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25205: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25205: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25206(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25206"))
            {

                //William Moreira da Silva - Conforme Email
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "INPUT_P", DbType.Double, parametros.obterValor<double>("INPUTVALORDIVIDA_P"));    //NILTON - CORRECAO - 09/01/13           
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));           //NILTON - CORRECAO - 09/01/13

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);
                //William Moreira da Silva - Conforme Email

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25206: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25206: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25209(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25209"))
            {

                //William Moreira da Silva SOL 201773 KINTANA 1950518
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long?>("IDCONTRATOEMPTMO"));//Willamy Henrique SOL - 239238 PPM - 514531
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));

                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));

                // Eliamar Tani - SOL 225057/18141 PPM 1315874 - início
                //William Moreira da Silva - SIG 24060
                //bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                //William Moreira da Silva - SIG 24060
                // Eliamar Tani - SOL 225057/18141 PPM 1315874 - fim

                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //William Moreira da Silva SOL 201773 KINTANA 1950518

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25209: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25209: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public string regra25478(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25478"))
            {

                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME COMBINADO COM O SAULO
                bancoDeDados.AddInParameter(comando, "IDHISTMOVEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDHISTMOVEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.String, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25478: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25478: " + retorno);


                return valor.ToString();
            }

        }

        //BRUNO AZEVEDO - CRIAÇÃO DA REGRA DE IOF
        public double regra26405(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26405"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64?>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                //William Moreira da Silva - Conforme email
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "LIQUIDOZERO_P", DbType.Int32, parametros.obterValor<int>("LIQUIDOZERO_P"));
                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26405: Não foi possível calcular o IOF.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26405: " + retorno);


                return Convert.ToDouble(valor);
            }
        }

        //SIG 67808 - Matias
        public double regra27015(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27015"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64?>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                //William Moreira da Silva - Conforme email
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "LIQUIDOZERO_P", DbType.Int32, parametros.obterValor<int>("LIQUIDOZERO_P"));
                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int>("EXCEPCIONALOUTROS_P")); // Felipe A. Santos SOL 208770 Kintana 2016022

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27015: Não foi possível calcular o IOF.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27015: " + retorno);

                return Convert.ToDouble(valor);
            }
        }



        //BRUNO AZEVEDO - CRIAÇÃO DA REGRA DE IOF

        public double regra25504(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25504"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25504: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25504: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25523(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25523"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "SALDOEMPTMOQUITAR_P", DbType.String, parametros.obterValor<string>("SALDOEMPTMOQUITAR_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "VALORMAXIMO_P", DbType.Double, parametros.obterValor<double?>("VALORMAXIMO_P"));
                bancoDeDados.AddInParameter(comando, "VALORMARGEM_P", DbType.Double, parametros.obterValor<double?>("VALORMARGEM_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int?>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "VALORFINANHAB_P", DbType.Double, parametros.obterValor<double?>("VALORFINANHAB_P"));
                bancoDeDados.AddInParameter(comando, "FINANCIAMENTO_P", DbType.Int32, parametros.obterValor<int?>("FINANCIAMENTO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "LIQUIDOZERO_P", DbType.Int32, parametros.obterValor<int?>("LIQUIDOZERO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int?>("EXCEPCIONAL_P"));  // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int?>("EXCEPCIONALMARGEM_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                                                                                                                                         //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);
                
                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25523: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25523: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25664(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25664"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAREFERENCIA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAREFERENCIA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25664: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25664: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25701(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25701"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25701: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25701: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25702(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25702"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR", DbType.Int32, parametros.obterValor<int>("IDTITULAR"));//NILTON - CORRECAO
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25702: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25702: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25731(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25731"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "LIQUIDOZERO_P", DbType.Int32, parametros.obterValor<int?>("LIQUIDOZERO_P"));
                //bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int?>("EXCEPCIONAL_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "EXCEPCIONAL_P", DbType.Int32, parametros.obterValor<int?>("EXCEPCIONALOUTROS_P")); // Felipe A. Santos SOL 208770 Kintana 2016022
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL 

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25731: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25731: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25745(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25745"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25745: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25745: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25747(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25747"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAASSINATURA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAASSINATURA_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25747: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25747: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra25748(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25748"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25748: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25748: " + retorno);

                return Convert.ToDouble(valor);
            }

        }

        public double regra25791(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25791"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));               
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));             
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));               
                bancoDeDados.AddInParameter(comando, "SALDOEMPTMOQUITAR_P", DbType.String, parametros.obterValor<string>("SALDOEMPTMOQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "IDPATROCINADORA_P", DbType.Int32, parametros.obterValor<int>("IDPATROCINADORA_P"));             
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));              
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "SALARIOBASE_P", DbType.Double, parametros.obterValor<double?>("SALARIOBASE_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "LIQUIDOZERO_P", DbType.Int32, parametros.obterValor<int?>("LIQUIDOZERO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
            
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);               

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25791: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25791: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25836(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25836"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);//NILTON - CORRECAO
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);//NILTON - CORRECAO

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25836: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25836: " + retorno);


                return Convert.ToDouble(valor);

            }

        }

        public double regra25839(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25839"))
            {


                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                //HELEN BIANCHI - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                //HELEN BIANCHI - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                //HELEN BIANCHI - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                //HELEN BIANCHI - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                //HELEN BIANCHI - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                //HELEN BIANCHI - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25839: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25839: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra25974(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_25974"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double?>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 25974: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 25974: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra26129(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26129"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "VALORSOLICITADO_P", DbType.Double, parametros.obterValor<double>("VALORSOLICITADO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26129: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26129: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra26418(IDictionary<string, object> parametros)
        {//HELEN BIANCHI - CRIACAO DA ASSINATURA CONFORME E-MAIL

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26418"))
            {

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26418: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26418: " + retorno);


                return Convert.ToDouble(valor);
                //HELEN BIANCHI - CRIACAO DA ASSINATURA CONFORME E-MAIL 
            }

        }
        public double regra26420(IDictionary<string, object> parametros)
        {//HELEN BIANCHI - CRIACAO DA ASSINATURA CONFORME E-MAIL

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26420"))
            {
                //NILTON - CORRECAO - 10/01/13.

                bancoDeDados.AddInParameter(comando, "IDCONTRATO_P", DbType.Int64, parametros.obterValor<Int64?>("IDCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double?>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATAQUITACAO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAQUITACAO_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26420: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26420: " + retorno);


                return Convert.ToDouble(valor);
                //HELEN BIANCHI - CRIACAO DA ASSINATURA CONFORME E-MAIL 
            }
        }

        //SIG 67808 - Matias
        public double regra27017(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27017"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int?>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "VALORDESCONTO_P", DbType.Double, parametros.obterValor<double?>("VALORDESCONTO_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27017: Não foi possível calcular item de concessão.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27017: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27090(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27090"))
            {


                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int?>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int?>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDITEMEMPTMO_P", DbType.Int64, parametros.obterValor<Int64>("IDITEMEMPTMO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "SALDOANTERIOR_P", DbType.Double, parametros.obterValor<double?>("SALDOANTERIOR_P"));
                bancoDeDados.AddInParameter(comando, "IDPLANOPREV_P", DbType.Int32, parametros.obterValor<int>("IDPLANOPREV_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOAQUITAR_P", DbType.String, parametros.obterValor<string>("IDCONTRATOAQUITAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27090: Não foi possível calcular item de quitação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27090: " + retorno);

                return Convert.ToDouble(valor);
            }
        }


        //SIG 128871 - Aplicação de desconto no valor do FGQC - Criação a regra 27131 do novo item 159
        public double regra27131(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27131"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long?>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "DATAPRIMEIRAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPRIMEIRAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "IDTIPOSUSPENSAO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOSUSPENSAO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "SALDODEVEDOR_P", DbType.Double, parametros.obterValor<double>("SALDODEVEDOR_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P")); 
                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);
                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27131: Não foi possível calcular item de prestação.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27131: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        #endregion

        //William Moreira da Silva - SOL 207977
        #region Itens de Encargos

        public double regra6202(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6202"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6062: Não foi possível calcular item de encargo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6062: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6203(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6203"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6063: Não foi possível calcular item de encargo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6063: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6204(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6204"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6064: Não foi possível calcular item de encargo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6064: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra6205(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_6205"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 6065: Não foi possível calcular item de encargo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 6065: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra26409(IDictionary<string, object> parametros)
        {

            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_26409"))
            {

                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));

                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 26409: Não foi possível calcular item de encargo.");

                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 26409: " + retorno);


                return Convert.ToDouble(valor);
            }

        }

        public double regra27006(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27006"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27006: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27006: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27007(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27007"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27007: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27007: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27009(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27009"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27009: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27009: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27010(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27010"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27010: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27010: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27011(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27011"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27011: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27011: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27012(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27012"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27012: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27012: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        public double regra27013(IDictionary<string, object> parametros)
        {
            Database bancoDeDados = this.obterBancoDeDados();

            using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PR_EMP_REGRA_27013"))
            {
                bancoDeDados.AddInParameter(comando, "IDMUTUARIO_P", DbType.Int32, parametros.obterValor<int>("IDMUTUARIO_P"));
                bancoDeDados.AddInParameter(comando, "IDTITULAR_P", DbType.Int32, parametros.obterValor<int>("IDTITULAR_P"));
                bancoDeDados.AddInParameter(comando, "IDCONTRATOEMPTMO", DbType.Int64, parametros.obterValor<long>("IDCONTRATOEMPTMO"));
                bancoDeDados.AddInParameter(comando, "IDTIPOCONTRATO_P", DbType.Int32, parametros.obterValor<int>("IDTIPOCONTRATO_P"));
                bancoDeDados.AddInParameter(comando, "IDOPERACAO_P", DbType.Int32, parametros.obterValor<int>("IDOPERACAO_P"));
                bancoDeDados.AddInParameter(comando, "DATACREDITO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATACREDITO_P"));
                bancoDeDados.AddInParameter(comando, "PARCELA_P", DbType.Int32, parametros.obterValor<int>("PARCELA_P"));
                bancoDeDados.AddInParameter(comando, "NUMPARCELAS_P", DbType.Int32, parametros.obterValor<int>("NUMPARCELAS_P"));
                bancoDeDados.AddInParameter(comando, "VLRPARCELA_P", DbType.Double, parametros.obterValor<double?>("VLRPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAPARCELA_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAPARCELA_P"));
                bancoDeDados.AddInParameter(comando, "DATAEVENTO_P", DbType.DateTime, parametros.obterValor<DateTime>("DATAEVENTO_P"));
                bancoDeDados.AddInParameter(comando, "TAXAJUROS_P", DbType.Double, parametros.obterValor<double>("TAXAJUROS_P"));
                bancoDeDados.AddInParameter(comando, "IDCALCULO_P", DbType.Int32, parametros.obterValor<int>("IDCALCULO_P"));
                bancoDeDados.AddInParameter(comando, "USUARIO_P", DbType.String, parametros.obterValor<string>("USUARIO_P"));
                bancoDeDados.AddInParameter(comando, "TIPOPROPOSTA_P", DbType.String, parametros.obterValor<int>("TIPOPROPOSTA_P"));

                bancoDeDados.AddOutParameter(comando, "RESULTADO_P", DbType.Double, 10);
                bancoDeDados.AddOutParameter(comando, "RETORNO_P", DbType.String, 1000);

                bancoDeDados.ExecuteNonQuery(comando);

                object valor = bancoDeDados.GetParameterValue(comando, "RESULTADO_P");
                string retorno = Convert.ToString(bancoDeDados.GetParameterValue(comando, "RETORNO_P"));

                if (valor == DBNull.Value)
                    throw new ExcecaoPlanus("Regra 27013: Não foi possível calcular item de encargo.");
                if (!retorno.Equals("OK"))
                    throw new ExcecaoPlanus("Regra 27013: " + retorno);

                return Convert.ToDouble(valor);
            }
        }

        #endregion
        //William Moreira da Silva - SOL 207977

        #endregion

    }
}