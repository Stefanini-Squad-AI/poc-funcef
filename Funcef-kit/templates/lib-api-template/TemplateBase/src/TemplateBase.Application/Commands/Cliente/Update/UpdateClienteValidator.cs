// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;

namespace TemplateBase.Application.Commands.Cliente.Update;

/// <summary>
/// Validador do comando de atualização de cliente.
/// </summary>
public class UpdateClienteValidator : AbstractValidator<UpdateClienteCommand>
{
    public UpdateClienteValidator()
    {
        this.RuleForRequiredId(x => x.Id, "ID do cliente");
        this.RuleForRequiredText(x => x.Request.Nome, "nome", 100);
        this.RuleForOptionalEmail(x => x.Request.Email, maxLength: 150);
    }
}
