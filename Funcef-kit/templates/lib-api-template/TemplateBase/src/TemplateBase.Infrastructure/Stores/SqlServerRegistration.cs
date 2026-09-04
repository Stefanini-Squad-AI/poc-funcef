using Funcef.Abstractions.Secrets;
using Funcef.Abstractions.Telemetry;
using FuncefCofre.Contracts;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;
using TemplateBase.Application.Abstractions.Persistence;
using TemplateBase.Infrastructure.Persistence.Context;
using TemplateBase.Infrastructure.Persistence.SqlServer;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do banco <strong>SECUNDÁRIO: SQL Server</strong> — segundo provedor, opcional.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Papel no template.</strong> Existe para os casos em que os dados <em>não pertencem</em> ao
/// Oracle: integração com sistemas que já publicam em SQL Server, bases legadas de terceiros e
/// espelhos de interoperabilidade. Não é uma segunda opção para o domínio — entidade de negócio nova
/// vai para o Oracle (ver <see cref="OracleRegistration"/>).
/// </para>
/// <para>
/// <strong>Isto não é código de exemplo.</strong> A infraestrutura deste módulo (contexto,
/// repositório, unidade de trabalho, health check, resolução de connection string) é capacidade
/// permanente do template: é o padrão a seguir para adicionar qualquer segundo provedor relacional.
/// Para usá-la: declare a entidade no <c>SqlServerDbContext</c>, crie o service sobre
/// <c>ISqlServerRepository&lt;T&gt;</c>/<c>ISqlServerUnitOfWork</c> e registre-o condicionado a
/// <c>ConfigurationSections.IsSqlServerEnabled</c> (ver <c>DomainServicesRegistration</c>).
/// </para>
/// <para><strong>Por que um registro local em vez de <c>AddFuncefORMDbContext</c>:</strong> na linha
/// 3.x do FUNCEF.ORM existe um único <c>ORMOptions</c>/<c>ProviderType</c> por aplicação, e o
/// provedor principal desta API é Oracle. Este módulo replica o padrão da lib (segredo no Key Vault
/// com fallback direto, timeout, retry) para o segundo contexto.
/// </para>
/// <para><strong>Paridade com o Oracle</strong> — o que este módulo registra:</para>
/// <list type="table">
///   <listheader><term>Capacidade</term><description>Oracle × SQL Server</description></listheader>
///   <item><term>Contexto</term><description><c>AppDbContext</c> × <see cref="SqlServerDbContext"/></description></item>
///   <item><term>Repositório</term><description><c>IRepository&lt;T&gt;</c> × <see cref="ISqlServerRepository{T}"/></description></item>
///   <item><term>Unidade de trabalho</term><description><c>IUnitOfWork</c> × <see cref="ISqlServerUnitOfWork"/></description></item>
///   <item><term>Health check</term><description><c>funcef-orm</c> × <c>sqlserver</c> (ambos com tag <c>ready</c>)</description></item>
///   <item><term>Migrations/seeders</term><description>auto em dev × scripts em <c>scripts/banco-dados/sqlserver</c></description></item>
/// </list>
/// <para>
/// <strong>Sem transação distribuída.</strong> As duas bases são recursos transacionais
/// independentes: <c>IUnitOfWork</c> (Oracle) e <see cref="ISqlServerUnitOfWork"/> commitam
/// separadamente. Operação que precise alterar as duas de forma consistente exige consistência
/// eventual (outbox + reprocessamento) — ver <c>docs/ARQUITETURA.md</c> §13.
/// </para>
/// <para>Seção de configuração <c>SqlServer</c>:</para>
/// <code>
/// "SqlServer": {
///   "ConnectionStringFromKeyVault": {        // forma canônica SecretRef, igual à das libs FUNCEF
///     "Enabled": true,
///     "SecretName": "SQLConnection"
///   },
///   "DirectConnectionString": "",           // fallback para desenvolvimento local
///   "CommandTimeout": 30,
///   "MaxRetryCount": 3
/// }
/// </code>
/// <para>No-op quando a seção não existe: nenhum registro, e o health check não entra no probe.</para>
/// </remarks>
internal static class SqlServerRegistration
{
    /// <summary>
    /// Registra o contexto, o repositório e a unidade de trabalho do SQL Server quando a seção
    /// <c>SqlServer</c> está configurada. No-op caso contrário.
    /// </summary>
    internal static IServiceCollection AddSqlServer(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        if (!ConfigurationSections.IsSqlServerEnabled(configuration))
        {
            return services;
        }

        var section = configuration.GetSection(ConfigurationSections.SqlServer);

        services.AddDbContext<SqlServerDbContext>((provider, optionsBuilder) =>
        {
            var connectionString = ResolveConnectionString(provider, section);

            optionsBuilder.UseSqlServer(connectionString, sqlOptions =>
            {
                sqlOptions.CommandTimeout(section.GetValue("CommandTimeout", 30));
                sqlOptions.EnableRetryOnFailure(section.GetValue("MaxRetryCount", 3));
            });
        });

        // Padrão de acesso a dados simétrico ao do Oracle: nenhum service toca DbContext direto.
        services.AddScoped(typeof(ISqlServerRepository<>), typeof(SqlServerRepository<>));
        services.AddScoped<ISqlServerUnitOfWork, SqlServerUnitOfWork>();

        return services;
    }

