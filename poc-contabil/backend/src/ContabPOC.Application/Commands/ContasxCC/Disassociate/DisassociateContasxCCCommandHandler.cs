using ContabPOC.Application.Commands.ContasxCC.Disassociate;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using ContasxCCEntity = ContabPOC.Domain.Entities.ContasxCC;

namespace ContabPOC.Application.Commands.ContasxCC.Disassociate;

/// <summary>
/// Handler para desassociar centros de custo de uma conta contábil.
/// Migração de: FCadContasContabMT.pas → btnVoltaUmClick (líneas 1097-1124)
///   e btnVoltaTodosClick (líneas 1126-1148)
///
/// Regras Delphi:
/// 1. btnVoltaTodos: remove todas as associações (com confirmação)
/// 2. btnVoltaUm: remove apenas a selecionada
/// </summary>
public class DisassociateContasxCCCommandHandler : ICommandHandler<DisassociateContasxCCCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork;

    public DisassociateContasxCCCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<bool> Handle(
        DisassociateContasxCCCommand command,
        CancellationToken cancellationToken)
    {
        var contasxCCRepository = _unitOfWork.GetRepository<ContasxCCEntity>();

        // Buscar todas as relações para esta conta
        var relacoes = await contasxCCRepository.FindAsync(
            cc => cc.Plano == command.Plano
                && cc.PlacConta.Trim() == command.PlacConta.Trim()
                && cc.IdEmpresa == command.IdEmpresa,
            false,
            cancellationToken);

        // Filtrar quais remover
        var relacoesParaRemover = command.CodCentrosCusto.Count == 0
            ? relacoes.ToList() // btnVoltaTodosClick: remover todas
            : relacoes
                .Where(cc => command.CodCentrosCusto.Contains(cc.CodCentroCusto))
                .ToList();

        if (!relacoesParaRemover.Any())
        {
            return true; // Nada a remover
        }

        foreach (var relacao in relacoesParaRemover)
        {
            await contasxCCRepository.DeleteAsync(relacao, cancellationToken);
        }

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return true;
    }
}
