using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Sub-Grupo (Sub-Grupo Contábil)
/// Migração de: FCadContasContabMT.pas → CdsSubGrupo
///   dblkSubGrupo1..4 (TwwDBLookupCombo) → LookupTable = CdsSubGrupo
///   SELECT CODSUBGRP, DESCSUBGRP FROM SUBGRUPO ORDER BY 2
/// Tabela Oracle: SUBGRUPO
///   CODSUBGRP   → Id (PK)
///   DESCSUBGRP  → Descricao
/// </summary>
[Auditable]
public class SubGrupo
{
    /// <summary>
    /// Código único do sub-grupo (PK)
    /// Delphi: CODSUBGRP
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Descrição do sub-grupo
    /// Delphi: DESCSUBGRP
    /// </summary>
    public string Descricao { get; set; } = string.Empty;
}
