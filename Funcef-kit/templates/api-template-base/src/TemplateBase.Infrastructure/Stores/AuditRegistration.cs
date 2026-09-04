using FuncefAutenticacao.AccessAudit.Extensions;
using FuncefORM.Audit.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro da <strong>auditoria</strong> — de entidades (FUNCEF.ORM.Audit) e de acesso
/// (FUNCEF.Autenticacao.AccessAudit).
/// </summary>
/// <remarks>
/// <para>
/// As duas auditorias persistem no <strong>Oracle Lakehouse</strong> e compartilham o mesmo segredo de
/// conexão (<c>AuditOracle</c>), mas são registradas em <strong>momentos diferentes</strong> da cadeia
/// — daí os dois métodos deste módulo em vez de um só:
/// </para>
/// <list type="bullet">
///   <item><description>
///     <see cref="AddEntityAuditing"/> vem <em>depois</em> de <see cref="OracleRegistration"/>: é um
///     interceptor de <c>SaveChanges</c> sobre o <c>AppDbContext</c>, que precisa já existir.
///   </description></item>
///   <item><description>
///     <see cref="AddAccessAuditing"/> vem <em>depois</em> de <see cref="AuthenticationRegistration"/>:
///     complementa a configuração de autenticação com a trilha de acesso, e inverter a ordem faz o
///     registro da autenticação sobrescrever opções da auditoria.
///   </description></item>
/// </list>
/// <para>
/// <strong>As connection strings de auditoria são injetadas no <c>IConfiguration</c></strong> pelo
/// <c>AddAuthSecretsFromKeyVault</c>, antes de qualquer registro. Motivo: a auditoria de entidades
/// resolve a conexão em um <em>singleton</em> que buscaria o <c>IVaultService</c> (scoped) no provider
/// raiz — o que lança sob validação de escopo, e a exceção é engolida pelo background service da
/// auditoria. O sintoma seria auditoria que nunca persiste, sem erro visível. Com a connection string
/// direta na configuração, o componente usa o caminho direto e não resolve o cofre em runtime.
/// </para>
/// <para>
/// Não há condicional aqui: ambos os componentes leem a própria flag <c>Enabled</c> das respectivas
/// seções (<c>FuncefORM:Audit</c> e <c>Auth:Audit</c>).
/// </para>
/// </remarks>
internal static class AuditRegistration
{
    /// <summary>
    /// Auditoria automática de entidades — interceptor de <c>SaveChanges</c> no contexto Oracle.
    /// Registrar após <see cref="OracleRegistration"/>.
    /// </summary>
    internal static IServiceCollection AddEntityAuditing(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddFuncefOrmAudit(configuration);

        return services;
    }

    /// <summary>
    /// Auditoria de acesso — trilha de login/logout e de requisições autenticadas.
    /// Registrar após <see cref="AuthenticationRegistration"/>.
    /// </summary>
    internal static IServiceCollection AddAccessAuditing(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddAccessAudit(configuration);

        return services;
    }
}
