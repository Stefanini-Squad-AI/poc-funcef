using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Rateio Administrativo por Plano/Patrocinadora
/// Migração de: CONTAB/FontesMT/FCadRatAdmPlanoPatroMT.pas (TfrmCadRatAdmPlanoPatroMT)
/// Tabela Oracle: RATADMPLANPATRO
///   IDRATADMPLANPATRO → Id (PK)
///   DESCRICAO         → Descricao (Nome do Rateio)
///   IDPLANOPREV       → PlanoPrevId (FK PLANPREVCONTABIL)
///   IDPATRO           → PatroId (FK PESSOA)
///   ATIVO             → Ativo (S/N)
///   DTINCLUSAO        → CreatedAt
///   DTALTERACAO       → UpdatedAt
/// </summary>
[Auditable]
public class RateioPlanoPatro
{
    /// <summary>
    /// ID único do rateio (PK)
    /// Delphi: IDRATADMPLANPATRO
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Nome/descrição do rateio
    /// Delphi: DESCRICAO (display: "Nome do Rateio")
    /// </summary>
    public string Descricao { get; set; } = string.Empty;

    /// <summary>
    /// ID do plano previdenciário (FK PLANPREVCONTABIL)
    /// Delphi: IDPLANOPREV
    /// </summary>
    public int? PlanoPrevId { get; set; }

    /// <summary>
    /// ID da patrocinadora (FK PESSOA)
    /// Delphi: IDPATRO
    /// </summary>
    public int? PatroId { get; set; }

    /// <summary>
    /// Indica se o rateio está ativo (S/N)
    /// Delphi: ATIVO
    /// </summary>
    public string Ativo { get; set; } = "S";

    /// <summary>
    /// Data de inclusão
    /// Delphi: DTINCLUSAO
    /// </summary>
    public DateTime CreatedAt { get; set; }

    /// <summary>
    /// Data de alteração
    /// Delphi: DTALTERACAO
    /// </summary>
    public DateTime? UpdatedAt { get; set; }
}
