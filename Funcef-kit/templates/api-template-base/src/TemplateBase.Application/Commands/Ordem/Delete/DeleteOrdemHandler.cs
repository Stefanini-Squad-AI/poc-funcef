// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using TemplateBase.Application.Services;

namespace TemplateBase.Application.Commands.Ordem.Delete;

/// <summary>
/// Handler responsável pela exclusão de uma ordem.
/// </summary>
public class DeleteOrdemHandler : ICommandHandler<DeleteOrdemCommand>
{
    private readonly IOrdemService _service;
    private readonly IUnitOfWork _unitOfWork;

    public DeleteOrdemHandler(IOrdemService service, IUnitOfWork unitOfWork)
    {
        _service = service;
        _unitOfWork = unitOfWork;
    }

    public async Task Handle(DeleteOrdemCommand command, CancellationToken cancellationToken)
    {
        await _service.ValidateAndDeleteAsync(command.Id, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }
}
