using ContabPOC.Application.DTOs.ProgramaDto;
using ContabPOC.Application.Queries.Programa.GetProgramas;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using ProgramaEntity = ContabPOC.Domain.Entities.Programa;

namespace ContabPOC.Application.Queries.Programa.GetProgramas;

/// <summary>
/// Handler para processar a query de listagem de programas.
/// Migração de: FCadContasContabMT.pas linhas 452-453:
///   SqlPrograma.Prepare; SqlPrograma.Open;
/// Delphi SQL: SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
///
/// POC: Consulta diretamente a tabela PROGRAMA.
/// </summary>
public class GetProgramasQueryHandler : IQueryHandler<GetProgramasQuery, IEnumerable<ProgramaResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetProgramasQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<ProgramaResponse>> Handle(
        GetProgramasQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<ProgramaEntity>();

        var programas = await repository.FindAsync(
            p => true,
            true,
            cancellationToken);

        // ORDER BY 2 = ORDER BY DESCPROGRAMA (segunda coluna no SQL Delphi)
        var programasResponse = programas
            .Select(p => new ProgramaResponse
            {
                Id = p.Id,
                Descricao = p.Descricao
            })
            .OrderBy(p => p.Descricao)
            .ToList();

        return programasResponse.AsEnumerable();
    }
}
