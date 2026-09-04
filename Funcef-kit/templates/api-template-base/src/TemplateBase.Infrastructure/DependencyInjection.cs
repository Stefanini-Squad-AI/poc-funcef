using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Infrastructure.Stores;

namespace TemplateBase.Infrastructure;

/// <summary>
/// Orquestrador de injeção de dependência da camada <strong>Infrastructure</strong>.
/// </summary>
/// <remarks>
/// <para>
/// Ponto de entrada único da camada. Não registra nada diretamente: define a <strong>ordem</strong> em
/// que os módulos de <c>Stores/</c> entram no container. A ordem é a razão de este arquivo existir —
/// vários módulos consomem, em tempo de registro, serviços registrados por módulos anteriores.
/// </para>
/// <para><strong>Cadeia de registro e por que cada posição importa:</strong></para>
/// <list type="number">
///   <item><description>
///     <strong>Secrets</strong> (Key Vault) — origem das connection strings e chaves de quase todos os
///     módulos seguintes. Registrar depois faz os outros caírem em fallback silencioso.
///   </description></item>
///   <item><description>
///     <strong>Telemetry</strong> — registra <c>ITelemetry</c>, consumido pelos módulos seguintes para
///     log, métricas e tracing.
///   </description></item>
///   <item><description>
///     <strong>Oracle</strong> (banco principal) — <c>AppDbContext</c>, <c>IRepository&lt;T&gt;</c>,
///     <c>IUnitOfWork</c> e health check <c>ready</c>.
///   </description></item>
///   <item><description>
///     <strong>SqlServer</strong> (banco secundário, opcional) — contexto, repositório e UoW próprios.
///   </description></item>
///   <item><description>
///     <strong>Cache</strong> (Redis) — <strong>obrigatoriamente antes de Authentication</strong>: com
///     <c>Auth:RefreshToken:StorageType = Redis</c>, o store de refresh tokens reaproveita o
///     <c>ICacheStore</c> daqui. Invertido, cai em memória sem erro — e os tokens deixam de ser
///     compartilhados entre réplicas.
///   </description></item>
///   <item><description>
///     <strong>Documents</strong> (MongoDB, opcional) — document store e o service condicional
///     <c>IOrdemHistoricoService</c>.
///   </description></item>
///   <item><description>
///     <strong>EntityAuditing</strong> — interceptor de <c>SaveChanges</c>; exige o
///     <c>AppDbContext</c> do passo 3.
///   </description></item>
///   <item><description>
///     <strong>Authentication</strong> — Entra ID, refresh tokens e cliente do PDP; exige o cache do
///     passo 5.
///   </description></item>
///   <item><description>
///     <strong>AccessAuditing</strong> — trilha de acesso; complementa a autenticação do passo 8 e
///     precisa vir depois dela.
///   </description></item>
///   <item><description>
///     <strong>FileStorage</strong> (Azure Storage, opcional) — resolve a URI da conta via Key Vault.
///   </description></item>
///   <item><description>
///     <strong>Mapping</strong> — object mapper; sem dependência de ordem, fecha a cadeia.
///   </description></item>
/// </list>
/// <para>
/// <strong>Módulos opcionais</strong> (SqlServer, Cache, Documents, FileStorage) são <em>no-op</em>
/// quando a seção de configuração correspondente não existe. A condição de cada um vem de
/// <c>ConfigurationSections</c> (na Application), fonte única compartilhada com a API — que usa a
/// mesma condição para decidir quais health checks entram no probe <c>/health/ready</c>.
/// </para>
/// <para><strong>Bases de dados e seus papéis:</strong></para>
/// <list type="table">
///   <listheader><term>Base</term><description>Papel</description></listheader>
///   <item><term>Oracle</term><description>
///     Registro do domínio — entidades de negócio, transações, auditoria. Destino padrão de qualquer
///     entidade nova. Obrigatório.
///   </description></item>
///   <item><term>SQL Server</term><description>
///     Interoperabilidade — dados que não pertencem ao Oracle (integração, legado de terceiros).
///     Opcional, sem transação distribuída com o Oracle.
///   </description></item>
///   <item><term>MongoDB</term><description>
///     Documentos — append-only, sem esquema rígido, fora de transação relacional. Opcional.
///   </description></item>
///   <item><term>Redis</term><description>
///     Cache distribuído e backing store de refresh tokens. Opcional, mas recomendado em produção.
///   </description></item>
/// </list>
/// </remarks>
public static class DependencyInjection
{
    /// <summary>
    /// Adiciona os serviços de infraestrutura para <strong>produção</strong> e <strong>homologação</strong>.
    /// </summary>
    /// <param name="services">Coleção de serviços do container de DI.</param>
    /// <param name="configuration">Configuração da aplicação.</param>
    /// <returns>A coleção de serviços para encadeamento fluente.</returns>
    public static IServiceCollection AddInfrastructure(
        this IServiceCollection services,
        IConfiguration configuration)
        => AddInfrastructure(services, configuration, isDevelopment: false);

