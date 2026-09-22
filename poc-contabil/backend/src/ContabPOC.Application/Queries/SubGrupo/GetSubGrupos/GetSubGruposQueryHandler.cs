using ContabPOC.Application.DTOs.SubGrupoDto;
using ContabPOC.Application.Queries.SubGrupo.GetSubGrupos;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using SubGrupoEntity = ContabPOC.Domain.Entities.SubGrupo;

namespace ContabPOC.Application.Queries.SubGrupo.GetSubGrupos;

/// <summary>
/// Handler para processar a query de listagem de sub-grupos.
/// Migração de: FCadContasContabMT.pas → CdsSubGrupo
///   dblkSubGrupo1..4 (TwwDBLookupCombo) → LookupTable = CdsSubGrupo
/// Delphi SQL: SELECT CODSUBGRP, DESCSUBGRP FROM SUBGRUPO ORDER BY 2
///
/// POC: Consulta diretamente a tabela SUBGRUPO.
/// </summary>
public class GetSubGruposQueryHandler : IQueryHandler<GetSubGruposQuery, IEnumerable<SubGrupoResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetSubGruposQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<SubGrupoResponse>> Handle(
        GetSubGruposQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<SubGrupoEntity>();

        var subGrupos = await repository.FindAsync(
            s => true,
            true,
            cancellationToken);

        // ORDER BY 2 = ORDER BY DESCSUBGRP (segunda coluna no SQL Delphi)
        var subGruposResponse = subGrupos
            .Select(s => new SubGrupoResponse
            {
                Id = s.Id,
                Descricao = s.Descricao
            })
            .OrderBy(s => s.Descricao)
            .ToList();

        return subGruposResponse.AsEnumerable();
    }
}
