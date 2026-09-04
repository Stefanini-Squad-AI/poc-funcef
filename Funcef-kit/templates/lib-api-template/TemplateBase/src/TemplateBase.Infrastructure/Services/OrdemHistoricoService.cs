// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefNoSql.Contracts;
using TemplateBase.Application.Documents;
using TemplateBase.Application.Services;

namespace TemplateBase.Infrastructure.Services;

/// <summary>
/// Implementação do histórico de status de ordens sobre o <see cref="IDocumentStore{T}"/>
/// do FUNCEF.NoSql (MongoDB).
/// </summary>
/// <remarks>
/// <para>
/// <strong>Por que vive na Infrastructure</strong> (e não na Application, ao lado de
/// <c>ClienteService</c>/<c>OrdemService</c>): depende de <see cref="IDocumentStore{T}"/>, um
/// contrato de <em>infraestrutura</em> do FUNCEF.NoSql. A regra do projeto é: service cujo único
/// vínculo externo são abstrações declaradas na Application (ou contratos de repositório) fica na
/// Application; service que depende de um cliente de infraestrutura concreto fica aqui.
/// </para>
/// <para>
/// Registrado no DI apenas quando a seção <c>NoSql:MongoDocuments</c> está configurada
/// (ver <c>DocumentsRegistration</c>).
/// </para>
/// </remarks>
public class OrdemHistoricoService : IOrdemHistoricoService
{
    private readonly IDocumentStore<OrdemHistoricoDocumento> _store;

    public OrdemHistoricoService(IDocumentStore<OrdemHistoricoDocumento> store)
    {
        _store = store;
    }

    /// <inheritdoc />
    public virtual Task RegistrarAsync(
        long ordemId,
        string? statusAnterior,
        string statusNovo,
        CancellationToken cancellationToken = default)
        => _store.CreateAsync(new OrdemHistoricoDocumento
        {
            OrdemId = ordemId,
            StatusAnterior = statusAnterior,
            StatusNovo = statusNovo,
            DataEvento = DateTime.UtcNow
        }, cancellationToken);

    /// <inheritdoc />
    public virtual Task<List<OrdemHistoricoDocumento>> ListarPorOrdemAsync(
        long ordemId,
        CancellationToken cancellationToken = default)
        => _store.FindAsync(new DocumentFilter
        {
            Equalities = new Dictionary<string, object> { ["OrdemId"] = ordemId },
            SortField = nameof(OrdemHistoricoDocumento.DataEvento),
            SortAscending = false
        }, cancellationToken);
}
