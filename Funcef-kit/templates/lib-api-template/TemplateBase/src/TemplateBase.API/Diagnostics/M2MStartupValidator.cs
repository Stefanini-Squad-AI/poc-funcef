using FuncefAutenticacao.Configuration;
using FuncefAutenticacao.Credentials;
using Microsoft.Extensions.Options;

namespace TemplateBase.API.Diagnostics;

/// <summary>
/// Serviço de startup que valida (de forma não-fatal) o fluxo M2M (client credentials) contra o
/// Azure Entra ID, registrando claramente o resultado nos logs.
/// </summary>
/// <remarks>
/// <para>
/// É executado apenas quando <c>Auth:M2M:ValidateOnStartup</c> é <c>true</c>. Monta a credencial de
/// client pelo <see cref="IEntraClientCredential"/> da própria lib — exatamente como a aplicação faz
/// — e solicita um token <c>client_credentials</c> para o escopo <c>{Audience}/.default</c>.
/// </para>
/// <para>
/// <strong>Por que passar pelo <see cref="IEntraClientCredential"/>.</strong> A credencial depende de
/// <c>Auth:EntraId:CredentialType</c>: <c>ManagedIdentity</c> e <c>Certificate</c> enviam
/// <c>client_assertion</c> (secretless), e só <c>ClientSecret</c> envia <c>client_secret</c>. Montar o
/// formulário à mão com <c>client_secret</c> faria este self-test reprovar justamente a configuração
/// secretless recomendada — reportando falha em um ambiente correto.
/// </para>
/// <para>
/// Em caso de falha, loga o <c>AADSTS...</c> retornado pelo Entra — por exemplo <c>AADSTS501051</c>
/// (a aplicação não tem App Role atribuída para a própria API). Nunca interrompe o startup.
/// </para>
/// </remarks>
public sealed class M2MStartupValidator : IHostedService
{
    private readonly IConfiguration _configuration;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IEntraClientCredential _clientCredential;
    private readonly IOptions<AuthOptions> _authOptions;
    private readonly ILogger<M2MStartupValidator> _logger;

    public M2MStartupValidator(
        IConfiguration configuration,
        IHttpClientFactory httpClientFactory,
        IEntraClientCredential clientCredential,
        IOptions<AuthOptions> authOptions,
        ILogger<M2MStartupValidator> logger)
    {
        _configuration = configuration;
        _httpClientFactory = httpClientFactory;
        _clientCredential = clientCredential;
        _authOptions = authOptions;
        _logger = logger;
    }

    public async Task StartAsync(CancellationToken cancellationToken)
    {
        if (!_configuration.GetValue<bool>("Auth:M2M:ValidateOnStartup"))
        {
            return;
        }

        try
        {
            var entraId = _authOptions.Value.EntraId;

            var tenantId = entraId?.TenantId;
            var clientId = entraId?.ClientId;
            var audience = entraId?.Audience;

            if (entraId is null || string.IsNullOrWhiteSpace(tenantId) ||
                string.IsNullOrWhiteSpace(clientId) || string.IsNullOrWhiteSpace(audience))
            {
                _logger.LogWarning(
                    "[M2M self-test] Ignorado: Auth:EntraId TenantId/ClientId/Audience não configurados.");
                return;
            }

            var scope = audience.TrimEnd('/') + "/.default";
            var tokenUrl = $"{entraId.Instance.TrimEnd('/')}/{tenantId}/oauth2/v2.0/token";

            // A credencial do client é montada pela lib conforme CredentialType: client_secret,
            // client_assertion por certificado ou client_assertion federada (Managed Identity).
            var authFields = await _clientCredential.GetClientAuthFieldsAsync(
                entraId, tokenUrl, cancellationToken);

            if (authFields.Count == 0)
            {
                _logger.LogError(
                    "[M2M self-test] Nenhuma credencial de client disponível para " +
                    "CredentialType='{CredentialType}'. Para ClientSecret, habilite " +
                    "'Auth:EntraId:ClientSecretFromKeyVault' (Enabled + SecretName); para Certificate, " +
                    "'Auth:EntraId:ClientCertificateFromKeyVault'. A troca de token resultará em " +
                    "HTTP 401 (invalid_client).",
                    entraId.CredentialType);
                return;
            }

            var campos = new Dictionary<string, string>
            {
                ["grant_type"] = "client_credentials",
                ["client_id"] = clientId,
                ["scope"] = scope,
            };

            foreach (var (chave, valor) in authFields)
            {
                campos[chave] = valor;
            }

            using var form = new FormUrlEncodedContent(campos);

            var http = _httpClientFactory.CreateClient();
            using var response = await http.PostAsync(tokenUrl, form, cancellationToken);

            if (response.IsSuccessStatusCode)
            {
                _logger.LogInformation(
                    "[M2M self-test] OK — token client_credentials obtido para o escopo '{Scope}' " +
                    "com CredentialType='{CredentialType}'.", scope, entraId.CredentialType);
            }
            else
            {
                // O corpo NAO e lido/logado aqui: este HttpClient passa pelo
                // EntraTokenDiagnosticsHandler (registrado via ConfigureHttpClientDefaults), que ja
                // registra os codigos AADSTS desta mesma resposta. Logar de novo duplicaria o evento.
                _logger.LogError(
                    "[M2M self-test] FALHOU — escopo '{Scope}', CredentialType='{CredentialType}', " +
                    "HTTP {Status}. Os codigos AADSTS estao no log do EntraTokenDiagnosticsHandler.",
                    scope, entraId.CredentialType, (int)response.StatusCode);
            }
        }
        catch (Exception ex)
        {
            // Diagnóstico nunca deve derrubar a aplicação.
            _logger.LogError(ex, "[M2M self-test] Erro inesperado durante a validação de startup.");
        }
    }

    public Task StopAsync(CancellationToken cancellationToken) => Task.CompletedTask;
}
