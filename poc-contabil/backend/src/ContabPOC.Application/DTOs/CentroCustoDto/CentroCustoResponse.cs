namespace ContabPOC.Application.DTOs.CentroCustoDto;

/// <summary>
/// DTO de resposta para Centro de Custo
/// Migração de: FCadContasContabMT.pas → CdsCCusto / CdsContasxCC
///   SELECT C.CODEXTERNO, C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC
///   FROM CENTCUST C
/// </summary>
public record CentroCustoResponse
{
    /// <summary>
    /// ID da empresa (Delphi: IDPESSOA)
    /// </summary>
    public int IdPessoa { get; init; }

    /// <summary>
    /// Código do centro de custo (Delphi: CODCENTROCUSTO)
    /// </summary>
    public string CodCentroCusto { get; init; } = string.Empty;

    /// <summary>
    /// Nome do centro de custo (Delphi: NOME)
    /// </summary>
    public string Nome { get; init; } = string.Empty;

    /// <summary>
    /// Status do grupo: 'A' = Analítico, 'S' = Sintético (Delphi: STATUSGRUPOCDC)
    /// Sintéticos não podem ser relacionados a contas
    /// </summary>
    public string StatusGrupoCdc { get; init; } = "A";

    /// <summary>
    /// Código externo (Delphi: CODEXTERNO)
    /// </summary>
    public string? CodExterno { get; init; }

    /// <summary>
    /// Ativo: 'S' = Sim, 'N' = Não (Delphi: ATIVO)
    /// </summary>
    public string Ativo { get; init; } = "S";
}
