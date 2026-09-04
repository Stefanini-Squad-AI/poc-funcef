using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;
// ── EXEMPLO: using dos Services do domínio Cliente/Ordem — troque ao trocar o domínio ──
using TemplateBase.Application.Services;
// ── FIM EXEMPLO ──

namespace TemplateBase.Application.Stores;

/// <summary>
/// Registro dos services de negócio da camada Application.
/// </summary>
/// <remarks>
/// <para>
/// Ao contrário dos handlers (descobertos por convenção — ver <c>MediatorRegistration</c>), os
/// services são registrados <strong>manualmente por interface</strong>. É deliberado: o registro
/// explícito é a lista legível de quais capacidades de negócio a aplicação expõe, e permite
/// condicionar o registro à configuração disponível.
/// </para>
/// <para>
/// <strong>Services incondicionais × condicionais.</strong> Um service só pode ser registrado se as
/// dependências que ele exige existirem no container — senão a resolução explode no primeiro uso.
/// Os handlers que consomem services condicionais os declaram como dependência
/// <em>opcional</em> (parâmetro com <c>= null</c>) e lançam <c>BusinessException</c> com mensagem de
/// configuração quando ausentes. Por isso o registro condicional é <em>load-bearing</em>: registrar
/// um service que depende do SQL Server sem a seção <c>SqlServer</c> trocaria uma mensagem clara de
/// "não habilitado" por um <c>InvalidOperationException</c> de DI.
/// </para>
/// <para>
/// <strong>Onde ficam os demais services condicionais.</strong> A regra é: o registro acompanha a
/// <em>implementação</em>. <c>IOrdemHistoricoService</c> é implementado na Infrastructure (depende do
/// <c>IDocumentStore&lt;T&gt;</c> do FUNCEF.NoSql), então é registrado lá, em
/// <c>DocumentsRegistration</c> — a Application não pode referenciar a Infrastructure sem inverter a
/// regra de dependência da Clean Architecture. Ambos os pontos avaliam a <em>mesma</em> condição via
/// <see cref="ConfigurationSections"/>, que é a fonte única dessas decisões.
/// </para>
/// </remarks>
internal static class DomainServicesRegistration
{
    /// <summary>
    /// Registra os services de negócio da Application.
    /// </summary>
    /// <param name="services">Coleção de serviços do container de DI.</param>
    /// <param name="configuration">
    /// Configuração da aplicação, usada para condicionar os services que dependem de recursos
    /// opcionais de infraestrutura.
    /// </param>
    internal static IServiceCollection AddDomainServices(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        // ── EXEMPLO: services Cliente/Ordem — substitua pelo seu domínio ──
        // Incondicionais: dependem de IRepository<T>/IUnitOfWork (FUNCEF.ORM/Oracle), sempre registrados.
        services.AddScoped<IClienteService, ClienteService>();
        services.AddScoped<IOrdemService, OrdemService>();
        // ── FIM EXEMPLO ──

        // Service condicional (banco secundário SQL Server): depende de ISqlServerRepository<T>/
        // ISqlServerUnitOfWork, registrados pela Infrastructure (SqlServerRegistration) somente
        // quando a seção SqlServer existe. Padrão:
        //   if (ConfigurationSections.IsSqlServerEnabled(configuration))
        //   {
        //       services.AddScoped<IMeuServiceSqlServer, MeuServiceSqlServer>();
        //   }
        // O handler que consome um service condicional o declara como dependência OPCIONAL
        // (parâmetro `= null`) e lança BusinessException de configuração quando ausente.
        _ = configuration;

        return services;
    }
}
