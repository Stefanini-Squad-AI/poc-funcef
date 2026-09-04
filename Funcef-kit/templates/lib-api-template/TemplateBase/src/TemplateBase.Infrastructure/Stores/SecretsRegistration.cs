using FuncefCofre.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do <strong>Azure Key Vault</strong> (FUNCEF.Cofre) — gestão de segredos.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Primeiro módulo da cadeia, e não por acaso.</strong> O <c>IVaultService</c> registrado
/// aqui é a origem das connection strings e chaves consumidas por praticamente todos os módulos
/// seguintes (Oracle, SQL Server, Redis, Mongo, Storage, auditoria, autenticação). Registrar depois
/// significa que esses módulos resolvem <c>null</c> e caem em fallback silencioso.
/// </para>
/// <para>
/// <strong>Este é o <c>IVaultService</c> de runtime</strong> — com cache, telemetria e circuit
/// breaker, dimensionado para leituras repetidas em produção. Não confundir com o provider isolado
/// do <see cref="Configuration.VaultBootstrap"/>, usado apenas em tempo de registro (antes de existir
/// container) e sem breaker.
/// </para>
/// <para>
/// No-op quando <c>KeyVault:Url</c> não está configurado — cenário de desenvolvimento local, em que
/// as connection strings vêm de <c>DirectConnectionString</c>/user-secrets.
/// </para>
/// </remarks>
internal static class SecretsRegistration
{
    /// <summary>Registra o <c>IVaultService</c> quando <c>KeyVault:Url</c> está configurado.</summary>
    internal static IServiceCollection AddSecrets(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        if (!ConfigurationSections.IsKeyVaultEnabled(configuration))
        {
            return services;
        }

        var keyVaultUrl = configuration[$"{ConfigurationSections.KeyVault}:Url"]!;

        services.AddVaultComplete(keyVaultUrl, cfg =>
        {
            cfg.EnableCache = true;
            cfg.EnableTelemetry = true;
            cfg.EnableCircuitBreaker = true;
        });

        return services;
    }
}
