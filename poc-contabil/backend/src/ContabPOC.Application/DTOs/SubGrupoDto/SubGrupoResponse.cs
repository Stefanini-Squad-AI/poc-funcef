namespace ContabPOC.Application.DTOs.SubGrupoDto;

/// <summary>
/// DTO de resposta para Sub-Grupo
/// Migração de: FCadContasContabMT.pas → CdsSubGrupo
///   SELECT CODSUBGRP, DESCSUBGRP FROM SUBGRUPO ORDER BY 2
/// </summary>
public record SubGrupoResponse
{
    /// <summary>
    /// Código único do sub-grupo (Delphi: CODSUBGRP)
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Descrição do sub-grupo (Delphi: DESCSUBGRP)
    /// </summary>
    public string Descricao { get; init; } = string.Empty;
}
