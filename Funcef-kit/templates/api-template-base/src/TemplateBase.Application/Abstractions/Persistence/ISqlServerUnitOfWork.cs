namespace TemplateBase.Application.Abstractions.Persistence;

/// <summary>
/// Unidade de trabalho do banco secundário <strong>SQL Server</strong>.
/// </summary>
/// <remarks>
/// <para>
/// Espelha a superfície do <c>IUnitOfWork</c> do FUNCEF.ORM (que atende o Oracle) para o segundo
/// provedor, de modo que o padrão de escrita seja idêntico nas duas bases.
/// </para>
/// <para>
/// <strong>Não há transação distribuída entre Oracle e SQL Server.</strong> São dois recursos
/// transacionais independentes: um <c>CommitAsync</c> aqui não participa do commit do Oracle, e o
/// rollback de um não desfaz o outro. Quando uma operação precisar alterar as duas bases de forma
/// consistente, use um padrão de consistência eventual (outbox + reprocessamento) em vez de assumir
/// atomicidade — ver <c>docs/ARQUITETURA.md</c> §13.
/// </para>
/// </remarks>
public interface ISqlServerUnitOfWork
{
    /// <summary>
    /// Persiste as alterações pendentes do contexto SQL Server.
    /// </summary>
    /// <remarks>
    /// Fora de uma transação explícita (<see cref="BeginAsync"/>), o EF Core envolve o lote em uma
    /// transação implícita própria — a chamada já é atômica em relação a si mesma.
    /// </remarks>
    /// <returns>Quantidade de registros afetados.</returns>
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);

    /// <summary>Abre uma transação explícita, para agrupar vários <see cref="SaveChangesAsync"/>.</summary>
    Task BeginAsync(CancellationToken cancellationToken = default);

    /// <summary>Confirma a transação aberta por <see cref="BeginAsync"/>.</summary>
    Task CommitAsync(CancellationToken cancellationToken = default);

    /// <summary>Descarta a transação aberta por <see cref="BeginAsync"/>.</summary>
    Task RollbackAsync(CancellationToken cancellationToken = default);
}
