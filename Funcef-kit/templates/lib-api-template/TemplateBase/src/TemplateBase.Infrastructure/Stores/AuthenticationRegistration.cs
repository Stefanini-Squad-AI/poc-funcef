using FuncefAutenticacao.Credentials;
using FuncefAutenticacao.Extensions;
using FuncefAutenticacao.Pat.Extensions;
using FuncefCofre.Contracts;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;
using TemplateBase.Infrastructure.Configuration;
using TemplateBase.Infrastructure.Credentials;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro da <strong>autenticação e autorização</strong> (FUNCEF.Autenticacao) — Azure Entra ID.
/// </summary>
/// <remarks>
/// <para>O módulo cobre três capacidades:</para>
/// <list type="number">
///   <item><description>
///     <strong>Autenticação Entra ID</strong> — JWT Bearer, OAuth2/PKCE e Client Credentials (M2M).
///   </description></item>
///   <item><description>
///     <strong>Refresh tokens</strong> — conforme <c>Auth:RefreshToken:StorageType</c>
///     (<c>InMemory</c> ou <c>Redis</c>). Com <c>Redis</c>, reaproveita o <c>ICacheStore</c> já
///     registrado por <see cref="CacheRegistration"/> — <strong>por isso o cache precede este
///     módulo</strong>.
///   </description></item>
///   <item><description>
///     <strong>Cliente de autorização</strong> (PEP → PDP do GAP) — opt-in pela seção
///     <c>Auth:Autorizacao</c>. Habilita <c>[FuncefAuthorize(Acao = "...")]</c> e o endpoint
///     <c>GET /auth/menu/me</c> (menu efetivo). Requer <c>BaseUrl</c> (api-ms-gap, validada no
///     startup) e <c>CodigoSistema</c> (o menu é resolvido por sistema). Sem a seção, o cliente não é
///     registrado e <c>/auth/menu/me</c> responde <c>503 AUTHORIZATION_CLIENT_NOT_CONFIGURED</c>
///     (fail-closed, e não acesso liberado).
///   </description></item>
/// </list>
/// <para>
/// <strong>A sobrecarga com <c>IVaultService</c> não é opcional quando há Key Vault.</strong> Somente
/// ela faz o componente resolver, no momento do registro, os segredos do Entra ID:
/// </para>
/// <list type="bullet">
///   <item><description><c>Auth:EntraId:ClientSecretFromKeyVault</c> → <c>EntraId.ClientSecret</c></description></item>
///   <item><description><c>Auth:EntraId:ClientIdFromKeyVault</c> → <c>EntraId.ClientId</c></description></item>
///   <item><description><c>Auth:EntraId:TenantIdFromKeyVault</c> → <c>EntraId.TenantId</c></description></item>
///   <item><description><c>Auth:EntraId:AudienceFromKeyVault</c> → <c>EntraId.Audience</c></description></item>
///   <item><description><c>Auth:RefreshToken:SigningKeyFromKeyVault</c> → <c>RefreshToken.SigningKey</c></description></item>
/// </list>
/// <para>
/// Cada uma dessas chaves é um <c>Funcef.Abstractions.Secrets.SecretRef</c>: subseção com
/// <c>Enabled</c> + <c>SecretName</c>. As sintaxes antigas (<c>*KeyName</c>, <c>*SecretName</c> cru,
/// <c>UseKeyVaultForX</c>) foram removidas dos componentes e hoje são silenciosamente ignoradas.
/// </para>
/// <para>
/// A sobrecarga que recebe apenas <c>IConfiguration</c> <strong>não</strong> resolve esses segredos: o
/// <c>ClientSecret</c> fica vazio e a troca do authorization code por token falha com
/// <c>HTTP 401 AADSTS7000218</c>.
/// </para>
/// <para>
/// O <c>IVaultService</c> aqui vem do <see cref="VaultBootstrap"/> — provider isolado, pois o
/// container da aplicação ainda não existe neste ponto.
/// </para>
/// </remarks>
internal static class AuthenticationRegistration
{
    internal static IServiceCollection AddAuthentication(
        this IServiceCollection services,
        IConfiguration configuration,
        bool isDevelopment)
    {
        // Credencial de client SECRETLESS em desenvolvimento local. A lib registra o provider dela com
        // TryAddSingleton, então registrar ANTES de AddFUNCEFAuthentication faz esta implementação
        // vencer. Motivo: o modo ManagedIdentity (WIF) de HML/PRD só funciona rodando no Azure — na
        // estação o DefaultAzureCredential devolve token de USUÁRIO, que o Entra rejeita como
        // client_assertion federada (AADSTS700222). Ver DeveloperUserCredential.
        //
        // SÓ quando não há client secret resolvido. A DeveloperUserCredential devolve dicionário VAZIO
        // em GetClientAuthFieldsAsync, e é ela que alimenta a troca do authorization code no
        // FuncefAuthController.Callback — registrá-la com um secret configurado faria o segredo ser
        // silenciosamente ignorado e o login falharia com HTTP 401 AADSTS7000218, apesar de
        // GET /auth/m2m/config reportar hasClientSecret=true (a chave existe na configuração; o que
        // não chega ao Entra é o campo client_secret da requisição de token).
        //
        // A leitura é de Auth:EntraId:ClientSecret já resolvida, e não do SecretRef
        // ClientSecretFromKeyVault, porque AddAuthSecretsFromKeyVault() roda antes de AddApiServices()
        // (ver Program.cs) e nivela ali todas as origens — cofre, user-secrets e variável de ambiente.
        var temClientSecret = !string.IsNullOrWhiteSpace(configuration["Auth:EntraId:ClientSecret"]);

        if (isDevelopment && !temClientSecret)
        {
            services.AddSingleton<IEntraClientCredential>(_ => new DeveloperUserCredential());
        }

        if (ConfigurationSections.IsKeyVaultEnabled(configuration))
        {
            var keyVaultUrl = configuration[$"{ConfigurationSections.KeyVault}:Url"]!;

            using var vaultProvider = VaultBootstrap.CreateProvider(configuration, keyVaultUrl);
            using var vaultScope = vaultProvider.CreateScope();
            var vaultService = vaultScope.ServiceProvider.GetRequiredService<IVaultService>();

            services.AddFUNCEFAuthentication(configuration, vaultService);
        }
        else
        {
            // Sem Key Vault (desenvolvimento local): segredos vêm da configuração direta/user-secrets.
            services.AddFUNCEFAuthentication(configuration);
        }

        // PAT (Token de Acesso do GAP) — aceita 'Bearer gap_…' no mesmo endpoint que o JWT do Entra,
        // validando por introspecção no GAP. Esta API é CONSUMIDORA: não emite nem revoga PAT.
        //
        // Dois detalhes de ordem/opt-in que quebram silenciosamente se invertidos:
        //   1. DEPOIS de AddFUNCEFAuthentication — é ele que define o esquema padrão que o policy
        //      scheme do PAT captura para reencaminhar o tráfego não-PAT.
        //   2. Só quando Auth:Pat:Enabled é explicitamente true. O default de PatOptions na lib é
        //      Enabled = true, então chamar sem a seção configurada derrubaria o startup exigindo
        //      BaseUrl/IntrospectionScope de um recurso que este serviço nem usa.
        if (configuration.GetValue<bool>("Auth:Pat:Enabled"))
        {
            services.AddFuncefPatAuthentication(configuration);
        }

        // Cliente do PDP (GAP) — opt-in. Sem a seção, [FuncefAuthorize(Acao)] não tem PDP para
        // consultar e o menu efetivo responde 503.
        if (ConfigurationSections.IsAutorizacaoEnabled(configuration))
        {
            services.AddFuncefAuthorizationClient(configuration);
        }

        return services;
    }
}
