using FuncefCofre.Contracts;
using FuncefCofre.Extensions;
using FuncefEssenciais.Exceptions;
using FuncefEssenciais.Infrastructure.Telemetry.Configuration;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace TemplateBase.Infrastructure.Configuration;

/// <summary>
/// Resolução de segredos do Azure Key Vault <strong>no momento do registro</strong>, antes de existir
/// um container de DI da aplicação.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Por que é necessário.</strong> Vários registros exigem o valor do segredo já resolvido —
/// não aceitam resolução lazy: <c>AddAzureMonitorTelemetry</c> recebe a connection string,
/// <c>AddFUNCEFAuthentication</c> recebe um <c>IVaultService</c> para ler os segredos do Entra ID, e
/// alguns componentes leem segredos direto do <c>IConfiguration</c>. Resolver isso com
/// <c>BuildServiceProvider()</c> sobre o container principal é anti-pattern (duplica singletons e
/// dispara avisos de escopo), então usamos um container <em>mínimo e isolado</em>, descartado em
/// seguida.
/// </para>
/// <para>
/// <strong>Fonte única.</strong> Antes desta classe a mesma lógica existia em três lugares — na
/// resolução da connection string do SQL Server, na do Application Insights e no
/// <c>KeyVaultConfigurationExtensions</c> — cada uma com semântica própria de fallback e de
/// tratamento de erro. Toda leitura de segredo em tempo de registro passa por aqui.
/// </para>
/// <para>
/// <strong>Ciclo de vida.</strong> <see cref="CreateProvider"/> devolve um provider de
/// responsabilidade do chamador (use <c>using</c>). Para leituras pontuais, prefira
/// <see cref="TryGetSecret(IConfiguration, string)"/>, que cria e descarta o provider por conta
/// própria; para várias leituras em sequência, crie o provider uma vez e use
/// <see cref="TryGetSecret(IServiceProvider, string)"/> para reaproveitá-lo.
/// </para>
/// </remarks>
public static class VaultBootstrap
{
    /// <summary>
    /// Cria um container de DI mínimo e isolado contendo <c>IVaultService</c> (FUNCEF.Cofre) e
    /// <c>ITelemetry</c>.
    /// </summary>
    /// <remarks>
    /// <para>
    /// <strong>Por que registrar telemetria:</strong> o <c>IVaultService</c> de
    /// <c>AddVaultComplete</c> depende de <c>ITelemetry</c> mesmo com <c>EnableTelemetry = false</c>.
    /// Sem ela, a resolução falha com <c>"No service for type 'ITelemetry' has been registered"</c>.
    /// A telemetria de console é leve e não abre conexão externa.
    /// </para>
    /// <para>
    /// <strong>Por que sem circuit breaker:</strong> este provider faz apenas leituras pontuais e
    /// sequenciais no startup. O breaker não agrega resiliência aqui e atrapalha: (a) loga toda
    /// <c>NotFoundException</c> como ERRO "Falha na operação via circuit breaker" — ruído para
    /// segredos opcionais ainda não cadastrados — e (b) conta o NotFound como falha, podendo ABRIR o
    /// breaker e bloquear a leitura dos segredos seguintes, que existem. O <c>IVaultService</c> de
    /// runtime (registrado em <c>SecretsRegistration</c>) mantém o breaker para as leituras
    /// repetidas em produção.
    /// </para>
    /// </remarks>
    /// <param name="configuration">Configuração da aplicação.</param>
    /// <param name="keyVaultUrl">URL do Azure Key Vault.</param>
    /// <returns>Provider isolado; o chamador é responsável por descartá-lo.</returns>
    public static ServiceProvider CreateProvider(IConfiguration configuration, string keyVaultUrl)
    {
        var serviceName = configuration["Telemetry:ServiceName"] ?? "TemplateBase.API";
        var serviceVersion = configuration["Telemetry:ServiceVersion"] ?? "1.0.0";

        var bootstrapServices = new ServiceCollection();
        bootstrapServices.AddSingleton(configuration);
        bootstrapServices.AddConsoleTelemetry(serviceName, serviceVersion);
        bootstrapServices.AddVaultComplete(keyVaultUrl, cfg =>
        {
            cfg.EnableCache = true;
            cfg.EnableTelemetry = false;
            cfg.EnableCircuitBreaker = false;
        });

        return bootstrapServices.BuildServiceProvider();
    }

