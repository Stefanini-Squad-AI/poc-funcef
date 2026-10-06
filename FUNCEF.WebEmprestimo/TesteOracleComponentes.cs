using System;
using System.Data;
using FUNCEF.Planus.Componentes.AcessoDados;
using Oracle.ManagedDataAccess.Client;

namespace FUNCEF.TesteComponents
{
    /// <summary>
    /// Teste para validar funcionamento do Oracle.ManagedDataAccess com FUNCEF.Planus.Componentes
    /// </summary>
    public class TesteOracleComponentes
    {
        public static void TestarConexaoOracle()
        {
            try
            {
                // Testa se consegue usar a classe OracleDatabase do componente
                var oracle = new OracleDatabase("TestConnection");
                
                // Testa se consegue instanciar OracleConnection diretamente
                using (var connection = new OracleConnection())
                {
                    Console.WriteLine("Oracle.ManagedDataAccess.Client funciona corretamente!");
                }
                
                Console.WriteLine("FUNCEF.Planus.Componentes funciona corretamente!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro: {ex.Message}");
            }
        }
        
        public static void TestarExtensoesDataReader()
        {
            try
            {
                // Simula um DataReader para testar as extensões
                DataTable dt = new DataTable();
                dt.Columns.Add("TestColumn", typeof(string));
                dt.Rows.Add("TestValue");
                
                using (var reader = dt.CreateDataReader())
                {
                    if (reader.Read())
                    {
                        // Testa extensão obterString
                        string value = reader.obterString(0);
                        Console.WriteLine($"Extensão obterString funcionou: {value}");
                    }
                }
                
                Console.WriteLine("ExtensoesDataReader funciona corretamente!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao testar extensões: {ex.Message}");
            }
        }
    }
}