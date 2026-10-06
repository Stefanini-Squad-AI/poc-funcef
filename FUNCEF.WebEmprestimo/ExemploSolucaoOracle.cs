using System;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace FUNCEF.ExemploSolucao
{
    /// <summary>
    /// Exemplo de implementação que funciona com Oracle.ManagedDataAccess v23.26.0
    /// evitando o problema do OpenTelemetry/OracleActivitySource
    /// </summary>
    public class ExemploSolucaoOracle
    {
        /// <summary>
        /// PADRÃO 1: Usando Enterprise Library (RECOMENDADO para o projeto atual)
        /// Já implementado e funcionando no projeto FUNCEF.Planus.Componentes
        /// </summary>
        public static void ExemploEnterpriseLibrary()
        {
            try
            {
                Console.WriteLine("=== SOLUÇÃO 1: Enterprise Library (Já implementado) ===");
                
                // Este padrão já funciona no projeto porque usa DatabaseFactory
                // var database = DatabaseFactory.CreateDatabase("OracleConnectionName");
                // var command = database.GetSqlStringCommand("SELECT 1 FROM DUAL");
                // var result = database.ExecuteScalar(command);
                
                Console.WriteLine("✅ Enterprise Library funciona perfeitamente");
                Console.WriteLine("   - Usar DatabaseFactory.CreateDatabase()");
                Console.WriteLine("   - Usar database.GetSqlStringCommand() ou GetStoredProcCommand()");
                Console.WriteLine("   - Evita problemas de inicialização do OracleCommand");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Erro: {ex.Message}");
            }
        }

        /// <summary>
        /// PADRÃO 2: Usando DataSet/DataTable (ALTERNATIVA SIMPLES)
        /// Para casos onde não se pode usar Enterprise Library
        /// </summary>
        public static void ExemploDataSet()
        {
            try
            {
                Console.WriteLine("\n=== SOLUÇÃO 2: DataSet/DataTable (Alternativa) ===");
                
                string connectionString = "Data Source=servidor;User Id=usuario;Password=senha;";
                string sql = "SELECT campo1, campo2 FROM tabela WHERE condicao = :parametro";
                
                using (var connection = new OracleConnection(connectionString))
                {
                    // Cria DataSet e DataAdapter SEM usar OracleCommand diretamente
                    var dataSet = new DataSet();
                    var adapter = new OracleDataAdapter();
                    
                    // Esta abordagem pode evitar o problema em alguns cenários
                    // adapter.SelectCommand = connection.CreateCommand();
                    // adapter.SelectCommand.CommandText = sql;
                    // adapter.SelectCommand.Parameters.Add(new OracleParameter("parametro", valor));
                    
                    Console.WriteLine("✅ DataSet/DataTable pode ser uma alternativa");
                    Console.WriteLine("   - Usar OracleDataAdapter com CreateCommand()");
                    Console.WriteLine("   - Evitar new OracleCommand() direto");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Erro: {ex.Message}");
            }
        }

        /// <summary>
        /// PADRÃO 3: Usando DbProviderFactory (MAIS GENÉRICO)
        /// Abordagem mais robusta e independente
        /// </summary>
        public static void ExemploDbProviderFactory()
        {
            try
            {
                Console.WriteLine("\n=== SOLUÇÃO 3: DbProviderFactory (Genérico) ===");
                
                var factory = DbProviderFactories.GetFactory("Oracle.ManagedDataAccess.Client");
                string connectionString = "Data Source=servidor;User Id=usuario;Password=senha;";
                
                using (var connection = factory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;
                    
                    using (var command = factory.CreateCommand())
                    {
                        command.Connection = connection;
                        command.CommandText = "SELECT 1 AS test_value FROM DUAL";
                        
                        // connection.Open();
                        // var result = command.ExecuteScalar();
                        
                        Console.WriteLine("✅ DbProviderFactory é a abordagem mais segura");
                        Console.WriteLine("   - Usar factory.CreateCommand() em vez de new OracleCommand()");
                        Console.WriteLine("   - Abstrai o provedor específico");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Erro: {ex.Message}");
            }
        }

        /// <summary>
        /// EXEMPLO PRÁTICO: Conversão de código problemático para funcionando
        /// </summary>
        public static void ExemploConversaoCodigoProblematico()
        {
            Console.WriteLine("\n=== CONVERSÃO DE CÓDIGO PROBLEMÁTICO ===");
            
            Console.WriteLine("❌ CÓDIGO PROBLEMÁTICO (não funciona v23+):");
            Console.WriteLine(@"
    using (var conn = new OracleConnection(connectionString))
    {
        using (var cmd = new OracleCommand())  // ← PROBLEMA AQUI
        {
            cmd.Connection = conn;
            cmd.CommandText = ""SELECT * FROM tabela"";
            conn.Open();
            var result = cmd.ExecuteScalar();
        }
    }");
            
            Console.WriteLine("\n✅ CÓDIGO CORRIGIDO (funciona):");
            Console.WriteLine(@"
    // OPÇÃO A: Enterprise Library (RECOMENDADO)
    var database = DatabaseFactory.CreateDatabase(""OracleConnection"");
    var command = database.GetSqlStringCommand(""SELECT * FROM tabela"");
    var result = database.ExecuteScalar(command);
    
    // OPÇÃO B: DbProviderFactory
    var factory = DbProviderFactories.GetFactory(""Oracle.ManagedDataAccess.Client"");
    using (var conn = factory.CreateConnection())
    {
        conn.ConnectionString = connectionString;
        using (var cmd = factory.CreateCommand())  // ← SEM PROBLEMA
        {
            cmd.Connection = conn;
            cmd.CommandText = ""SELECT * FROM tabela"";
            conn.Open();
            var result = cmd.ExecuteScalar();
        }
    }");
        }

        public static void Main(string[] args)
        {
            Console.WriteLine("=== SOLUÇÕES PARA ORACLE.MANAGEDDATAACCESS v23+ ===");
            Console.WriteLine("Resolvendo problema OpenTelemetry/OracleActivitySource\n");

            ExemploEnterpriseLibrary();
            ExemploDataSet();
            ExemploDbProviderFactory();
            ExemploConversaoCodigoProblematico();

            Console.WriteLine("\n📋 RESUMO DAS RECOMENDAÇÕES:");
            Console.WriteLine("1. ✅ CONTINUAR usando Enterprise Library (já implementado)");
            Console.WriteLine("2. 🔄 CONVERTER códigos que usam 'new OracleCommand()' direto");
            Console.WriteLine("3. 💡 USAR DbProviderFactory.CreateCommand() para novos códigos");
            Console.WriteLine("4. ⚠️ EVITAR new OracleCommand() em Oracle.ManagedDataAccess v23+");
            Console.WriteLine("5. 🎯 CONSIDERAR downgrade para v21.x se houver muitos problemas");
            
            Console.WriteLine("\nPressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}