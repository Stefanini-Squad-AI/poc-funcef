// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using FuncefEssenciais.Exceptions;
using Funcef.Abstractions.Pagination;
using FuncefORM.Data;
using FuncefORM.Mapping.Extensions;
using TemplateBase.Application.DTOs.OrdemDto.Resume;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Queries.Ordem.GetByCliente;

/// <summary>
/// Handler responsável pela listagem paginada de ordens de um cliente específico.
/// </summary>
public class GetOrdensByClienteHandler : IQueryHandler<GetOrdensByClienteQuery, PaginatedResult<OrdemResume>>
{
    private readonly IOrdemService _ordemService;
    private readonly IClienteService _clienteService;

    public GetOrdensByClienteHandler(IOrdemService ordemService, IClienteService clienteService)
    {
        _ordemService = ordemService;
        _clienteService = clienteService;
    }

    public async Task<PaginatedResult<OrdemResume>> Handle(
        GetOrdensByClienteQuery query,
        CancellationToken cancellationToken)
    {
        var clienteExiste = await _clienteService.ExistsAsync(
            c => c.Id == query.ClienteId, cancellationToken);

        if (!clienteExiste)
            throw NotFoundException.ForResource("Cliente", query.ClienteId);

        var pagedRequest = PagedRequest.Create(
            query.Pagina,
            query.TamanhoPagina,
            "DataPedido",
            SortDirection.Descending);

        var pagedResult = await _ordemService.GetPagedAsync(
            pagedRequest,
            o => o.ClienteId == query.ClienteId &&
                 (string.IsNullOrEmpty(query.Status) || o.Status == query.Status),
            cancellationToken);

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
