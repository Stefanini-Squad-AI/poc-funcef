using Funcef.Abstractions.Secrets;
using Microsoft.Extensions.Configuration;

namespace TemplateBase.Infrastructure.Configuration;

/// <summary>
/// Extensões de configuração para resolver, a partir do Azure Key Vault, os segredos de autenticação
/// <strong>e os identificadores do App Registration do Entra ID</strong>, injetando-os no
/// <see cref="IConfiguration"/> da aplicação.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Por que isso é necessário:</strong> alguns componentes do FUNCEF.Autenticacao leem segredos
/// <em>diretamente</em> de <c>IConfiguration</c> (ou de <c>IOptions</c> bindado a partir do config),
/// <strong>ignorando</strong> a resolução por <see cref="SecretRef"/> que só alimenta cópias
/// locais usadas no registro. Em particular:
/// </para>
/// <list type="bullet">
///   <item><description>
///     <c>FuncefAuthController.Callback</c> lê <c>Auth:EntraId:ClientSecret</c> direto do <c>IConfiguration</c>
///     ao trocar o authorization code por token. Sem valor → <c>HTTP 401 AADSTS7000218</c>.
///   </description></item>
///   <item><description>
///     <c>RefreshTokenService</c> lê <c>RefreshTokenOptions.SigningKey</c> via <c>IOptions</c>, que é bindado
///     de <c>Auth:RefreshToken:SigningKey</c>. Sem valor → "Chave de assinatura do refresh token não configurada".
///   </description></item>
///   <item><description>
///     <c>AddSwaggerBearerAuthentication</c> (da própria lib), o gate do health check do Entra em
///     <c>HealthCheckRegistration</c> e o <c>M2MStartupValidator</c> leem <c>TenantId</c>/<c>ClientId</c>/
///     <c>Audience</c> do <c>IConfiguration</c>. Sem valor → Authority sem tenant (botão Authorize quebrado)
///     e health check/self-test silenciosamente desligados.
///   </description></item>
///   <item><description>
///     A auditoria do <c>FuncefORM</c> resolve a connection string Oracle em um <em>singleton</em> que
///     obtém <c>IVaultService</c> (scoped) do provider raiz — falha sob validação de escopo (Development)
///     e a exceção é engolida pelo background service (auditoria nunca persiste). Injetar a connection
///     string direta (<c>FuncefORM:Audit:ConnectionString</c> / <c>Auth:Audit:DirectConnectionString</c>)
///     faz os componentes usarem o caminho direto, sem resolver o Key Vault em runtime.
///   </description></item>
/// </list>
/// <para>
/// Esta extensão resolve esses valores do Key Vault e os injeta como fonte de configuração in-memory de
/// maior precedência — mantendo o repositório livre tanto de segredos quanto dos GUIDs do App Registration.
/// </para>
/// <para>
/// <strong>Forma canônica.</strong> Toda referência a segredo é um <see cref="SecretRef"/>: uma subseção
/// <c>&lt;Coisa&gt;FromKeyVault</c> com <c>Enabled</c> + <c>SecretName</c>. É fixa a <strong>chave</strong>
/// do <c>appsettings.json</c>, nunca o nome do segredo — que pertence ao cofre deste sistema. As quatro
/// sintaxes antigas (<c>*KeyName</c>, <c>SecretName</c> cru, <c>UseKeyVaultForX</c> + <c>XSecretName</c>,
/// e o <c>KeyVaultReference</c> do FUNCEF.NoSql) foram <strong>removidas</strong> dos componentes, sem
/// alias nem período de convivência: chave antiga é silenciosamente ignorada. Ver
/// <c>FUNCEF.Abstractions/docs/CONFIGURACAO-FUNCEF.md</c>.
/// </para>
/// <para>
/// <strong>Não</strong> reintroduzir valor literal ao lado do <c>*FromKeyVault</c> correspondente: aqui o
/// valor direto tem precedência, mas o <c>AuthOptionsVaultPostConfigure</c> da lib sobrescreve pelo cofre —
/// o processo passaria a ter dois valores divergentes (<c>IConfiguration</c> ≠ <c>IOptions</c>).
/// </para>
/// </remarks>
public static class KeyVaultConfigurationExtensions
{
    /// <summary>
    /// Mapeamento: (subseção <see cref="SecretRef"/> que declara o segredo) → (chave de destino a
    /// popular) → (obrigatória: se não resolver, o startup falha) → (condição que liga a
    /// obrigatoriedade).
    /// </summary>
    private static readonly (string RefSection, string TargetKey, bool Required, string? RequiredWhen)[] SecretMappings =
    [
        // Identificadores do App Registration: obrigatórios. Sem eles a API subiria com Authority
        // inválida e responderia 401 em tudo, sem erro visível — por isso o fail-fast.
        ("Auth:EntraId:TenantIdFromKeyVault", "Auth:EntraId:TenantId", true, null),
        ("Auth:EntraId:ClientIdFromKeyVault", "Auth:EntraId:ClientId", true, null),
        ("Auth:EntraId:AudienceFromKeyVault", "Auth:EntraId:Audience", true, null),

        // Banco: obrigatório. O ConnectionManager do FuncefORM tenta o cofre primeiro e só usa
        // DirectConnectionString como fallback; mapear aqui garante o fail-fast (em vez de a API subir
        // e falhar a cada requisição) e deixa o fallback pronto.
        ("FuncefORM:Connection:ConnectionStringFromKeyVault", "FuncefORM:Connection:DirectConnectionString", true, null),

        // Chave de assinatura dos refresh tokens: obrigatória apenas quando o recurso está habilitado.
        // Sem ela o login conclui mas a emissão falha com "Chave de assinatura não configurada".
        ("Auth:RefreshToken:SigningKeyFromKeyVault", "Auth:RefreshToken:SigningKey", true, "Auth:RefreshToken:Enabled"),

        // Segredos lidos diretamente do IConfiguration/IOptions pelos componentes de autenticação.
        // O client secret é opcional de propósito: CredentialType pode ser ManagedIdentity/Certificate
        // (secretless, que é o padrão deste template). Credencial ausente/incoerente é barrada pelo
        // AuthOptionsValidator da lib.
        ("Auth:EntraId:ClientSecretFromKeyVault", "Auth:EntraId:ClientSecret", false, null),
        ("Auth:EntraIdExternal:ClientSecretFromKeyVault", "Auth:EntraIdExternal:ClientSecret", false, null),

        // Connection strings de auditoria (Oracle Lakehouse, segredo "AuditOracle"). Injetar a connection
        // string DIRETA faz os componentes usarem o caminho de conexão direto, evitando a resolução de
        // IVaultService (scoped) a partir do provider raiz feita pela auditoria de entidades do FuncefORM
        // (ConfigureOracleAuditConnection) — que lança sob validação de escopo (Development) e tem a
        // exceção engolida pelo AuditBackgroundService, fazendo a auditoria nunca persistir. Mesmo
        // segredo ("AuditOracle") alimenta a auditoria de entidades e a de acesso — são duas auditorias
        // distintas (entidade × acesso) sobre UMA conexão. Segue opcional: falha de auditoria é
        // não-fatal por decisão de projeto (vai só para telemetria).
        //
        // O alvo é 'ConnectionString' nas DUAS: é a chave de valor direto tanto de AuditOptions
        // (FUNCEF.ORM) quanto de AccessAuditOptions (FUNCEF.Autenticacao). Não existe
        // 'DirectConnectionString' em nenhuma das duas — apontar para lá injetaria o segredo em uma
        // chave que ninguém lê, deixando a auditoria de acesso silenciosamente sem persistência.
        ("FuncefORM:Audit:ConnectionStringFromKeyVault", "FuncefORM:Audit:ConnectionString", false, null),
        ("Auth:Audit:ConnectionStringFromKeyVault", "Auth:Audit:ConnectionString", false, null),
    ];

