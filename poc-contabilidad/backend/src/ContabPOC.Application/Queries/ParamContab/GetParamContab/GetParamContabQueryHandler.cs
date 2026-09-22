using ContabPOC.Application.DTOs.ParamContabDto;
using ContabPOC.Application.Queries.ParamContab.GetParamContab;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using ParamContabEntity = ContabPOC.Domain.Entities.ParamContab;

namespace ContabPOC.Application.Queries.ParamContab.GetParamContab;

/// <summary>
/// Handler para processar a query de parâmetros contábeis por empresa.
/// Migração de: uCtrlContab.pas → TCtrlContab:
///   SELECT PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
///   FROM PARAMCONTAB WHERE IDPESSOA = IdEmpresa
///   FMoedaOficial := _Cds.FieldByName('PACMOEDAOFICIAL').AsInteger;
/// </summary>
public class GetParamContabQueryHandler : IQueryHandler<GetParamContabQuery, ParamContabResponse?>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetParamContabQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ParamContabResponse?> Handle(
        GetParamContabQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<ParamContabEntity>();

        var paramContab = await repository.FindAsync(
            p => p.IdPessoa == query.IdEmpresa,
            true,
            cancellationToken);

        var entity = paramContab.FirstOrDefault();

        if (entity is null)
        {
            return null;
        }

        return new ParamContabResponse
        {
            IdPessoa = entity.IdPessoa,
            MoedaOficial = entity.MoedaOficial,
            MoedaGerencial = entity.MoedaGerencial,
            MoedaGeren1 = entity.MoedaGeren1,
            MoedaGeren2 = entity.MoedaGeren2,
            PacReduzA = entity.PacReduzA,
            PacReduzP = entity.PacReduzP,
            PacReduzR = entity.PacReduzR,
            PacReduzD = entity.PacReduzD,
            PacReduzC = entity.PacReduzC,
            PacReduzE = entity.PacReduzE,
            PacReduzO = entity.PacReduzO
        };
    }
}
