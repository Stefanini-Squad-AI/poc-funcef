using System.Linq.Expressions;

namespace TemplateBase.Application.Abstractions.Persistence;

/// <summary>
/// Repositório do banco secundário <strong>SQL Server</strong>.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Por que não usar o <c>IRepository&lt;T&gt;</c> do FUNCEF.ORM:</strong> na linha 3.x da lib
/// existe um único <c>ORMOptions</c>/<c>ProviderType</c> por aplicação, e o provedor principal desta
/// API é Oracle. O <c>IRepository&lt;T&gt;</c> e o <c>IUnitOfWork</c> do FUNCEF.ORM ficam portanto
/// ligados ao <c>AppDbContext</c> (Oracle). Este contrato é o par simétrico para o segundo provedor,
/// mantendo <em>um único padrão de acesso a dados</em> nas duas bases: nenhum service manipula
/// <c>DbContext</c> diretamente.
/// </para>
/// <para>
/// A implementação (<c>SqlServerRepository&lt;T&gt;</c>) vive na Infrastructure, sobre o
/// <c>SqlServerDbContext</c>. Registrada apenas quando a seção <c>SqlServer</c> está configurada
/// (ver <c>ConfigurationSections.IsSqlServerEnabled</c>).
/// </para>
/// <para>
/// <strong>Escopo transacional:</strong> os métodos de escrita apenas registram a intenção no change
/// tracker — a persistência acontece no <c>SaveChangesAsync</c> do
/// <see cref="ISqlServerUnitOfWork"/>. Isso é deliberado: sem isso, cada operação viraria uma
/// transação implícita própria e não haveria como agrupar múltiplas escritas no segundo banco.
/// </para>
/// </remarks>
/// <typeparam name="TEntity">Entidade de domínio mapeada no <c>SqlServerDbContext</c>.</typeparam>
public interface ISqlServerRepository<TEntity> where TEntity : class
{
    /// <summary>Obtém uma entidade pela chave primária, ou <c>null</c> quando não existe.</summary>
    Task<TEntity?> GetByIdAsync(object id, CancellationToken cancellationToken = default);

    /// <summary>Lista entidades que satisfazem o predicado (sem tracking), ordenadas conforme informado.</summary>
    /// <param name="predicate">Filtro; <c>null</c> lista todas.</param>
    /// <param name="orderBy">Expressão de ordenação; <c>null</c> mantém a ordem do provedor.</param>
    /// <param name="descending">Direção da ordenação quando <paramref name="orderBy"/> é informado.</param>
    /// <param name="take">Limite de registros; <c>null</c> sem limite.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    Task<List<TEntity>> ListAsync(
        Expression<Func<TEntity, bool>>? predicate = null,
        Expression<Func<TEntity, object>>? orderBy = null,
        bool descending = false,
        int? take = null,
        CancellationToken cancellationToken = default);

    /// <summary>Indica se existe alguma entidade que satisfaça o predicado.</summary>
    Task<bool> ExistsAsync(Expression<Func<TEntity, bool>> predicate, CancellationToken cancellationToken = default);

    /// <summary>Conta as entidades que satisfazem o predicado (<c>null</c> conta todas).</summary>
    Task<int> CountAsync(Expression<Func<TEntity, bool>>? predicate = null, CancellationToken cancellationToken = default);

    /// <summary>
    /// Marca a entidade para inserção. Só é persistida no <c>SaveChangesAsync</c> do
    /// <see cref="ISqlServerUnitOfWork"/>.
    /// </summary>
    Task AddAsync(TEntity entity, CancellationToken cancellationToken = default);

    /// <summary>Marca a entidade para atualização.</summary>
    void Update(TEntity entity);

    /// <summary>Marca a entidade para exclusão.</summary>
    void Delete(TEntity entity);
}
