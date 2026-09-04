// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;

namespace TemplateBase.Application.Commands.Cliente.Delete;

/// <summary>
/// Validador do comando de exclusão de cliente.
/// </summary>
public class DeleteClienteValidator : AbstractValidator<DeleteClienteCommand>
{
    public DeleteClienteValidator()
    {
        this.RuleForRequiredId(x => x.Id, "ID do cliente");
    }
}
