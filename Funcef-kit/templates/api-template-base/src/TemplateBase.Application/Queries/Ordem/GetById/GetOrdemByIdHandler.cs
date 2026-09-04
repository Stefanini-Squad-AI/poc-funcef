// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using FuncefEssenciais.Exceptions;
using FuncefORM.Mapping.Extensions;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.DTOs.OrdemDto.Response;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Queries.Ordem.GetById;

/// <summary>
/// Handler responsável pela consulta de uma ordem por ID.
/// </summary>
public class GetOrdemByIdHandler : IQueryHandler<GetOrdemByIdQuery, OrdemResponse>
{
    private readonly IOrdemService _service;

    public GetOrdemByIdHandler(IOrdemService service)
    {
        _service = service;
    }

    public async Task<OrdemResponse> Handle(GetOrdemByIdQuery query, CancellationToken cancellationToken)
    {
        var ordem = await _service.GetByIdWithAutoIncludesAsync(query.Id, cancellationToken)
            ?? throw NotFoundException.ForResource("Ordem", query.Id);

        return ordem.MapTo<Domain.Entities.Ordem, OrdemResponse>(dto =>
        {
            dto.ClienteId = ordem.ClienteId;
            if (ordem.Cliente != null)
            {
                dto.NomeCliente = ordem.Cliente.Nome;
                dto.Cliente = ordem.Cliente.MapTo<Domain.Entities.Cliente, ClienteResume>();
            }
        });
    }
}
