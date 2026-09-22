using ContabPOC.Application.DTOs.ContasxCCDto;
using ContabPOC.Application.Queries.ContasxCC.GetContasxCC;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using CentroCustoEntity = ContabPOC.Domain.Entities.CentroCusto;
using ContasxCCEntity = ContabPOC.Domain.Entities.ContasxCC;

namespace ContabPOC.Application.Queries.ContasxCC.GetContasxCC;

/// <summary>
/// Handler para processar a query de listagem de centros de custo associados a uma conta.
/// Migração de: FCadContasContabMT.pas → CdsContasxCC
///   ListContasxCC (uCtrlContaContabil.pas líneas 466-517):
///     SELECT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, CC.PLANO, CC.IDEMPRESA,
///            CC.PLACONTA, CC.IDUSUARIOINCLUSAO, C.CODEXTERNO
///     FROM CENTCUST C, CONTASXCC CC
///     WHERE CC.PLANO = :plano AND RTRIM(CC.PLACONTA) = :conta AND CC.IDEMPRESA = :emp
///       AND CC.CODCENTROCUSTO = C.CODCENTROCUSTO AND CC.IDEMPRESA = C.IDPESSOA
///       AND ((C.ATIVO = 'S') OR (C.ATIVO IS NULL))
/// </summary>
public class GetContasxCCQueryHandler : IQueryHandler<GetContasxCCQuery, IEnumerable<ContasxCCResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetContasxCCQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<ContasxCCResponse>> Handle(
        GetContasxCCQuery query,
        CancellationToken cancellationToken)
    {
        var contasxCCRepository = _unitOfWork.GetRepository<ContasxCCEntity>();
        var ccRepository = _unitOfWork.GetRepository<CentroCustoEntity>();

        // Buscar relações CONTASXCC para esta conta
        var contasxCC = await contasxCCRepository.FindAsync(
            cc => cc.Plano == query.Plano
                && cc.PlacConta.Trim() == query.PlacConta.Trim()
                && cc.IdEmpresa == query.IdEmpresa,
            true,
            cancellationToken);

        // Buscar todos os centros de custo para fazer o join
        var centrosCusto = await ccRepository.FindAsync(
            c => c.IdPessoa == query.IdEmpresa,
            true,
            cancellationToken);

        var ccDict = centrosCusto
            .Where(c => c.Ativo == "S" || c.Ativo == null)
            .ToDictionary(c => c.CodCentroCusto.Trim());

        // Join CONTASXCC × CENTCUST
        var result = contasxCC
            .Select(cc =>
            {
                ccDict.TryGetValue(cc.CodCentroCusto.Trim(), out var centroCusto);
                return new ContasxCCResponse
                {
                    IdContaCc = cc.IdContaCc,
                    Plano = cc.Plano,
                    PlacConta = cc.PlacConta,
                    CodCentroCusto = cc.CodCentroCusto,
                    Nome = centroCusto?.Nome ?? string.Empty,
                    StatusGrupoCdc = centroCusto?.StatusGrupoCdc ?? "A",
                    CodExterno = centroCusto?.CodExterno,
                    IdEmpresa = cc.IdEmpresa,
                    IdUsuarioInclusao = cc.IdUsuarioInclusao,
                    DtInclusao = cc.DtInclusao
                };
            })
            .OrderBy(r => r.CodExterno)
            .ToList();

        return result.AsEnumerable();
    }
}
