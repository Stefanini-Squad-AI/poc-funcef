namespace TemplateBase.API.Diagnostics;

/// <summary>
/// <see cref="DelegatingHandler"/> que registra o corpo das respostas de erro do endpoint de token
/// do Azure Entra ID (<c>login.microsoftonline.com/.../token</c>).
/// </summary>
/// <remarks>
/// <para>
/// O <c>FuncefAuthController</c> (componente FUNCEF.Autenticacao) registra apenas <c>"HTTP 401"</c> quando
/// a troca de código/credenciais falha, omitindo o código <c>AADSTS...</c> retornado pelo Entra — que é
/// a informação essencial para o diagnóstico (ex.: <c>AADSTS7000215</c> secret inválido,
/// <c>AADSTS50011</c> redirect URI, <c>AADSTS501051</c> app role ausente).
/// </para>
/// <para>
/// Este handler intercepta <em>somente</em> as chamadas ao endpoint de token e, em respostas sem sucesso,
/// loga o corpo completo. O conteúdo da resposta é bufferizado pelo <c>HttpClient</c>, portanto a leitura
/// aqui não impede o consumidor original de lê-lo novamente.
/// </para>
/// </remarks>
public sealed class EntraTokenDiagnosticsHandler : DelegatingHandler
{
    private readonly ILogger<EntraTokenDiagnosticsHandler> _logger;

    public EntraTokenDiagnosticsHandler(ILogger<EntraTokenDiagnosticsHandler> logger)
    {
        _logger = logger;
    }

    protected override async Task<HttpResponseMessage> SendAsync(
        HttpRequestMessage request,
        CancellationToken cancellationToken)
    {
        var response = await base.SendAsync(request, cancellationToken);

        if (IsEntraTokenEndpoint(request.RequestUri) && !response.IsSuccessStatusCode)
        {
            string detalhe;
            try
            {
                var body = await response.Content.ReadAsStringAsync(cancellationToken);
                detalhe = ExtrairDiagnostico(body);
            }
            catch (Exception ex)
            {
                detalhe = $"<falha ao ler corpo: {ex.Message}>";
            }

            // Loga apenas os campos de diagnostico (error + codigos AADSTS + correlation_id), nao o
            // corpo cru: a error_description do Entra pode carregar identificadores de tenant/usuario,
            // que nao devem ser persistidos nos logs da aplicacao (LGPD / higiene de log).
            _logger.LogError(
                "Falha na chamada ao endpoint de token do Entra ID. Status={Status} {Uri}. Diagnostico: {Diagnostico}",
                (int)response.StatusCode,
                request.RequestUri,
                detalhe);
        }

        return response;
    }

    /// <summary>
    /// Reduz o corpo de erro do Entra ao essencial para diagnostico: o campo <c>error</c>, os
    /// codigos <c>AADSTSnnnnnn</c> presentes na descricao e o <c>correlation_id</c>.
    /// </summary>
    internal static string ExtrairDiagnostico(string? body)
    {
        if (string.IsNullOrWhiteSpace(body))
        {
            return "<corpo vazio>";
        }

        var partes = new List<string>();

        try
        {
            using var doc = System.Text.Json.JsonDocument.Parse(body);
            var root = doc.RootElement;

            if (root.ValueKind == System.Text.Json.JsonValueKind.Object)
            {
                if (root.TryGetProperty("error", out var error))
                {
                    partes.Add($"error={error}");
                }

                if (root.TryGetProperty("error_description", out var descricao))
                {
                    var codigos = System.Text.RegularExpressions.Regex
                        .Matches(descricao.ToString() ?? string.Empty, @"AADSTS\d+")
                        .Select(m => m.Value)
                        .Distinct()
                        .ToArray();

                    if (codigos.Length > 0)
                    {
                        partes.Add($"codigos={string.Join(",", codigos)}");
                    }
                }

                if (root.TryGetProperty("correlation_id", out var correlationId))
                {
                    partes.Add($"correlation_id={correlationId}");
                }
            }
        }
        catch (System.Text.Json.JsonException)
        {
            // Resposta nao-JSON (ex.: HTML de proxy/WAF): nao logar o conteudo, apenas sinalizar.
            return $"<resposta nao-JSON, {body.Length} bytes>";
        }

        return partes.Count > 0
            ? string.Join(" ", partes)
            : "<sem campos de diagnostico reconhecidos>";
    }

    private static bool IsEntraTokenEndpoint(Uri? uri) =>
        uri is not null
        && uri.Host.Equals("login.microsoftonline.com", StringComparison.OrdinalIgnoreCase)
        && uri.AbsolutePath.EndsWith("/token", StringComparison.OrdinalIgnoreCase);
}
