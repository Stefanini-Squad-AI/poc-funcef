// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using TemplateBase.Application.DTOs.OrdemDto.Response;

namespace TemplateBase.Application.Queries.Ordem.GetById;

/// <summary>
/// Query para obtenção de uma ordem por ID.
/// </summary>
public class GetOrdemByIdQuery : IQuery<OrdemResponse>
{
    public long Id { get; set; }
}
