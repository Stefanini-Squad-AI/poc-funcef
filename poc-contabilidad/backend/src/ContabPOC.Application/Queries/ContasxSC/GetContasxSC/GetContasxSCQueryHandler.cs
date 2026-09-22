using ContabPOC.Application.DTOs.ContasxSCDto;
using ContabPOC.Application.Queries.ContasxSC.GetContasxSC;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using ContasxSCEntity = ContabPOC.Domain.Entities.ContasxSC;

namespace ContabPOC.Application.Queries.ContasxSC.GetContasxSC;

/// <summary>
/// Handler para processar a query de listagem de sub-contas associadas a uma conta.
/// Migração de: FCadContasContabMT.pas → CdsContasxSC (grid direito)
///   ListContasxSC (uCtrlContaContabil.pas):
///     SELECT IDPESSOA, IDUSUARIO, PLANO, PLACONTA, CODSUBCONTA, NOMESUBCONTA, DTINCLUSAO
///     FROM CONTASXSUBC
///     WHERE PLANO = :plano AND RTRIM(PLACONTA) = :conta AND IDPESSOA = :emp
///     ORDER BY CODSUBCONTA
/// </summary>
public class GetContasxSCQueryHandler : IQueryHandler<GetContasxSCQuery, IEnumerable<ContasxSCResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetContasxSCQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<ContasxSCResponse>> Handle(
        GetContasxSCQuery query,
        CancellationToken cancellationToken)
    {
        var contasxSCRepository = _unitOfWork.GetRepository<ContasxSCEntity>();

        // Buscar relações CONTASXSUBC para esta conta
        var contasxSC = await contasxSCRepository.FindAsync(
            sc => sc.Plano == query.Plano
                && sc.PlacConta.Trim() == query.PlacConta.Trim()
                && sc.IdPessoa == query.IdEmpresa,
            true,
            cancellationToken);

        var result = contasxSC
            .OrderBy(sc => sc.CodSubConta)
            .Select(sc => new ContasxSCResponse
            {
                IdPessoa = sc.IdPessoa,
                IdUsuario = sc.IdUsuario,
                Plano = sc.Plano,
                PlacConta = sc.PlacConta,
                CodSubConta = sc.CodSubConta,
                NomeSubConta = sc.NomeSubConta,
                DtInclusao = sc.DtInclusao
            });

        return result;
    }
}
