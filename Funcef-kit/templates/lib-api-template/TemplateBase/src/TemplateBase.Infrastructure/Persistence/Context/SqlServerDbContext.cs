using FuncefORM.EFCore;
using Microsoft.EntityFrameworkCore;

namespace TemplateBase.Infrastructure.Persistence.Context;

/// <summary>
/// DbContext do banco <strong>secundário</strong> (SQL Server), ao lado do Oracle principal.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Quando usar este contexto</strong>: dados que não pertencem ao Oracle — integração com
/// sistemas que já publicam em SQL Server, bases legadas de terceiros, espelhos de
/// interoperabilidade. Entidade de negócio nova vai no <see cref="AppDbContext"/> (Oracle).
/// </para>
/// <para>
/// Herda de <see cref="BaseDbContext"/> do FUNCEF.ORM para reaproveitar as convenções da lib
/// (telemetria, detecção de slow query, convenções de mapeamento), mas é registrado pelo módulo local
/// <c>SqlServerRegistration</c> — <c>AddFuncefORMDbContext</c> não serve aqui porque o
/// <c>ORMOptions</c>/<c>ProviderType</c> é único por aplicação na linha 3.x da lib, e o provedor
/// principal desta API é Oracle.
/// </para>
/// <para>
/// <strong>Acesso a dados</strong>: via <c>ISqlServerRepository&lt;T&gt;</c> +
/// <c>ISqlServerUnitOfWork</c> (contratos na Application, implementações em
/// <c>Persistence/SqlServer</c>). O <c>IRepository&lt;T&gt;</c>/<c>IUnitOfWork</c> genéricos do
/// FUNCEF.ORM permanecem ligados ao contexto Oracle — não alcançam este contexto.
/// </para>
/// <para>
/// <strong>Migrations</strong>: não há auto-migration para este contexto. O schema é versionado nos
/// scripts de <c>scripts/banco-dados/sqlserver</c>.
/// </para>
/// </remarks>
public class SqlServerDbContext : BaseDbContext
{
    // Declare aqui os DbSet<T> das entidades do banco secundário, ex.:
    //   public DbSet<MinhaEntidade> MinhasEntidades { get; set; } = null!;
    // O acesso nos services é feito por ISqlServerRepository<MinhaEntidade> (genérico aberto —
    // nenhum registro adicional é necessário além da entidade mapeada neste contexto).

    public SqlServerDbContext(DbContextOptions<SqlServerDbContext> options) : base(options)
    {
    }
}
