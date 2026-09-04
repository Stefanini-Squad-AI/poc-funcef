using FuncefORM.Contracts;
using FuncefORM.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Infrastructure.Persistence.Context;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do banco <strong>PRINCIPAL: Oracle</strong> (FUNCEF.ORM) — EF Core + Dapper.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Papel no template.</strong> O Oracle é a base de registro do domínio: entidades de
/// negócio, transações e trilha de auditoria. Tudo que precisa de consistência transacional,
/// auditoria automática (<c>[Auditable]</c>) e conformidade com o PadraoBD FUNCEF vive aqui. É o
/// destino padrão de qualquer entidade nova — o SQL Server é a exceção justificada, não a
/// alternativa livre (ver <see cref="SqlServerRegistration"/>).
/// </para>
/// <para><strong>O que este módulo registra:</strong></para>
/// <list type="bullet">
///   <item><description><c>ORMOptions</c> a partir da seção <c>FuncefORM</c> (pool, resiliência, observabilidade)</description></item>
///   <item><description><see cref="AppDbContext"/> com os interceptors da lib (auditoria, telemetria, slow query)</description></item>
///   <item><description><c>IRepository&lt;T&gt;</c> e <c>IUnitOfWork</c> — o padrão de acesso a dados do domínio</description></item>
///   <item><description>Health check com as tags <c>ready</c> e <c>database</c></description></item>
///   <item><description>Em desenvolvimento: auto-migrations e seeders</description></item>
/// </list>
/// <para>
/// <strong>Por que existe o alias de <c>IUnitOfWork</c>.</strong> O FUNCEF.ORM registra
/// <c>IUnitOfWork&lt;AppDbContext&gt;</c> (tipado por contexto). Os services do domínio injetam o
/// <c>IUnitOfWork</c> não-genérico para não se acoplarem ao contexto concreto; o
/// <c>AddScoped</c> abaixo faz essa ponte. <strong>Consequência importante:</strong> o
/// <c>IUnitOfWork</c> sem tipo é, por definição deste registro, <em>sempre o do Oracle</em> — o
/// segundo provedor tem o seu próprio (<c>ISqlServerUnitOfWork</c>).
/// </para>
/// <para>
/// <strong>Requer segredos já registrados</strong> (<see cref="SecretsRegistration"/>): a connection
/// string vem de <c>FuncefORM:Connection:ConnectionStringFromKeyVault</c> (forma canônica
/// <c>SecretRef</c>: <c>Enabled</c> + <c>SecretName</c>) no Key Vault, com fallback para
/// <c>DirectConnectionString</c>.
/// </para>
/// </remarks>
internal static class OracleRegistration
{
    /// <summary>
    /// Registra o provedor Oracle, o contexto principal, o padrão repositório/UoW e o health check.
    /// </summary>
    /// <param name="services">Coleção de serviços do container de DI.</param>
    /// <param name="configuration">Configuração da aplicação (seção <c>FuncefORM</c>).</param>
    /// <param name="isDevelopment">
    /// Quando <c>true</c>, habilita auto-migrations e seeders via <c>AddFuncefORMDevelopment</c>.
    /// </param>
    internal static IServiceCollection AddOracle(
        this IServiceCollection services,
        IConfiguration configuration,
        bool isDevelopment)
    {
        services.AddFuncefORM(configuration);
        services.AddFuncefORMDbContext<AppDbContext>();

        // Alias do IUnitOfWork não-genérico → contexto Oracle. Ver <remarks>.
        services.AddScoped<IUnitOfWork>(provider => provider.GetRequiredService<IUnitOfWork<AppDbContext>>());

        if (isDevelopment)
        {
            services.AddFuncefORMDevelopment<AppDbContext>(typeof(OracleRegistration).Assembly);
        }

        // Readiness: conectividade real com o Oracle. Tags explícitas para o probe /health/ready
        // cobrir o banco — sem elas o probe subiria verde com o banco fora do ar.
        services.AddFuncefORMHealthCheck("funcef-orm", "ready", "database");

        return services;
    }
}
