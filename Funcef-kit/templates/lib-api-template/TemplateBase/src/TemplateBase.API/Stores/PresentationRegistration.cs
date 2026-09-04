using System.Text.Json;
using System.Text.Json.Serialization;
using FuncefAutenticacao.Extensions;
using FuncefEssenciais.Http.Extensions;
using FuncefEssenciais.Http.Filters;
using TemplateBase.API.Diagnostics;

namespace TemplateBase.API.Stores;

/// <summary>
/// Registro da camada de <strong>apresentação</strong>: controllers, serialização, validação,
/// documentação e sessão.
/// </summary>
/// <remarks>
/// <para>
/// Tudo que é específico do transporte HTTP — nada de regra de negócio nem de acesso a dados. As
/// políticas de segurança do pipeline (CORS, rate limit, headers) ficam em
/// <see cref="SecurityRegistration"/>.
/// </para>
/// </remarks>
internal static class PresentationRegistration
{
    internal static IServiceCollection AddPresentation(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        // HttpClient para o fluxo OAuth e chamadas externas.
        services.AddHttpClient();

        // Diagnóstico: loga o corpo (código AADSTS...) das respostas de erro do endpoint de token do
        // Entra ID. Aplica-se a TODOS os HttpClient da factory — inclusive o usado internamente pelo
        // FuncefAuthController, que é justamente o que precisamos observar. O handler filtra apenas as
        // chamadas ao endpoint de token, então não há custo nas demais.
        services.AddTransient<EntraTokenDiagnosticsHandler>();
        services.ConfigureHttpClientDefaults(http => http.AddHttpMessageHandler<EntraTokenDiagnosticsHandler>());

        // Self-test M2M no startup (não-fatal) — habilitado via Auth:M2M:ValidateOnStartup.
        services.AddHostedService<M2MStartupValidator>();

        // Controllers da aplicação + os do FUNCEF.Autenticacao (login, callback, token, menu).
        services.AddControllers()
            .AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
                options.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
                options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter());
            })
            .AddFuncefAuthControllers();

        // Validação de entrada via FluentValidation, aplicada globalmente como filtro — os validators
        // são descobertos por convenção no assembly da Application (ver MediatorRegistration).
        services.AddFluentValidationFilterGlobally();

        services.AddSwagger(configuration);
        services.AddOAuthSession();

        return services;
    }

    /// <summary>Documentação OpenAPI com autenticação Bearer.</summary>
    private static IServiceCollection AddSwagger(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSwaggerDocumentation(new SwaggerOptions
        {
            Title = configuration["Swagger:Title"] ?? "TemplateBase API",
            Version = configuration["Swagger:Version"] ?? "v1",
            Description = configuration["Swagger:Description"] ??
                "API Template usando componentes FUNCEF com Clean Architecture e CQRS",
            ContactName = "FUNCEF",
            ContactEmail = "operador@exemplo.local",
            IncludeXmlComments = true
        });

        services.AddSwaggerBearerAuthentication(configuration);

        return services;
    }

    /// <summary>
    /// Sessão usada para guardar <c>state</c>/<c>nonce</c> durante o fluxo OAuth2 + PKCE.
    /// </summary>
    /// <remarks>
    /// <para>
    /// <strong><c>SameSite = Lax</c>, não <c>None</c>:</strong> o retorno do Entra no Authorization Code
    /// Flow é uma navegação GET de primeiro nível, que o <c>Lax</c> permite — enquanto <c>None</c>
    /// enviaria o cookie em <em>qualquer</em> request cross-site, ampliando a superfície de CSRF. Se o
    /// fluxo algum dia passar a usar <c>response_mode=form_post</c> (POST cross-site), este valor
    /// precisa voltar para <c>None</c>.
    /// </para>
    /// <para>
    /// <c>AddDistributedMemoryCache</c> é o backing store da sessão. Em cenário multi-instância sem
    /// sticky sessions, o fluxo OAuth pode falhar se o callback cair em outra réplica — nesse caso troque
    /// por um distributed cache real (Redis).
    /// </para>
    /// </remarks>
    private static IServiceCollection AddOAuthSession(this IServiceCollection services)
    {
        services.AddDistributedMemoryCache();
        services.AddSession(options =>
        {
            options.IdleTimeout = TimeSpan.FromMinutes(30);
            options.Cookie.HttpOnly = true;
            options.Cookie.IsEssential = true;
            options.Cookie.SameSite = SameSiteMode.Lax;
            options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
            options.Cookie.Name = ".TemplateBase.Session";
        });

        return services;
    }
}
