using ContabPOC.Application.DTOs.MoedaDto;
using ContabPOC.Application.Queries.Moeda.GetMoedas;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using MoedaEntity = ContabPOC.Domain.Entities.Moeda;

namespace ContabPOC.Application.Queries.Moeda.GetMoedas;

/// <summary>
/// Handler para processar a query de listagem de moedas.
/// Migração de: FCadContasContabMT.pas → CdsMoeda
///   dblkMoeda (TwwDBLookupCombo) → LookupTable = CdsMoeda
/// Delphi SQL: SELECT MOECODIGO, MOEDESC, MOESIGLA FROM MOEDA ORDER BY 2
///
/// POC: Consulta diretamente a tabela MOEDA.
/// </summary>
public class GetMoedasQueryHandler : IQueryHandler<GetMoedasQuery, IEnumerable<MoedaResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetMoedasQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<MoedaResponse>> Handle(
        GetMoedasQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<MoedaEntity>();

        var moedas = await repository.FindAsync(
            m => true,
            true,
            cancellationToken);

        // ORDER BY 2 = ORDER BY MOEDESC (segunda coluna no SQL Delphi)
        var moedasResponse = moedas
            .Select(m => new MoedaResponse
            {
                Id = m.Id,
                Descricao = m.Descricao,
                Sigla = m.Sigla
            })
            .OrderBy(m => m.Descricao)
            .ToList();

        return moedasResponse.AsEnumerable();
    }
}
