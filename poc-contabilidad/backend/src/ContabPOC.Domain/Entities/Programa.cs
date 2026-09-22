using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Programa do Critério
/// Migração de: FCadContasContabMT.pas → SqlPrograma (line 1821)
///   SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
/// Tabela Oracle: PROGRAMA
///   IDPROGRAMA     → Id (PK)
///   DESCPROGRAMA   → Descricao
/// </summary>
[Auditable]
public class Programa
{
    /// <summary>
    /// ID único do programa (PK)
    /// Delphi: IDPROGRAMA
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Descrição do programa
    /// Delphi: DESCPROGRAMA
    /// </summary>
    public string Descricao { get; set; } = string.Empty;
}
