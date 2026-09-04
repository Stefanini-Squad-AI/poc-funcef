// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using FuncefORM.Mapping.Extensions;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Commands.Cliente.Update;

/// <summary>
/// Handler responsável pela atualização de um cliente existente.
/// </summary>
public class UpdateClienteHandler : ICommandHandler<UpdateClienteCommand, ClienteResponse>
{
    private readonly IClienteService _service;
    private readonly IUnitOfWork _unitOfWork;

    public UpdateClienteHandler(IClienteService service, IUnitOfWork unitOfWork)
    {
        _service = service;
        _unitOfWork = unitOfWork;
    }

    public async Task<ClienteResponse> Handle(UpdateClienteCommand command, CancellationToken cancellationToken)
    {
        var cliente = await _service.UpdateAsync(command.Id, command.Request, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
        return cliente.MapTo<Domain.Entities.Cliente, ClienteResponse>();
    }
}
