using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Centro de Custo (maestro)
/// Migração de: uDbCentroCusto.pas / CENTCUST
/// Tabla Oracle: CENTCUST
/// </summary>
[Auditable]
public class CentroCusto
{
    /// <summary>
    /// ID da empresa/pessoa (FK PESSOA)
    /// Delphi: IDPESSOA
    /// </summary>
    public int IdPessoa { get; set; }

    /// <summary>
    /// Código do centro de custo
    /// Delphi: CODCENTROCUSTO
    /// </summary>
    public string CodCentroCusto { get; set; } = string.Empty;

    /// <summary>
    /// Nome do centro de custo
    /// Delphi: NOME
    /// </summary>
    public string Nome { get; set; } = string.Empty;

    /// <summary>
    /// Status do grupo CDC: 'A' = Analítico, 'S' = Sintético
    /// Delphi: STATUSGRUPOCDC
    /// Sintéticos não podem ser relacionados a contas contábeis
    /// </summary>
    public string StatusGrupoCdc { get; set; } = "A";

    /// <summary>
    /// Código externo
    /// Delphi: CODEXTERNO
    /// </summary>
    public string? CodExterno { get; set; }

    /// <summary>
    /// Ativo: 'S' = Sim, 'N' = Não
    /// Delphi: ATIVO
    /// </summary>
    public string Ativo { get; set; } = "S";

    /// <summary>
    /// ID do plano de centro de custo
    /// Delphi: IDPLANCENTCUST
    /// </summary>
    public int? IdPlanCentCust { get; set; }
}