    /// <summary>
    /// Resolve a connection string: segredo do Key Vault (<c>ConnectionStringFromKeyVault</c>, forma
    /// canônica <see cref="SecretRef"/>) com fallback para <c>DirectConnectionString</c> — o mesmo
    /// padrão, e agora também a mesma sintaxe, que o FUNCEF.ORM aplica ao Oracle.
    /// </summary>
    /// <remarks>
    /// <para>
    /// <strong>Por que aqui e não no <c>VaultBootstrap</c>:</strong> este é o caminho de
    /// <em>runtime</em>. A resolução acontece na criação do contexto, usando o <c>IVaultService</c>
    /// definitivo do container (com cache e circuit breaker) — não há necessidade de um provider de
    /// bootstrap isolado, que existe apenas para o que precisa do segredo <em>antes</em> de haver
    /// container (telemetria e segredos injetados no <c>IConfiguration</c>).
    /// </para>
    /// <para>
    /// Falha na leitura do segredo não é fatal: cai no fallback direto. Só lança quando <em>nenhuma</em>
    /// das duas fontes tem valor — aí é erro de configuração, e falhar alto é melhor que subir com um
    /// contexto que estoura na primeira query.
    /// </para>
    /// </remarks>
    private static string ResolveConnectionString(IServiceProvider provider, IConfigurationSection section)
    {
        var secretRef = section.GetSection("ConnectionStringFromKeyVault").Get<SecretRef>() ?? new SecretRef();

        // Cofre pedido sem nome de segredo derruba o startup com a mensagem canônica, em vez de cair
        // no fallback direto e mascarar o erro de digitação no appsettings.
        secretRef.ValidateConfigured(
            $"{ConfigurationSections.SqlServer}:ConnectionStringFromKeyVault",
            $"{ConfigurationSections.SqlServer}:DirectConnectionString");

        var secretName = secretRef.IsConfigured ? secretRef.SecretName : null;
        string? connectionString = null;

        if (!string.IsNullOrEmpty(secretName))
        {
            try
            {
                connectionString = provider.GetService<IVaultService>()?.GetSecret(secretName);
            }
            catch (Exception ex)
            {
                provider.GetService<ITelemetry>()?.LogWarning(
                    "SqlServer: erro ao obter o segredo no Key Vault, tentando DirectConnectionString",
                    new Dictionary<string, object?>
                    {
                        ["secretName"] = secretName,
                        ["errorType"] = ex.GetType().Name
                    });
            }
        }

        connectionString = string.IsNullOrEmpty(connectionString)
            ? section["DirectConnectionString"]
            : connectionString;

        if (string.IsNullOrEmpty(connectionString))
        {
            throw new InvalidOperationException(
                "SqlServer: connection string não configurada. Defina " +
                "SqlServer:ConnectionStringFromKeyVault (Enabled + SecretName) ou " +
                "SqlServer:DirectConnectionString.");
        }

        return connectionString;
    }
}
