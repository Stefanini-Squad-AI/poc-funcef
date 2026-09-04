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

namespace TemplateBase.Application.Commands.Cliente.Create;

/// <summary>
/// Handler responsável pela criação de um novo cliente.
/// Delega regras de negócio ao <see cref="IClienteService"/> e persiste via <see cref="IUnitOfWork"/>.
/// </summary>
public class CreateClienteHandler : ICommandHandler<CreateClienteCommand, ClienteResponse>
{
    private readonly IClienteService _service;
    private readonly IUnitOfWork _unitOfWork;

    public CreateClienteHandler(IClienteService service, IUnitOfWork unitOfWork)
    {
        _service = service;
        _unitOfWork = unitOfWork;
    }

    public async Task<ClienteResponse> Handle(CreateClienteCommand command, CancellationToken cancellationToken)
    {
        var cliente = await _service.CreateAsync(command.Request, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
        return cliente.MapTo<Domain.Entities.Cliente, ClienteResponse>();
    }
}
