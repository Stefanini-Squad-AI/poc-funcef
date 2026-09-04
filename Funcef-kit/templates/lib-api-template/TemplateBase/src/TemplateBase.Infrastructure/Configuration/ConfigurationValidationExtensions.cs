using System.ComponentModel.DataAnnotations;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;

namespace TemplateBase.Infrastructure.Configuration;

/// <summary>
/// Extensões para validação de configuração no startup.
/// </summary>
/// <remarks>
/// Valida seções críticas da configuração antes da aplicação iniciar,
/// falhando rapidamente (fail-fast) com mensagens claras quando configurações obrigatórias estão ausentes.
/// </remarks>
public static class ConfigurationValidationExtensions
{
    /// <summary>
    /// Adiciona validação de configuração ao container de DI.
    /// A validação é executada no primeiro uso das opções ou no startup quando <c>ValidateOnStart</c> é true.
    /// </summary>
    /// <param name="services">Coleção de serviços.</param>
    /// <param name="configuration">Configuração da aplicação.</param>
    /// <param name="environmentName">Nome do ambiente (Development, Production, etc.).</param>
    /// <returns>A coleção de serviços para encadeamento.</returns>
    public static IServiceCollection AddConfigurationValidation(
        this IServiceCollection services,
        IConfiguration configuration,
        string environmentName)
    {
        var isDevelopment = string.Equals(environmentName, "Development", StringComparison.OrdinalIgnoreCase);
        var isHomologation = string.Equals(environmentName, "Homologation", StringComparison.OrdinalIgnoreCase);

        // Fora de Development: placeholders do template derrubam o ambiente inteiro em silêncio —
        // AllowedHosts placeholder → 400 em toda requisição (HostFilteringMiddleware); BaseUrl do
        // PDP placeholder → 403 em todo endpoint ([FuncefAuthorize] é fail-closed). Falhar o
        // startup com mensagem clara é melhor do que subir "verde" e negar tudo em silêncio.
        if (!isDevelopment)
        {
            ValidateAllowedHosts(configuration, environmentName);
            ValidateAutorizacaoPlaceholder(configuration, environmentName);
            ValidateKeyVaultPlaceholder(configuration, environmentName);
        }

        // Em Development e Homologation, o restante da validação é mais flexível
        // (Key Vault e PDP podem ser opcionais para execução local).
        if (isDevelopment || isHomologation)
        {
            return services;
        }

        // Em produção: os endpoints usam [FuncefAuthorize(Acao=...)] (fail-closed) — sem a seção
        // Auth:Autorizacao o cliente do PDP não é registrado e TODOS os endpoints respondem 403.
        ValidateAutorizacao(configuration);

        // Em produção: validar Key Vault quando configurado para uso. A referência segue a forma
        // canônica SecretRef (Enabled + SecretName) — ver CONFIGURACAO-FUNCEF.md.
        var useKeyVaultForAppInsights =
            configuration.GetValue<bool>("ApplicationInsights:ConnectionStringFromKeyVault:Enabled");

        if (useKeyVaultForAppInsights)
        {
            services.AddOptions<KeyVaultValidationOptions>()
                .Bind(configuration.GetSection(KeyVaultValidationOptions.SectionName))
                .ValidateDataAnnotations()
                .ValidateOnStart();

            // Garante que a validação seja executada no startup (ValidateOnStart só roda quando as opções são resolvidas)
            services.AddHostedService<ConfigurationValidationHostedService>();
        }

        return services;
    }

    private static void ValidateAllowedHosts(IConfiguration configuration, string environmentName)
    {
        var allowedHosts = configuration.GetValue<string>("AllowedHosts");

        if (!string.IsNullOrWhiteSpace(allowedHosts) &&
            allowedHosts.Contains("altere-para", StringComparison.OrdinalIgnoreCase))
        {
            throw new InvalidOperationException(
                $"AllowedHosts ainda contém o placeholder do template ('{allowedHosts}') no ambiente " +
                $"'{environmentName}'. Com esse valor o HostFilteringMiddleware responde 400 Bad Request " +
                "para TODA requisição. Defina os hosts reais servidos pela API no " +
                $"appsettings.{environmentName}.json (ex.: 'api.funcef.com.br') — ou '*' apenas para " +
                "execução local, ciente de que desativa a proteção contra Host header injection.");
        }
    }

