namespace ContabPOC.Domain.Enums;

/// <summary>
/// Grupo patrimonial da conta contábil
/// </summary>
public enum GrupoContaEnum
{
    /// <summary>
    /// Ativo - bens e direitos
    /// </summary>
    Ativo = 1,

    /// <summary>
    /// Passivo - obrigações
    /// </summary>
    Passivo = 2,

    /// <summary>
    /// Receita - entradas de recursos
    /// </summary>
    Receita = 3,

    /// <summary>
    /// Despesa - saídas de recursos
    /// </summary>
    Despesa = 4,

    /// <summary>
    /// Custo - gastos com produção
    /// </summary>
    Custo = 5,

    /// <summary>
    /// Patrimônio Social - capital e reservas
    /// </summary>
    PatrimonioSocial = 6
}
