using Funcef.Abstractions.Secrets;
using FuncefEssenciais.Infrastructure.Telemetry.Configuration;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Infrastructure.Configuration;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro da <strong>telemetria</strong> (FUNCEF.Essenciais) — OpenTelemetry + Azure Monitor.
/// </summary>
/// <remarks>
/// <para>
/// Registra <c>ITelemetry</c>, consumido por todos os módulos seguintes para log estruturado,
/// métricas e tracing correlacionado. Por isso vem logo após os segredos: um módulo que resolva
/// <c>ITelemetry</c> antes deste registro falha ou perde os eventos.
/// </para>
/// <para>Resolução da connection string do Application Insights, em ordem:</para>
/// <list type="number">
///   <item><description>
///     Se <c>ApplicationInsights:ConnectionStringFromKeyVault</c> está habilitada (forma canônica
///     <see cref="SecretRef"/>: <c>Enabled</c> + <c>SecretName</c>), lê o segredo via
///     <see cref="VaultBootstrap"/>.
///   </description></item>
///   <item><description>
///     Caso contrário (ou se a leitura falhar), usa <c>ApplicationInsights:ConnectionString</c>.
///   </description></item>
///   <item><description>
///     Sem nenhuma das duas, cai em telemetria de <em>console</em> — a aplicação nunca sobe sem
///     <c>ITelemetry</c> registrado.
///   </description></item>
/// </list>
/// <para>
/// A resolução é feita em tempo de registro porque <c>AddAzureMonitorTelemetry</c> recebe a
/// connection string por valor e não aceita resolução lazy.
/// </para>
/// </remarks>
internal static class TelemetryRegistration
{
    internal static IServiceCollection AddTelemetry(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        var serviceName = configuration["Telemetry:ServiceName"] ?? "TemplateBase.API";
        var serviceVersion = configuration["Telemetry:ServiceVersion"] ?? "1.0.0";

        var connectionString = ResolveConnectionString(configuration);

        if (!string.IsNullOrEmpty(connectionString))
        {
            services.AddAzureMonitorTelemetry(serviceName, serviceVersion, connectionString);
        }
        else
        {
            services.AddConsoleTelemetry(serviceName, serviceVersion);
        }

        return services;
    }

    /// <summary>
    /// Resolve a connection string do Application Insights via Key Vault ou configuração direta.
    /// </summary>
    private static string? ResolveConnectionString(IConfiguration configuration)
    {
        // Esta seção é lida pela APLICAÇÃO (não por uma lib FUNCEF), mas segue a mesma forma canônica
        // SecretRef para não existir uma sintaxe de referência a segredo diferente no mesmo arquivo.
        var secretRef = configuration
            .GetSection("ApplicationInsights:ConnectionStringFromKeyVault")
            .Get<SecretRef>() ?? new SecretRef();

        // Cofre pedido sem nome de segredo é erro de digitação, não ausência de configuração: sem esta
        // checagem a telemetria cairia para console em silêncio e a API produziria zero rastro no
        // Application Insights sem nenhum sinal de que algo está errado.
        secretRef.ValidateConfigured(
            "ApplicationInsights:ConnectionStringFromKeyVault",
            "ApplicationInsights:ConnectionString");

        if (secretRef.IsConfigured)
        {
            var secret = VaultBootstrap.TryGetSecret(configuration, secretRef.SecretName!);
            if (!string.IsNullOrEmpty(secret))
            {
                return secret;
            }
        }

        return configuration["ApplicationInsights:ConnectionString"];
    }
}
