namespace ContabPOC.Application.DTOs.ContasxCCDto;

/// <summary>
/// DTO de resposta para a relação Conta × Centro de Custo
/// Migração de: FCadContasContabMT.pas → CdsContasxCC
///   SELECT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, CC.PLANO, CC.IDEMPRESA,
///          CC.PLACONTA, CC.IDUSUARIOINCLUSAO, C.CODEXTERNO
///   FROM CENTCUST C, CONTASXCC CC
///   WHERE CC.CODCENTROCUSTO = C.CODCENTROCUSTO AND CC.IDEMPRESA = C.IDPESSOA
///
/// Inclui dados do centro de custo (join) para exibição no grid.
/// </summary>
public record ContasxCCResponse
{
    /// <summary>
    /// ID da relação (Delphi: IDCONTACC)
    /// </summary>
    public int IdContaCc { get; init; }

    /// <summary>
    /// Plano contábil (Delphi: PLANO)
    /// </summary>
    public int Plano { get; init; }

    /// <summary>
    /// Código da conta contábil (Delphi: PLACONTA)
    /// </summary>
    public string PlacConta { get; init; } = string.Empty;

    /// <summary>
    /// Código do centro de custo (Delphi: CODCENTROCUSTO)
    /// </summary>
    public string CodCentroCusto { get; init; } = string.Empty;

    /// <summary>
    /// Nome do centro de custo (join CENTCUST.NOME)
    /// </summary>
    public string Nome { get; init; } = string.Empty;

    /// <summary>
    /// Status do grupo: 'A' = Analítico, 'S' = Sintético (join CENTCUST.STATUSGRUPOCDC)
    /// </summary>
    public string StatusGrupoCdc { get; init; } = "A";

    /// <summary>
    /// Código externo (join CENTCUST.CODEXTERNO)
    /// </summary>
    public string? CodExterno { get; init; }

    /// <summary>
    /// ID da empresa (Delphi: IDEMPRESA)
    /// </summary>
    public int IdEmpresa { get; init; }

    /// <summary>
    /// ID do usuário que incluiu (Delphi: IDUSUARIOINCLUSAO)
    /// </summary>
    public int IdUsuarioInclusao { get; init; }

    /// <summary>
    /// Data de inclusão (Delphi: DTINCLUSAO)
    /// </summary>
    public DateTime DtInclusao { get; init; }
}
