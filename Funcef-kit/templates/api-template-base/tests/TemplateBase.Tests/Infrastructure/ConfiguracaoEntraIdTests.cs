using System.Text.RegularExpressions;
using Funcef.Abstractions.Secrets;
using FuncefAutenticacao.AccessAudit.Configuration;
using FuncefAutenticacao.Configuration;
using FuncefORM.Audit.Configuration;
using FuncefORM.Configuration;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Infrastructure.Configuration;

namespace TemplateBase.Tests.Infrastructure;

/// <summary>
/// Testes de convenção da configuração do Entra ID: os identificadores do App Registration
/// (TenantId/ClientId/Audience) não ficam versionados no <c>appsettings</c> — apenas as referências
/// canônicas <c>*FromKeyVault</c> (<c>Enabled</c> + <c>SecretName</c>) aos segredos do Key Vault,
/// resolvidas por <see cref="KeyVaultConfigurationExtensions.AddAuthSecretsFromKeyVault"/> na primeira
/// instrução do <c>Program.cs</c>.
/// </summary>
/// <remarks>
/// Isto protege o template de um erro difícil de perceber: um projeto novo herdaria os GUIDs do App
/// Registration do próprio template e autenticaria contra a aplicação errada em vez de falhar.
/// </remarks>
[TestClass]
public class ConfiguracaoEntraIdTests
{
    private static readonly Regex Guid = new(
        "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}",
        RegexOptions.Compiled);

    private static IConfigurationRoot Carregar(string arquivo)
        => new ConfigurationBuilder()
            .AddJsonFile(arquivo, optional: false)
            .Build();

    /// <summary>
    /// Configuração mínima em que todas as chaves obrigatórias já têm valor direto e nenhuma
    /// referência <c>*FromKeyVault</c> opcional está habilitada: nenhuma entrada do mapeamento chega a
    /// consultar o cofre, o que permite exercitar o método sem depender do Azure.
    /// </summary>
    private static ConfigurationManager ConfiguracaoSemAcessoAoCofre(
        params (string Chave, string Valor)[] extras)
    {
        var valores = new Dictionary<string, string?>
        {
            ["KeyVault:Url"] = "https://cofre-inexistente.vault.azure.net/",
            ["Auth:EntraId:TenantId"] = "11111111-1111-1111-1111-111111111111",
            ["Auth:EntraId:ClientId"] = "22222222-2222-2222-2222-222222222222",
            ["Auth:EntraId:Audience"] = "22222222-2222-2222-2222-222222222222",
            ["FuncefORM:Connection:DirectConnectionString"] = "User Id=app;Data Source=fake",
        };

        foreach (var (chave, valor) in extras)
        {
            valores[chave] = valor;
        }

        var configuration = new ConfigurationManager();
        configuration.AddInMemoryCollection(valores);
        return configuration;
    }

    [TestMethod]
    [DataRow("appsettings.json")]
    [DataRow("appsettings.Development.json")]
    [DataRow("appsettings.Homologation.json")]
    public void Config_AuthEntraIdEM2M_NaoDevemConterGuidLiteral(string arquivo)
    {
        var configuration = Carregar(arquivo);

        foreach (var secao in new[] { "Auth:EntraId", "Auth:EntraIdExternal", "Auth:M2M" })
        {
            foreach (var (chave, valor) in configuration.GetSection(secao).AsEnumerable(makePathsRelative: true))
            {
                if (string.IsNullOrEmpty(valor) || !Guid.IsMatch(valor))
                {
                    continue;
                }

                Assert.Fail(
                    $"{arquivo}: '{secao}:{chave}' contém um GUID literal. Os identificadores do Entra ID " +
                    "devem vir do Key Vault via '*FromKeyVault' (ver KeyVaultConfigurationExtensions).");
            }
        }
    }