    /// <summary>
    /// Barra o placeholder de <c>KeyVault:Url</c> no caso que o <c>AddAuthSecretsFromKeyVault</c> não
    /// alcança.
    /// </summary>
    /// <remarks>
    /// Aquele método é a primeira instrução do <c>Program.cs</c> e já derruba o startup, em qualquer
    /// ambiente, quando o placeholder seria usado para resolver algum segredo. Sobra o cenário em que
    /// todos os valores diretos estão preenchidos e nenhuma referência ao cofre chega a ser consultada:
    /// ali o placeholder passaria despercebido, e a primeira leitura de segredo em runtime — o SQL
    /// Server, o Application Insights — falharia em produção sem explicação. Não vale para Development,
    /// onde valor direto é caminho legítimo.
    /// </remarks>
    private static void ValidateKeyVaultPlaceholder(IConfiguration configuration, string environmentName)
    {
        var url = configuration.GetValue<string>("KeyVault:Url");

        if (KeyVaultConfigurationExtensions.ContemPlaceholder(url))
        {
            throw new InvalidOperationException(
                $"KeyVault:Url ainda contém o placeholder do template ('{url}') no ambiente " +
                $"'{environmentName}'. Não existe cofre corporativo único: informe o Azure Key Vault " +
                $"deste sistema no appsettings.{environmentName}.json " +
                "(ex.: 'https://kv-api-<sistema>-hml-001.vault.azure.net/').");
        }
    }

    private static void ValidateAutorizacaoPlaceholder(IConfiguration configuration, string environmentName)
    {
        var baseUrl = configuration.GetValue<string>("Auth:Autorizacao:BaseUrl");

        if (!string.IsNullOrWhiteSpace(baseUrl) &&
            baseUrl.Contains("altere-para", StringComparison.OrdinalIgnoreCase))
        {
            throw new InvalidOperationException(
                $"Auth:Autorizacao:BaseUrl ainda contém o placeholder do template ('{baseUrl}') no ambiente " +
                $"'{environmentName}'. Com esse valor o cliente do PDP não alcança o GAP e, como " +
                "[FuncefAuthorize(Acao = ...)] é fail-closed, TODOS os endpoints respondem 403 Forbidden. " +
                $"Defina a URL do GAP do ambiente no appsettings.{environmentName}.json " +
                "(ex.: 'https://gap-hml.funcef.com.br').");
        }
    }

    private static void ValidateAutorizacao(IConfiguration configuration)
    {
        var baseUrl = configuration.GetValue<string>("Auth:Autorizacao:BaseUrl");

        if (string.IsNullOrWhiteSpace(baseUrl))
        {
            throw new InvalidOperationException(
                "A seção 'Auth:Autorizacao' (BaseUrl/CodigoSistema do PDP GAP) não está configurada. " +
                "Os endpoints deste serviço usam [FuncefAuthorize(Acao = ...)], que é fail-closed: sem o " +
                "cliente de autorização registrado, TODOS os endpoints respondem 403 Forbidden. Configure " +
                "a seção com a URL do GAP do ambiente (ex.: \"Autorizacao\": { \"BaseUrl\": " +
                "\"https://gap.funcef.com.br\", \"CodigoSistema\": \"Template\" }). Se este serviço não usa " +
                "ações do PDP (nenhum [FuncefAuthorize] com Acao), remova esta validação.");
        }
    }
}

/// <summary>
/// Opções para validação do Key Vault (uso interno).
/// </summary>
internal class KeyVaultValidationOptions
{
    public const string SectionName = "KeyVault";

    [Url(ErrorMessage = "KeyVault:Url deve ser uma URL válida do Azure Key Vault.")]
    [Required(AllowEmptyStrings = false, ErrorMessage = "KeyVault:Url é obrigatório quando ApplicationInsights:ConnectionStringFromKeyVault:Enabled é true.")]
    public string Url { get; set; } = string.Empty;
}

/// <summary>
/// Hosted service que dispara a validação de configuração no startup.
/// </summary>
internal class ConfigurationValidationHostedService : IHostedService
{
    private readonly IOptions<KeyVaultValidationOptions> _options;

    public ConfigurationValidationHostedService(IOptions<KeyVaultValidationOptions> options)
    {
        _options = options;
    }

    public Task StartAsync(CancellationToken cancellationToken)
    {
        _ = _options.Value; // Dispara a validação ValidateOnStart
        return Task.CompletedTask;
    }

    public Task StopAsync(CancellationToken cancellationToken) => Task.CompletedTask;
}
