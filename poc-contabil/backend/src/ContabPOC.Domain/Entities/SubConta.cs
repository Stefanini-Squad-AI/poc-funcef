using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Sub-Conta (maestro)
/// Migração de: FCadSubContaMT.pas / SUBCONTA
/// Tabla Oracle: SUBCONTA
/// </summary>
[Auditable]
public class SubConta
{
    /// <summary>
    /// ID da empresa/pessoa (FK PESSOA)
    /// Delphi: IDPESSOA
    /// </summary>
    public int IdPessoa { get; set; }

    /// <summary>
    /// Código da sub-conta
    /// Delphi: CODSUBCONTA
    /// </summary>
    public int CodSubConta { get; set; }

    /// <summary>
    /// Nome da sub-conta
    /// Delphi: NOMESUBCONTA
    /// </summary>
    public string NomeSubConta { get; set; } = string.Empty;

    /// <summary>
    /// Ativo: 'S' = Sim, 'N' = Não
    /// Delphi: ATIVO
    /// </summary>
    public string Ativo { get; set; } = "S";
}
