using TemplateBase.API.Stores;
using TemplateBase.Application;
using TemplateBase.Infrastructure;
using TemplateBase.Infrastructure.Configuration;

namespace TemplateBase.API;

/// <summary>
/// Orquestrador de injeção de dependência da camada <strong>API</strong> — e ponto de composição das
/// três camadas.
/// </summary>
/// <remarks>
/// <para>
/// Este é o único lugar da solução onde as camadas se encontram. A ordem reflete a regra de
/// dependência da Clean Architecture, de dentro para fora: <c>Application</c> → <c>Infrastructure</c>
/// → <c>API</c>.
/// </para>
/// <para><strong>O que cada módulo de <c>Stores/</c> registra:</strong></para>
/// <list type="table">
///   <listheader><term>Módulo</term><description>Responsabilidade</description></listheader>
///   <item><term><c>PresentationRegistration</c></term><description>
///     Controllers, serialização JSON, FluentValidation, Swagger, sessão OAuth, HttpClient
///   </description></item>
///   <item><term><c>SecurityRegistration</c></term><description>
///     Políticas de borda — CORS e rate limiting
///   </description></item>
///   <item><term><c>HealthCheckRegistration</c></term><description>
///     Health checks e as tags <c>live</c>/<c>ready</c> que definem os probes
///   </description></item>
/// </list>
/// </remarks>
public static class DependencyInjection
{
    /// <summary>
    /// Registra todos os serviços da aplicação — API, Application e Infrastructure.
    /// </summary>
    /// <param name="builder">Builder da aplicação web.</param>
    /// <returns>O mesmo builder, para encadeamento.</returns>
    public static WebApplicationBuilder AddApiServices(this WebApplicationBuilder builder)
    {
        var services = builder.Services;
        var configuration = builder.Configuration;

        // Não anunciar o servidor (defesa em profundidade). O SecurityHeadersMiddleware também remove
        // "Server"/"X-Powered-By", mas o Kestrel injeta "Server: Kestrel" no início da resposta —
        // desligar aqui é o único ponto efetivo.
        builder.WebHost.ConfigureKestrel(options => options.AddServerHeader = false);

        // Validação de configuração no startup (fail-fast em produção).
        services.AddConfigurationValidation(configuration, builder.Environment.EnvironmentName);

        // Camadas de dentro para fora.
        services.AddApplication(configuration);

        if (builder.Environment.IsDevelopment())
        {
            services.AddInfrastructureDevelopment(configuration);
        }
        else
        {
            services.AddInfrastructure(configuration);
        }

        // Camada de apresentação.
        services.AddPresentation(configuration);
        services.AddSecurityPolicies(builder.Environment, configuration);
        services.AddHealthChecksWithProbes(configuration);

        return builder;
    }
}
