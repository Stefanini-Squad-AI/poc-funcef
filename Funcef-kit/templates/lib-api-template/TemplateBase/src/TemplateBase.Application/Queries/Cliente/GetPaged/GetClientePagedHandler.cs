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
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Queries.Cliente.GetPaged;

/// <summary>
/// Handler responsável pela listagem paginada de clientes.
/// </summary>
public class GetClientePagedHandler : IQueryHandler<GetClientePagedQuery, PaginatedResult<ClienteResume>>
{
    private readonly IClienteService _service;

    public GetClientePagedHandler(IClienteService service)
    {
        _service = service;
    }

    public async Task<PaginatedResult<ClienteResume>> Handle(
        GetClientePagedQuery query,
        CancellationToken cancellationToken)
    {
        var sortDirection = query.DirecaoOrdenacao?.ToLowerInvariant() == "desc"
            ? SortDirection.Descending
            : SortDirection.Ascending;

        var pagedRequest = PagedRequest.Create(
            query.Pagina,
            query.TamanhoPagina,
            query.OrdenarPor ?? "Nome",
            sortDirection);

        System.Linq.Expressions.Expression<Func<Domain.Entities.Cliente, bool>>? predicate = null;

        if (!string.IsNullOrEmpty(query.TermoBusca))
        {
            var termoBusca = query.TermoBusca.ToLowerInvariant();
            predicate = c => c.Nome.ToLower().Contains(termoBusca) ||
                            (c.Email != null && c.Email.ToLower().Contains(termoBusca));
        }

        var pagedResult = await _service.GetPagedAsync(pagedRequest, predicate, cancellationToken);

        var dtos = pagedResult.Items.MapToList<Domain.Entities.Cliente, ClienteResume>();

        return new PaginatedResult<ClienteResume>
        {
            Items = dtos,
            Page = pagedResult.Page,
            PageSize = pagedResult.PageSize,
            TotalItems = pagedResult.TotalItems,
            TotalPages = pagedResult.TotalPages
        };
    }
}
