using Microsoft.Extensions.Configuration;
using TemplateBase.Infrastructure.Configuration;

namespace TemplateBase.Tests.Infrastructure;

/// <summary>
/// Testes de verificação da configuração do NoSQL (FUNCEF.NoSql v4) no appsettings.
/// Valida o schema atual de cache Redis (<c>ConnectionStringFromKeyVault</c>).
/// </summary>
/// <remarks>
/// A partir da v4 dos componentes a auditoria (entidades e acesso) passou a usar o Oracle Lakehouse;
/// o MongoDB deixou de ser necessário e sua seção foi removida do template.
/// </remarks>
[TestClass]
public class NoSqlConfigurationTests
{
    private IConfiguration _configuration = null!;

    [TestInitialize]
    public void Setup()
    {
        _configuration = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false)
            .Build();
    }

    [TestMethod]
    public void Config_SecaoNoSqlRedis_DeveExistir()
    {
        var section = _configuration.GetSection("NoSql:RedisCache");

        Assert.IsTrue(section.Exists(), "A seção 'NoSql:RedisCache' deve existir no appsettings.json");
    }

    [TestMethod]
    public void Config_Redis_ConnectionStringFromKeyVault_DeveEstarHabilitado()
    {
        var enabled = _configuration.GetValue<bool>("NoSql:RedisCache:ConnectionStringFromKeyVault:Enabled");

        Assert.IsTrue(enabled, "Redis deve resolver a connection string via Key Vault em produção");
    }

    [TestMethod]
    public void Config_Redis_SecretName_DeveEstarConfigurado()
    {
        var secretName = _configuration["NoSql:RedisCache:ConnectionStringFromKeyVault:SecretName"];

        Assert.IsFalse(string.IsNullOrWhiteSpace(secretName),
            "O nome do segredo da connection string do Redis deve estar configurado");
    }

    [TestMethod]
    public void Config_MongoDB_NaoDeveMaisExistir()
    {
        var section = _configuration.GetSection("NoSql:MongoDB");

        Assert.IsFalse(section.Exists(),
            "A seção 'NoSql:MongoDB' foi removida: a auditoria usa o Oracle Lakehouse na v4 dos componentes");
    }

    [TestMethod]
    public void Config_KeyVault_DeveDeclararUmCofreProprioPorAmbiente()
    {
        // Este teste já fixou o NOME do cofre ('kv-<sistema>-<env>-001', tido como "o Key Vault real"). A
        // premissa não se sustentou: em 2026-08-11 esse cofre não existia em nenhuma assinatura FUNCEF
        // — o nome sequer resolvia em DNS — e todo projeto gerado herdava a referência morta em
        // silêncio, sem que teste algum acusasse.
        //
        // Por isso aqui se verifica a FORMA, não a identidade: cada sistema tem o seu cofre e cada
        // ambiente o seu, então fixar um nome concreto recria exatamente o acoplamento que falhou.
        var url = _configuration["KeyVault:Url"];

        Assert.IsFalse(string.IsNullOrWhiteSpace(url), "'KeyVault:Url' deve estar declarado.");
        Assert.IsTrue(
            Uri.TryCreate(url, UriKind.Absolute, out var uri) &&
            uri.Scheme == Uri.UriSchemeHttps &&
            uri.Host.EndsWith(".vault.azure.net", StringComparison.OrdinalIgnoreCase),
            $"'KeyVault:Url' deve ser uma URL HTTPS de Azure Key Vault (atual: '{url}').");
    }

    [TestMethod]
    public void Config_KeyVault_DevDeveApontarParaCofreDiferenteDoBase()
    {
        // Cofre é por ambiente: DEV e o arquivo base não podem compartilhar o mesmo. Compartilhar
        // significaria a estação lendo — e podendo escrever — os segredos de produção.
        var urlBase = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false)
            .Build()["KeyVault:Url"];

        var urlDev = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false)
            .AddJsonFile("appsettings.Development.json", optional: false)
            .Build()["KeyVault:Url"];

        Assert.AreNotEqual(urlBase, urlDev, StringComparer.OrdinalIgnoreCase,
            "appsettings.Development.json deve sobrescrever 'KeyVault:Url' com o cofre de DEV.");
    }
}
