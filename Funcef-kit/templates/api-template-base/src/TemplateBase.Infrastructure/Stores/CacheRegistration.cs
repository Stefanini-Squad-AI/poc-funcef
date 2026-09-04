using FuncefNoSql.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do <strong>cache distribuído Redis</strong> (FUNCEF.NoSql).
/// </summary>
/// <remarks>
/// <para>
/// Registra <c>ICacheStore</c>/<c>ICacheService</c> a partir da seção <c>NoSql:RedisCache</c>.
/// No-op quando a seção não existe.
/// </para>
/// <para>
/// <strong>ORDEM CRÍTICA: este módulo precede <see cref="AuthenticationRegistration"/>.</strong>
/// Quando <c>Auth:RefreshToken:StorageType = "Redis"</c>, o store de refresh tokens reaproveita o
/// <c>ICacheStore</c> já registrado aqui. Se a autenticação for registrada primeiro, o componente não
/// encontra o cache e cai no store em memória — os refresh tokens deixam de ser compartilhados entre
/// instâncias, e cada reinício/balanceamento invalida os tokens emitidos pelas outras réplicas.
/// A falha é silenciosa: nada quebra no startup.
/// </para>
/// </remarks>
internal static class CacheRegistration
{
    internal static IServiceCollection AddCache(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        if (!ConfigurationSections.IsRedisEnabled(configuration))
        {
            return services;
        }

        services.AddRedisCache(configuration, ConfigurationSections.Redis);

        return services;
    }
}
