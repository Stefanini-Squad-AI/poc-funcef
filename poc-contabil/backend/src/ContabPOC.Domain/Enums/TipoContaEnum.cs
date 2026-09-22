namespace ContabPOC.Domain.Enums;

/// <summary>
/// Tipo de conta contábil: Sintética (agregadora) ou Analítica (detalhada)
/// </summary>
public enum TipoContaEnum
{
    /// <summary>
    /// Conta sintética - agrupa outras contas, não recebe lançamentos diretos
    /// </summary>
    Sintetica = 1,

    /// <summary>
    /// Conta analítica - recebe lançamentos contábeis diretos
    /// </summary>
    Analitica = 2
}
