using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Moeda
/// Migração de: FCadContasContabMT.pas → CdsMoeda
///   dblkMoeda (TwwDBLookupCombo) → LookupTable = CdsMoeda
///   SELECT MOECODIGO, MOEDESC FROM MOEDA ORDER BY 2
/// Tabela Oracle: MOEDA
///   MOECODIGO  → Id (PK)
///   MOEDESC    → Descricao
///   MOESIGLA   → Sigla
/// </summary>
[Auditable]
public class Moeda
{
    /// <summary>
    /// Código único da moeda (PK)
    /// Delphi: MOECODIGO
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Descrição da moeda
    /// Delphi: MOEDESC
    /// </summary>
    public string Descricao { get; set; } = string.Empty;

    /// <summary>
    /// Sigla da moeda (ex: R$, US$, EUR)
    /// Delphi: MOESIGLA
    /// </summary>
    public string? Sigla { get; set; }
}
