using FluentValidation;

namespace ContabPOC.Application.Commands.ContaContabil.Create;

/// <summary>
/// Validador para criação de conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroBeforeConfirma (líneas 1396-1477)
/// 
/// Reglas de validación Delphi:
/// - dbeCodigo.Text = '' → "Código da Conta Contábil não informado"
/// - dblkPlanoContabil.Text = '' → "Plano Contábil ao qual a Conta pertence não informado"
/// - cmbGrp.text = '' → "Grupo da Conta não selecionado"
/// - dbeDescPort.Text = '' → "Nome da Conta não informado"
/// - PLACCUST = 'S' and CdsContasxCC.isEmpty → "Conta obriga Centro de Custo"
/// - PLASUBCONTA = 'S' and CdsContasxSC.isEmpty → "Conta obriga Subconta"
/// - dbeCodigoExit: verifica se conta já existe, se tem pai, se pai é sintética
/// - cmbGrpExit: valida grupo e atribui natureza correspondente
/// </summary>
public class CreateContaContabilValidator : AbstractValidator<CreateContaContabilCommand>
{
    public CreateContaContabilValidator()
    {
        // === CmeCadastroBeforeConfirma validations ===

        // dbeCodigo (PLACONTA)
        RuleFor(x => x.Request.Codigo)
            .NotEmpty().WithMessage("Código da Conta Contábil não informado.")
            .MaximumLength(20).WithMessage("Código não pode exceder 20 caracteres.");

        // dblkPlanoContabil (PLANO)
        RuleFor(x => x.Request.Plano)
            .GreaterThan(0).WithMessage("Plano Contábil ao qual a Conta pertence não informado.");

        // cmbGrp (PLAGRUPO)
        RuleFor(x => x.Request.Grupo)
            .NotEmpty().WithMessage("Grupo da Conta não selecionado.")
            .Must(g => IsValidGrupo(g))
            .WithMessage("Grupo deve ser: A=Ativo, P=Pasivo, R=Receita, D=Despesa, C=Custo, O=Outros, E=Estatística, S=Patrimônio Social.");

        // dbeDescPort (PLANOME)
        RuleFor(x => x.Request.Descricao)
            .NotEmpty().WithMessage("Nome da Conta não informado.")
            .MaximumLength(200).WithMessage("Descrição não pode exceder 200 caracteres.");

        // grpTipo (PLATIPO)
        RuleFor(x => x.Request.Tipo)
            .NotEmpty().WithMessage("Tipo da conta é obrigatório.")
            .Must(t => t == "S" || t == "A")
            .WithMessage("Tipo deve ser: S=Sintética, A=Analítica.");

        // grpNatureza (PLANATUREZA)
        RuleFor(x => x.Request.Natureza)
            .Must(n => n == null || new[] { "D", "C", "N" }.Contains(n))
            .WithMessage("Natureza deve ser: D=Devedora, C=Credora, N=Neutra.");

        // dbeGrau (PLAGRAU)
        RuleFor(x => x.Request.Nivel)
            .InclusiveBetween(1, 99).WithMessage("Nível (grau) deve estar entre 1 e 99.");

        // dbeCodReduz (PLAREDUZ)
        // No Delphi, PLAREDUZ é auto-gerado por CriaCodReduz ao selecionar Grupo.
        // Não há validação de > 0 em CmeCadastroBeforeConfirma.
        RuleFor(x => x.Request.CodigoReduzido)
            .GreaterThanOrEqualTo(0).WithMessage("Código reduzido deve ser maior ou igual a 0.");

        // === dbeCodigoExit validations ===
        // Se nível > 1, la conta deve ter pai (verificado en el handler)
        // Se nível = nível máximo, tipo deve ser 'A' (Analítica)
        // Se nível = 1, tipo deve ser 'S' (Sintética)
        // Nota: A validação de grau máximo requiere acceso à máscara do plano (banco de dados).
        // Implementada no CreateContaContabilCommandHandler que tem acesso ao repositório.

        // === grpTipoClick: Conta sintética não pode ter centro de custo ===
        RuleFor(x => x)
            .Must(NotHaveSinteticaWithCentroCusto)
            .WithMessage("Conta sintética não pode aceitar centro de custo.")
            .When(x => x.Request.Tipo == "S");

        // === cmbGrpExit: grupo determina natureza ===
        // A → D (Devedora), P → C (Credora), R → C, D → D, C → D, O → N, E → N, S → C
        RuleFor(x => x)
            .Must(HaveConsistentGrupoNatureza)
            .WithMessage("Natureza inconsistente com o grupo selecionado.")
            .When(x => x.Request.Natureza != null);

        // === Conversão de Moeda defaults ===
        RuleFor(x => x.Request.ConversaoOficial)
            .Must(c => c == null || new[] { "S", "N" }.Contains(c))
            .WithMessage("Conversão Oficial deve ser S ou N.");

        RuleFor(x => x.Request.ConversaoGerencial)
            .Must(c => c == null || new[] { "S", "N" }.Contains(c))
            .WithMessage("Conversão Gerencial deve ser S ou N.");

        RuleFor(x => x.Request.ConversaoGerencial2)
            .Must(c => c == null || new[] { "S", "N" }.Contains(c))
            .WithMessage("Conversão Gerencial 2 deve ser S ou N.");

        RuleFor(x => x.Request.ConversaoGerencial3)
            .Must(c => c == null || new[] { "S", "N" }.Contains(c))
            .WithMessage("Conversão Gerencial 3 deve ser S ou N.");

        // Taxa de juros
        RuleFor(x => x.Request.TaxaJuros)
            .InclusiveBetween(0m, 100m)
            .When(x => x.Request.TaxaJuros.HasValue)
            .WithMessage("Taxa de juros deve estar entre 0 e 100.");
    }

    /// <summary>
    /// Valida se o grupo é um valor válido
    /// Delphi: cmbGrp items (0-7)
    /// </summary>
    private static bool IsValidGrupo(string? grupo)
    {
        return new[] { "A", "P", "R", "D", "C", "O", "E", "S" }.Contains(grupo);
    }

    /// <summary>
    /// Valida consistência entre grupo e natureza
    /// Delphi: cmbGrpExit (líneas 613-670)
    /// A→D, P→C, R→C, D→D, C→D, O→N, E→N, S→C
    /// </summary>
    private static bool HaveConsistentGrupoNatureza(CreateContaContabilCommand command)
    {
        var grupo = command.Request.Grupo;
        var natureza = command.Request.Natureza;

        return grupo switch
        {
            "A" => natureza == "D",
            "P" => natureza == "C",
            "R" => natureza == "C",
            "D" => natureza == "D",
            "C" => natureza == "D",
            "O" => natureza == "N",
            "E" => natureza == "N",
            "S" => natureza == "C",
            _ => true
        };
    }

    /// <summary>
    /// Valida que conta sintética não aceita centro de custo
    /// Delphi: grpTipoClick (líneas 582-610)
    /// Se tipo = 'S' (Sintética), não pode ter aceitaCentroCusto = true
    /// </summary>
    private static bool NotHaveSinteticaWithCentroCusto(CreateContaContabilCommand command)
    {
        if (command.Request.Tipo != "S") return true;
        return command.Request.AceitaCentroCusto != true;
    }
}
