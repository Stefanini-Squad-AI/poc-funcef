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
            string query;

            // Consulta
            query = @" SELECT CBS.NOME,            
                   CBS.PERCINDENIZACAO, 
                   CBS.NUMBANCO,        
                   CBS.CODAGENCIA,      
                   CBS.CONTACORRENTE,   
                   CBS.OBS,             
                   CBS.VLRSALDOREC,     
                   CBS.VLRREPASSE,      
                   CBS.DATAREPASSE      
            FROM   CM.CONTRATOXBENEFSEG CBS, CONTRATOEMPTMO CON 
            WHERE  CBS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO 
            AND    CON.IDCONTRATOEMPTMO = :NUMERO_P ";

            // Cria comando de consulta
            Database bancoDeDados = this.obterBancoDeDados();
            using (DbCommand comando = bancoDeDados.obterComandoPorSql(query))
            {

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
                            nome = leitor.obterString(NOME_BENEF),
                            percentual = (double)leitor.obterDecimal(PERCENTUAL_BENEF),
                            outrasInformacoes = leitor.obterString(OUTRASINFO_BENEF),
                            valorFundacao = leitor.obterValorDecimal(VLRSALDOREC_BENEF) != null ? (double?)leitor.obterValorDecimal(VLRSALDOREC_BENEF) : null,
                            valorBeneficio = leitor.obterValorDecimal(VLRREPASSE_BENEF) != null ? (double?)leitor.obterValorDecimal(VLRREPASSE_BENEF) : null,
                            dataDeposito = leitor.obterValorData(DATAREPASSE_BENEF),
                            dadosBancarios = new DadosBancarios()
                            {
                                agencia = leitor.obterString(AGENCIA_BENEF),
                                banco = leitor.obterInt(NUMBANCO_BENEF),
                                contaCorrente = leitor.obterString(CONTACORRENTE_BENEF)
                            }
                        };
                        beneficiarios.Add(beneficiario);
                    }
                }



                return beneficiarios;
            }
        }

        #endregion
    }
}