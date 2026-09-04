// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Commands.Ordem.UpdateStatus;

/// <summary>
/// Validador do comando de atualização de status de ordem.
/// </summary>
/// <remarks>
/// A lista de status vem do domínio (<see cref="StatusOrdem.Validos"/>) — fonte única de
/// verdade; o validator dá a resposta 400 amigável e a entidade garante a transição.
/// </remarks>
public class UpdateOrdemStatusValidator : AbstractValidator<UpdateOrdemStatusCommand>
{
    public UpdateOrdemStatusValidator()
    {
        this.RuleForRequiredId(x => x.Id, "ID da ordem");
        this.RuleForRequiredAllowedValues(x => x.Request.Status, [.. StatusOrdem.Validos], "Status");
    }
}
