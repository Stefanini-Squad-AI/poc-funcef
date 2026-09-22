using ContabPOC.Application.Commands.ContasxSC.Disassociate;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using ContasxSCEntity = ContabPOC.Domain.Entities.ContasxSC;

namespace ContabPOC.Application.Commands.ContasxSC.Disassociate;

/// <summary>
/// Handler para desassociar sub-contas de uma conta contábil.
/// Migração de: FCadContasContabMT.pas → btnVoltaUm2Click (líneas 1221-1248)
///   e btnVoltaTodos2Click (líneas 1250-1278)
///
/// Regras Delphi:
/// 1. btnVoltaTodos2Click: remove todas as associações (com confirmação)
/// 2. btnVoltaUm2Click: remove apenas a selecionada
/// </summary>
public class DisassociateContasxSCCommandHandler : ICommandHandler<DisassociateContasxSCCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork;

    public DisassociateContasxSCCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<bool> Handle(
        DisassociateContasxSCCommand command,
        CancellationToken cancellationToken)
    {
        var contasxSCRepository = _unitOfWork.GetRepository<ContasxSCEntity>();

        // Buscar todas as relações para esta conta
        var relacoes = await contasxSCRepository.FindAsync(
            sc => sc.Plano == command.Plano
                && sc.PlacConta.Trim() == command.PlacConta.Trim()
                && sc.IdPessoa == command.IdEmpresa,
            false,
            cancellationToken);

        // Filtrar quais remover
        var relacoesParaRemover = command.CodSubContas.Count == 0
            ? relacoes.ToList() // btnVoltaTodos2Click: remover todas
            : relacoes
                .Where(sc => command.CodSubContas.Contains(sc.CodSubConta))
                .ToList();

        if (!relacoesParaRemover.Any())
        {
            return true; // Nada a remover
        }

        foreach (var relacao in relacoesParaRemover)
        {
            await contasxSCRepository.DeleteAsync(relacao, cancellationToken);
        }

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return true;
    }
}
