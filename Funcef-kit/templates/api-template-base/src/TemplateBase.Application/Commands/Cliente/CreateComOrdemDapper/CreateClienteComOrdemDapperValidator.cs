// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Core.Validation.FluentValidation;

namespace TemplateBase.Application.Commands.Cliente.CreateComOrdemDapper;

/// <summary>
/// Validador do comando de criação de cliente com ordem via Dapper.
/// </summary>
public class CreateClienteComOrdemDapperValidator : AbstractValidator<CreateClienteComOrdemDapperCommand>
{
    public CreateClienteComOrdemDapperValidator()
    {
        this.RuleForRequiredText(x => x.Request.NomeCliente, "nome do cliente", 100);
        this.RuleForOptionalEmail(x => x.Request.EmailCliente, "email do cliente", 150);
        this.RuleForPositiveDecimal(x => x.Request.ValorOrdem, "valor da ordem");
        this.RuleForOptionalText(x => x.Request.ObservacoesOrdem, "observações da ordem", 500);
    }
}
