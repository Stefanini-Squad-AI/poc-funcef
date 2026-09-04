using Azure.Core;
using Azure.Identity;
using FuncefAutenticacao.Configuration;
using FuncefAutenticacao.Credentials;

namespace TemplateBase.Infrastructure.Credentials;

/// <summary>
/// Credencial de <b>desenvolvimento local</b>: substitui o provider de credencial de client da
/// FUNCEF.Autenticacao para que a API obtenha tokens app-only usando o token do desenvolvedor logado
/// (<c>az login</c>), sem client secret e sem certificado na máquina.
/// </summary>
/// <remarks>
/// <para>
/// <b>Por que existe.</b> Autenticação de <em>client</em> OAuth2 tem apenas três formas
/// (<c>client_secret</c>, <c>client_assertion</c> por certificado e <c>client_assertion</c> federada),
/// e nenhuma delas é "o usuário logado". O modo <see cref="EntraCredentialType.ManagedIdentity"/>
/// usado em HML/PRD depende de Workload Identity Federation e só funciona rodando <b>no</b> Azure: na
/// estação o <c>DefaultAzureCredential</c> devolve token de <em>usuário</em>, que o Entra rejeita como
/// assertion federada (<c>AADSTS700222</c>). Trocar apenas a origem do token mantém o ambiente local
/// secretless sem tocar em HML/PRD e sem reintroduzir client secret no cofre de desenvolvimento.
/// </para>
/// <para>
/// <b>Delegado, não app-only.</b> O token devolvido é do <em>desenvolvedor</em>, não da aplicação — o
/// recurso chamado passa a responder no escopo do que a pessoa enxerga. Isso funciona para recursos
/// que aceitam token delegado (o Microsoft Graph é o caso típico) e <b>não</b> funciona para os que
/// exigem app role atribuída à aplicação: lá o recurso responde 403 mesmo com a credencial válida.
/// </para>
/// <para>
/// <b>Nenhum campo de autenticação de client.</b> <see cref="GetClientAuthFieldsAsync"/> devolve um
/// dicionário vazio — o mesmo contrato que a lib aplica quando
/// <see cref="EntraCredentialType.ClientSecret"/> não tem segredo configurado (public client / PKCE
/// puro), preservando as mensagens de erro da própria lib nos fluxos que exigem credencial do app.
/// Consequência prática: em desenvolvimento a troca do authorization code depende de o
/// <c>RedirectUri</c> local estar registrado numa plataforma de cliente <b>público</b> do App
/// Registration (<i>Mobile and desktop applications</i>). Na plataforma <i>Web</i> o Entra trata o
/// resgate como cliente confidencial e responde <c>HTTP 401 AADSTS7000218</c> — o toggle
/// <i>Allow public client flows</i> (<c>isFallbackPublicClient</c>) não muda isso, pois governa
/// apenas ROPC e device code.
/// </para>
/// <para>
/// <b>Nunca fora de Development — e nem sempre dentro.</b> O registro ocorre apenas no caminho de
/// desenvolvimento de <c>AddInfrastructureDevelopment</c> e <b>somente</b> quando
/// <c>Auth:EntraId:ClientSecret</c> não foi resolvido: com secret configurado esta credencial é
/// omitida, porque ela vence o provider da lib e faria o segredo ser ignorado em silêncio. Em
/// HML/PRD vale o provider da lib com o <c>Auth:EntraId:CredentialType</c> configurado (padrão do
/// template: <see cref="EntraCredentialType.ManagedIdentity"/>). Ver
/// <c>AuthenticationRegistration.AddAuthentication</c>.
/// </para>
/// </remarks>
public sealed class DeveloperUserCredential : IEntraClientCredential
{
    private static readonly IReadOnlyDictionary<string, string> SemCredencialDeClient =
        new Dictionary<string, string>(StringComparer.Ordinal);

    private readonly TokenCredential _credential;

    /// <summary>
    /// Cria a credencial de desenvolvimento com o <c>DefaultAzureCredential</c> padrão.
    /// </summary>
    public DeveloperUserCredential()
        : this(new DefaultAzureCredential())
    {
    }

    /// <summary>
    /// Cria a credencial de desenvolvimento sobre uma <see cref="TokenCredential"/> do Azure SDK.
    /// </summary>
    /// <param name="credential">
    /// Origem do token. Em execução normal é um <c>DefaultAzureCredential</c>, que respeita
    /// <c>AZURE_TOKEN_CREDENTIALS=AzureCliCredential</c> (definido no <c>launchSettings.json</c>) e cai
    /// no <c>az login</c> em vez da conta do Visual Studio — sem isso, o oid autenticado é o da conta
    /// do VS e o diagnóstico de 403 no cofre vira caça ao tesouro.
    /// </param>
    public DeveloperUserCredential(TokenCredential credential)
        => _credential = credential ?? throw new ArgumentNullException(nameof(credential));

    /// <inheritdoc />
    public Task<IReadOnlyDictionary<string, string>> GetClientAuthFieldsAsync(
        EntraIdOptionsBase options, string tokenEndpoint, CancellationToken cancellationToken = default)
        => Task.FromResult(SemCredencialDeClient);

    /// <inheritdoc />
    /// <remarks>
    /// Devolve um token <b>delegado</b> do desenvolvedor para o <paramref name="scope"/> pedido
    /// (ex.: <c>https://graph.microsoft.com/.default</c>).
    /// </remarks>
    public async Task<string> AcquireAppTokenAsync(
        EntraIdOptionsBase options, string scope, CancellationToken cancellationToken = default)
    {
        ArgumentException.ThrowIfNullOrWhiteSpace(scope);

        var token = await _credential.GetTokenAsync(
            new TokenRequestContext([scope]), cancellationToken);

        return token.Token;
    }
}
