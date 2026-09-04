using FuncefAutenticacao.Extensions;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using TemplateBase.API.HealthChecks;
using TemplateBase.Application.Abstractions.Configuration;

namespace TemplateBase.API.Stores;

/// <summary>
/// Registro dos <strong>health checks</strong> e das tags que definem cada probe.
/// </summary>
/// <remarks>
/// <para>
/// O contrato entre este módulo e o pipeline (<c>ApiPipeline</c>) são as <strong>tags</strong>, não os
/// nomes dos checks:
/// </para>
/// <list type="table">
///   <listheader><term>Tag</term><description>Probe e semântica</description></listheader>
///   <item><term><c>live</c></term><description>
///     <c>/health</c> e <c>/health/live</c> — o processo está vivo. Apenas checks em memória, sem
///     tocar dependência externa.
///   </description></item>
///   <item><term><c>ready</c></term><description>
///     <c>/health/ready</c> — a aplicação consegue atender. Cobre Oracle, e as dependências opcionais
///     configuradas (Redis, MongoDB, SQL Server, Entra).
///   </description></item>
/// </list>
/// <para>
/// <strong>Um check sem a tag certa não entra em probe nenhum</strong> e o endpoint responde verde sem
/// verificar nada — é o modo de falha silenciosa mais comum aqui. Ao adicionar um check, escolha a tag
/// deliberadamente.
/// </para>
/// <para>
/// As dependências opcionais usam <c>ConfigurationSections</c> — a mesma fonte que a Infrastructure
/// consulta para decidir se registra o recurso. Sem isso, um rename de seção habilitaria o serviço sem
/// o probe (ou o inverso).
/// </para>
/// </remarks>
internal static class HealthCheckRegistration
{
    internal static IServiceCollection AddHealthChecksWithProbes(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        var builder = services.AddHealthChecks();

        // Liveness: self-check leve, sem dependência externa. Sem ele, /health/live não teria nenhum
        // check com a tag "live" e responderia Healthy vazio — probe sempre verde.
        builder.AddCheck(
            "self",
            () => HealthCheckResult.Healthy("API viva."),
            tags: ["live"]);

        // Readiness das dependências opcionais. A do Oracle é registrada pelo FUNCEF.ORM em
        // OracleRegistration, já com as tags "ready"/"database".
        if (ConfigurationSections.IsRedisEnabled(configuration))
        {
            builder.AddCheck<RedisCacheHealthCheck>("redis", tags: ["ready", "nosql"]);
        }

        if (ConfigurationSections.IsMongoDocumentsEnabled(configuration))
        {
            builder.AddCheck<MongoDocumentsHealthCheck>("mongodb", tags: ["ready", "nosql"]);
        }

        if (ConfigurationSections.IsSqlServerEnabled(configuration))
        {
            builder.AddCheck<SqlServerHealthCheck>("sqlserver", tags: ["ready", "database"]);
        }

        AddEntraHealthChecks(builder, configuration);

        return services;
    }

    /// <summary>
    /// Health checks do provedor de identidade (Entra ID), quando configurado.
    /// </summary>
    /// <remarks>
    /// <c>AddAuthenticationHealthChecks</c> fixa as tags <c>authentication</c>/<c>security</c>, que não
    /// entram em <c>/health/ready</c>. O mesmo check tipado é registrado uma segunda vez sob a tag
    /// <c>ready</c> para que o probe valide de fato a conectividade com o IdP — sem isso a API
    /// apareceria pronta com o Entra fora do ar.
    /// </remarks>
    private static void AddEntraHealthChecks(IHealthChecksBuilder builder, IConfiguration configuration)
    {
        var tenantId = configuration["Auth:EntraId:TenantId"];
        if (string.IsNullOrEmpty(tenantId))
        {
            return;
        }

        builder.AddAuthenticationHealthChecks();
        builder.AddCheck<FuncefAutenticacao.HealthChecks.AuthenticationHealthCheck>(
            "entra-ready",
            tags: ["ready"]);
    }
}
