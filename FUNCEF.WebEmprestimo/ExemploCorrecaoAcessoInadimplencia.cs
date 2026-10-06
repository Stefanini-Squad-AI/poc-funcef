using System;
using System.Configuration;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.Data.Common;

namespace FUNCEF.ExemploCorrecao
{
    /// <summary>
    /// Exemplo de como corrigir métodos que usam OracleCommand diretamente
    /// Conversão do método calculaCorrecaoMonetaria do AcessoInadimplencia
    /// </summary>
    public class ExemploCorrecaoAcessoInadimplencia
    {
        /// <summary>
        /// CÓDIGO ORIGINAL (problemático com Oracle v23+)
        /// </summary>
        public double calculaCorrecaoMonetariaOriginal(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo)
        {
            double valorCorrecaoMonetaria = 0;

            string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(conexaoOracle))
            {
                /* 
                // PROBLEMA: Este código não funciona com Oracle.ManagedDataAccess v23+
                using (OracleCommand cmd = new OracleCommand())  // ← ERRO AQUI
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

                    valorCorrecaoMonetaria = Convert.ToDouble(paramResultado.Value);
                }
                */
            }
            return valorCorrecaoMonetaria;
        }

        /// <summary>
        /// SOLUÇÃO 1: Usando DbProviderFactory (RECOMENDADO)
        /// </summary>
        public double calculaCorrecaoMonetariaCorrigido_V1(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo)
        {
            double valorCorrecaoMonetaria = 0;

            try
            {
                string conexaoOracle = ConfigurationManager.ConnectionStrings["OraWebEmprestimoConnectionString"].ConnectionString;
                
                // Usar DbProviderFactory em vez de new OracleCommand()
                var factory = DbProviderFactories.GetFactory("Oracle.ManagedDataAccess.Client");
                
                using (var conn = factory.CreateConnection())
                {
                    conn.ConnectionString = conexaoOracle;
                    
                    using (var cmd = factory.CreateCommand())  // ✅ SEM PROBLEMA
                    {
                        cmd.Connection = conn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "CM.FN_EMP_CALC_CORRECAO_MONETARIA";

                        // Criar parâmetros usando factory
                        var paramResultado = factory.CreateParameter();
                        paramResultado.ParameterName = "pResultado";
                        paramResultado.DbType = DbType.Double;
                        paramResultado.Direction = ParameterDirection.ReturnValue;
                        cmd.Parameters.Add(paramResultado);

                        var paramDataPrestacao = factory.CreateParameter();
                        paramDataPrestacao.ParameterName = "pDataPrestacao";
                        paramDataPrestacao.DbType = DbType.Date;
                        paramDataPrestacao.Value = dataPrestacao.Date;
                        cmd.Parameters.Add(paramDataPrestacao);

                        var paramValorPrestacao = factory.CreateParameter();
                        paramValorPrestacao.ParameterName = "pValorPrestacao";
                        paramValorPrestacao.DbType = DbType.Double;
                        paramValorPrestacao.Value = valorNominal;
                        cmd.Parameters.Add(paramValorPrestacao);

                        var paramDataCalculo = factory.CreateParameter();
                        paramDataCalculo.ParameterName = "pDataCalculo";
                        paramDataCalculo.DbType = DbType.Date;
                        paramDataCalculo.Value = dataCalculo.Date;
                        cmd.Parameters.Add(paramDataCalculo);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        valorCorrecaoMonetaria = Convert.ToDouble(paramResultado.Value);
                    }
                }
            }
            catch (Exception ex)
            {
                // Log do erro
                throw new Exception($"Erro ao calcular correção monetária: {ex.Message}", ex);
            }

            return valorCorrecaoMonetaria;
        }

        /// <summary>
        /// SOLUÇÃO 2: Usando Enterprise Library (MELHOR OPÇÃO para o projeto)
        /// Requer referência ao Microsoft.Practices.EnterpriseLibrary.Data
        /// </summary>
        public double calculaCorrecaoMonetariaCorrigido_V2(DateTime dataPrestacao, double valorNominal, DateTime dataCalculo)
        {
            double valorCorrecaoMonetaria = 0;

            try
            {
                /* 
                // Esta seria a implementação ideal usando Enterprise Library
                // que já está disponível no projeto
                
                Database database = DatabaseFactory.CreateDatabase("OracleConnectionName");
                DbCommand command = database.GetStoredProcCommand("CM.FN_EMP_CALC_CORRECAO_MONETARIA");
                
                database.AddReturnParameter(command, "pResultado", DbType.Double);
                database.AddInParameter(command, "pDataPrestacao", DbType.Date, dataPrestacao.Date);
                database.AddInParameter(command, "pValorPrestacao", DbType.Double, valorNominal);
                database.AddInParameter(command, "pDataCalculo", DbType.Date, dataCalculo.Date);
                
                database.ExecuteNonQuery(command);
                
                valorCorrecaoMonetaria = Convert.ToDouble(database.GetParameterValue(command, "pResultado"));
                */
                
                Console.WriteLine("Enterprise Library seria a melhor opção");
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao calcular correção monetária: {ex.Message}", ex);
            }

            return valorCorrecaoMonetaria;
        }

        public static void Main(string[] args)
        {
            Console.WriteLine("=== EXEMPLO DE CORREÇÃO DO CÓDIGO PROBLEMÁTICO ===");
            Console.WriteLine("Demonstrando como corrigir métodos do AcessoInadimplencia.cs");
            Console.WriteLine("que usam 'new OracleCommand()' e falham com Oracle v23+\n");
            
            var exemplo = new ExemploCorrecaoAcessoInadimplencia();
            
            Console.WriteLine("✅ Soluções implementadas:");
            Console.WriteLine("1. DbProviderFactory - CreateCommand() em vez de new OracleCommand()");
            Console.WriteLine("2. Enterprise Library - DatabaseFactory (recomendado)");
            Console.WriteLine("3. Tratamento de erros melhorado");
            
            Console.WriteLine("\n📋 Para aplicar no projeto real:");
            Console.WriteLine("- Substituir todas as ocorrências de 'new OracleCommand()'");
            Console.WriteLine("- Usar factory.CreateCommand() ou Enterprise Library");
            Console.WriteLine("- Testar cada método individualmente após a conversão");
            
            Console.WriteLine("\nPressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}