using ContabPOC.Application.DTOs.ContaContabilDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.ContaContabil.GetTree;

/// <summary>
/// Query para obter a árvore hierárquica de contas contábeis
/// </summary>
public class GetContaContabilTreeQuery : IQuery<IEnumerable<ContaContabilResponse>>
{
    /// <summary>
    /// Incluir contas inativas na árvore
    /// </summary>
    public bool IncluirInativas { get; set; } = false;

    /// <summary>
    /// Filtrar por plano específico (default: 1)
    /// </summary>
    public int Plano { get; set; } = 1;

    /// <summary>
    /// Filtrar por grupo específico (ex: "1"=Activo, "2"=Pasivo, "3"=Patrimonio, "4"=Ingresos, "5"=Gastos)
    /// </summary>
    public string? GrupoFiltro { get; set; }
}
