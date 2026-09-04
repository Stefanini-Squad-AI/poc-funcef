// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;

namespace TemplateBase.Application.Commands.Ordem.Create;

/// <summary>
/// Validador do comando de criação de ordem.
/// </summary>
public class CreateOrdemValidator : AbstractValidator<CreateOrdemCommand>
{
    public CreateOrdemValidator()
    {
        this.RuleForRequiredId(x => x.Request.ClienteId, "ID do cliente");
        this.RuleForPositiveDecimal(x => x.Request.Valor);
        this.RuleForOptionalText(x => x.Request.Observacoes, "observações", 500);
    }
}
