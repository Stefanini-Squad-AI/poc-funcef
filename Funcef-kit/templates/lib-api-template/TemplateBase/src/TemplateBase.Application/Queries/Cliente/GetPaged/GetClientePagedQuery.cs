// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using FuncefORM.Data;
using TemplateBase.Application.DTOs.ClienteDto.Resume;

namespace TemplateBase.Application.Queries.Cliente.GetPaged;

/// <summary>
/// Query para listagem paginada de clientes com filtros e ordenação.
/// </summary>
public class GetClientePagedQuery : IQuery<PaginatedResult<ClienteResume>>
{
    public int Pagina { get; set; } = 1;
    public int TamanhoPagina { get; set; } = 10;
    public string? TermoBusca { get; set; }
    public string? OrdenarPor { get; set; }
    public string DirecaoOrdenacao { get; set; } = "asc";
}
