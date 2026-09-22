using FluentValidation;

namespace ContabPOC.Application.Commands.ContaContabil.Update;

/// <summary>
/// Validador para atualização de conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroBeforeConfirma
/// Reutiliza las mismas reglas que Create
/// </summary>
public class UpdateContaContabilValidator : AbstractValidator<UpdateContaContabilCommand>
{
    public UpdateContaContabilValidator()
    {
        RuleFor(x => x.Plano)
            .GreaterThan(0).WithMessage("Plano é obrigatório.");

        RuleFor(x => x.Codigo)
            .NotEmpty().WithMessage("Código da conta é obrigatório.");

        RuleFor(x => x.Request.Descricao)
            .NotEmpty().WithMessage("Nome da Conta não informado.")
            .MaximumLength(200).WithMessage("Descrição não pode exceder 200 caracteres.");

        RuleFor(x => x.Request.Grupo)
            .NotEmpty().WithMessage("Grupo da Conta não selecionado.")
            .Must(g => new[] { "A", "P", "R", "D", "C", "O", "E", "S" }.Contains(g))
            .WithMessage("Grupo inválido.");

        RuleFor(x => x.Request.Tipo)
            .NotEmpty().WithMessage("Tipo da conta é obrigatório.")
            .Must(t => t == "S" || t == "A")
            .WithMessage("Tipo deve ser: S=Sintética, A=Analítica.");

        RuleFor(x => x.Request.Natureza)
            .Must(n => n == null || new[] { "D", "C", "N" }.Contains(n))
            .WithMessage("Natureza deve ser: D=Devedora, C=Credora, N=Neutra.");

        RuleFor(x => x.Request.Nivel)
            .InclusiveBetween(1, 99).WithMessage("Nível deve estar entre 1 e 99.");
    }
}
