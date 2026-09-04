using TemplateBase.Infrastructure.Persistence.Documents;

// Configuração de assembly para testes MSTest
[assembly: Parallelize(Scope = ExecutionScope.MethodLevel, Workers = 0)]

namespace TemplateBase.Tests;

/// <summary>
/// Inicialização única do assembly de testes.
/// </summary>
[TestClass]
public static class TestAssemblySetup
{
    /// <summary>
    /// Registra os class maps do MongoDB antes de qualquer teste.
    /// </summary>
    /// <remarks>
    /// Reproduz o que <c>DocumentsRegistration</c> faz no startup da aplicação: o mapeamento precede o
    /// primeiro uso do tipo pelo driver, porque o serializador é construído uma única vez e cacheado.
    /// Feito aqui, e não em cada teste, para não haver corrida entre métodos executados em paralelo
    /// (<c>ExecutionScope.MethodLevel</c>).
    /// </remarks>
    [AssemblyInitialize]
    public static void Initialize(TestContext context)
    {
        OrdemHistoricoDocumentoMapping.Register();
    }
}
