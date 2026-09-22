namespace ContabPOC.Application.DTOs.SubContaDto;

/// <summary>
/// DTO de resposta para Sub-Conta
/// Migração de: FCadContasContabMT.pas → CdsSubConta
///   SELECT CODSUBCONTA, NOMESUBCONTA FROM SUBCONTA WHERE IDPESSOA = :emp
/// </summary>
public record SubContaResponse
{
    /// <summary>
    /// ID da empresa (Delphi: IDPESSOA)
    /// </summary>
    public int IdPessoa { get; init; }

    /// <summary>
    /// Código da sub-conta (Delphi: CODSUBCONTA)
    /// </summary>
    public int CodSubConta { get; init; }

    /// <summary>
    /// Nome da sub-conta (Delphi: NOMESUBCONTA)
    /// </summary>
    public string NomeSubConta { get; init; } = string.Empty;

    /// <summary>
    /// Ativo: 'S' = Sim, 'N' = Não (Delphi: ATIVO)
    /// </summary>
    public string Ativo { get; init; } = "S";
}