    /// <summary>
    /// Lê um segredo criando e descartando um provider de bootstrap próprio. Use para leituras
    /// pontuais; para várias leituras, veja <see cref="TryGetSecret(IServiceProvider, string)"/>.
    /// </summary>
    /// <param name="configuration">Configuração da aplicação (fornece <c>KeyVault:Url</c>).</param>
    /// <param name="secretName">Nome do segredo no Key Vault.</param>
    /// <returns>
    /// O valor do segredo, ou <c>null</c> quando o Key Vault não está configurado, o segredo não
    /// existe ou a leitura falha. Nunca lança — ausência de segredo é tratada no ponto de uso.
    /// </returns>
    public static string? TryGetSecret(IConfiguration configuration, string secretName)
    {
        var keyVaultUrl = configuration["KeyVault:Url"];
        if (string.IsNullOrEmpty(keyVaultUrl) || string.IsNullOrEmpty(secretName))
        {
            return null;
        }

        using var provider = CreateProvider(configuration, keyVaultUrl);
        return TryGetSecret(provider, secretName);
    }

    /// <summary>
    /// Lê um segredo reaproveitando um provider de bootstrap já criado por
    /// <see cref="CreateProvider"/>.
    /// </summary>
    /// <param name="bootstrapProvider">Provider isolado com <c>IVaultService</c>.</param>
    /// <param name="secretName">Nome do segredo no Key Vault.</param>
    /// <returns>
    /// O valor do segredo, ou <c>null</c> quando não existe ou a leitura falha. Nunca lança: a falha
    /// de um segredo não pode abortar a resolução dos demais — sem isso, um segredo opcional ausente
    /// (ex.: signing key do refresh token) impediria a leitura das connection strings de auditoria.
    /// </returns>
    public static string? TryGetSecret(IServiceProvider bootstrapProvider, string secretName)
        => TryGetSecret(bootstrapProvider, secretName, out _);

    /// <summary>
    /// Lê um segredo reaproveitando um provider de bootstrap já criado, informando <b>por que</b> a
    /// leitura falhou.
    /// </summary>
    /// <param name="bootstrapProvider">Provider isolado com <c>IVaultService</c>.</param>
    /// <param name="secretName">Nome do segredo no Key Vault.</param>
    /// <param name="falha">
    /// Motivo da falha em uma linha, ou <c>null</c> quando a leitura teve êxito. Use no diagnóstico de
    /// segredos <em>obrigatórios</em>: o <c>FUNCEF.Cofre</c> só converte <b>404</b> em
    /// <c>NotFoundException</c>, então 401/403/rede chegam como <c>RequestFailedException</c>, cuja
    /// mensagem traz o status HTTP e a identidade sem permissão — o dado que resolve o incidente.
    /// Nunca contém valor de segredo.
    /// </param>
    /// <returns>O valor do segredo, ou <c>null</c> quando não existe ou a leitura falha. Nunca lança.</returns>
    public static string? TryGetSecret(IServiceProvider bootstrapProvider, string secretName, out string? falha)
    {
        falha = null;

        if (string.IsNullOrEmpty(secretName))
        {
            return null;
        }

        try
        {
            using var scope = bootstrapProvider.CreateScope();
            var vaultService = scope.ServiceProvider.GetRequiredService<IVaultService>();

            return vaultService.GetSecretAsync(secretName).GetAwaiter().GetResult();
        }
        catch (NotFoundException)
        {
            // Segredo opcional não cadastrado neste cofre: segue sem ele. A ausência é diagnosticada
            // no ponto de uso (validador de startup, emissão de token), não aqui — não é erro de
            // configuração.
            falha = "não encontrado no Key Vault";
            Trace($"segredo '{secretName}' não encontrado no Key Vault; seguindo sem ele.");
            return null;
        }
        catch (Exception ex)
        {
            // Falha inesperada (rede/RBAC): não interrompe as leituras seguintes.
            falha = $"{ex.GetType().Name}: {string.Join(" | ", ex.Message.Split(['\r', '\n'], StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))}";
            Trace($"falha ao ler o segredo '{secretName}': {ex.Message}");
            return null;
        }
    }

    private static void Trace(string message)
        => System.Diagnostics.Debug.WriteLine($"[VaultBootstrap] {message}");
}