    [TestMethod]
    public void Config_AuthEntraId_DeveReferenciarOsSegredosDoCofre()
    {
        // Os nomes dos segredos são específicos do cofre de cada ambiente, por isso não são fixados
        // aqui — o invariante é que as três referências obrigatórias existam e sejam distintas, senão
        // o fail-fast de AddAuthSecretsFromKeyVault derruba o startup.
        var entraId = Carregar("appsettings.json").GetSection("Auth:EntraId");

        var referencias = new[] { "TenantIdFromKeyVault", "ClientIdFromKeyVault", "AudienceFromKeyVault" };

        foreach (var chave in referencias)
        {
            var secretRef = entraId.GetSection(chave).Get<SecretRef>();

            Assert.IsNotNull(secretRef, $"'Auth:EntraId:{chave}' deve existir (forma canônica SecretRef).");
            Assert.IsTrue(
                secretRef.IsConfigured,
                $"'Auth:EntraId:{chave}' deve estar habilitada (Enabled) e nomear o segredo (SecretName).");
        }

        var nomes = referencias.Select(c => entraId[$"{c}:SecretName"]).ToArray();
        Assert.AreEqual(nomes.Length, nomes.Distinct(StringComparer.OrdinalIgnoreCase).Count(),
            "Cada referência deve apontar para um segredo distinto.");
    }

    [TestMethod]
    [DataRow("appsettings.json")]
    [DataRow("appsettings.Development.json")]
    [DataRow("appsettings.Homologation.json")]
    public void Config_NaoDeveUsarSintaxeAntigaDeReferenciaASegredo(string arquivo)
    {
        // As quatro sintaxes anteriores foram REMOVIDAS dos componentes FUNCEF, sem alias: uma chave
        // remanescente não quebra o build nem o startup — ela é simplesmente ignorada, e o segredo
        // nunca é resolvido. É exatamente o tipo de falha que este teste existe para pegar.
        var proibidas = new[]
        {
            "TenantIdKeyName", "ClientIdKeyName", "AudienceKeyName", "ClientSecretKeyName",
            "ClientCertificateKeyName", "SigningKeySecretName", "ConnectionSecretName",
            "UseKeyVaultForConnectionString", "StorageAccountUriSecretName", "UseKeyVaultForNamespace",
            "NamespaceSecretName",
        };

        const string ComoMigrar =
            "Migre para a forma canônica '<Coisa>FromKeyVault: { Enabled, SecretName }' — ver " +
            "FUNCEF.Abstractions/docs/CONFIGURACAO-FUNCEF.md.";

        foreach (var (chave, _) in Carregar(arquivo).AsEnumerable())
        {
            var caminho = chave.Split(':');
            var folha = caminho[^1];

            Assert.IsFalse(
                proibidas.Contains(folha, StringComparer.OrdinalIgnoreCase),
                $"{arquivo}: '{chave}' usa a sintaxe antiga de referência a segredo, removida dos " +
                $"componentes FUNCEF. {ComoMigrar}");

            // 'SecretName' é válido DENTRO de uma subseção '*FromKeyVault' e inválido fora dela —
            // solto, é a sintaxe C (nome cru, sem flag) de FuncefORM:Connection e SqlServer.
            var dentroDeSecretRef = caminho.Length >= 2 &&
                caminho[^2].EndsWith("FromKeyVault", StringComparison.OrdinalIgnoreCase);

            Assert.IsFalse(
                folha.Equals("SecretName", StringComparison.OrdinalIgnoreCase) && !dentroDeSecretRef,
                $"{arquivo}: '{chave}' declara o nome do segredo solto, sem a flag Enabled. {ComoMigrar}");
        }
    }

    [TestMethod]
    public void Config_AuthEntraId_NaoDeveTerValorDiretoAoLadoDoKeyName()
    {
        // O valor direto tem precedência em AddAuthSecretsFromKeyVault, mas o
        // AuthOptionsVaultPostConfigure da lib sobrescreve pelo cofre — os dois juntos deixariam
        // IConfiguration e IOptions<AuthOptions> divergentes no mesmo processo.
        var entraId = Carregar("appsettings.json").GetSection("Auth:EntraId");

        foreach (var chave in new[] { "TenantId", "ClientId", "Audience", "ClientSecret" })
        {
            Assert.IsTrue(
                string.IsNullOrEmpty(entraId[chave]),
                $"'Auth:EntraId:{chave}' não deve ter valor no appsettings — usar '{chave}FromKeyVault'.");
        }
    }

