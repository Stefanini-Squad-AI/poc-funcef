using ContabPOC.Application.Commands.ContaContabil.Create;
using ContabPOC.Application.DTOs.ContaContabilDto;
using ContabPOC.Application.Queries.ContaContabil.GetTree;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using ContaContabilEntity = ContabPOC.Domain.Entities.ContaContabil;

namespace ContabPOC.Application.Queries.ContaContabil.GetTree;

/// <summary>
/// Handler para processar a query de árvore hierárquica de contas contábeis
/// Migração de: FCadContasContabMT.pas → pgCtrlChange/TabSheet2 (linha 470)
///   CdsTreeContas.Data := CtrlContaContabil.ListContas(PlanoParam, tcambasC, True, '');
/// </summary>
public class GetContaContabilTreeQueryHandler : IQueryHandler<GetContaContabilTreeQuery, IEnumerable<ContaContabilResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetContaContabilTreeQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<ContaContabilResponse>> Handle(
        GetContaContabilTreeQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<ContaContabilEntity>();

        // Construir filtro dinâmico
        var contas = await repository.FindAsync(
            c => c.Plano == query.Plano
                && (!query.IncluirInativas ? !c.Inativa : true)
                && (query.GrupoFiltro == null || c.Grupo == query.GrupoFiltro),
            true,
            cancellationToken);

        var contasList = contas.ToList();

        // Mapear para response e ordenar por código
        var contasResponse = contasList
            .Select(CreateContaContabilCommandHandler.MapToResponse)
            .OrderBy(c => c.Codigo)
            .ToList();

        return contasResponse.AsEnumerable();
    }
}
