using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Critério de Segregação de Recursos
/// Migração de: CONTAB/FontesMT/fCadCriterioSegregacao.pas
/// Tabela Oracle: SEGREGACRITER
///   IDSEGREGACRITER  → Id (PK)
///   DESCRICAO        → Descricao
///   ORDEM            → Ordem
///   FLGTIPOSEGREGA   → TipoSegrega
///   FLGTIPOCOTACAO   → TipoCotacao
/// </summary>
[Auditable]
public class SegregacaoCriter
{
    /// <summary>
    /// ID único do critério de segregação (PK)
    /// Delphi: IDSEGREGACRITER
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Descrição do critério
    /// Delphi: DESCRICAO
    /// </summary>
    public string Descricao { get; set; } = string.Empty;

    /// <summary>
    /// Ordem de exibição
    /// Delphi: ORDEM
    /// </summary>
    public int? Ordem { get; set; }

    /// <summary>
    /// Tipo de segregação (P=Plano, A=Patrocinadora, U=Unidade, M=Mista)
    /// Delphi: FLGTIPOSEGREGA
    /// </summary>
    public string? TipoSegrega { get; set; }

    /// <summary>
    /// Tipo de cotação (Q=Quota, etc.)
    /// Delphi: FLGTIPOCOTACAO
    /// </summary>
    public string? TipoCotacao { get; set; }
}
