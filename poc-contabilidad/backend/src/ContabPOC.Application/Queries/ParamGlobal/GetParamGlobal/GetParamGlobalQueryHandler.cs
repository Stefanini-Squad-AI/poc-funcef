using ContabPOC.Application.DTOs.ParamGlobalDto;
using ContabPOC.Application.Queries.ParamGlobal.GetParamGlobal;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using ParamGlobalEntity = ContabPOC.Domain.Entities.ParamGlobal;

namespace ContabPOC.Application.Queries.ParamGlobal.GetParamGlobal;

/// <summary>
/// Handler para processar a query de parâmetros globais por empresa.
/// Migração de: uCtrlParamIntegra.pas → GetParams(IdEmpresa):
///   SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = IdEmpresa
///   FSegregaVirtual := (_Cds.FieldByName('FLGSEGREGAVIRTUAL').AsString = 'S');
/// </summary>
public class GetParamGlobalQueryHandler : IQueryHandler<GetParamGlobalQuery, ParamGlobalResponse?>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetParamGlobalQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ParamGlobalResponse?> Handle(
        GetParamGlobalQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<ParamGlobalEntity>();

        var paramGlobal = await repository.FindAsync(
            p => p.IdPessoa == query.IdEmpresa,
            true,
            cancellationToken);

        var entity = paramGlobal.FirstOrDefault();

        if (entity is null)
        {
            return null;
        }

        return new ParamGlobalResponse
        {
            IdPessoa = entity.IdPessoa,
            SegregaVirtual = entity.SegregaVirtual == "S",
            SegregaOrAdm = entity.SegregaOrAdm == "S",
            SegregaOrComum = entity.SegregaOrComum == "S",
            IdPlanoPrevAdm = entity.IdPlanoPrevAdm,
            IdPatro = entity.IdPatro,
            IdPlanoPrev = entity.IdPlanoPrev,
            ObrigaCC = entity.ObrigaCC == "S"
        };
    }
}