    /// <summary>
    /// Adiciona os serviços de infraestrutura para <strong>desenvolvimento</strong>.
    /// </summary>
    /// <remarks>
    /// <para>Diferenças em relação a <see cref="AddInfrastructure(IServiceCollection, IConfiguration)"/>:</para>
    /// <list type="bullet">
    ///   <item><description>
    ///     <strong>Auto-migrations e seeders</strong> no Oracle, via <c>AddFuncefORMDevelopment</c>.
    ///   </description></item>
    ///   <item><description>
    ///     <strong>Connection strings diretas</strong> são aceitas (sem Key Vault) quando configuradas
    ///     em <c>FuncefORM:Connection:DirectConnectionString</c> / <c>SqlServer:DirectConnectionString</c>.
    ///   </description></item>
    /// </list>
    /// </remarks>
    /// <param name="services">Coleção de serviços do container de DI.</param>
    /// <param name="configuration">Configuração da aplicação.</param>
    /// <returns>A coleção de serviços para encadeamento fluente.</returns>
    public static IServiceCollection AddInfrastructureDevelopment(
        this IServiceCollection services,
        IConfiguration configuration)
        => AddInfrastructure(services, configuration, isDevelopment: true);

    /// <summary>
    /// Cadeia de registro compartilhada entre os ambientes. A ordem é load-bearing — ver
    /// <c>remarks</c> da classe antes de reordenar.
    /// </summary>
    private static IServiceCollection AddInfrastructure(
        IServiceCollection services,
        IConfiguration configuration,
        bool isDevelopment)
    {
        // 1. Segredos — precede tudo que resolve connection string ou chave.
        services.AddSecrets(configuration);

        // 2. Telemetria — ITelemetry para os módulos seguintes.
        services.AddTelemetry(configuration);

        // 3. Banco PRINCIPAL: Oracle.
        services.AddOracle(configuration, isDevelopment);

        // 4. Banco SECUNDÁRIO: SQL Server (opcional).
        services.AddSqlServer(configuration);

        // 5. Cache Redis — ANTES da autenticação (refresh tokens reaproveitam o ICacheStore).
        services.AddCache(configuration);

        // 6. Documentos MongoDB (opcional).
        services.AddDocuments(configuration);

        // 7. Auditoria de entidades — exige o AppDbContext do passo 3.
        services.AddEntityAuditing(configuration);

        // 8. Autenticação e autorização — exige o cache do passo 5. Em Development, troca a credencial
        //    de client pela DeveloperUserCredential (secretless na estação).
        services.AddAuthentication(configuration, isDevelopment);

        // 9. Auditoria de acesso — DEPOIS da autenticação do passo 8.
        services.AddAccessAuditing(configuration);

        // 10. Azure Storage (opcional).
        services.AddFileStorage(configuration);

        // 11. Object mapper — fecha a cadeia, sem dependência de ordem.
        services.AddMapping();

        return services;
    }
}
