using ContabPOC.Application.DTOs.CentroCustoDto;
using ContabPOC.Application.Queries.CentroCusto.GetCentrosCusto;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using CentroCustoEntity = ContabPOC.Domain.Entities.CentroCusto;
using ContasxCCEntity = ContabPOC.Domain.Entities.ContasxCC;

namespace ContabPOC.Application.Queries.CentroCusto.GetCentrosCusto;

/// <summary>
/// Handler para processar a query de listagem de centros de custo disponíveis.
/// Migração de: FCadContasContabMT.pas → CdsCCusto
///   ListCCustoCadContas (uCtrlPlanoConta.pas líneas 576-607):
///     SELECT C.CODEXTERNO, C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC
///     FROM CENTCUST C
///     WHERE (C.IDEMPRESA = :emp)
///       AND NOT EXISTS (SELECT CC.CODCENTROCUSTO FROM CONTASXCC CC
///                       WHERE CC.CODCENTROCUSTO = C.CODCENTROCUSTO
///                         AND CC.IDEMPRESA = C.IDEMPRESA
///                         AND CC.PLANO = :plano
///                         AND RTRIM(CC.PLACONTA) = :conta)
///       AND (C.ATIVO = 'S')
///     ORDER BY CODEXTERNO
/// </summary>
public class GetCentrosCustoQueryHandler : IQueryHandler<GetCentrosCustoQuery, IEnumerable<CentroCustoResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetCentrosCustoQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<CentroCustoResponse>> Handle(
        GetCentrosCustoQuery query,
        CancellationToken cancellationToken)
    {
        var ccRepository = _unitOfWork.GetRepository<CentroCustoEntity>();
        var contasxCCRepository = _unitOfWork.GetRepository<ContasxCCEntity>();

        // Buscar todos os centros de custo ativos da empresa
        var centrosCusto = await ccRepository.FindAsync(
            c => c.IdPessoa == query.IdEmpresa
                && (c.Ativo == "S" || c.Ativo == null),
            true,
            cancellationToken);

        // Buscar centros de custo já associados a esta conta
        var contasxCC = await contasxCCRepository.FindAsync(
            cc => cc.Plano == query.Plano
                && cc.PlacConta.Trim() == query.PlacConta.Trim()
                && cc.IdEmpresa == query.IdEmpresa,
            true,
            cancellationToken);

        var codigosAssociados = contasxCC
            .Select(cc => cc.CodCentroCusto.Trim())
            .ToHashSet();

        // Filtrar: NOT EXISTS (centros já associados)
        var result = centrosCusto
            .Where(c => !codigosAssociados.Contains(c.CodCentroCusto.Trim()))
            .Select(c => new CentroCustoResponse
            {
                IdPessoa = c.IdPessoa,
                CodCentroCusto = c.CodCentroCusto,
                Nome = c.Nome,
                StatusGrupoCdc = c.StatusGrupoCdc,
                CodExterno = c.CodExterno,
                Ativo = c.Ativo
            })
            .OrderBy(c => c.CodExterno)
            .ToList();

        return result.AsEnumerable();
    }
}
