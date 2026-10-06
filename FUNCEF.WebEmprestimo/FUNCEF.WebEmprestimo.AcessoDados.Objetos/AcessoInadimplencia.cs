#region SIG 90605
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 10/10/2019
///
/// Descrição da Alteração:
/// Opção para buscara valor de FGQC ainda não pago
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
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using FUNCEF.Planus.WebEmprestimo.Web;

namespace FUNCEF.Planus.WebEmprestimo.AcessoDados.Objetos
{
    public class AcessoInadimplencia : ObjetoAcessoDados, IAcessoInadimplencia
    {
        public List<ItemContrato> obterParcelasEmAberto(long numeroContrato, DateTime dataInadimplencia)
        {
            List<ItemContrato> parcelasEmAberto = new List<ItemContrato>();
            // Consulta
            string query2 = @"SELECT h.parcela,
                               h.numparcelas,
                               h.dataprevista,
                               to_char(h.vlrprevisto) --Evitar problemas com o NLS_LANG do tibero
                        FROM hmeprestacao h
                        WHERE h.idcontratoemptmo = :pIdContratoEmptmo
                        AND   h.dataprevista < :pDataInad_1
                        AND   (h.flgenvio = 0 OR h.datavencto + 30 <= :pDataInad_2)
                        AND   h.naturezaitem = 2
                        --AND   h.iditememptmo in (13,99)
                        AND   h.flgquitabonoestorno = 0
                        AND   h.vlrefetivo IS NULL
                        AND   h.dataefetiva IS NULL
                        AND   h.origem IN (1,11,12)
                        AND   h.vlrprevisto > 0
                        AND   (h.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                  FROM tiposuspemptmo ts
                                                                  WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))
                        ORDER BY h.parcela";




            string query = $@"SELECT parcela,
                                   numparcelas,
                                   dataprevista,
                                   vlrprevisto
                             from (SELECT h.parcela,
                                           h.numparcelas,
                                           h.dataprevista,
                                           to_char(h.vlrprevisto) vlrprevisto --Evitar problemas com o NLS_LANG do tibero
                                    FROM hmeprestacao h
                                    WHERE h.idcontratoemptmo = :pIdContratoEmptmo
                                    --AND   h.dataprevista < :pDataInad_1
                                    AND   (h.flgenvio = 0 OR h.datavencto + 30 <= :pDataInad_2)
                                    AND   h.naturezaitem = 2
                                    --AND   h.iditememptmo in (13,99)
                                    AND   h.flgquitabonoestorno = 0
                                    AND   h.vlrefetivo IS NULL
                                    AND   h.dataefetiva IS NULL
                                    AND   h.origem IN (1,11,12)
                                    AND   h.vlrprevisto > 0
                                    AND   (h.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                              FROM tiposuspemptmo ts
                                                                              WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))
                                    UNION
                                    SELECT hp.parcela,
                                           hp.numparcelas,
                                           hp.dataprevista,
                                           '0' vlrprevisto
                                    FROM hmeprestacao hp
                                    WHERE hp.idcontratoemptmo = :numeroContrato
                                    AND hp.iditememptmo = 99
                                    AND hp.flgquitabonoestorno = 0
                                    AND hp.vlrefetivo IS NULL
                                    AND hp.dataefetiva IS NULL
                                    AND hp.parcela IN ( SELECT DISTINCT parcela
                                                        FROM hmeprestacao
                                                        WHERE idcontratoemptmo = hp.idcontratoemptmo
                                                        AND naturezaitem = 2
                                                        AND vlrefetivo IS NOT NULL
                                                        AND dataefetiva IS NOT NULL)
                                    )
                                    ORDER BY parcela";

