namespace ContabPOC.Application.DTOs.ProgramaDto;

/// <summary>
/// DTO de resposta para Programa do Critério
/// Migração de: FCadContasContabMT.pas → SqlPrograma (line 1821)
///   SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
/// </summary>
public record ProgramaResponse
{
    /// <summary>
    /// ID único do programa (Delphi: IDPROGRAMA)
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Descrição do programa (Delphi: DESCPROGRAMA)
    /// </summary>
    public string Descricao { get; init; } = string.Empty;
}
