// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.DTOs.OrdemDto.Response;

namespace TemplateBase.Application.Commands.Ordem.UpdateStatus;

/// <summary>
/// Comando para atualização exclusiva do status de uma ordem.
/// </summary>
public class UpdateOrdemStatusCommand : ICommand<OrdemResponse>
{
    public long Id { get; set; }
    public UpdateOrdemStatusRequest Request { get; set; } = new();
}
