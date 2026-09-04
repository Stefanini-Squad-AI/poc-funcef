// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using FuncefEssenciais.Exceptions;
using TemplateBase.Application.Documents;
using TemplateBase.Application.Services;

namespace TemplateBase.Application.Queries.Ordem.GetHistorico;

/// <summary>
/// Handler responsável pela consulta do histórico de status de uma ordem no MongoDB
/// (<c>IDocumentStore&lt;OrdemHistoricoDocumento&gt;</c> do FUNCEF.NoSql).
/// </summary>
public class GetOrdemHistoricoHandler : IQueryHandler<GetOrdemHistoricoQuery, List<OrdemHistoricoDocumento>>
{
    private readonly IOrdemService _ordemService;
    private readonly IOrdemHistoricoService? _historicoService;

    /// <remarks>
    /// <paramref name="historicoService"/> é opcional: só é registrado no DI quando a seção
    /// <c>NoSql:MongoDocuments</c> está configurada (MongoDB disponível).
    /// </remarks>
    public GetOrdemHistoricoHandler(
        IOrdemService ordemService,
        IOrdemHistoricoService? historicoService = null)
    {
        _ordemService = ordemService;
        _historicoService = historicoService;
    }

    public async Task<List<OrdemHistoricoDocumento>> Handle(GetOrdemHistoricoQuery query, CancellationToken cancellationToken)
    {
        if (_historicoService == null)
        {
            throw new BusinessException(
                "Histórico de ordens não habilitado: configure a seção NoSql:MongoDocuments (MongoDB).",
                "HISTORICO_NAO_CONFIGURADO");
        }

        _ = await _ordemService.GetByIdAsync(query.OrdemId, cancellationToken)
            ?? throw NotFoundException.ForResource("Ordem", query.OrdemId);

        return await _historicoService.ListarPorOrdemAsync(query.OrdemId, cancellationToken);
    }
}
