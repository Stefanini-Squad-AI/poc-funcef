using FuncefArmazenamentos.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do <strong>Azure Storage</strong> (FUNCEF.Armazenamentos) — Blob, Queue e Table.
/// </summary>
/// <remarks>
/// <para>
/// Registra os serviços de armazenamento a partir da seção <c>Storage</c>, incluindo cache, telemetria,
/// métricas, circuit breaker e health check conforme as flags da própria seção.
/// </para>
/// <para>
/// A URI da conta é resolvida pelo componente via Key Vault em
/// <c>Storage:StorageAccountUriFromKeyVault</c> (forma canônica <c>SecretRef</c>: <c>Enabled</c> +
/// <c>SecretName</c>) — por isso o módulo depende de <see cref="SecretsRegistration"/> já ter
/// registrado o <c>IVaultService</c> de runtime.
/// </para>
/// <para>
/// Para SAS de acesso delegado (<c>IBlobSasService</c>) ou mensageria (Service Bus), ver os
/// registros específicos do FUNCEF.Armazenamentos (<c>AddBlobStorage</c>, <c>AddServiceBus</c>,
/// <c>AddUnifiedMessaging</c>) — não habilitados por padrão neste template.
/// </para>
/// <para>No-op quando a seção <c>Storage</c> não existe.</para>
/// </remarks>
internal static class FileStorageRegistration
{
    internal static IServiceCollection AddFileStorage(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        if (!ConfigurationSections.IsStorageEnabled(configuration))
        {
            return services;
        }

        services.AddStorageServices(configuration);

        return services;
    }
}
