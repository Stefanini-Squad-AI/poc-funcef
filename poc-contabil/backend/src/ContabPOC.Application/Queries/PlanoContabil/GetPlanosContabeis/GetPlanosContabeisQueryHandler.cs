using ContabPOC.Application.DTOs.PlanoContabilDto;
using ContabPOC.Application.Queries.PlanoContabil.GetPlanosContabeis;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using PlanoContabilEntity = ContabPOC.Domain.Entities.PlanoContabil;

namespace ContabPOC.Application.Queries.PlanoContabil.GetPlanosContabeis;

/// <summary>
/// Handler para processar a query de listagem de planos contábeis.
/// Migração de: uCtrlContaContabil.pas - ListPlanosContas (linha 121-152).
///
/// SQL Delphi original (com UNION de PARAMCONTAB + PLANODATA):
///   SELECT U.PLANO, U.DESCPLANO, U.MASCARA FROM
///   ((SELECT PC.PLANO, P.DESCPLANO, P.MASCARA FROM PARAMCONTAB PC, PLANO P
///     WHERE P.PLANO = PC.PLANO AND PC.IDPESSOA = empresa)
///   UNION
///   (SELECT PD.PLANO, P.DESCPLANO, P.MASCARA FROM PLANODATA PD, PLANO P
///     WHERE P.PLANO = PD.PLANO AND PD.IDPESSOA = empresa)) U
///   ORDER BY U.DESCPLANO
///
/// POC: Como PARAMCONTAB e PLANODATA não existem na BD do POC,
///      a query simplificada consulta diretamente a tabela PLANO.
/// </summary>
public class GetPlanosContabeisQueryHandler : IQueryHandler<GetPlanosContabeisQuery, IEnumerable<PlanoContabilResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetPlanosContabeisQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<PlanoContabilResponse>> Handle(
        GetPlanosContabeisQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<PlanoContabilEntity>();

        var planos = await repository.FindAsync(
            p => query.IncluirInativos || p.Ativo == "S",
            true,
            cancellationToken);

        var planosResponse = planos
            .Select(p => new PlanoContabilResponse
            {
                Id = p.Id,
                Nome = p.Nome,
                Mascara = p.Mascara,
                Ativo = p.Ativo == "S"
            })
            .OrderBy(p => p.Nome)
            .ToList();

        return planosResponse.AsEnumerable();
    }
}
