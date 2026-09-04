using FuncefNoSql.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application.Abstractions.Configuration;
// ── EXEMPLO: documento e service do histórico de ordens — troque ao trocar o domínio ──
using TemplateBase.Application.Documents;
using TemplateBase.Application.Services;
using TemplateBase.Infrastructure.Persistence.Documents;
using TemplateBase.Infrastructure.Services;
// ── FIM EXEMPLO ──

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do <strong>document store MongoDB</strong> (FUNCEF.NoSql) — dados sem forma relacional.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Papel no template.</strong> Terceira base, ao lado do Oracle (registro do domínio) e do
/// SQL Server (interoperabilidade). Destina-se a dados append-only, sem participação em transação
/// relacional e sem esquema rígido — no domínio de exemplo, o histórico de status de ordens.
/// </para>
/// <para>
/// <strong>Nota histórica:</strong> até a v3 dos componentes, a auditoria (de entidades e de acesso)
/// persistia no MongoDB. A partir da v4 ambas gravam no <em>Oracle Lakehouse</em>
/// (ver <see cref="AuditRegistration"/>) — o Mongo deixou de ser requisito de auditoria e passou a ser
/// exclusivamente um document store de aplicação.
/// </para>
/// <para>
/// <strong>Registra também o service condicional <c>IOrdemHistoricoService</c>.</strong> A
/// implementação depende de <c>IDocumentStore&lt;T&gt;</c> e por isso vive nesta camada — logo o
/// registro acompanha a implementação. A Application não pode fazê-lo sem referenciar a
/// Infrastructure (ver <c>TemplateBase.Application.DependencyInjection</c>). O handler que o consome
/// declara a dependência como <em>opcional</em> e responde com <c>BusinessException</c> de
/// configuração quando o Mongo não está habilitado.
/// </para>
/// <para>No-op quando <c>NoSql:MongoDocuments</c> não existe.</para>
/// </remarks>
internal static class DocumentsRegistration
{
    internal static IServiceCollection AddDocuments(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        if (!ConfigurationSections.IsMongoDocumentsEnabled(configuration))
        {
            return services;
        }

        // ── EXEMPLO: histórico de ordens — substitua pelos seus documentos ──
        // O mapeamento Bson precede o AddMongoDocuments: o driver constrói o serializador do tipo
        // no primeiro uso e ignora class maps registrados depois.
        OrdemHistoricoDocumentoMapping.Register();

        services.AddMongoDocuments<OrdemHistoricoDocumento>(
            configuration,
            collectionName: "ordens_historico");

        services.AddScoped<IOrdemHistoricoService, OrdemHistoricoService>();
        // ── FIM EXEMPLO ──

        return services;
    }
}
