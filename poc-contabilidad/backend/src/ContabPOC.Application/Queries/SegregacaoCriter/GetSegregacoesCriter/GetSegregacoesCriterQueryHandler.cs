using ContabPOC.Application.DTOs.SegregacaoCriterDto;
using ContabPOC.Application.Queries.SegregacaoCriter.GetSegregacoesCriter;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using SegregacaoCriterEntity = ContabPOC.Domain.Entities.SegregacaoCriter;

namespace ContabPOC.Application.Queries.SegregacaoCriter.GetSegregacoesCriter;

/// <summary>
/// Handler para processar a query de listagem de critérios de segregação.
/// Migração de: FCadContasContabMT.pas linha 379:
///   cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
///
/// POC: Consulta diretamente a tabela SEGREGACRITER.
/// </summary>
public class GetSegregacoesCriterQueryHandler : IQueryHandler<GetSegregacoesCriterQuery, IEnumerable<SegregacaoCriterResponse>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetSegregacoesCriterQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<IEnumerable<SegregacaoCriterResponse>> Handle(
        GetSegregacoesCriterQuery query,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<SegregacaoCriterEntity>();

        var segregacoes = await repository.FindAsync(
            s => true,
            true,
            cancellationToken);

        var segregacoesResponse = segregacoes
            .Select(s => new SegregacaoCriterResponse
            {
                Id = s.Id,
                Descricao = s.Descricao,
                Ordem = s.Ordem,
                TipoSegrega = s.TipoSegrega,
                TipoCotacao = s.TipoCotacao
            })
            .OrderBy(s => s.Descricao)
            .ToList();

        return segregacoesResponse.AsEnumerable();
    }
}
