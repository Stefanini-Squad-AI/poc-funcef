// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using TemplateBase.Application.Documents;

namespace TemplateBase.Application.Services;

/// <summary>
/// Serviço de histórico de status de ordens, persistido em MongoDB
/// via <c>IDocumentStore&lt;OrdemHistoricoDocumento&gt;</c> (FUNCEF.NoSql).
/// </summary>
public interface IOrdemHistoricoService
{
    /// <summary>
    /// Registra um evento de mudança de status (ou de criação, com <paramref name="statusAnterior"/> nulo).
    /// </summary>
    Task RegistrarAsync(long ordemId, string? statusAnterior, string statusNovo, CancellationToken cancellationToken = default);

    /// <summary>
    /// Lista os eventos de uma ordem, do mais recente para o mais antigo.
    /// </summary>
    Task<List<OrdemHistoricoDocumento>> ListarPorOrdemAsync(long ordemId, CancellationToken cancellationToken = default);
}
