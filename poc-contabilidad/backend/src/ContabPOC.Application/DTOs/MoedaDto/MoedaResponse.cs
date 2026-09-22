namespace ContabPOC.Application.DTOs.MoedaDto;

/// <summary>
/// DTO de resposta para Moeda
/// Migração de: FCadContasContabMT.pas → CdsMoeda
///   SELECT MOECODIGO, MOEDESC, MOESIGLA FROM MOEDA ORDER BY 2
/// </summary>
public record MoedaResponse
{
    /// <summary>
    /// Código único da moeda (Delphi: MOECODIGO)
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Descrição da moeda (Delphi: MOEDESC)
    /// </summary>
    public string Descricao { get; init; } = string.Empty;

    /// <summary>
    /// Sigla da moeda (Delphi: MOESIGLA)
    /// </summary>
    public string? Sigla { get; init; }
}
