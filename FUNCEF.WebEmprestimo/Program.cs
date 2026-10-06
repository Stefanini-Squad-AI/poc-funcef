using System;

namespace FUNCEF.TesteComponents
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Testando FUNCEF.Planus.Componentes com Oracle.ManagedDataAccess...");
            
            TesteOracleComponentes.TestarConexaoOracle();
            TesteOracleComponentes.TestarExtensoesDataReader();
            
            Console.WriteLine("Testes concluídos. Pressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}