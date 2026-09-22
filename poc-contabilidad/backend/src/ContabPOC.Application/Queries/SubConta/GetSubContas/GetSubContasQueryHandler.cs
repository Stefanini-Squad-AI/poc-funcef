using ContabPOC.Application.DTOs.SubContaDto;
using ContabPOC.Application.Queries.SubConta.GetSubContas;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using SubContaEntity = ContabPOC.Domain.Entities.SubConta;
using ContasxSCEntity = ContabPOC.Domain.Entities.ContasxSC;

namespace ContabPOC.Application.Queries.SubConta.GetSubContas;

/// <summary>
/// Handler para processar a query de listagem de sub-contas disponíveis.
/// Migração de: FCadContasContabMT.pas → CdsSubConta (grid esquerdo)
///   ListSubContaCadContas (uCtrlPlanoConta.pas):
///     SELECT CODSUBCONTA, NOMESUBCONTA FROM SUBCONTA
///     WHERE IDPESSOA = :emp AND ATIVO = 'S'
///       AND NOT EXISTS (SELECT CODSUBCONTA FROM CONTASXSUBC
///                       WHERE CODSUBCONTA = S.CODSUBCONTA
///                         AND IDPESSOA = S.IDPESSOA
///                         AND PLANO = :plano
///                         AND RTRIM(PLACONTA) = :conta)
///     ORDER BY CODSUBCONTA
/// </summary>
public class GetSubContasQueryHandler : IQueryHandler<GetSubContasQuery, IEnumerable<SubContaResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetSubContasQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<SubContaResponse>> Handle(
        GetSubContasQuery query,
        CancellationToken cancellationToken)
    {
        var subContaRepository = _unitOfWork.GetRepository<SubContaEntity>();
        var contasxSCRepository = _unitOfWork.GetRepository<ContasxSCEntity>();

        // Buscar todas as sub-contas ativas da empresa
        var subContas = await subContaRepository.FindAsync(
            s => s.IdPessoa == query.IdEmpresa
                && (s.Ativo == "S" || s.Ativo == null),
            true,
            cancellationToken);

        // Buscar sub-contas já associadas a esta conta
        var contasxSC = await contasxSCRepository.FindAsync(
            sc => sc.Plano == query.Plano
                && sc.PlacConta.Trim() == query.PlacConta.Trim()
                && sc.IdPessoa == query.IdEmpresa,
            true,
            cancellationToken);

        var codigosJaAssociados = contasxSC
            .Select(sc => sc.CodSubConta)
            .ToHashSet();

        // Filtrar disponíveis (não associados)
        var disponiveis = subContas
            .Where(s => !codigosJaAssociados.Contains(s.CodSubConta))
            .OrderBy(s => s.CodSubConta)
            .Select(s => new SubContaResponse
            {
                IdPessoa = s.IdPessoa,
                CodSubConta = s.CodSubConta,
                NomeSubConta = s.NomeSubConta,
                Ativo = s.Ativo
            });

        return disponiveis;
    }
}
