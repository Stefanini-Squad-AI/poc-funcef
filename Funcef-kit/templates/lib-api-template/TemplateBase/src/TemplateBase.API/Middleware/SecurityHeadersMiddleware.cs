using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace TemplateBase.API.Middleware;

/// <summary>
/// Middleware que adiciona cabeçalhos de segurança HTTP a todas as respostas.
/// Mitiga MIME-sniffing (<c>X-Content-Type-Options</c>), clickjacking
/// (<c>X-Frame-Options</c> + CSP <c>frame-ancestors</c>), vazamento de referrer
/// e injeção de conteúdo (Content-Security-Policy).
/// </summary>
/// <remarks>
/// O ecossistema FUNCEF ainda não expõe um helper de cabeçalhos de segurança
/// (diferente de CORS/RateLimiting, que vêm do FuncefEssenciais). Este middleware
/// preenche a lacuna no template. <strong>Recomendação:</strong> promover este
/// comportamento a <c>FuncefEssenciais.Http.Middleware</c> como <c>UseSecurityHeaders()</c>
/// para que todas as APIs derivadas herdem o mesmo baseline.
/// <para>
/// HSTS (<c>Strict-Transport-Security</c>) NÃO é definido aqui — use o
/// <c>app.UseHsts()</c> nativo fora do ambiente de Development.
/// </para>
/// </remarks>
public static class SecurityHeadersMiddleware
{
    /// <summary>
    /// CSP padrão compatível com as páginas de demonstração em <c>wwwroot</c>
    /// (fontes do Google) e com o Swagger UI (estilos/scripts inline).
    /// Pode ser sobrescrita via configuração <c>Security:ContentSecurityPolicy</c>.
    /// </summary>
    private const string DefaultContentSecurityPolicy =
        "default-src 'self'; " +
        "base-uri 'self'; " +
        "frame-ancestors 'none'; " +
        "object-src 'none'; " +
        "img-src 'self' data:; " +
        "font-src 'self' https://fonts.gstatic.com data:; " +
        "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; " +
        // script-src SEM 'unsafe-inline' (a API nao serve paginas com scripts inline proprios).
        // Ambientes com Swagger (Dev/Homologation) sobrescrevem via 'Security:ContentSecurityPolicy'.
        "script-src 'self'; " +
        "connect-src 'self'; " +
        "form-action 'self'";

    /// <summary>
    /// Registra o middleware de cabeçalhos de segurança. Deve ser posicionado cedo
    /// no pipeline (antes de <c>UseStaticFiles</c>/Swagger/Controllers) para que os
    /// cabeçalhos se apliquem a todas as respostas, inclusive arquivos estáticos.
    /// </summary>
    /// <param name="app">O <see cref="IApplicationBuilder"/> da aplicação.</param>
    /// <returns>O mesmo <see cref="IApplicationBuilder"/> para encadeamento.</returns>
    public static IApplicationBuilder UseSecurityHeaders(this IApplicationBuilder app)
    {
        var configuration = app.ApplicationServices.GetRequiredService<IConfiguration>();
        var csp = configuration["Security:ContentSecurityPolicy"];
        if (string.IsNullOrWhiteSpace(csp))
        {
            csp = DefaultContentSecurityPolicy;
        }

        return app.Use(async (context, next) =>
        {
            var headers = context.Response.Headers;

            // Indexador sobrescreve valores existentes — garante baseline único e previsível.
            headers["X-Content-Type-Options"] = "nosniff";
            headers["X-Frame-Options"] = "DENY";
            headers["Referrer-Policy"] = "no-referrer";
            headers["X-Permitted-Cross-Domain-Policies"] = "none";
            headers["Cross-Origin-Opener-Policy"] = "same-origin";
            headers["Content-Security-Policy"] = csp;

            // Desabilita APIs sensíveis do navegador que a API não usa (defesa em profundidade).
            headers["Permissions-Policy"] = "geolocation=(), camera=(), microphone=()";

            // Não anunciar a stack tecnológica.
            headers.Remove("X-Powered-By");
            headers.Remove("Server");

            await next();
        });
    }
}
