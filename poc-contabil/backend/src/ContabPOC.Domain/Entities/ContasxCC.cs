using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Relação Conta Contábil × Centro de Custo
/// Migração de: FCadContasContabMT.pas → CdsContasxCC / CONTASXCC
/// Tabla Oracle: CONTASXCC
///   IDCONTACC        → Id (PK, sequence)
///   PLANO            → Plano
///   PLACONTA         → PlacConta
///   CODCENTROCUSTO   → CodCentroCusto
///   DTINCLUSAO       → DtInclusao
///   IDEMPRESA        → IdEmpresa
///   IDUSUARIOINCLUSAO→ IdUsuarioInclusao
/// </summary>
[Auditable]
public class ContasxCC
{
    /// <summary>
    /// ID único da relação (PK)
    /// Delphi: IDCONTACC
    /// </summary>
    public int IdContaCc { get; set; }

    /// <summary>
    /// Plano contábil
    /// Delphi: PLANO
    /// </summary>
    public int Plano { get; set; }

    /// <summary>
    /// Código da conta contábil
    /// Delphi: PLACONTA
    /// </summary>
    public string PlacConta { get; set; } = string.Empty;

    /// <summary>
    /// Código do centro de custo
    /// Delphi: CODCENTROCUSTO
    /// </summary>
    public string CodCentroCusto { get; set; } = string.Empty;

    /// <summary>
    /// Data de inclusão
    /// Delphi: DTINCLUSAO
    /// </summary>
    public DateTime DtInclusao { get; set; } = DateTime.UtcNow;

    /// <summary>
    /// ID da empresa
    /// Delphi: IDEMPRESA
    /// </summary>
    public int IdEmpresa { get; set; }

    /// <summary>
    /// ID do usuário que incluiu
    /// Delphi: IDUSUARIOINCLUSAO
    /// </summary>
    public int IdUsuarioInclusao { get; set; }
}