            // Cria comando de consulta
            
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "pIdContratoEmptmo", DbType.Int64, numeroContrato);                
                //bancoDeDados.AddInParameter(comando, "pDataInad_1", DbType.Date, dataInadimplencia.Date);
                bancoDeDados.AddInParameter(comando, "pDataInad_2", DbType.Date, dataInadimplencia.Date);
                bancoDeDados.AddInParameter(comando, "numeroContrato", DbType.Int64, numeroContrato);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        ItemContrato parcelaEmAberto = new ItemContrato()
                        {
                            id = 13,
                            parcela = leitor.obterInt(0),
                            numeroParcelas = leitor.obterInt(1),
                            dataPrevista = (DateTime)leitor.obterValorData(2),
                            valor = Convert.ToDouble(leitor.obterString(3))
                        };
                        parcelasEmAberto.Add(parcelaEmAberto);
                    }
                }
            }

            return parcelasEmAberto;
        }

        public double calculaCorrecaoMonetaria(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo)
        {
            double valorCorrecaoMonetaria = 0;

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CM.FN_EMP_CALC_CORRECAO_MONETARIA";

                    OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                    cmd.Parameters.Add(paramResultado);

                    cmd.Parameters.Add("pDataPrestacao", OracleDbType.Date).Value = dataPrestacao.Date;
                    cmd.Parameters.Add("pValorPrestacao", OracleDbType.Double).Value = valorNominal;
                    cmd.Parameters.Add("pDataCalculo", OracleDbType.Date).Value = dataCalculo.Date;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    valorCorrecaoMonetaria = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                }
            }

            return valorCorrecaoMonetaria;
        }

        public double calculaJurosRemuneratorios(DateTime dataPrestacao, double valorNominal, double valorCorrMonet, double jurosAA, DateTime dataCalculo)
        {
            double valorJurosRemuneratorios = 0;

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CM.FN_EMP_CALC_JUR_REMUNERATORIO";

                    OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                    cmd.Parameters.Add(paramResultado);

                    cmd.Parameters.Add("pDataPrestacao", OracleDbType.Date).Value = dataPrestacao.Date;
                    cmd.Parameters.Add("pValorPrestacao", OracleDbType.Double).Value = valorNominal;
                    cmd.Parameters.Add("pValorCorrMon", OracleDbType.Double).Value = valorCorrMonet;
                    cmd.Parameters.Add("pTaxaJurosAnual", OracleDbType.Double).Value = jurosAA;
                    cmd.Parameters.Add("pDataCalculo", OracleDbType.Date).Value = dataCalculo.Date;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    valorJurosRemuneratorios = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                }
            }

            return valorJurosRemuneratorios;
        }

        public double calculaJurosMoratorios(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo)
        {
            double valorJurosMoratorios = 0;

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CM.FN_EMP_CALC_JUROS_MORATORIOS";

                    OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                    cmd.Parameters.Add(paramResultado);

                    cmd.Parameters.Add("pDataPrestacao", OracleDbType.Date).Value = dataPrestacao.Date;
                    cmd.Parameters.Add("pValorPrestacao", OracleDbType.Double).Value = valorNominal;
                    cmd.Parameters.Add("pDataCalculo", OracleDbType.Date).Value = dataCalculo.Date;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    valorJurosMoratorios = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                }
            }

            return valorJurosMoratorios;
        }

        public double calculaMulta(DateTime dataPrestacao, double valorNominal)
        {
            double valorMulta = 0;

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CM.FN_EMP_CALC_MULTA";

                    OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                    cmd.Parameters.Add(paramResultado);

                    cmd.Parameters.Add("pDataPrestacao", OracleDbType.Date).Value = dataPrestacao.Date;
                    cmd.Parameters.Add("pValorPrestacao", OracleDbType.Double).Value = valorNominal;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    valorMulta = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                }
            }

            return valorMulta;
        }

        public double calculaIOFComplementar(DateTime dataPrestacao, DateTime dataCredito, int numParcela, int parcRestantes, double jurosAA, double valorSolicitado, DateTime dataCalculo, string SistemaAmortizacao, bool Calculado, long NumeroContrato)
        {
            double valorIOFComplementar = 0;

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;          

            string sistemaAmortizacao = SistemaAmortizacao == string.Empty ? "SAC" : SistemaAmortizacao;

            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                using (OracleCommand cmd = new OracleCommand())
                {
                    if (Calculado == true)
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "CM.FN_EMP_CALC_IOF_COMPLEMENTAR";

                        OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                        cmd.Parameters.Add(paramResultado);

                        cmd.Parameters.Add("pDataPrestacao", OracleDbType.Date).Value = dataPrestacao.Date;
                        cmd.Parameters.Add("pDataCredito", OracleDbType.Date).Value = dataCredito.Date;
                        cmd.Parameters.Add("piNumParcela", OracleDbType.Int32).Value = numParcela;
                        cmd.Parameters.Add("piParcRestantes", OracleDbType.Int32).Value = parcRestantes;
                        cmd.Parameters.Add("pTxJurAnual", OracleDbType.Double).Value = jurosAA;
                        cmd.Parameters.Add("pVlrSolicitado", OracleDbType.Double).Value = valorSolicitado;
                        cmd.Parameters.Add("pDataCalculo", OracleDbType.Date).Value = dataCalculo.Date;
                        cmd.Parameters.Add("pSistemaAmort", OracleDbType.Varchar2).Value = sistemaAmortizacao.ToUpper();

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        
                        valorIOFComplementar = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                    }
                    else 
                    {
                        string Query = @"SELECT TO_CHAR(SUM(HMEVLRPREVISTO)) HMEVLRPREVISTO 
                                        FROM HISTMOVEMPTMO
                                        WHERE IDCONTRATOEMPTMO =:NumeroContrato
                                        AND HMEPARCELA = :numParcela
                                        AND IDITEMEMPTMO = 121
                                        AND NVL(FLGESTORNADO, 0) = 0
                                        AND NVL(FLGABONADO, 0)   = 0
                                        AND NVL(FLGQUITADO, 0)   = 0";

                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = Query;                       

                        cmd.Parameters.Add("NumeroContrato", OracleDbType.Int64).Value = NumeroContrato;
                        cmd.Parameters.Add("numParcela", OracleDbType.Int32).Value = numParcela;
                        conn.Open();
                        

                        using (IDataReader leitor = cmd.ExecuteReader())
                        {
                            if (leitor.Read())
                            {
                                if (!string.IsNullOrEmpty(leitor.obterString(0))) 
                                {
                                    valorIOFComplementar = Convert.ToDouble(leitor.obterString(0));
                                }                                
                            }
                        }                       
                    }
                    
                }
                conn.Close();
            }                     

            return valorIOFComplementar;
        }

        //public double calculaFGQC(long numeroContrato, int numParcela)//SIG90605
        public double calculaFGQC(long numeroContrato, int numParcela, bool SomentePagos = true) //SIG90605
        {
            double valorFGQC = 0;
            // Consulta
            
            //SIG90605 -Inicio
            string query;
            if (SomentePagos)
            {
                 query = @"SELECT to_char(h.vlrprevisto) --Evitar problemas com o NLS_LANG do tibero
                               FROM hmeprestacao h
                              WHERE h.idcontratoemptmo = :pIDContratoEmptmo
                                AND   h.parcela = :pNumParcela
                                AND   h.origem IN (1,11,12)
                                AND   h.naturezaitem = 1
                                AND   h.vlrefetivo IS NULL 
                                AND   h.dataefetiva IS NULL 
                                AND   h.flgquitabonoestorno = 0
                                AND   (h.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                          FROM tiposuspemptmo ts
                                                                          WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))";
            }
            else
            {                
                query = @"SELECT to_char(h.vlrprevisto) --Evitar problemas com o NLS_LANG do tibero
                               FROM hmeprestacao h
                              WHERE h.idcontratoemptmo = :pIDContratoEmptmo
                                AND   h.parcela = :pNumParcela
                                AND   h.origem IN (1,11,12)
                                AND   h.naturezaitem = 1                                
                                AND   h.flgquitabonoestorno = 0
                                AND   (h.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto
                                                                          FROM tiposuspemptmo ts
                                                                          WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))";
            }
            //SIG90605 -Fim

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                // Parâmetros
                bancoDeDados.AddInParameter(comando, "pIDContratoEmptmo", DbType.Int64, numeroContrato);
                bancoDeDados.AddInParameter(comando, "pNumParcela", DbType.Int32, numParcela);

                // Popula objetos resultantes
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        valorFGQC = Convert.ToDouble(leitor.obterString(0));
                    }
                }
            }

            return valorFGQC;
        }

        public bool tratarParcelasEmAtraso(long numeroContrato, DateTime dataCalculo, int numParcela, string origemRecurso, int tipoProposta)
        {
            try
            {
                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(conexaoOracle))
                {
                    using (OracleCommand cmd = new OracleCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "CM.SP_TRAT_PARCELAS_EM_ATRASO";

                        cmd.Parameters.Add("pNumContrato", OracleDbType.Int64).Value = numeroContrato;
                        cmd.Parameters.Add("pInArquivo", OracleDbType.Int32).Value = -1;
                        cmd.Parameters.Add("pNotInArquivo", OracleDbType.Int32).Value = -1;
                        cmd.Parameters.Add("pAnoMes", OracleDbType.Varchar2, 6).Value = dataCalculo.ToString("yyyyMM");
                        cmd.Parameters.Add("pAnoMesCobranca", OracleDbType.Varchar2, 6).Value = "-1";
                        cmd.Parameters.Add("pAnoMesCompetencia", OracleDbType.Varchar2, 6).Value = "-1";
                        cmd.Parameters.Add("pDataCalculo", OracleDbType.Date).Value = dataCalculo.Date;
                        cmd.Parameters.Add("pNumParcela", OracleDbType.Int32).Value = numParcela;
                        cmd.Parameters.Add("pOrigemRecurso", OracleDbType.NVarchar2, Int16.MaxValue).Value = origemRecurso;
                        cmd.Parameters.Add("pTipoProposta", OracleDbType.Int32).Value = tipoProposta;

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public double buscaSaldoInadimplente(long numeroContrato, DateTime dataInadimplencia)
        {
            double saldoInadimplente = 0;
            try
            {
                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(conexaoOracle))
                {
                    using (OracleCommand cmd = new OracleCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "CM.PCK_EMPRESTIMO.FN_SALDOINAD_ATUALIZADO";

                        OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                        cmd.Parameters.Add(paramResultado);

                        cmd.Parameters.Add("pNumContrato", OracleDbType.Int64).Value = numeroContrato;
                        cmd.Parameters.Add("pDataLimite", OracleDbType.Date).Value = dataInadimplencia.Date;

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        saldoInadimplente = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                    }
                }
                return saldoInadimplente;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public double BuscaSaldoInadimplente(long numeroContrato, DateTime dataInadimplencia)
        {
            double saldoInadimplente = 0;
            try
            {
                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                using (OracleConnection conn = new OracleConnection(conexaoOracle))
                {
                    using (OracleCommand cmd = new OracleCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "CM.PCK_EMPRESTIMO.FN_SALDOINAD_ATUALIZADO";

                        OracleParameter paramResultado = new OracleParameter("pResultado", OracleDbType.Double, ParameterDirection.ReturnValue);
                        cmd.Parameters.Add(paramResultado);

                        cmd.Parameters.Add("pNumContrato", OracleDbType.Int64).Value = numeroContrato;
                        cmd.Parameters.Add("pDataLimite", OracleDbType.Date).Value = dataInadimplencia.Date;

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        saldoInadimplente = Convert.ToDouble(cmd.Parameters["pResultado"].Value);
                    }
                }
                return saldoInadimplente;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public double BuscarContratosInclusaoSerasaTotal(DateTime DataInicial, DateTime DataFinal)
        {
            double totalRegistros = 0;
            string query = @"SELECT COUNT(*)
                              FROM contratoemptmo c 
  	                               JOIN tipocontremptmo tc     ON tc.idtipocontremptmo = c.idtipocontremptmo
	                               JOIN histeventocobemptmo he ON he.idcontratoemptmo = c.idcontratoemptmo
  	                               JOIN tipoeventocobemptmo te ON te.idtipoeventocobemptmo = he.idtipoeventocobemptmo
	                               JOIN depentit d 		       ON d.idtitular = c.idpessoa AND d.idpessoa = c.idbenef
	                               JOIN pessoa p 	    ON p.idpessoa = c.idbenef
	                               JOIN hmeprestacao hx ON hx.idcontratoemptmo = c.idcontratoemptmo
	                               JOIN eventocobxhistmovemptmo ev ON hx.idhistmovemptmo = ev.idhistmovemptmo
                                   JOIN pessoa ptr 	 	 ON ptr.idpessoa = c.idpatro
                                   JOIN pessoafisica pf  ON pf.idpessoa = p.idpessoa
                                   JOIN endpess e 		 ON e.idpessoa = p.idpessoa
                                   LEFT JOIN telendpess tel ON tel.idendereco = e.idendereco
                                   LEFT JOIN cidades ci     ON ci.idcidades = e.idcidades       
                             WHERE he.idtipoeventocobemptmo IN (13,22)
                               AND hx.iditememptmo = 13
                               AND ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                               --AND he.dataeventocob BETWEEN TO_DATE(:DataInicial, 'DD/MM/YYYY') AND TO_DATE(:DataFinal, 'DD/MM/YYYY')
                               AND he.dataeventocob BETWEEN TO_DATE('01/05/2019', 'DD/MM/YYYY') AND TO_DATE('20/06/2019', 'DD/MM/YYYY')
                               --AND c.idcontratoemptmo =  300000658057
                               AND e.idendereco = NVL(NVL(p.idendcorresp, p.idendresidencial), (SELECT MAX(ep.idendereco) FROM Endpess ep WHERE ep.idpessoa = p.idpessoa))
                               AND NVL(tel.idtelefone,1) = NVL((SELECT MAX(t.idtelefone) FROM telendpess t WHERE t.idendereco = e.idendereco),1)
                               ORDER BY idcontratoemptmo, Parcela";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))            
            {                
                bancoDeDados.AddInParameter(comando, "DataInicial", DbType.Date, DataInicial.Date);
                bancoDeDados.AddInParameter(comando, "DataFinal", DbType.Date, DataFinal.Date);                

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    totalRegistros = Convert.ToDouble(leitor.GetValue(0));
                }
            }

            return totalRegistros;
        }

        //SIG 42330
        public List<Serasa> BuscarContratosInclusaoSerasa(int NumeroRemessa, string Usuario, DateTime DataEventoCobranca)
        {
            List<Serasa> listaContratos = new List<Serasa>();           
            string query = @"        
                            SELECT distinct Matricula,
                                   Nome,
                                   CPF,
                                   DataNasc,
                                   NomePai, 
                                   NomeMae,
                                   Idcontratoemptmo,
                                   ValorSolicitado,
                                   DataCredito, 
                                   FormaPagamento,
                                   Endereco,
                                   Bairro,
                                   Municipio,
                                   UF,
                                   CEP,
                                   DDD,
                                   Numero,
                                   DataInadimplencia,
                                   SaldoInadimplencia,
                                   Modalidade,
                                   NumParcela,
                                   IdHistCobranca
                            FROM  (
                                    SELECT distinct d.matricula,
                                           p.nome,
                                           p.numdocumento as CPF,
                                           pf.datanasc,
                                           pf.nomepai, 
                                           pf.nomemae,
                                           c.idcontratoemptmo,
                                           c.vlrcontrato*100 AS ValorSolicitado,
                                           to_char(c.datacredito,'YYYYMMDD') AS DataCredito,                                  
                                           CASE
                                                                      WHEN hx.FORMACOBRANCA = 'F' THEN 'EG'
                                                                      WHEN hx.FORMACOBRANCA = 'C' THEN 'EC'
                                           END  AS FormaPagamento,                                       
                                              (e.logradouro || ' ' || e.numero || ' ' || e.complemento) AS Endereco,
                                              e.bairro,
                                              ci.nome AS municipio,
                                              NVL(ci.uf,ci.codestado) AS UF,
                                              e.cep,
                                              tel.ddd,
                                              tel.numero,
                                                                     (
                                                  SELECT MIN(h.hmedataprevista)
                                                                                     FROM histmovemptmo h
                                                                                          JOIN contratoemptmo cont ON cont.idcontratoemptmo=h.idcontratoemptmo
                                                                                     WHERE h.hmetipomov = 1
                                                                                     AND   h.hmerecpag = 'R'
                                                                                     AND   h.hmecentraliza + h.hmedestacado = 1
                                                                                     AND   h.hmedataefetiva IS NULL
                                                                                     AND   h.hmevlrefetivo IS NULL
                                                                                     AND   NVL(h.flgestornado,0) = 0
                                                                                     AND   h.iditememptmo IN (13,99)
                                                                                     AND   h.iditemcentraliza = 13
                                                                                     AND   NVL(h.flgquitado,0) = 0
                                                                                     AND   NVL(h.flgabonado,0) = 0
                                                                                     AND   (NVL(h.flgsuspensao,0) = 0 OR 1 = (
                                                                                  SELECT NVL(t.flgemaberto,0) FROM tiposuspemptmo t
                                                                                                                               WHERE t.idtiposuspemptmo = h.idtiposuspemptmo
                                                                                                                              )
                                                                                           )
                                                                                     AND   h.hmedataprevista > add_months(SYSDATE, (-1) * (4*12+11))
                                                                                     AND   h.hmedataprevista < (SYSDATE - 4)
                                                                                     AND   h.idcontratoemptmo = c.idcontratoemptmo
                                                  AND   h.hmeparcela = hx.parcela
                                                                     ) AS DataInadimplencia,
                                                                     (
                                                      SELECT NVL(TO_CHAR(SUM(h.hmevlrprevisto)),'0')
                                                                                     FROM histmovemptmo h
                                                                                          JOIN contratoemptmo cont ON cont.idcontratoemptmo=h.idcontratoemptmo
                                                                                     WHERE h.hmetipomov = 1
                                                                                     AND   h.hmerecpag = 'R'
                                                                                     AND   h.hmecentraliza + h.hmedestacado = 1
                                                                                     AND   h.hmedataefetiva IS NULL
                                                                                     AND   h.hmevlrefetivo IS NULL
                                                                                     AND   NVL(h.flgestornado,0) = 0
                                                                                     AND   h.iditememptmo IN (13,99)
                                                                                     AND   h.iditemcentraliza = 13
                                                                                     AND   NVL(h.flgquitado,0) = 0
                                                                                     AND   NVL(h.flgabonado,0) = 0
                                                                                     AND   (NVL(h.flgsuspensao,0) = 0 OR 1 = (SELECT NVL(t.flgemaberto,0) FROM tiposuspemptmo t
                                                                                                                              WHERE t.idtiposuspemptmo = h.idtiposuspemptmo))
                                                                                     AND   h.hmedataprevista > add_months(SYSDATE, (-1) * (4*12+11))
                                                                                     AND   h.hmedataprevista < (SYSDATE - 4)
                                                                                     AND   h.idcontratoemptmo =  c.idcontratoemptmo 
                                                  AND   h.hmeparcela = hx.parcela
                                                                     ) AS SaldoInadimplencia,
                                                tc.tcedescricao AS Modalidade,
                                              (
                                                  SELECT DISTINCT hme.parcela
                                                  FROM hmeprestacao hme JOIN eventocobxhistmovemptmo ev ON hme.idhistmovemptmo = ev.idhistmovemptmo
                                                  WHERE ev.idhisteventocobemptmo = he.idhisteventocobemptmo
                                                  AND hme.parcela = hx.parcela
                                                  AND hme.iditememptmo in (13)
                                              )  AS NumParcela,
                                           he.IdHistEventoCobEmptmo AS IdHistCobranca
                                      FROM contratoemptmo c 
                                           JOIN tipocontremptmo tc     ON tc.idtipocontremptmo = c.idtipocontremptmo
                                           JOIN histeventocobemptmo he ON he.idcontratoemptmo = c.idcontratoemptmo
                                           JOIN tipoeventocobemptmo te ON te.idtipoeventocobemptmo = he.idtipoeventocobemptmo
                                           JOIN depentit d 		       ON d.idtitular = c.idpessoa AND d.idpessoa = c.idbenef
                                           JOIN pessoa p 	    ON p.idpessoa = c.idbenef
                                           JOIN hmeprestacao hx ON hx.idcontratoemptmo = c.idcontratoemptmo
                                           --JOIN hmeenvio    env ON env.idhistmovemptmo = hx.idhistmovemptmo
                                           JOIN histenvioemptmo henv ON henv.idhistmovemptmo = hx.idhistmovemptmo
                                           JOIN eventocobxhistmovemptmo ev ON hx.idhistmovemptmo = ev.idhistmovemptmo
                                           JOIN pessoa ptr 	 	 ON ptr.idpessoa = c.idpatro
                                           JOIN pessoafisica pf  ON pf.idpessoa = p.idpessoa
                                           JOIN endpess e 		 ON e.idpessoa = p.idpessoa
                                           LEFT JOIN telendpess tel ON tel.idendereco = e.idendereco
                                           LEFT JOIN cidades ci     ON ci.idcidades = e.idcidades       
                                           LEFT JOIN docpessoa dp ON dp.idpessoa = p.idpessoa AND dp.iddocumento = 2
                                     WHERE he.idtipoeventocobemptmo IN (13,22)
                                       AND hx.iditememptmo = 13
                                       AND NVL(hx.FlgQuitAbonoEstorno,0) = 0
                                       AND hx.dataefetiva is null
                                       AND ev.idhisteventocobemptmo = he.idhisteventocobemptmo   
                                       AND he.dataeventocob = :DataInicial                                                                                                          
                                       AND e.idendereco = NVL(NVL(p.idendcorresp, p.idendresidencial), (SELECT MAX(ep.idendereco) 
                                                                                                        FROM Endpess ep 
                                                                                                        WHERE ep.idpessoa = p.idpessoa))
                                       AND NVL(tel.idtelefone,1) = NVL((SELECT MAX(t.idtelefone) 
                                                                        FROM telendpess t 
                                                                        WHERE t.idendereco = e.idendereco),1)                                    
                                       AND he.DtGeracaoArqSerasa IS NULL                                       
                                       ORDER BY Nome, Idcontratoemptmo, NumParcela
                            )";

            //WO23253 - Retirada condição que limitava o número de registros devido limitação do SERASA - WHERE ROWNUM <= 990

            Database bancoDeDados = this.obterBancoDeDados();            
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {                
                bancoDeDados.AddInParameter(comando, "DataInicial", DbType.Date, DataEventoCobranca.Date);                                   

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {                
                    listaContratos.AddRange(MontaListaSerasa(leitor));
                }
            }

            return listaContratos;
        }

        //SIG 42330
        private List<Serasa> MontaListaSerasa(IDataReader Reader)
        {
            System.Globalization.TextInfo ti = new System.Globalization.CultureInfo("pt-BR", false).TextInfo;
            List<Serasa> listaContratos = new List<Serasa>();
            string[] excessoes = { "De", "Da", "Das", "Do", "Dos" };

            while (Reader.Read())
            {
                Serasa Dados = new Serasa();
                Dados.Matricula = Reader.obterString(0);
                Dados.NomeParticipante = StringUtil.PrimeiraMaiuscula(Reader.obterString(1), excessoes);
                Dados.NumCPF = Reader.obterString(2);
                Dados.DataNascimento = Reader.GetValue(3) == DBNull.Value ? "" : Convert.ToDateTime(Reader.obterValorData(3)).ToString("dd/MM/yyyy");           
                Dados.NomePai = StringUtil.PrimeiraMaiuscula(Reader.obterString(4), excessoes);
                Dados.NomeMae = StringUtil.PrimeiraMaiuscula(Reader.obterString(5), excessoes);
                Dados.NumeroContrato = Reader.obterString(6);
                Dados.ValorContratado = (double)Reader.obterValorDecimal(7).Value;
                Dados.FormaPagamento = Reader.obterString(9);

                Dados.Endereco = Reader.obterString(10);
                Dados.Bairro = Reader.obterString(11);
                Dados.Cidade = Reader.obterString(12);
                Dados.UF = Reader.obterString(13);
                Dados.CEP = Reader.obterString(14);
                Dados.DDD = Reader.obterString(15);
                Dados.Telefone = Reader.obterString(16);
                Dados.DataInadimplencia = Reader.obterValorData(17) == null ? DateTime.MinValue : (DateTime) Reader.obterValorData(17); 
                Dados.SaldoInadimplencia = Reader.obterString(18) == "" ? 0 : Convert.ToDouble(Reader.obterString(18));
                Dados.Modalidade = StringUtil.PrimeiraMaiuscula(Reader.obterString(19));
                Dados.NumeroPrestacao = Reader.obterString(20);
                Dados.IdEventoCobranca = Reader.obterInt(21);
                Dados.DataCredito = Reader.obterString(8);
       
                listaContratos.Add(Dados);
            }

            return listaContratos;
        }

        //SIG 42330
        //public void GravarDataGeracaoArquivoSerasa(long NumeroContrato, int NumeroRemessa, int IdEventoCobranca)
        //{
        //    try
        //    {
        //        Database bancoDeDados = this.obterBancoDeDados();
        //        var update = @"UPDATE cm.histeventocobemptmo 
        //                       SET DtGeracaoArqSerasa = SYSDATE,
        //                            NuRemessa = :NumeroRemessa
        //                       WHERE IdContratoEmptmo = :NumeroContrato 
        //                       AND IdHistEventoCobEmptmo = :IdEventoCobranca";

        //        using (DbCommand cmd = bancoDeDados.obterComandoPorSql(update))
        //        {
        //            bancoDeDados.AddInParameter(cmd, "NumeroRemessa", DbType.Int32, NumeroRemessa);
        //            bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Int64, NumeroContrato);                    
        //            bancoDeDados.AddInParameter(cmd, "IdEventoCobranca", DbType.Int32, IdEventoCobranca);

        //            bancoDeDados.ExecuteNonQuery(cmd);
        //        }
        //    }
        //    catch
        //    {
        //        throw new Exception("Não foi possível registrar a data de geração do arquivo de inclusão do Serasa.");
        //    }
        //}

        public void GravarDataGeracaoArquivoSerasa(decimal NumeroContrato, int NumeroRemessa, int IdEventoCobranca)
        {
            try
            {
                Database bancoDeDados = this.obterBancoDeDados();

                var update = @"UPDATE cm.histeventocobemptmo 
                               SET DtGeracaoArqSerasa = SYSDATE,
                                   NuRemessa = :NumeroRemessa
                               WHERE IdContratoEmptmo = :NumeroContrato 
                               AND IdHistEventoCobEmptmo = :IdEventoCobranca";

                using (DbCommand cmd = bancoDeDados.obterComandoPorSql(update))
                {
                    bancoDeDados.AddInParameter(cmd, "NumeroRemessa", DbType.Int32, NumeroRemessa);
                    bancoDeDados.AddInParameter(cmd, "NumeroContrato", DbType.Decimal, NumeroContrato);
                    bancoDeDados.AddInParameter(cmd, "IdEventoCobranca", DbType.Int32, IdEventoCobranca);

                    int linhasAfetadas = bancoDeDados.ExecuteNonQuery(cmd);

                    if (linhasAfetadas == 0)
                    {
                        throw new InvalidOperationException($"Nenhum registro atualizado para Contrato {NumeroContrato} / Evento {IdEventoCobranca}.");
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível registrar a data de geração do arquivo de inclusão do Serasa.", ex);
            }
        }

        //SIG 42330
        public int ObterNumeroRemessaArquivo()
        {
            string query;
            int numeroRemessa = 0;

            query = @" SELECT MAX(NuRemessa) FROM histeventocobemptmo";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        numeroRemessa = leitor.obterInt(0);
                    }
                }
                if (numeroRemessa > 0)
                    numeroRemessa = numeroRemessa + 1;

                return numeroRemessa;
            }
        }

        public List<long> BuscarContratosInadimplentes(int IdPessoa)
        {
            List<long> contratos = new List<long> ();
            
            string query = $@"SELECT c.idcontratoemptmo 
		                     FROM contratoemptmo c
		                     WHERE c.flgsituacao IN ('A','E')
		                     AND  cm.pck_emprestimo.FN_SALDOINADIMPLENTE(c.idcontratoemptmo, trunc(SYSDATE)) > 0
		                     AND   c.idbenef IN (SELECT p.idpessoa
							                    FROM pessoa p
							                    WHERE p.numdocumento = (SELECT p1.numdocumento
												                        FROM pessoa p1
												                        WHERE p1.idpessoa = {IdPessoa})
		                                        );";
            
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {            
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {                                                  
                        contratos.Add((long)leitor.obterValorInt64(0));
                    }
                }
            }
            return contratos;            
        }

        public itemPrestacaoDTO BuscarResumoInadimplencia(long NumeroContrato, DateTime DataPrevista)
        {
            var inadimplencia = new ContratoRenegociacao();
            Database bancoDeDados = this.obterBancoDeDados();           
            itemPrestacaoDTO dto;
            try
            {       
                using (DbCommand comando = bancoDeDados.GetStoredProcCommand("CM.PCK_EMP_RENEG_INADIMPLENCIA.PR_CALC_VALORES_ABERTO"))
                {               
                    bancoDeDados.AddInParameter(comando, "pDataPrevista", DbType.DateTime, DataPrevista);
                    bancoDeDados.AddInParameter(comando, "pNumeroContrato", DbType.Int64, NumeroContrato);          

                    bancoDeDados.AddOutParameter(comando, "pCorrecaoMonetaria", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pParcela", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pJurosRemuneratorio", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pJurosMora", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pMulta", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pIOFComplementar", DbType.Double, 10);                    
                    bancoDeDados.AddOutParameter(comando, "pTotalEncargos", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pFGQC", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pSaldoDevedor", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pSaldoDevedorVencido", DbType.Double, 10);
                    bancoDeDados.AddOutParameter(comando, "pMsgErro", DbType.String, 150);       

                    bancoDeDados.ExecuteNonQuery(comando);
                    dto = (new itemPrestacaoDTO{NumeroContrato = NumeroContrato,
                                                Parcela = (double)bancoDeDados.GetParameterValue(comando, "pParcela"),
                                                CorrecaoMonetaria = (double)bancoDeDados.GetParameterValue(comando, "pCorrecaoMonetaria"),
                                                JurosRemuneratorios = (double)bancoDeDados.GetParameterValue(comando, "pJurosRemuneratorio"),
                                                JurosMora = (double)bancoDeDados.GetParameterValue(comando, "pJurosMora"),
                                                Multa = (double)bancoDeDados.GetParameterValue(comando, "pMulta"),
                                                IofComplementar = (double)bancoDeDados.GetParameterValue(comando, "pIOFComplementar"),                                                
                                                TotalEncargos = (double)bancoDeDados.GetParameterValue(comando, "pTotalEncargos"),
                                                FGQC = (double)bancoDeDados.GetParameterValue(comando, "pFGQC"),
                                                SaldoDevedor = (double)bancoDeDados.GetParameterValue(comando, "pSaldoDevedor"),
                                                SaldoDevedorVencido = (double)bancoDeDados.GetParameterValue(comando, "pSaldoDevedorVencido"),

                        ValorTotal = 0
                    });
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return dto;
        }

        public void DesfazerRemessaSerasa(int NumeroRemessa, double IdUsuarioLogado)
        {  
            try
            {
                Database bancoDeDados = this.obterBancoDeDados();
                var update = @"UPDATE cm.histeventocobemptmo 
                               SET DtGeracaoArqSerasa = NULL,
                                   NuRemessa = NULL,
                                   DtCancelRemessa = SYSDATE,
                                   UsuarioCancelRemessa = :IdUsuarioLogado
                               WHERE NuRemessa = :NumeroRemessa 
                               AND idtipoeventocobemptmo IN (13,22)";

                using (DbCommand cmd = bancoDeDados.obterComandoPorSql(update))
                {
                    bancoDeDados.AddInParameter(cmd, "IdUsuarioLogado", DbType.Int32, IdUsuarioLogado);
                    bancoDeDados.AddInParameter(cmd, "NumeroRemessa", DbType.Int32, NumeroRemessa);                    

                    bancoDeDados.ExecuteNonQuery(cmd);
                }
            }
            catch
            {
                throw new Exception("Não foi possível desfazer a remessa número " + NumeroRemessa + ".");
            }
        }

        public void ExecutarRelatorioInadimplencia(long NumeroContrato, DateTime DataLimite)
        {
            try
            {
                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                
                string Query = @"SELECT 
                                    DISTINCT
                                        C.IDCONTRATOEMPTMO,
                                        D.MATRICULA,
                                        max(H.CODDOCUMENTO) AS CODDOCUMENTO,
                                        C.IDBENEF
                                    FROM
                                        DEPENTIT D,
                                        CONTRATOEMPTMO C,
                                        HISTMOVEMPTMO H
                                    WHERE
                                        (C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO) AND
                                        (H.CODDOCUMENTO IS NOT NULL) AND
                                        (C.FLGSITUACAO NOT IN('C', 'Q')) AND
                                        (C.IDPESSOA = D.IDTITULAR) AND
                                        (C.IDBENEF = D.IDPESSOA) AND
                                        (D.MATRICULA = '0670462')
                                        AND C.IDCONTRATOEMPTMO = 300000740472
                                        group by C.IDCONTRATOEMPTMO, D.MATRICULA,C.IDBENEF";                                
                    
                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(Query))
                {
                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {                          
                            using (OracleConnection conn = new OracleConnection(conexaoOracle))
                            {
                                using (OracleCommand cmd = new OracleCommand())
                                {
                                    cmd.Connection = conn;
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.CommandText = "CM.PR_RELINADIMPLENTESNOVO";

                                    cmd.Parameters.Add("pDATALIMITE", OracleDbType.Date).Value = DataLimite;
                                    cmd.Parameters.Add("PIDBENEF", OracleDbType.Int32).Value = leitor.obterInt(3);
                                    cmd.Parameters.Add("PIDCONTRATOEMPTMO", OracleDbType.Int64).Value = NumeroContrato;
                                    cmd.Parameters.Add("PCODDOCUMENTO", OracleDbType.Varchar2, 6).Value = leitor.obterString(3);
                                    cmd.Parameters.Add("PCONTRATOAD", OracleDbType.Varchar2, 6).Value = "-1";
                                    cmd.Parameters.Add("PNOMERELATORIO", OracleDbType.Varchar2, 6).Value = "Relatório Busca Inadimplentes";
                                    cmd.Parameters.Add("PIDFORM", OracleDbType.Int32).Value = 13441;

                                    conn.Open();
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                }
                            }
                        }
                    } 
                }
            }
            catch (Exception ex)
            {
                throw ex;              
            }
        }

        public List<long> BuscarContratosAtivosEncerrados()
        {
            List<long> contratos = new List<long>();

            string query = $@"SELECT c.idcontratoemptmo 
		                     FROM contratoemptmo c
		                     WHERE c.flgsituacao IN ('A','E');";

            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
            {
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    while (leitor.Read())
                    {
                        contratos.Add((long)leitor.obterValorInt64(0));
                    }
                }
            }
            return contratos;
        }

        //public void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa)
        //{
        //    if (contratos == null || !contratos.Any())
        //        return;

        //    Database banco = this.obterBancoDeDados();

        //    using (DbConnection conn = banco.CreateConnection())
        //    {
        //        conn.Open();

        //        using (DbTransaction trans = conn.BeginTransaction())
        //        {
        //            try
        //            {
        //                var parametros = new List<string>();

        //                for (int i = 0; i < contratos.Count; i++)
        //                {
        //                    parametros.Add($":p{i}");
        //                }

        //                string sql = $@"UPDATE cm.histeventocobemptmo
        //                                SET DtGeracaoArqSerasa = SYSDATE,
        //                                    NuRemessa = :NumeroRemessa
        //                                WHERE IdContratoEmptmo IN ({string.Join(",", parametros)})";

        //                using (DbCommand cmd = banco.GetSqlStringCommand(sql))
        //                {
        //                    cmd.Connection = conn;
        //                    cmd.Transaction = trans;

        //                    banco.AddInParameter(cmd, "NumeroRemessa", DbType.Int32, numeroRemessa);

        //                    for (int i = 0; i < contratos.Count; i++)
        //                    {
        //                        banco.AddInParameter(cmd, $"p{i}", DbType.Int64, contratos[i]);
        //                    }

        //                    int linhas = cmd.ExecuteNonQuery();

        //                    if (linhas == 0)
        //                        throw new Exception("Nenhum registro foi atualizado.");

        //                    trans.Commit();
        //                }
        //            }
        //            catch
        //            {
        //                trans.Rollback();
        //                throw;
        //            }
        //        }
        //    }
        //}

        //public void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa)
        //{
        //    const int TAMANHO_LOTE = 1000;

        //    Database banco = this.obterBancoDeDados();

        //    using (DbConnection conn = banco.CreateConnection())
        //    {
        //        conn.Open();

        //        using (DbTransaction trans = conn.BeginTransaction())
        //        {
        //            try
        //            {
        //                foreach (var lote in DividirEmLotes(contratos, TAMANHO_LOTE))
        //                {
        //                    ExecutarUpdateLote(conn, trans, lote, numeroRemessa);
        //                }

        //                trans.Commit();
        //            }
        //            catch
        //            {
        //                trans.Rollback();
        //                throw;
        //            }
        //        }
        //    }
        //}

        public void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa, DateTime dataEvento)
        {
            if (contratos == null || contratos.Count == 0)
                return;
            Database banco = this.obterBancoDeDados();
            
            using (var conn = new OracleConnection(banco.ConnectionString))
            {
                conn.Open();

                using (var trans = conn.BeginTransaction())
                {
                    try
                    {
                        var lotes = DividirEmLotes(contratos, 1000);

                        foreach (var lote in lotes)
                        {
                            ExecutarUpdateLote(conn, trans, lote, numeroRemessa, dataEvento);
                        }

                        trans.Commit();
                    }
                    catch
                    {
                        trans.Rollback();
                        throw;
                    }
                }
            }
        }

        private static IEnumerable<List<T>> DividirEmLotes<T>(List<T> lista, int tamanhoLote)
        {
            for (int i = 0; i < lista.Count; i += tamanhoLote)
            {
                yield return lista.GetRange(i, Math.Min(tamanhoLote, lista.Count - i));
            }
        }

        //private void ExecutarUpdateLote(Database banco, DbConnection conn, DbTransaction trans, List<decimal> contratos, int numeroRemessa)
        //{
        //    var parametros = new List<string>();

        //    for (int i = 0; i < contratos.Count; i++)
        //        parametros.Add($":p{i}");

        //    string sql = $@"UPDATE cm.histeventocobemptmo
        //                    SET DtGeracaoArqSerasa = SYSDATE,
        //                        NuRemessa = :NumeroRemessa
        //                    WHERE IdContratoEmptmo IN ({string.Join(",", parametros)})";

        //    using (DbCommand cmd = banco.GetSqlStringCommand(sql))
        //    {
        //        cmd.Connection = conn;
        //        cmd.Transaction = trans;

        //        banco.AddInParameter(cmd, "NumeroRemessa", DbType.Int32, numeroRemessa);

        //        for (int i = 0; i < contratos.Count; i++)
        //            banco.AddInParameter(cmd, $"p{i}", DbType.Int64, contratos[i]);

        //        cmd.ExecuteNonQuery();
        //    }
        //}

        private void ExecutarUpdateLote(OracleConnection conn, OracleTransaction trans, List<decimal> contratos, int numeroRemessa, DateTime dataEvento)
        {
            var parametros = new List<string>();

            for (int i = 0; i < contratos.Count; i++)
                parametros.Add($":p{i}");

            string sql = $@"UPDATE CM.histeventocobemptmo
                            SET DtGeracaoArqSerasa = SYSDATE,
                                NuRemessa = :NumeroRemessa
                            WHERE idtipoeventocobemptmo IN (13, 22)
                            AND dataeventocob = :dataEvento
                            AND DtGeracaoArqSerasa IS NULL  
                            AND IdContratoEmptmo IN ({string.Join(",", parametros)})";
                            

            using (var cmd = new OracleCommand(sql, conn))
            {
                cmd.Transaction = trans;
                cmd.BindByName = true;

                cmd.Parameters.Add("numeroRemessa", OracleDbType.Int32).Value = numeroRemessa;
                cmd.Parameters.Add("dataEvento", OracleDbType.Date).Value = dataEvento;

                for (int i = 0; i < contratos.Count; i++)
                {
                    cmd.Parameters.Add($"p{i}", OracleDbType.Int64).Value = contratos[i];
                }

                cmd.ExecuteNonQuery();
            }
        }
    }
}
