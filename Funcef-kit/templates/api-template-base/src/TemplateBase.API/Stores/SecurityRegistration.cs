using FuncefEssenciais.Http.Extensions;

namespace TemplateBase.API.Stores;

/// <summary>
/// Registro das <strong>políticas de segurança</strong> de borda da API: CORS e rate limiting.
/// </summary>
/// <remarks>
/// <para>
/// Aqui ficam as políticas; a aplicação delas no pipeline está em <c>ApiPipeline</c>. Autenticação e
/// autorização não estão neste módulo — pertencem à Infrastructure
/// (<c>AuthenticationRegistration</c>), porque dependem de segredos e do cache.
/// </para>
/// </remarks>
internal static class SecurityRegistration
{
    internal static IServiceCollection AddSecurityPolicies(
        this IServiceCollection services,
        IWebHostEnvironment environment,
        IConfiguration configuration)
    {
        // CORS por ambiente (seção "Cors": Politica/OriginsPermitidas/...).
        // Em Production/Custom, FALHA no startup se OriginsPermitidas não estiver configurado —
        // fail-fast deliberado, para nunca cair em AllowAnyOrigin silencioso.
        services.AddCorsPolicyWithConfiguration(environment, configuration);

        // Rate limiting: o middleware distribuído do FUNCEF.Essenciais (backing store Redis via
        // FUNCEF.NoSql) é configurado no pipeline por UseRateLimiting(configuration), lendo a seção
        // "RateLimiting". Não há registro de serviço a fazer aqui — o limiter em memória por IP de
        // conexão foi abandonado porque não funciona atrás de proxy/ingress, onde todas as requisições
        // chegam com o IP do proxy.

        return services;
    }
}
