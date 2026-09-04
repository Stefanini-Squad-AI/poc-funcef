using Funcef.Abstractions.Health;
using FuncefNoSql.Contracts;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using TemplateBase.Application.Documents;
using TemplateBase.Infrastructure.Persistence.Context;

// Health checks das dependências de dados OPCIONAIS (Redis, MongoDB, SQL Server).
//
// São registrados por HealthCheckRegistration apenas quando a seção de configuração correspondente
// existe, todos com a tag "ready" — assim o probe /health/ready cobre exatamente as dependências que
// a aplicação realmente usa. Um check registrado para uma dependência não configurada deixaria o
// probe permanentemente vermelho.
//
// O Oracle não aparece aqui: seu check vem do próprio FUNCEF.ORM (AddFuncefORMHealthCheck, em
// OracleRegistration).
namespace TemplateBase.API.HealthChecks;

/// <summary>
/// Health check do cache Redis (FUNCEF.NoSql) via <see cref="IStoreHealth"/> do provider.
/// </summary>
public sealed class RedisCacheHealthCheck : IHealthCheck
{
    private readonly ICacheStore _cacheStore;

    public RedisCacheHealthCheck(ICacheStore cacheStore) => _cacheStore = cacheStore;

    public async Task<HealthCheckResult> CheckHealthAsync(
        HealthCheckContext context, CancellationToken cancellationToken = default)
    {
        try
        {
            if (_cacheStore is IStoreHealth health && await health.PingAsync(cancellationToken))
            {
                return HealthCheckResult.Healthy("Redis acessível.");
            }

            return HealthCheckResult.Unhealthy("Redis não respondeu ao ping.");
        }
        catch (Exception ex)
        {
            return HealthCheckResult.Unhealthy("Falha ao verificar o Redis.", ex);
        }
    }
}

/// <summary>
/// Health check do MongoDB (FUNCEF.NoSql, módulo de documentos) via <see cref="IStoreHealth"/>.
/// </summary>
/// <remarks>
/// Usa o document store de exemplo (<see cref="OrdemHistoricoDocumento"/>) porque
/// <c>IDocumentStore&lt;T&gt;</c> é registrado por tipo de documento — ao trocar o domínio, aponte
/// para um documento seu.
/// </remarks>
public sealed class MongoDocumentsHealthCheck : IHealthCheck
{
    private readonly IDocumentStore<OrdemHistoricoDocumento> _store;

    public MongoDocumentsHealthCheck(IDocumentStore<OrdemHistoricoDocumento> store) => _store = store;

    public async Task<HealthCheckResult> CheckHealthAsync(
        HealthCheckContext context, CancellationToken cancellationToken = default)
    {
        try
        {
            if (_store is IStoreHealth health && await health.PingAsync(cancellationToken))
            {
                return HealthCheckResult.Healthy("MongoDB acessível.");
            }

            return HealthCheckResult.Unhealthy("MongoDB não respondeu ao ping.");
        }
        catch (Exception ex)
        {
            return HealthCheckResult.Unhealthy("Falha ao verificar o MongoDB.", ex);
        }
    }
}

/// <summary>
/// Health check do banco secundário SQL Server.
/// </summary>
/// <remarks>
/// Usa <see cref="IServiceScopeFactory"/> porque o <see cref="SqlServerDbContext"/> é scoped e health
/// checks são resolvidos fora de um escopo de request.
/// </remarks>
public sealed class SqlServerHealthCheck : IHealthCheck
{
    private readonly IServiceScopeFactory _scopeFactory;

    public SqlServerHealthCheck(IServiceScopeFactory scopeFactory) => _scopeFactory = scopeFactory;

    public async Task<HealthCheckResult> CheckHealthAsync(
        HealthCheckContext context, CancellationToken cancellationToken = default)
    {
        try
        {
            using var scope = _scopeFactory.CreateScope();
            var dbContext = scope.ServiceProvider.GetRequiredService<SqlServerDbContext>();

            return await dbContext.Database.CanConnectAsync(cancellationToken)
                ? HealthCheckResult.Healthy("SQL Server acessível.")
                : HealthCheckResult.Unhealthy("SQL Server inacessível.");
        }
        catch (Exception ex)
        {
            return HealthCheckResult.Unhealthy("Falha ao verificar o SQL Server.", ex);
        }
    }
}