    [TestMethod]
    public void Config_Auth_DeveBindarNosTiposDeOptionsDaLib()
    {
        // Verificação de CONTRATO, não de texto: liga o appsettings.json real aos tipos de Options
        // publicados pela FUNCEF.Autenticacao. Uma chave escrita na sintaxe antiga passa no binding em
        // silêncio (a propriedade simplesmente não existe mais) e só falha em produção, como 401 em
        // tudo. Aqui ela falha no CI.
        var auth = new AuthOptions();
        Carregar("appsettings.json").GetSection("Auth").Bind(auth);

        Assert.IsNotNull(auth.EntraId, "A seção 'Auth:EntraId' deve bindar em EntraIdOptions.");

        Assert.IsTrue(auth.EntraId.TenantIdFromKeyVault.IsConfigured,
            "TenantIdFromKeyVault não bindou — verifique a forma canônica (Enabled + SecretName).");
        Assert.IsTrue(auth.EntraId.ClientIdFromKeyVault.IsConfigured, "ClientIdFromKeyVault não bindou.");
        Assert.IsTrue(auth.EntraId.AudienceFromKeyVault.IsConfigured, "AudienceFromKeyVault não bindou.");

        // Postura secretless do template: a credencial de client é federada (Managed Identity), e por
        // isso as referências a client secret / certificado ficam desligadas.
        Assert.AreEqual(EntraCredentialType.ManagedIdentity, auth.EntraId.CredentialType);
        Assert.IsFalse(auth.EntraId.ClientSecretFromKeyVault.Enabled,
            "O template é secretless por padrão: ligue o client secret apenas com CredentialType=ClientSecret.");
        Assert.IsFalse(auth.EntraId.ClientCertificateFromKeyVault.Enabled);

        // Nenhuma das duas pode estar 'Enabled sem SecretName' — seria fail-fast no startup.
        Assert.IsFalse(auth.EntraId.ClientSecretFromKeyVault.IsIncomplete);
        Assert.IsFalse(auth.EntraId.ClientCertificateFromKeyVault.IsIncomplete);

        Assert.IsNotNull(auth.RefreshToken, "A seção 'Auth:RefreshToken' deve bindar em RefreshTokenOptions.");
        Assert.IsTrue(auth.RefreshToken.SigningKeyFromKeyVault.IsConfigured,
            "SigningKeyFromKeyVault não bindou — sem ela o login conclui e a emissão do refresh token falha.");

        // A auditoria de acesso tem seção própria: AccessAuditOptions não pende de AuthOptions.
        var acessoAudit = new AccessAuditOptions();
        Carregar("appsettings.json").GetSection("Auth:Audit").Bind(acessoAudit);

        Assert.IsTrue(acessoAudit.ConnectionStringFromKeyVault.IsConfigured,
            "Auth:Audit:ConnectionStringFromKeyVault não bindou — a auditoria de acesso não persistiria.");
    }

