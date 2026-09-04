using Microsoft.EntityFrameworkCore.Storage;
using TemplateBase.Application.Abstractions.Persistence;
using TemplateBase.Infrastructure.Persistence.Context;

namespace TemplateBase.Infrastructure.Persistence.SqlServer;

/// <summary>
/// Implementação de <see cref="ISqlServerUnitOfWork"/> sobre o <see cref="SqlServerDbContext"/>.
/// </summary>
/// <remarks>
/// <para>
/// Escopo por request (scoped), como o <c>IUnitOfWork</c> do Oracle: a transação eventualmente aberta
/// acompanha o ciclo de vida do contexto. A transação em si é descartada pelo próprio
/// <c>DbContext</c> ao final do escopo — se um <see cref="BeginAsync"/> não for confirmado, o
/// resultado é rollback, que é o comportamento seguro.
/// </para>
/// <para>
/// <strong>Independente do Oracle.</strong> Um <see cref="CommitAsync"/> aqui não participa do commit
/// do <c>IUnitOfWork</c> do Oracle, e vice-versa. Ver <see cref="ISqlServerUnitOfWork"/>.
/// </para>
/// </remarks>
public class SqlServerUnitOfWork : ISqlServerUnitOfWork
{
    private readonly SqlServerDbContext _context;
    private IDbContextTransaction? _transaction;

    public SqlServerUnitOfWork(SqlServerDbContext context)
    {
        _context = context;
    }

    /// <inheritdoc />
    public virtual Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        => _context.SaveChangesAsync(cancellationToken);

    /// <inheritdoc />
    public virtual async Task BeginAsync(CancellationToken cancellationToken = default)
    {
        if (_transaction is not null)
        {
            throw new InvalidOperationException(
                "SqlServerUnitOfWork: já existe uma transação aberta neste escopo. " +
                "Confirme (CommitAsync) ou descarte (RollbackAsync) antes de abrir outra.");
        }

        _transaction = await _context.Database.BeginTransactionAsync(cancellationToken);
    }

    /// <inheritdoc />
    public virtual async Task CommitAsync(CancellationToken cancellationToken = default)
    {
        if (_transaction is null)
        {
            throw new InvalidOperationException(
                "SqlServerUnitOfWork: nenhuma transação aberta para confirmar. Chame BeginAsync primeiro.");
        }

        try
        {
            await _context.SaveChangesAsync(cancellationToken);
            await _transaction.CommitAsync(cancellationToken);
        }
        finally
        {
            await DisposeTransactionAsync();
        }
    }

    /// <inheritdoc />
    public virtual async Task RollbackAsync(CancellationToken cancellationToken = default)
    {
        if (_transaction is null)
        {
            return;
        }

        try
        {
            await _transaction.RollbackAsync(cancellationToken);
        }
        finally
        {
            await DisposeTransactionAsync();
        }
    }

    private async Task DisposeTransactionAsync()
    {
        if (_transaction is not null)
        {
            await _transaction.DisposeAsync();
            _transaction = null;
        }
    }
}
