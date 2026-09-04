// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using FuncefEssenciais.Exceptions;
using FuncefORM.Mapping.Extensions;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Queries.Cliente.GetById;

/// <summary>
/// Handler responsável pela consulta de um cliente por ID.
/// </summary>
public class GetClienteByIdHandler : IQueryHandler<GetClienteByIdQuery, ClienteResponse>
{
    private readonly IClienteService _service;

    public GetClienteByIdHandler(IClienteService service)
    {
        _service = service;
    }

    public async Task<ClienteResponse> Handle(GetClienteByIdQuery query, CancellationToken cancellationToken)
    {
        var cliente = query.IncluirOrdens
            ? await _service.GetByIdWithAutoIncludesAsync(query.Id, cancellationToken)
            : await _service.GetByIdAsync(query.Id, cancellationToken);

        if (cliente is null)
            throw NotFoundException.ForResource("Cliente", query.Id);

        return cliente.MapTo<Domain.Entities.Cliente, ClienteResponse>();
    }
}
