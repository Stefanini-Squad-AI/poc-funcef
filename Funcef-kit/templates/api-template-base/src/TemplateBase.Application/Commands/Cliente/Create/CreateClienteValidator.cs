// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;

namespace TemplateBase.Application.Commands.Cliente.Create;

/// <summary>
/// Validador do comando de criação de cliente.
/// Executado automaticamente pelo <c>ValidationBehavior</c> no pipeline do Mediator.
/// </summary>
public class CreateClienteValidator : AbstractValidator<CreateClienteCommand>
{
    public CreateClienteValidator()
    {
        this.RuleForRequiredText(x => x.Request.Nome, "nome", 100);
        this.RuleForOptionalEmail(x => x.Request.Email, maxLength: 150);
    }
}
