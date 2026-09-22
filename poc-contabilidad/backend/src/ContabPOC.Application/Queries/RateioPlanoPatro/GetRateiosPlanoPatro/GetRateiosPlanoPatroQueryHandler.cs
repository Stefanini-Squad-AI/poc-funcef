using ContabPOC.Application.DTOs.RateioPlanoPatroDto;
using ContabPOC.Application.Queries.RateioPlanoPatro.GetRateiosPlanoPatro;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using RateioPlanoPatroEntity = ContabPOC.Domain.Entities.RateioPlanoPatro;

namespace ContabPOC.Application.Queries.RateioPlanoPatro.GetRateiosPlanoPatro;

/// <summary>
/// Handler para processar a query de listagem de rateios por plano/patrocinadora.
/// Migração de: FCadContasContabMT.pas linha 389:
///   cdsRateioPlanoPatro.Data := CtrlProcessaTotalPrev.ListaRatAdm;
///
/// POC: Consulta diretamente a tabela RATADMPLANPATRO.
/// </summary>
public class GetRateiosPlanoPatroQueryHandler : IQueryHandler<GetRateiosPlanoPatroQuery, IEnumerable<RateioPlanoPatroResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetRateiosPlanoPatroQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<RateioPlanoPatroResponse>> Handle(
        GetRateiosPlanoPatroQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<RateioPlanoPatroEntity>();

        var rateios = await repository.FindAsync(
            r => query.IncluirInativos || r.Ativo == "S",
            true,
            cancellationToken);

        var rateiosResponse = rateios
            .Select(r => new RateioPlanoPatroResponse
            {
                Id = r.Id,
                Descricao = r.Descricao,
                PlanoPrevId = r.PlanoPrevId,
                PatroId = r.PatroId,
                Ativo = r.Ativo == "S"
            })
            .OrderBy(r => r.Descricao)
            .ToList();

        return rateiosResponse.AsEnumerable();
    }
}