    /// <summary>
    /// Resolve a configuração do Entra ID (tenant/client/audience e credencial) e os demais segredos de
    /// autenticação a partir do Key Vault, injetando-os no <paramref name="configuration"/> nas respectivas
    /// chaves de destino.
    /// </summary>
    /// <remarks>
    /// Não faz nada quando <c>KeyVault:Url</c> não está configurado. Para cada entrada, é ignorada quando a
    /// chave de destino já possui valor direto ou quando o nome do segredo não está configurado. Falhas de
    /// leitura de segredos <em>opcionais</em> são silenciosas (a ausência é diagnosticada em runtime / no
    /// self-test de startup); falhas nas chaves obrigatórias derrubam o startup.
    /// </remarks>
    /// <param name="configuration">Gerenciador de configuração da aplicação (é também um builder).</param>
    /// <returns>O próprio <paramref name="configuration"/> para encadeamento.</returns>
    /// <exception cref="InvalidOperationException">
    /// Quando <c>KeyVault:Url</c> ainda contém o placeholder do template, ou quando uma chave obrigatória
    /// do Entra ID (TenantId/ClientId/Audience) não pode ser resolvida nem por valor direto nem pelo cofre.
    /// A mensagem nomeia as chaves e os segredos esperados — nunca valores.
    /// </exception>
    public static IConfigurationManager AddAuthSecretsFromKeyVault(this IConfigurationManager configuration)
    {
        var keyVaultUrl = configuration["KeyVault:Url"];
        if (string.IsNullOrEmpty(keyVaultUrl))
        {
            return configuration;
        }

        // Placeholder do template: barra ANTES de qualquer chamada ao cofre, em TODOS os ambientes.
        // Sem isto o sintoma seria um erro de resolução de DNS embrulhado em "segredo não resolvido",
        // apontando para as chaves do Entra em vez de para a causa real (ninguém trocou a URL do cofre).
        // A validação equivalente em ConfigurationValidationExtensions não alcança este caso: ela roda
        // depois deste método no Program.cs, e cobre o cenário complementar — placeholder presente sem
        // nenhum segredo a resolver (todos os valores diretos preenchidos).
        if (ContemPlaceholder(keyVaultUrl))
        {
            throw new InvalidOperationException(
                $"'KeyVault:Url' ainda contém o placeholder do template ('{keyVaultUrl}'). Não existe cofre " +
                "corporativo único: informe o Azure Key Vault DESTE sistema para o ambiente em execução " +
                "(ex.: 'https://kv-api-<sistema>-dev-001.vault.azure.net/'). Em desenvolvimento, sobrescreva " +
                "em appsettings.Development.json e autentique-se com 'az login' (role 'Key Vault Secrets User').");
        }

        var overrides = new Dictionary<string, string?>();
        var naoResolvidas = new List<string>();

        // Um único provider de bootstrap para todas as leituras, criado sob demanda (só se houver
        // algo a resolver) e descartado ao final. O tratamento de falha é por segredo, dentro do
        // VaultBootstrap: a ausência de um (ex.: signing key do refresh token não cadastrada) não
        // pode abortar a leitura dos demais (ex.: connection strings de auditoria).
        Microsoft.Extensions.DependencyInjection.ServiceProvider? vaultProvider = null;
        try
        {
            foreach (var (refSection, targetKey, obrigatoria, condicao) in SecretMappings)
            {
                // Respeita valor direto já presente na configuração.
                if (!string.IsNullOrEmpty(configuration[targetKey]))
                {
                    continue;
                }

                // RequiredWhen: a obrigatoriedade só vale quando a chave booleana indicada está ligada.
                var required = obrigatoria &&
                    (condicao is null || configuration.GetValue<bool>(condicao));

                var secretRef = configuration.GetSection(refSection).Get<SecretRef>() ?? new SecretRef();

                // 'Enabled' sem 'SecretName' é erro de configuração, não ausência de configuração:
                // alguém pediu o cofre e não disse qual segredo. Derruba o startup mesmo quando a chave
                // é opcional — degradar aqui esconderia um erro de digitação no appsettings. A mensagem
                // canônica do ecossistema vem do próprio SecretRef.
                if (secretRef.IsIncomplete)
                {
                    try
                    {
                        secretRef.ValidateConfigured(refSection, targetKey);
                    }
                    catch (InvalidOperationException ex)
                    {
                        naoResolvidas.Add(ex.Message);
                    }

                    continue;
                }

                if (!secretRef.IsConfigured)
                {
                    if (required)
                    {
                        naoResolvidas.Add(
                            $"'{targetKey}' (sem valor direto e sem '{refSection}' habilitado com SecretName)");
                    }

                    continue;
                }

                var secretName = secretRef.SecretName!;

                vaultProvider ??= VaultBootstrap.CreateProvider(configuration, keyVaultUrl);

                var secret = VaultBootstrap.TryGetSecret(vaultProvider, secretName, out var falha);
                if (!string.IsNullOrEmpty(secret))
                {
                    overrides[targetKey] = secret;
                }
                else if (required)
                {
                    // TryGetSecret nunca lança; o motivo vem pelo out (status HTTP/RBAC quando houver).
                    naoResolvidas.Add($"'{targetKey}' <- segredo '{secretName}' ({falha ?? "vazio no cofre"})");
                }
            }
        }
        finally
        {
            vaultProvider?.Dispose();
        }

        if (naoResolvidas.Count > 0)
        {
            throw new InvalidOperationException(
                $"Configuração obrigatória não resolvida a partir do Key Vault '{keyVaultUrl}': " +
                $"{string.Join("; ", naoResolvidas)}. Verifique se os segredos existem no cofre e se a identidade " +
                "da aplicação tem a role 'Key Vault Secrets User'. Em desenvolvimento, atenção: o " +
                "DefaultAzureCredential prioriza a conta do Visual Studio sobre a do 'az login' — em caso de 403, " +
                "confira o oid reportado acima.");
        }

        AdicionarValoresDerivados(configuration, overrides);

        if (overrides.Count > 0)
        {
            // AddInMemoryCollection entra como última fonte -> maior precedência sobre o appsettings.
            configuration.AddInMemoryCollection(overrides);
        }

        return configuration;
    }

