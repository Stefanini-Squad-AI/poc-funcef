using ContabPOC.Application.DTOs.ContaContabilDto;
using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContaContabil.Update;

/// <summary>
/// Command para atualizar uma conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroApplyEdit (linha 1479)
/// </summary>
public class UpdateContaContabilCommand : ICommand<ContaContabilResponse>
{
    public int Plano { get; init; }
    public string Codigo { get; init; } = string.Empty;
    public ContaContabilRequest Request { get; init; } = null!;
}
