namespace ContabPOC.Application.DTOs.RateioPlanoPatroDto;

/// <summary>
/// DTO de resposta para Rateio por Plano/Patrocinadora
/// Migração de: FCadRatAdmPlanoPatroMT.pas → cds (ClientDataSet)
/// Campos: IDRATADMPLANPATRO, DESCRICAO, IDPLANOPREV, IDPATRO, ATIVO
/// </summary>
public record RateioPlanoPatroResponse
{
    /// <summary>
    /// ID único do rateio (Delphi: IDRATADMPLANPATRO)
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Nome/descrição do rateio (Delphi: DESCRICAO — "Nome do Rateio")
    /// </summary>
    public string Descricao { get; init; } = string.Empty;

    /// <summary>
    /// ID do plano previdenciário (Delphi: IDPLANOPREV)
    /// </summary>
    public int? PlanoPrevId { get; init; }

    /// <summary>
    /// ID da patrocinadora (Delphi: IDPATRO)
    /// </summary>
    public int? PatroId { get; init; }

    /// <summary>
    /// Indica se o rateio está ativo
    /// </summary>
    public bool Ativo { get; init; }
}
