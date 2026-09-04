using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Stores;

namespace TemplateBase.Application;

/// <summary>
/// Orquestrador de injeção de dependência da camada <strong>Application</strong>.
/// </summary>
/// <remarks>
/// <para>
/// Ponto de entrada único da camada, chamado uma vez pelo <c>Program.cs</c>. Não registra nada
/// diretamente: delega para os módulos de <c>Stores/</c>, cada um responsável por uma preocupação.
/// </para>
/// <list type="table">
///   <listheader>
///     <term>Módulo</term>
///     <description>Responsabilidade</description>
///   </listheader>
///   <item>
///     <term><c>MediatorRegistration</c></term>
///     <description>Mediator CQRS — commands, queries, handlers, validators e behaviors (por convenção)</description>
///   </item>
///   <item>
///     <term><c>DomainServicesRegistration</c></term>
///     <description>Services de negócio (registro manual por interface)</description>
///   </item>
/// </list>
/// <para>
/// <strong>Ordem:</strong> irrelevante aqui — os dois módulos registram tipos independentes e nenhum
/// resolve serviços durante o registro. Diferente da Infrastructure, onde a ordem é load-bearing
/// (ver <c>TemplateBase.Infrastructure.DependencyInjection</c>).
/// </para>
/// <para>
/// <strong>O que esta camada NÃO registra:</strong> <c>IOrdemHistoricoService</c>. A implementação
/// depende do <c>IDocumentStore&lt;T&gt;</c> (FUNCEF.NoSql) e por isso vive na Infrastructure, que é
/// quem a registra (<c>DocumentsRegistration</c>) quando <c>NoSql:MongoDocuments</c> está
/// configurado. A Application não pode referenciar a Infrastructure — a regra de dependência da
/// Clean Architecture aponta para dentro.
/// </para>
/// </remarks>
public static class DependencyInjection
{
    /// <summary>
    /// Adiciona os serviços da camada Application ao container de DI.
    /// </summary>
    /// <param name="services">Coleção de serviços do container de DI.</param>
    /// <param name="configuration">
    /// Configuração da aplicação. Necessária porque parte dos services é registrada apenas quando o
    /// recurso de infraestrutura correspondente está configurado — ver <c>DomainServicesRegistration</c>.
    /// </param>
    /// <returns>A mesma instância de <see cref="IServiceCollection"/> para encadeamento.</returns>
    public static IServiceCollection AddApplication(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddMediator();
        services.AddDomainServices(configuration);

        return services;
    }
}
