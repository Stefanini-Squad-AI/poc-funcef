// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using FuncefORM.Data;
using TemplateBase.Application.DTOs.OrdemDto.Resume;

namespace TemplateBase.Application.Queries.Ordem.GetPaged;

/// <summary>
/// Query para listagem paginada de ordens com filtros e ordenação.
/// </summary>
public class GetOrdemPagedQuery : IQuery<PaginatedResult<OrdemResume>>
{
    public int Pagina { get; set; } = 1;
    public int TamanhoPagina { get; set; } = 10;
    public string? Status { get; set; }
    public DateTime? DataInicio { get; set; }
    public DateTime? DataFim { get; set; }
    public long? ClienteId { get; set; }
    public string? OrdenarPor { get; set; }
    public string DirecaoOrdenacao { get; set; } = "desc";
}
