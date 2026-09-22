namespace ContabPOC.Domain.Enums;

/// <summary>
/// Natureza da conta contábil - define o lado do lançamento
/// </summary>
public enum NaturezaContaEnum
{
    /// <summary>
    /// Natureza devedora - aumenta no débito
    /// </summary>
    Devedora = 1,

    /// <summary>
    /// Natureza credora - aumenta no crédito
    /// </summary>
    Credora = 2
}
