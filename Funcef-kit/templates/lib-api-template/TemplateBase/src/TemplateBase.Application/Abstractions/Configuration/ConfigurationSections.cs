using Microsoft.Extensions.Configuration;

namespace TemplateBase.Application.Abstractions.Configuration;

/// <summary>
/// Fonte única dos nomes das seções de configuração e das condições que habilitam
/// os recursos opcionais da aplicação.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Por que isto existe na Application:</strong> a mesma condição é avaliada em mais de uma
/// camada. Exemplo: a seção <c>SqlServer</c> decide (na Infrastructure) se o
/// <c>SqlServerDbContext</c> é registrado e (na API) se o health check <c>sqlserver</c> entra no
/// probe <c>/health/ready</c>. Com a condição repetida em cada ponto por string literal, basta
/// renomear a seção em um lugar para o recurso ficar meio-registrado — o contexto sobe e o health
/// check não, ou vice-versa.
/// </para>
/// <para>
/// A Application é a camada mais interna que as duas alcançam (Infrastructure e API referenciam
/// Application), por isso o predicado vive aqui. A dependência é apenas
/// <c>Microsoft.Extensions.Configuration.Abstractions</c> — contrato, não infraestrutura: nada aqui
/// conhece Oracle, SQL Server, Redis ou Mongo, apenas o nome da seção que os habilita.
/// </para>
/// </remarks>
public static class ConfigurationSections
{
    /// <summary>Seção do Azure Key Vault (FUNCEF.Cofre). Sem ela, segredos vêm da configuração direta.</summary>
    public const string KeyVault = "KeyVault";

    /// <summary>Seção do provedor de banco principal (Oracle) — de propriedade do FUNCEF.ORM.</summary>
    public const string Oracle = "FuncefORM";

    /// <summary>Seção do banco secundário SQL Server (segundo provedor, opcional).</summary>
    public const string SqlServer = "SqlServer";

    /// <summary>Seção do cache distribuído Redis (FUNCEF.NoSql).</summary>
    public const string Redis = "NoSql:RedisCache";

    /// <summary>Seção do document store MongoDB (FUNCEF.NoSql).</summary>
    public const string MongoDocuments = "NoSql:MongoDocuments";

    /// <summary>Seção do Azure Storage (FUNCEF.Armazenamentos).</summary>
    public const string Storage = "Storage";

    /// <summary>Seção do cliente de autorização (PEP → PDP do GAP).</summary>
    public const string Autorizacao = "Auth:Autorizacao";

    /// <summary>Indica se o Azure Key Vault está configurado (<c>KeyVault:Url</c> preenchido).</summary>
    public static bool IsKeyVaultEnabled(IConfiguration configuration)
        => !string.IsNullOrEmpty(configuration[$"{KeyVault}:Url"]);

    /// <summary>Indica se o banco secundário SQL Server está habilitado.</summary>
    public static bool IsSqlServerEnabled(IConfiguration configuration)
        => configuration.GetSection(SqlServer).Exists();

    /// <summary>Indica se o cache Redis está habilitado.</summary>
    public static bool IsRedisEnabled(IConfiguration configuration)
        => configuration.GetSection(Redis).Exists();

    /// <summary>Indica se o document store MongoDB está habilitado.</summary>
    public static bool IsMongoDocumentsEnabled(IConfiguration configuration)
        => configuration.GetSection(MongoDocuments).Exists();

    /// <summary>Indica se o Azure Storage está habilitado.</summary>
    public static bool IsStorageEnabled(IConfiguration configuration)
        => configuration.GetSection(Storage).Exists();

    /// <summary>Indica se o cliente de autorização (PDP do GAP) está habilitado.</summary>
    public static bool IsAutorizacaoEnabled(IConfiguration configuration)
        => configuration.GetSection(Autorizacao).Exists();
}
