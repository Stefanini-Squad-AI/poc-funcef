using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Plano Contábil
/// Migração de: uCtrlContaContabil.pas → ListPlanosContas
/// Tabela Oracle: PLANO
///   IDPLANO    → Id (PK)
///   NOME       → Nome (equivale a DESCPLANO no SQL Delphi)
///   MASCARA    → Mascara
///   ATIVO      → Ativo
///   DTINCLUSAO → DtInclusao
///   DTALTERACAO → DtAlteracao
/// </summary>
[Auditable]
public class PlanoContabil
{
    /// <summary>
    /// Identificador do plano contábil (PK)
    /// Delphi: PLANO / Oracle: IDPLANO
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Nome/descrição do plano contábil
    /// Delphi: DESCPLANO / Oracle: NOME
    /// </summary>
    public string Nome { get; set; } = string.Empty;

    /// <summary>
    /// Máscara de formatação do código (ex: 9.9.9.99.999)
    /// </summary>
    public string? Mascara { get; set; }

    /// <summary>
    /// Indica se o plano está ativo (S/N)
    /// </summary>
    public string Ativo { get; set; } = "S";

    /// <summary>
    /// Data de inclusão do registro
    /// </summary>
    public DateTime? DtInclusao { get; set; }

    /// <summary>
    /// Data de alteração do registro
    /// </summary>
    public DateTime? DtAlteracao { get; set; }
}
