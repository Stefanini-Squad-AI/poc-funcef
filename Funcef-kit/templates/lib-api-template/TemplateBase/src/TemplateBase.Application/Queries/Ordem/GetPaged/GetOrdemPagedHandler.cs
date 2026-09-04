// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using Funcef.Abstractions.Pagination;
using FuncefORM.Data;
using FuncefORM.Mapping.Extensions;
using TemplateBase.Application.DTOs.OrdemDto.Resume;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Queries.Ordem.GetPaged;

/// <summary>
/// Handler responsável pela listagem paginada de ordens.
/// </summary>
public class GetOrdemPagedHandler : IQueryHandler<GetOrdemPagedQuery, PaginatedResult<OrdemResume>>
{
    private readonly IOrdemService _service;

    public GetOrdemPagedHandler(IOrdemService service)
    {
        _service = service;
    }

    public async Task<PaginatedResult<OrdemResume>> Handle(
        GetOrdemPagedQuery query,
        CancellationToken cancellationToken)
    {
        var sortDirection = query.DirecaoOrdenacao?.ToLowerInvariant() == "asc"
            ? SortDirection.Ascending
            : SortDirection.Descending;

        var pagedRequest = PagedRequest.Create(
            query.Pagina,
            query.TamanhoPagina,
            query.OrdenarPor ?? "DataPedido",
            sortDirection);

        System.Linq.Expressions.Expression<Func<Domain.Entities.Ordem, bool>>? predicate = null;

        if (!string.IsNullOrEmpty(query.Status) ||
            query.DataInicio.HasValue ||
            query.DataFim.HasValue ||
            query.ClienteId.HasValue)
        {
            predicate = o =>
                (string.IsNullOrEmpty(query.Status) || o.Status == query.Status) &&
                (!query.DataInicio.HasValue || o.DataPedido >= query.DataInicio.Value) &&
                (!query.DataFim.HasValue || o.DataPedido <= query.DataFim.Value) &&
                (!query.ClienteId.HasValue || o.ClienteId == query.ClienteId.Value);
        }

        var pagedResult = await _service.GetPagedAsync(pagedRequest, predicate, cancellationToken);

        var dtos = pagedResult.Items.MapToList<Domain.Entities.Ordem, OrdemResume>();

        return new PaginatedResult<OrdemResume>
        {
            Items = dtos,
            Page = pagedResult.Page,
            PageSize = pagedResult.PageSize,
            TotalItems = pagedResult.TotalItems,
            TotalPages = pagedResult.TotalPages
        };
    }
}
