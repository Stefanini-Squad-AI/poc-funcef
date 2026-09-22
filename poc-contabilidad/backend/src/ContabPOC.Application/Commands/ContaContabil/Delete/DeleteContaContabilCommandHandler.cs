using ContabPOC.Application.Commands.ContaContabil.Delete;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using ContaContabilEntity = ContabPOC.Domain.Entities.ContaContabil;

namespace ContabPOC.Application.Commands.ContaContabil.Delete;

/// <summary>
/// Handler para processar o comando de exclusão de conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroDelete (líneas 1503-1565)
/// 
/// Regras Delphi:
/// 1. Verifica se existe lançamento → ContaTemLancamento
/// 2. Verifica se possui filhos → ContaTemOutrosFilhos
/// 3. Apaga saldo → ApagarSaldo
/// 4. Apaga conta → Apagar
/// 5. Apaga relacionamentos (ContasxSC, ContasxCC)
/// </summary>
public class DeleteContaContabilCommandHandler : ICommandHandler<DeleteContaContabilCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork;

    public DeleteContaContabilCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<bool> Handle(
        DeleteContaContabilCommand command,
        CancellationToken cancellationToken)
    {
        var repository = _unitOfWork.GetRepository<ContaContabilEntity>();

        // Buscar a conta
        var contas = await repository.FindAsync(
            c => c.Plano == command.Plano && c.Codigo == command.Codigo,
            false,
            cancellationToken);

        var conta = contas.FirstOrDefault()
            ?? throw new KeyNotFoundException($"Conta contábil {command.Plano}/{command.Codigo} não encontrada.");

        // Delphi: CmeCadastroDelete → ContaTemLancamento
        // Verifica se existe lançamento para a Conta
        // TODO: Implementar verificação de lançamentos quando tabela de lançamentos existir

        // Delphi: CmeCadastroDelete → ContaTemOutrosFilhos
        // Verifica se a conta possui filhos
        var codigoPrefixo = command.Codigo.Trim();
        var temFilhos = await repository.ExistsAsync(
            c => c.Plano == command.Plano
                && c.Codigo != command.Codigo
                && c.Codigo.StartsWith(codigoPrefixo),
            false,
            cancellationToken);

        if (temFilhos)
        {
            throw new InvalidOperationException(
                "Existem contas vinculadas (filhas) a essa conta. " +
                "Exclusão cancelada.");
        }

        // Delphi: CmeCadastroDelete → ApagarSaldo + Apagar
        // Excluir a conta
        await repository.DeleteAsync(conta, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return true;
    }
}
