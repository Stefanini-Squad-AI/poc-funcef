using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Relação Conta Contábil × Sub-Conta
/// Migração de: FCadContasContabMT.pas → CdsContasxSC / CONTASXSUBC
/// Tabla Oracle: CONTASXSUBC
///   IDPESSOA      → IdPessoa
///   IDUSUARIO     → IdUsuario
///   PLANO         → Plano
///   PLACONTA      → PlacConta
///   CODSUBCONTA   → CodSubConta
///   NOMESUBCONTA  → NomeSubConta
///   DTINCLUSAO    → DtInclusao
/// </summary>
[Auditable]
public class ContasxSC
{
    /// <summary>
    /// ID da empresa/pessoa
    /// Delphi: IDPESSOA
    /// </summary>
    public int IdPessoa { get; set; }

    /// <summary>
    /// ID do usuário que incluiu
    /// Delphi: IDUSUARIO
    /// </summary>
    public int IdUsuario { get; set; }

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
    /// Código da sub-conta
    /// Delphi: CODSUBCONTA
    /// </summary>
    public int CodSubConta { get; set; }

    /// <summary>
    /// Nome da sub-conta (denormalizado)
    /// Delphi: NOMESUBCONTA
    /// </summary>
    public string NomeSubConta { get; set; } = string.Empty;

    /// <summary>
    /// Data de inclusão
    /// Delphi: DTINCLUSAO
    /// </summary>
    public DateTime DtInclusao { get; set; } = DateTime.UtcNow;
}