    /// <summary>
    /// Deriva as chaves que apenas repetem o TenantId/ClientId já resolvidos, evitando GUIDs literais no
    /// repositório sem inflar o cofre com segredos redundantes.
    /// </summary>
    private static void AdicionarValoresDerivados(IConfiguration configuration, Dictionary<string, string?> overrides)
    {
        var clientId = Resolvido(configuration, overrides, "Auth:EntraId:ClientId");
        var tenantId = Resolvido(configuration, overrides, "Auth:EntraId:TenantId");

        // Escopo do login interativo: api://{clientId}/user_impersonation + escopos OIDC padrão.
        if (!string.IsNullOrEmpty(clientId) && string.IsNullOrWhiteSpace(configuration["Auth:EntraId:Scope"]))
        {
            overrides["Auth:EntraId:Scope"] = $"openid profile email api://{clientId}/user_impersonation";
        }

        // Tenants aceitos no fluxo M2M: por padrão apenas o próprio tenant. Tenants adicionais continuam
        // podendo ser declarados explicitamente em Auth:M2M:AllowedTenantIds.
        if (!string.IsNullOrEmpty(tenantId) &&
            !configuration.GetSection("Auth:M2M:AllowedTenantIds").GetChildren().Any())
        {
            overrides["Auth:M2M:AllowedTenantIds:0"] = tenantId;
        }
    }

    /// <summary>
    /// Indica se o valor ainda carrega a marca de placeholder deixada pelo template
    /// (<c>altere-para-…</c>) nos itens que o projeto derivado precisa trocar. Mesma convenção usada
    /// por <c>AllowedHosts</c> e <c>Auth:Autorizacao:BaseUrl</c>.
    /// </summary>
    /// <param name="valor">Valor de configuração a inspecionar.</param>
    /// <returns><c>true</c> quando o placeholder ainda está presente.</returns>
    public static bool ContemPlaceholder(string? valor)
        => !string.IsNullOrWhiteSpace(valor) &&
           valor.Contains("altere-para", StringComparison.OrdinalIgnoreCase);

    /// <summary>Valor efetivo de uma chave: o resolvido no cofre nesta passada ou o já presente na configuração.</summary>
    private static string? Resolvido(IConfiguration configuration, Dictionary<string, string?> overrides, string key)
        => overrides.TryGetValue(key, out var doVault) && !string.IsNullOrEmpty(doVault)
            ? doVault
            : configuration[key];
}
