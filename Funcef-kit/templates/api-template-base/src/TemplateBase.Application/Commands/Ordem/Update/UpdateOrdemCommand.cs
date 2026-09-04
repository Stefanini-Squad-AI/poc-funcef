// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.DTOs.OrdemDto.Response;

namespace TemplateBase.Application.Commands.Ordem.Update;

/// <summary>
/// Comando para atualização de uma ordem existente.
/// </summary>
public class UpdateOrdemCommand : ICommand<OrdemResponse>
{
    public long Id { get; set; }
    public UpdateOrdemRequest Request { get; set; } = new();
}
