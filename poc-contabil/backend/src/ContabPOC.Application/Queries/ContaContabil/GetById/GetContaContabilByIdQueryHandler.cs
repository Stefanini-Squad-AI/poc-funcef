using ContabPOC.Application.Commands.ContaContabil.Create;
using ContabPOC.Application.DTOs.ContaContabilDto;
using ContabPOC.Application.Queries.ContaContabil.GetById;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using ContaContabilEntity = ContabPOC.Domain.Entities.ContaContabil;

namespace ContabPOC.Application.Queries.ContaContabil.GetById;

/// <summary>
/// Handler para processar a query de obtenção de conta contábil por PK
/// Migração de: FCadContasContabMT.pas → CmeCadastroFind (linha 846)
/// </summary>
public class GetContaContabilByIdQueryHandler : IQueryHandler<GetContaContabilByIdQuery, ContaContabilResponse?>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetContaContabilByIdQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ContaContabilResponse?> Handle(
        GetContaContabilByIdQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<ContaContabilEntity>();

        var contas = await repository.FindAsync(
            c => c.Plano == query.Plano && c.Codigo == query.Codigo,
            false,
            cancellationToken);

        var conta = contas.FirstOrDefault();
        
        return conta == null ? null : CreateContaContabilCommandHandler.MapToResponse(conta);
    }
}
