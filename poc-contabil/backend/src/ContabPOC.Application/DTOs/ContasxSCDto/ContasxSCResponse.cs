namespace ContabPOC.Application.DTOs.ContasxSCDto;

/// <summary>
/// DTO de resposta para a relação Conta × Sub-Conta
/// Migração de: FCadContasContabMT.pas → CdsContasxSC
///   SELECT IDPESSOA, IDUSUARIO, PLANO, PLACONTA, CODSUBCONTA, NOMESUBCONTA, DTINCLUSAO
///   FROM CONTASXSUBC WHERE PLANO = :plano AND PLACONTA = :conta AND IDPESSOA = :emp
/// </summary>
public record ContasxSCResponse
{
    /// <summary>
    /// ID da empresa (Delphi: IDPESSOA)
    /// </summary>
    public int IdPessoa { get; init; }

    /// <summary>
    /// ID do usuário (Delphi: IDUSUARIO)
    /// </summary>
    public int IdUsuario { get; init; }

    /// <summary>
    /// Plano contábil (Delphi: PLANO)
    /// </summary>
    public int Plano { get; init; }

    /// <summary>
    /// Código da conta contábil (Delphi: PLACONTA)
    /// </summary>
    public string PlacConta { get; init; } = string.Empty;

    /// <summary>
    /// Código da sub-conta (Delphi: CODSUBCONTA)
    /// </summary>
    public int CodSubConta { get; init; }

    /// <summary>
    /// Nome da sub-conta (Delphi: NOMESUBCONTA)
    /// </summary>
    public string NomeSubConta { get; init; } = string.Empty;

    /// <summary>
    /// Data de inclusão (Delphi: DTINCLUSAO)
    /// </summary>
    public DateTime DtInclusao { get; init; }
}
