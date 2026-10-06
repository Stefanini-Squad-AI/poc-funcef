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
    /// Objeto de acesso a dados de estado do sistema.
    /// </summary>
    public class AcessoBeneficiario : ObjetoAcessoDados, IAcessoBeneficiario
    {
        #region Constantes

        #region Consultar Beneficiários

        private const int NOME_BENEF = 0;
        private const int PERCENTUAL_BENEF = 1;
        private const int NUMBANCO_BENEF = 2;
        private const int AGENCIA_BENEF = 3;
        private const int CONTACORRENTE_BENEF = 4;
        private const int OUTRASINFO_BENEF = 5;
        private const int VLRSALDOREC_BENEF = 6;
        private const int VLRREPASSE_BENEF = 7;
        private const int DATAREPASSE_BENEF = 8;


        #endregion

        #endregion

        #region Consultas

        /// <summary>
        /// Consulta os beneficiários do contrato.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Beneficiario"/> com o(s) beneficiário(s) encontrado(s).</returns>
        public List<Beneficiario> consultarBeneficiarios(long numero)
        {
            List<Beneficiario> beneficiarios = new List<Beneficiario>();
            StringBuilder query = new StringBuilder();

            // Consulta
            query.Append("SELECT CBS.NOME,            ");
            query.Append("       CBS.PERCINDENIZACAO, ");
            query.Append("       CBS.NUMBANCO,        ");
            query.Append("       CBS.CODAGENCIA,      ");
            query.Append("       CBS.CONTACORRENTE,   ");
            query.Append("       CBS.OBS,             ");
            query.Append("       CBS.VLRSALDOREC,     ");
            query.Append("       CBS.VLRREPASSE,      ");
            query.Append("       CBS.DATAREPASSE      ");
            query.Append("FROM   CONTRATOXBENEFSEG CBS, CONTRATOEMPTMO CON ");
            query.Append("WHERE  CBS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO ");
            query.Append("AND    CON.IDCONTRATOEMPTMO = :NUMERO_P ");
            
            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            DbCommand comando = bancoDeDados.obterComandoPorSql(query.ToString());

            // Parâmetros
            bancoDeDados.AddInParameter(comando, "NUMERO_P", DbType.Int64, numero.ToString());

            // Popula objetos resultantes
            using (IDataReader leitor = bancoDeDados.ExecuteReader(comando))
            {
                Beneficiario beneficiario = null;
                while (leitor.Read())
                {
                    beneficiario = new Beneficiario()
                    {
                        nome = leitor.GetString(NOME_BENEF),
                        percentual = leitor.GetDouble(PERCENTUAL_BENEF),
                        outrasInformacoes = leitor.GetString(OUTRASINFO_BENEF),
                        valorFundacao = leitor.GetDouble(VLRSALDOREC_BENEF),
                        valorBeneficio = leitor.GetDouble(VLRREPASSE_BENEF),
                        dataDeposito = leitor.obterValorData(DATAREPASSE_BENEF),
                        dadosBancarios = new DadosBancarios()
                        {
                            agencia = leitor.GetString(AGENCIA_BENEF),
                            banco = leitor.GetInt32(NUMBANCO_BENEF),
                            contaCorrente = leitor.GetString(CONTACORRENTE_BENEF)
                        }
                    };
                    beneficiarios.Add(beneficiario);
                }
            }

            return beneficiarios;
        }

        #endregion
    }
}