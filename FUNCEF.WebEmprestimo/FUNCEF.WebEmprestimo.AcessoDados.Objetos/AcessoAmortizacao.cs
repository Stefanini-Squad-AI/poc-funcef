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
            }

            return existeAmortizacaoAnterior;
        }

        //William Moreira da Silva - SOL 249745
        /// <summary>
        /// Consulta que verifica se o participante já tem uma amortização para o contrato que seria quitado na renovação de emprestimo
        /// </summary>
        /// <param name="numeroContrato">Numero de contrato a ser verificado</param>
        /// <param name="dataPrevista">A data prevista que a amortização foi lanaçada</param>
        /// <returns>Retorna flgEnvio -1 se não tiver amortização ou 1/0 se já foi enviado ou não</returns>
        public int verificarAmortizacaoExistente(long numeroContrato, out DateTime dataPrevista)
        {
            string query;

            int flgEnvio = -1;
            dataPrevista = DateTime.Today;

            // Consulta
            query = @" SELECT DECODE(HME.FLGENVIO, NULL, 1, 1, 1, 0, 0) AS FLGENVIO,
                       HME.HMEDATAPREVISTA
                  FROM HISTMOVEMPTMO HME
                 WHERE HME.HMETIPOMOV = 2
                   AND HME.HMECENTRALIZA = 1
                   AND HME.FLGBAIXADO = 0
                   AND HME.HMEVLREFETIVO IS NULL
                   AND HME.HMEDATAEFETIVA IS NULL
                   AND NVL(HME.FLGESTORNADO, 0) = 0
                   AND NVL(HME.FLGQUITADO, 0) = 0
                   AND NVL(HME.FLGABONADO, 0) = 0
                   AND HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P ";

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
                        flgEnvio = Convert.ToInt32(leitor.GetValue(0));
                        dataPrevista = Convert.ToDateTime(leitor.GetValue(1));
                    }
                }

                return flgEnvio;
            }
        }

        /// <summary>
        /// Verifica se já existe uma amortização para o contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        public bool verificarAmortizacaoExistente(long numeroContrato, DateTime dataAmortizacao)
        {
            string query;

            bool existeAmortizacao = false;

            // Consulta
            query = @" SELECT DISTINCT HMEDATAPREVISTA 
             FROM HISTMOVEMPTMO HME 
               WHERE HME.IDCONTRATOEMPTMO = :NUMEROCONTRATO_P 
               AND HME.HMETIPOMOV = 2 
               AND TRUNC(HME.HMEDATAPREVISTA) >= TRUNC(:DATAAMORTIZACAO_P) 
               AND (HME.FLGESTORNADO = 0 OR FLGESTORNADO IS NULL) ";

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
                    existeAmortizacao = leitor.Read();
                }

            }

            return existeAmortizacao;
        }

        //Campanha Desconto
        public string ObterNossoNumeroPorCodDocumento(double codDocumento)
        {
            string resultado = string.Empty;
            try
            {
                string query = @"SELECT 
                                 D.NOSSONUMERO
                                 FROM
                                 CM.DOCUMENTO D
                                 WHERE D.CODDOCUMENTO = :codDocumento";

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "codDocumento", DbType.Int64, codDocumento);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {
                            resultado = leitor.obterString(0);
                        }
                    }
                }
            }
            catch
            {
                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }

            return resultado;
        }

        public bool VerificarDocumentoEmitido(double codDocumento)
        {
            bool resultado = false;
            try
            {
                string query = @"SELECT EMISBLOQ
                                FROM CM.DOCUMENTO D
                                WHERE D.CODDOCUMENTO = :codDocumento
                                AND D.EMISBLOQ = 'S'";

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "codDocumento", DbType.Int64, codDocumento);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {

                        if (leitor.Read())
                        {
                            resultado = leitor.obterString(0) == "S";
                        }
                    }
                }
            }
            catch
            {

                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }
            return resultado;
        }

        public string ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(int codPortForma)
        {
            string nossoNumero = "";
            try
            {
                string query = @"SELECT
                                 PF.NOSSONUMERO + 1 AS NOSSONUMERO
                                 FROM PORTADORFORMA PF
                                 WHERE PF.CODPORTFORMA = :codPortForma";

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "codPortForma", DbType.Int16, codPortForma);
                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {
                            nossoNumero = leitor.obterString(0);
                        }
                    }
                }

            }
            catch
            {

                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }

            return nossoNumero;
        }

        public void AtualizarNossoNumero(string nossoNumero, int codPortForma)
        {
            try
            {
                string query = @"UPDATE PORTADORFORMA PF
                                  SET PF.NOSSONUMERO = :nossoNumero
                                  WHERE PF.CODPORTFORMA = :codPortForma";

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "nossoNumero", DbType.String, nossoNumero);
                    bancoDeDados.AddInParameter(comando, "codPortForma", DbType.Int16, codPortForma);

                    bancoDeDados.ExecuteNonQuery(comando);
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }
        }

        public void AtualizarNossoNumero(double codDocumento, string nossoNumero)
        {
            try
            {
                string query = @"UPDATE DOCUMENTO D
                                 SET D.NOSSONUMERO = :nossoNumero
                                 WHERE D.CODDOCUMENTO = :codDocumento";

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "codDocumento", DbType.Int64, codDocumento);
                    bancoDeDados.AddInParameter(comando, "nossoNumero", DbType.Int64, nossoNumero);
                }
            }
            catch
            {
                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }
        }

        public Boleto ObterBoletoPorCodDocumento(double codDocumento, int portForma, bool blDocumentoEmitido, int tipoMovimento)
        {
            try
            {
                string query = @"SELECT NULL AS CEP,
                                   NULL AS CODESTADO,
                                   NULL AS CIDADE,
                                   NULL AS BAIRRO,
                                   NULL AS COMPLEMENTO,
                                   NULL AS NUMERO,
                                   NULL AS LOGRADOURO,
                                   trim(p.numdocumento) AS NUMDOCUMENTO,
                                   p.nome,
                                   TO_CHAR(d.valordesconto) valordesconto,
                                   d.datavencto,
                                   TRUNC(SYSDATE) AS DATADOCUMENTO,
                                   d.nossonumero,
                                   NULL AS NUMAGENCIA,
                                   NULL AS VALORJUROS,
                                   TO_CHAR(l.valor) valor,
                                   d.coddocumento,
                                   trim(ab.numagencia) || '.' || trim(pf.numempresabanco)
                                FROM documento d
                                     JOIN pessoa p ON p.idpessoa = d.idforcli
                                     JOIN lanctodocum l ON l.coddocumento = d.coddocumento
                                                        AND l.operacao = 2
                                     JOIN portadorforma pf ON pf.codportforma = d.codportforma
                                     JOIN portadorconta pc ON pc.codportador = pf.codportador
                                     JOIN agenciabancaria ab ON ab.idpessoa = pc.idagencia
                                WHERE d.codportforma = :portForma
                                AND   d.coddocumento = :codDocumento
                                AND   d.emisbloq = :boletoEmitido";


                string boletoEmitido = blDocumentoEmitido ? "S" : "N";

                Boleto dadosBoleto = new Boleto();
                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "portForma", DbType.Int16, portForma);
                    bancoDeDados.AddInParameter(comando, "codDocumento", DbType.Int64, codDocumento);
                    bancoDeDados.AddInParameter(comando, "boletoEmitido", DbType.String, boletoEmitido);


                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read())
                        {
                            dadosBoleto.CEP = leitor.obterString(0);
                            dadosBoleto.Estado = leitor.obterString(1);
                            dadosBoleto.Cidade = leitor.obterString(2);
                            dadosBoleto.Bairro = leitor.obterString(3);
                            dadosBoleto.Logradouro = leitor.obterString(6);
                            dadosBoleto.CPF = leitor.obterString(7);
                            dadosBoleto.NomeDaPessoa = leitor.obterString(8);
                            dadosBoleto.ValorDoDesconto = (double)leitor.obterDecimal(9);
                            dadosBoleto.DataDeVencimento = leitor.obterValorData(10).Value;
                            dadosBoleto.DataDoDocumento = leitor.obterValorData(11).Value;
                            dadosBoleto.NossoNumero = leitor.obterString(12);
                            dadosBoleto.VrDocumento = (double)leitor.obterDecimal(15);
                            dadosBoleto.ValorDoDocumento = leitor.obterDecimal(15).ToString("#,###,##0.00", System.Globalization.CultureInfo.CreateSpecificCulture("pt-BR"));
                            dadosBoleto.NumeroDoDocumento = leitor.obterString(16);
                            dadosBoleto.Agencia = leitor.obterString(17);
                        }
                    }
                }

                string queryInformacoes = @"SELECT tc.tcedescricao AS MODALIDADE,
                                                   c.datacredito AS DATA_CONCESSAO,
                                                   h.idcontratoemptmo,
                                                   wm_concat(' ' || TO_CHAR(H.DATAPREVISTA, 'MM/YYYY')) AS REFERENCIA
                                            FROM hmeall h
                                                 JOIN contratoemptmo c ON c.idcontratoemptmo = h.idcontratoemptmo
                                                 JOIN tipocontremptmo tc ON tc.idtipocontremptmo = c.idtipocontremptmo     
                                            WHERE h.tipomov = :tipoMovimento
                                            AND   h.naturezaitem = 2
                                            AND h.flgquitabonoestorno = 0
                                            AND h.flgenvio = 1
                                            AND h.formacobranca = 'C'
                                            AND   h.idhistmovemptmo IN 
                                            (SELECT hev.idhistmovemptmo
                                            FROM hmeenvio hev
                                            WHERE hev.coddocumento = :codDocumento
                                            AND   NOT EXISTS (SELECT 1 FROM lanctodocum l
                                                               WHERE l.coddocumento = hev.coddocumento
                                                               AND   l.operacao <> 2))
                                            GROUP BY tc.tcedescricao, c.datacredito, h.idcontratoemptmo";

                using (DbCommand comandoInfo = bancoDeDados.GetSqlStringCommand(queryInformacoes))
                {
                    bancoDeDados.AddInParameter(comandoInfo, "tipoMovimento", DbType.Int16, tipoMovimento);
                    bancoDeDados.AddInParameter(comandoInfo, "codDocumento", DbType.Double, codDocumento);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comandoInfo))
                    {
                        if (leitor.Read())
                        {
                            dadosBoleto.Modalidade = leitor.obterString(0);
                            dadosBoleto.DataConcessao = leitor.obterValorData(1).Value;
                            dadosBoleto.NumeroContrato = leitor.obterString(2);

                            switch (tipoMovimento)
                            {
                                case 1:
                                    dadosBoleto.ObservacoesAdicionais = "Parcela(s) referente(s) ao(s) mês(es)" + leitor.GetValue(3).ToString();
                                    break;
                                case 2:
                                    dadosBoleto.ObservacoesAdicionais = "Amortização do saldo devedor";
                                    break;
                                case 3:
                                    dadosBoleto.ObservacoesAdicionais = "Quitação do saldo devedor";
                                    break;
                            }
                        }
                    }
                }
                return dadosBoleto;
            }
            catch (Exception ex)
            {
                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }
        }

        public void AtualizarCampoEmisBloqParaS(double codDocumento)
        {
            try
            {
                string query = @"UPDATE CM.DOCUMENTO D
                                 SET D.EMISBLOQ = 'S', D.STATUS = 1
                                 WHERE D.CODDOCUMENTO = :codDocumento";


                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "codDocumento", DbType.String, codDocumento);
                }
            }
            catch
            {

                throw new Exception("Houve um erro ao estabelecer conexão com o banco de dados.");
            }
        }

        public EmptmoDocFinanceiroDTO RetornarDocumentoEnviado(double idContratoEmptmo, int tipoMovimento, int numParcela, DateTime dataVencimento)
        {
            EmptmoDocFinanceiroDTO docFinanceiro = new EmptmoDocFinanceiroDTO();
            try
            {
                string query;
                if (numParcela == 0)
                {
                    query = $@"SELECT DISTINCT d.coddocumento, d.codportforma
                             FROM hmeall h
                                  JOIN hmeenvio hev ON hev.idhistmovemptmo = h.idhistmovemptmo
                                  JOIN documento d ON d.coddocumento = hev.coddocumento
                                  JOIN lanctodocum l ON l.coddocumento = d.coddocumento
                            WHERE h.idcontratoemptmo = :idContratoEmptmo
                              AND h.tipomov = :tipoMovimento
                              AND h.datavencto = :dataVencimento
                              AND h.naturezaitem > 0
                              AND h.flgquitabonoestorno = 0
                              AND h.flgenvio = 1
                              AND h.formacobranca = 'C'
                              AND l.operacao = 2
                              AND h.RECPAG = 'R'";
                }
                else
                {
                    query = $@"SELECT d.coddocumento, d.codportforma
                             FROM hmeall h
                                  JOIN hmeenvio hev ON hev.idhistmovemptmo = h.idhistmovemptmo
                                  JOIN documento d ON d.coddocumento = hev.coddocumento
                                  JOIN lanctodocum l ON l.coddocumento = d.coddocumento
                            WHERE h.idcontratoemptmo = :idContratoEmptmo
                              AND h.tipomov = :tipoMovimento
                              AND h.parcela = :NumParcela
                              AND h.datavencto = :dataVencimento
                              AND h.naturezaitem > 0
                              AND h.flgquitabonoestorno = 0
                              AND h.flgenvio = 1
                              AND h.formacobranca = 'C'
                              AND l.operacao = 2
                              AND h.RECPAG = 'R'";
                }

                Database bancoDeDados = this.obterBancoDeDados();
                using (DbCommand comando = bancoDeDados.GetSqlStringCommand(query))
                {
                    bancoDeDados.AddInParameter(comando, "NumContrato", DbType.Int64, idContratoEmptmo);
                    bancoDeDados.AddInParameter(comando, "TipoMov", DbType.Int32, tipoMovimento);
                    bancoDeDados.AddInParameter(comando, "dataVencimento", DbType.DateTime, dataVencimento);

                    if (numParcela > 0)
                        bancoDeDados.AddInParameter(comando, "NumParcela", DbType.Int16, numParcela);

                    using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                    {
                        if (leitor.Read()) { 
                            docFinanceiro.numDocumento = (double)leitor.obterDecimal(0);
                            docFinanceiro.portadorForma = leitor.obterInt(1);
                        }
                    }
                    return docFinanceiro;
                }
            }
            catch (Exception ex)
            {
                docFinanceiro.msgErro = ex.Message;
                return docFinanceiro;
            }

        }

        public DateTime ObterUltimoDiaUtilBoleto()
        {
            DateTime ultimoDiaUtil = DateTime.Now.Date;
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @" SELECT cm.PCK_AA_EMPTMO_FINANCEIRO.fn_ultimo_dia_util_boleto FROM DUAL";
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        ultimoDiaUtil = leitor.obterValorData(0).Value;
                    }
                }
                return ultimoDiaUtil;
            }

        }

        public DateTime ObterProximoDiaUtil(DateTime data)
        {
            DateTime diaUtil = DateTime.Now.Date;
            Database bancoDeDados = this.obterBancoDeDados();

            string query = @" SELECT cm.pck_aa_funcao_emptmo.fn_proximo_dia_util(:pDataVerificar) FROM DUAL";
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {
                bancoDeDados.AddInParameter(comando, "pDataVerificar", DbType.Date, data);

                using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
                {
                    if (leitor.Read())
                    {
                        diaUtil = leitor.obterValorData(0).Value;
                    }
                }
                return diaUtil;
            }
        }
        #endregion
    }
}
