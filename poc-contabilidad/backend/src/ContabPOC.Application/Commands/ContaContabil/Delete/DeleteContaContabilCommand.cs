using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContaContabil.Delete;

/// <summary>
/// Command para excluir uma conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroApplyDelete (linha 1567)
///   accept := CtrlPlanoConta.Apagar;
/// </summary>
public class DeleteContaContabilCommand : ICommand<bool>
{
    public int Plano { get; init; }
    public string Codigo { get; init; } = string.Empty;
}
