namespace ContabPOC.Application.DTOs.PlanoContabilDto;

/// <summary>
/// DTO de resposta para Plano Contábil
/// Migração de: uCtrlContaContabil.pas → ListPlanosContas
/// Campos: PLANO, DESCPLANO, MASCARA
/// </summary>
public record PlanoContabilResponse
{
    /// <summary>
    /// Identificador do plano (Delphi: PLANO / Oracle: IDPLANO)
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Nome/descrição do plano (Delphi: DESCPLANO / Oracle: NOME)
    /// </summary>
    public string Nome { get; init; } = string.Empty;

    /// <summary>
    /// Máscara de formatação (ex: 9.9.9.99.999)
    /// </summary>
    public string? Mascara { get; init; }

    /// <summary>
    /// Indica se o plano está ativo
    /// </summary>
    public bool Ativo { get; init; }
}
