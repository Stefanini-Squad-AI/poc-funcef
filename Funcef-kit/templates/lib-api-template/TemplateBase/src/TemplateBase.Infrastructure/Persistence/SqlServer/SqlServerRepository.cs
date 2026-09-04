using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using TemplateBase.Application.Abstractions.Persistence;
using TemplateBase.Infrastructure.Persistence.Context;

namespace TemplateBase.Infrastructure.Persistence.SqlServer;

/// <summary>
/// Implementação de <see cref="ISqlServerRepository{TEntity}"/> sobre o
/// <see cref="SqlServerDbContext"/>.
/// </summary>
/// <remarks>
/// <para>
/// Registrado como genérico aberto (<c>typeof(ISqlServerRepository&lt;&gt;)</c>) em
/// <c>SqlServerRegistration</c>, de modo que qualquer entidade mapeada no contexto ganhe repositório
/// sem registro adicional.
/// </para>
/// <para>
/// <strong>Leituras sem tracking, escritas com.</strong> As consultas usam <c>AsNoTracking</c>: são
/// projeções de leitura e o change tracker só custaria memória. As escritas passam pelo tracker, que
/// é o que permite ao <see cref="SqlServerUnitOfWork"/> agrupar várias operações em um único
/// <c>SaveChangesAsync</c>.
/// </para>
/// </remarks>
/// <typeparam name="TEntity">Entidade mapeada no <see cref="SqlServerDbContext"/>.</typeparam>
public class SqlServerRepository<TEntity> : ISqlServerRepository<TEntity> where TEntity : class
{
    private readonly SqlServerDbContext _context;

    public SqlServerRepository(SqlServerDbContext context)
    {
        _context = context;
    }

    private DbSet<TEntity> Set => _context.Set<TEntity>();

    /// <inheritdoc />
    public virtual async Task<TEntity?> GetByIdAsync(object id, CancellationToken cancellationToken = default)
        => await Set.FindAsync([id], cancellationToken);

    /// <inheritdoc />
    public virtual Task<List<TEntity>> ListAsync(
        Expression<Func<TEntity, bool>>? predicate = null,
        Expression<Func<TEntity, object>>? orderBy = null,
        bool descending = false,
        int? take = null,
        CancellationToken cancellationToken = default)
    {
        IQueryable<TEntity> query = Set.AsNoTracking();

        if (predicate is not null)
        {
            query = query.Where(predicate);
        }

        if (orderBy is not null)
        {
            query = descending ? query.OrderByDescending(orderBy) : query.OrderBy(orderBy);
        }

        if (take is > 0)
        {
            query = query.Take(take.Value);
        }

        return query.ToListAsync(cancellationToken);
    }

    /// <inheritdoc />
    public virtual Task<bool> ExistsAsync(
        Expression<Func<TEntity, bool>> predicate,
        CancellationToken cancellationToken = default)
        => Set.AsNoTracking().AnyAsync(predicate, cancellationToken);

    /// <inheritdoc />
    public virtual Task<int> CountAsync(
        Expression<Func<TEntity, bool>>? predicate = null,
        CancellationToken cancellationToken = default)
        => predicate is null
            ? Set.AsNoTracking().CountAsync(cancellationToken)
            : Set.AsNoTracking().CountAsync(predicate, cancellationToken);

    /// <inheritdoc />
    public virtual async Task AddAsync(TEntity entity, CancellationToken cancellationToken = default)
        => await Set.AddAsync(entity, cancellationToken);

    /// <inheritdoc />
    public virtual void Update(TEntity entity) => Set.Update(entity);

    /// <inheritdoc />
    public virtual void Delete(TEntity entity) => Set.Remove(entity);
}
