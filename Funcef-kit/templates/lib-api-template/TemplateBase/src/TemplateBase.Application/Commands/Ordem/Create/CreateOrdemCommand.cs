// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.DTOs.OrdemDto.Response;

namespace TemplateBase.Application.Commands.Ordem.Create;

/// <summary>
/// Comando para criação de uma nova ordem vinculada a um cliente existente.
/// </summary>
public class CreateOrdemCommand : ICommand<OrdemResponse>
{
    public CreateOrdemRequest Request { get; set; } = new();
}
