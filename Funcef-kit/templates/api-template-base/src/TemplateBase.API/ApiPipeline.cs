using FuncefEssenciais.Http.Extensions;
using FuncefEssenciais.Http.Middleware;
using HealthChecks.UI.Client;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.HttpOverrides;
using TemplateBase.API.Middleware;

namespace TemplateBase.API;

/// <summary>
/// Montagem do <strong>pipeline HTTP</strong> e mapeamento dos endpoints.
/// </summary>
/// <remarks>
/// <para>
/// A <strong>ordem dos middlewares é semântica</strong>, não estética: cada um só protege o que vem
/// depois dele. Ver <c>docs/ARQUITETURA.md</c> §9 e a doutrina BE-05 §5.12 antes de reordenar.
/// </para>
/// </remarks>
public static class ApiPipeline
{
    /// <summary>
    /// Monta o pipeline HTTP na ordem correta e mapeia os endpoints.
    /// </summary>
    /// <param name="app">Aplicação web já construída.</param>
    /// <returns>A mesma aplicação, para encadeamento.</returns>
    public static WebApplication UseApiPipeline(this WebApplication app)
    {
        app.UseForwardedHeadersWhenTrusted();

        // Exceções → resposta HTTP padronizada. Primeiro middleware efetivo do pipeline: só assim
        // captura o que é lançado por todos os seguintes. ConflictException (FUNCEF.Essenciais) já é
        // mapeada para 409 pelo handler global.
        app.UseGlobalExceptionHandler();

        // Ordem BE-05 §5.12: HttpsRedirection → Hsts (fora de Development) → SecurityHeaders.
        app.UseHttpsRedirection();
        if (!app.Environment.IsDevelopment())
        {
            app.UseHsts();
        }

        // Cabeçalhos de segurança (nosniff, X-Frame-Options, CSP, Referrer-Policy, Permissions-Policy)
        // ANTES de StaticFiles/Swagger — do contrário os arquivos estáticos e a UI do Swagger sairiam
        // sem eles.
        app.UseSecurityHeaders();

        app.UseDefaultFiles();
        app.UseStaticFiles();

        if (app.Environment.IsDevelopment() || app.Configuration.GetValue<bool>("Swagger:Enabled"))
        {
            app.UseSwaggerDocumentation();
        }

        app.UseCors();
        app.UseSession();

        // Rate limit ANTES da autenticação: requisição abusiva é descartada sem custo de validação de
        // token nem consulta ao IdP.
        app.UseRateLimiting(app.Configuration);

        app.UseAuthentication();
        app.UseAuthorization();

        app.MapHealthEndpoints();
        app.MapInfoEndpoints();
        app.MapControllers();

        return app;
    }

    /// <summary>
    /// Restaura IP e scheme reais do cliente quando a API está atrás de proxy/ingress confiável.
    /// </summary>
    /// <remarks>
    /// <para>
    /// Necessário para o rate limit por IP e para a auditoria de IP funcionarem — sem isso, todas as
    /// requisições chegam com o endereço do proxy. Opt-in por <c>Auth:TrustForwardedHeaders</c>:
    /// confiar nesses cabeçalhos sem um proxy à frente permite ao cliente forjar o próprio IP,
    /// contornando o rate limit e poluindo a auditoria.
    /// </para>
    /// <para>
    /// As listas de proxies conhecidos são limpas porque em cluster/ingress os IPs são dinâmicos —
    /// confia-se no proxy imediato (1 hop).
    /// </para>
    /// </remarks>
    private static void UseForwardedHeadersWhenTrusted(this WebApplication app)
    {
        if (!app.Configuration.GetValue<bool>("Auth:TrustForwardedHeaders"))
        {
            return;
        }

        var options = new ForwardedHeadersOptions
        {
            ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
        };

        options.KnownIPNetworks.Clear();
        options.KnownProxies.Clear();

        app.UseForwardedHeaders(options);
    }

    /// <summary>
    /// Mapeia os probes de saúde. As tags vêm de <c>HealthCheckRegistration</c>.
    /// </summary>
    /// <remarks>
    /// <para>
    /// <strong><c>/health</c> é público e MÍNIMO</strong> (texto <c>Healthy</c>/<c>Unhealthy</c>): não
    /// expõe nomes, status, durações das dependências nem descrições de exceção a quem não está
    /// autenticado — isso é reconhecimento de infraestrutura.
    /// </para>
    /// <para>
    /// Executa apenas os checks com a tag <c>live</c> (self-check em memória). Um
    /// <c>Predicate = _ => true</c> aqui faria cada request anônimo abrir conexão com Oracle + Redis +
    /// Mongo + SQL Server + Entra — e como <c>/health</c> está em <c>RateLimiting:ExcludedPaths</c>,
    /// isso seria um vetor de amplificação não autenticado contra as dependências. A verificação de
    /// dependências fica em <c>/health/ready</c>.
    /// </para>
    /// <para>
    /// O detalhamento (<c>UIResponseWriter</c>) fica em <c>/health/detalhado</c>, exposto só em
    /// Development ou quando <c>HealthChecks:ExposeDetailed</c> é ligado explicitamente — para rede
    /// interna.
    /// </para>
    /// </remarks>
    private static void MapHealthEndpoints(this WebApplication app)
    {
        app.MapHealthChecks("/health", new HealthCheckOptions
        {
            Predicate = check => check.Tags.Contains("live")
        });

        if (app.Environment.IsDevelopment() || app.Configuration.GetValue<bool>("HealthChecks:ExposeDetailed"))
        {
            app.MapHealthChecks("/health/detalhado", new HealthCheckOptions
            {
                Predicate = _ => true,
                ResponseWriter = UIResponseWriter.WriteHealthCheckUIResponse
            });
        }

        app.MapHealthChecks("/health/live", new HealthCheckOptions
        {
            Predicate = check => check.Tags.Contains("live")
        });

        app.MapHealthChecks("/health/ready", new HealthCheckOptions
        {
            Predicate = check => check.Tags.Contains("ready")
        });
    }

    /// <summary>Endpoints de identificação da aplicação (nome, versão, ambiente).</summary>
    private static void MapInfoEndpoints(this WebApplication app)
    {
        var info = () =>
        {
            var version = typeof(ApiPipeline).Assembly.GetName().Version?.ToString() ?? "1.0.0";

            return Results.Ok(new Dictionary<string, object?>
            {
                ["name"] = "TemplateBase API",
                ["version"] = version,
                ["environment"] = app.Environment.EnvironmentName,
                ["timestamp"] = DateTimeOffset.UtcNow
            });
        };

        app.MapGet("/health/version", info);
        app.MapGet("/info", info);
    }
}