    [TestMethod]
    public void Config_FuncefORM_DeveBindarNosTiposDeOptionsDaLib()
    {
        var configuration = Carregar("appsettings.json");

        var orm = new ORMOptions();
        configuration.GetSection("FuncefORM").Bind(orm);

        Assert.IsTrue(orm.Connection.ConnectionStringFromKeyVault.IsConfigured,
            "FuncefORM:Connection:ConnectionStringFromKeyVault não bindou — a API subiria sem banco.");

        // Auditoria de entidade tem seção própria (FuncefORM:Audit não é parte de ORMOptions).
        var audit = new AuditOptions();
        configuration.GetSection("FuncefORM:Audit").Bind(audit);

        Assert.IsTrue(audit.ConnectionStringFromKeyVault.IsConfigured,
            "FuncefORM:Audit:ConnectionStringFromKeyVault não bindou.");
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_ComPlaceholderNaUrlDoCofre_DeveFalharNoStartup()
    {
        // Vale em TODOS os ambientes e antes de qualquer chamada ao cofre: sem esta guarda o sintoma
        // seria uma falha de DNS embrulhada em "segredo não resolvido", apontando para as chaves do
        // Entra em vez de para a causa real.
        var configuration = new ConfigurationManager();
        configuration.AddInMemoryCollection(new Dictionary<string, string?>
        {
            ["KeyVault:Url"] = "https://altere-para-o-cofre-do-ambiente.vault.azure.net/",
        });

        var ex = Assert.ThrowsExactly<InvalidOperationException>(() => configuration.AddAuthSecretsFromKeyVault());

        StringAssert.Contains(ex.Message, "KeyVault:Url");
        StringAssert.Contains(ex.Message, "placeholder");
    }

    [TestMethod]
    [DataRow("Homologation")]
    [DataRow("Production")]
    public void AddConfigurationValidation_ComPlaceholderDoCofreForaDeDev_DeveFalharNoStartup(string ambiente)
    {
        // Cenário complementar ao do AddAuthSecretsFromKeyVault: todos os valores diretos preenchidos,
        // nenhuma referência ao cofre consultada — o placeholder passaria, e a primeira leitura de
        // segredo em runtime falharia em produção sem explicação.
        var configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(new Dictionary<string, string?>
            {
                ["KeyVault:Url"] = "https://altere-para-o-cofre-do-ambiente.vault.azure.net/",
                ["AllowedHosts"] = "api.funcef.com.br",
                ["Auth:Autorizacao:BaseUrl"] = "https://gap.funcef.com.br",
            })
            .Build();

        var ex = Assert.ThrowsExactly<InvalidOperationException>(
            () => new ServiceCollection().AddConfigurationValidation(configuration, ambiente));

        StringAssert.Contains(ex.Message, "KeyVault:Url");
        StringAssert.Contains(ex.Message, ambiente);
    }

    [TestMethod]
    public void AddConfigurationValidation_EmDevelopment_NaoDeveBarrarOPlaceholderDoCofre()
    {
        // Em Development o placeholder é barrado no AddAuthSecretsFromKeyVault (que roda antes e vale
        // em todos os ambientes); aqui não se repete a checagem, para não impedir execução local com
        // valores diretos.
        var configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(new Dictionary<string, string?>
            {
                ["KeyVault:Url"] = "https://altere-para-o-cofre-do-ambiente.vault.azure.net/",
            })
            .Build();

        new ServiceCollection().AddConfigurationValidation(configuration, "Development");
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_SemKeyVaultUrl_DeveSerNoOp()
    {
        var configuration = new ConfigurationManager();
        configuration.AddInMemoryCollection(new Dictionary<string, string?>
        {
            ["Auth:EntraId:TenantIdFromKeyVault:Enabled"] = "true",
            ["Auth:EntraId:TenantIdFromKeyVault:SecretName"] = "EntraIdTenantId",
        });

        var fontes = configuration.Sources.Count;

        // Sem KeyVault:Url não há cofre a consultar: não deve lançar (nem o fail-fast das chaves
        // obrigatórias) nem acrescentar fontes de configuração.
        configuration.AddAuthSecretsFromKeyVault();

        Assert.AreEqual(fontes, configuration.Sources.Count);
        Assert.IsNull(configuration["Auth:EntraId:TenantId"]);
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_ComTenantEClientJaResolvidos_DeveDerivarScopeETenantsM2M()
    {
        var configuration = ConfiguracaoSemAcessoAoCofre();

        configuration.AddAuthSecretsFromKeyVault();

        Assert.AreEqual(
            "openid profile email api://22222222-2222-2222-2222-222222222222/user_impersonation",
            configuration["Auth:EntraId:Scope"]);
        Assert.AreEqual(
            "11111111-1111-1111-1111-111111111111",
            configuration["Auth:M2M:AllowedTenantIds:0"]);
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_ComScopeETenantsDeclarados_NaoDeveSobrescrever()
    {
        var configuration = ConfiguracaoSemAcessoAoCofre(
            ("Auth:EntraId:Scope", "openid profile email api://outro/escopo_custom"),
            ("Auth:M2M:AllowedTenantIds:0", "33333333-3333-3333-3333-333333333333"));

        configuration.AddAuthSecretsFromKeyVault();

        Assert.AreEqual("openid profile email api://outro/escopo_custom", configuration["Auth:EntraId:Scope"]);
        Assert.AreEqual("33333333-3333-3333-3333-333333333333", configuration["Auth:M2M:AllowedTenantIds:0"]);
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_SemTenantIdNemReferencia_DeveFalharNoStartup()
    {
        var configuration = ConfiguracaoSemAcessoAoCofre();
        configuration.AddInMemoryCollection(new Dictionary<string, string?> { ["Auth:EntraId:TenantId"] = null });

        var ex = Assert.ThrowsExactly<InvalidOperationException>(() => configuration.AddAuthSecretsFromKeyVault());

        StringAssert.Contains(ex.Message, "Auth:EntraId:TenantId");
        StringAssert.Contains(ex.Message, "Auth:EntraId:TenantIdFromKeyVault");
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_ReferenciaHabilitadaSemSecretName_DeveFalharNoStartup()
    {
        // Pedir o cofre sem dizer qual segredo é erro de digitação, não ausência de configuração —
        // vale até para chave OPCIONAL (aqui, a auditoria). Degradar silenciosamente esconderia o erro
        // e a auditoria simplesmente nunca persistiria.
        var configuration = ConfiguracaoSemAcessoAoCofre(
            ("Auth:Audit:ConnectionStringFromKeyVault:Enabled", "true"));

        var ex = Assert.ThrowsExactly<InvalidOperationException>(() => configuration.AddAuthSecretsFromKeyVault());

        StringAssert.Contains(ex.Message, "Auth:Audit:ConnectionStringFromKeyVault:SecretName");
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_SemConnectionStringDoBanco_DeveFalharNoStartup()
    {
        // Sem banco a API sobe e falha a cada requisição. Falhar no startup é melhor do que degradar
        // silenciosamente.
        var configuration = ConfiguracaoSemAcessoAoCofre();
        configuration.AddInMemoryCollection(
            new Dictionary<string, string?> { ["FuncefORM:Connection:DirectConnectionString"] = null });

        var ex = Assert.ThrowsExactly<InvalidOperationException>(() => configuration.AddAuthSecretsFromKeyVault());

        StringAssert.Contains(ex.Message, "FuncefORM:Connection");
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_RefreshTokenDesabilitado_NaoDeveExigirChaveDeAssinatura()
    {
        var configuration = ConfiguracaoSemAcessoAoCofre(("Auth:RefreshToken:Enabled", "false"));

        configuration.AddAuthSecretsFromKeyVault();

        Assert.IsNull(configuration["Auth:RefreshToken:SigningKey"]);
    }

    [TestMethod]
    public void AddAuthSecretsFromKeyVault_RefreshTokenHabilitadoSemChave_DeveFalharNoStartup()
    {
        // RequiredWhen: a obrigatoriedade da chave de assinatura acompanha Auth:RefreshToken:Enabled.
        var configuration = ConfiguracaoSemAcessoAoCofre(("Auth:RefreshToken:Enabled", "true"));

        var ex = Assert.ThrowsExactly<InvalidOperationException>(() => configuration.AddAuthSecretsFromKeyVault());

        StringAssert.Contains(ex.Message, "Auth:RefreshToken:SigningKey");
    }
}
