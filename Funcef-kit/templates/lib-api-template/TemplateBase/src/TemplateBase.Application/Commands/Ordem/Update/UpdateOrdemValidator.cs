// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Commands.Ordem.Update;

/// <summary>
/// Validador do comando de atualização de ordem.
/// </summary>
/// <remarks>
/// A lista de status e os limites vêm do domínio (<see cref="StatusOrdem"/> e constantes de
/// <see cref="Domain.Entities.Ordem"/>) — fonte única de verdade; o validator dá a resposta
/// 400 amigável e a entidade garante a invariante.
/// </remarks>
public class UpdateOrdemValidator : AbstractValidator<UpdateOrdemCommand>
{
    public UpdateOrdemValidator()
    {
        this.RuleForRequiredId(x => x.Id, "ID da ordem");
        this.RuleForPositiveDecimal(x => x.Request.Valor);
        this.RuleForRequiredAllowedValues(x => x.Request.Status, [.. StatusOrdem.Validos], "Status");
        this.RuleForOptionalText(x => x.Request.Observacoes, "observações", Domain.Entities.Ordem.ObservacoesTamanhoMaximo);
    }
}
