namespace ContabPOC.Application.DTOs.SegregacaoCriterDto;

/// <summary>
/// DTO de resposta para Critério de Segregação de Recursos
/// Migração de: fCadCriterioSegregacao.dfm → cdsSegregaCriter
/// Campos: IDSEGREGACRITER, DESCRICAO, ORDEM, FLGTIPOSEGREGA, FLGTIPOCOTACAO
/// </summary>
public record SegregacaoCriterResponse
{
    /// <summary>
    /// ID único do critério (Delphi: IDSEGREGACRITER)
    /// </summary>
    public int Id { get; init; }

    /// <summary>
    /// Descrição do critério (Delphi: DESCRICAO)
    /// </summary>
    public string Descricao { get; init; } = string.Empty;

    /// <summary>
    /// Ordem de exibição (Delphi: ORDEM)
    /// </summary>
    public int? Ordem { get; init; }

    /// <summary>
    /// Tipo de segregação (Delphi: FLGTIPOSEGREGA)
    /// </summary>
    public string? TipoSegrega { get; init; }

    /// <summary>
    /// Tipo de cotação (Delphi: FLGTIPOCOTACAO)
    /// </summary>
    public string? TipoCotacao { get; init; }
}
