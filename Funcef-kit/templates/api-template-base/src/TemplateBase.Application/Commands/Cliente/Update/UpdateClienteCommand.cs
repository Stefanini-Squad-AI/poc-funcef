// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.DTOs.ClienteDto.Response;

namespace TemplateBase.Application.Commands.Cliente.Update;

/// <summary>
/// Comando para atualização de um cliente existente.
/// </summary>
public class UpdateClienteCommand : ICommand<ClienteResponse>
{
    public long Id { get; set; }
    public ClienteRequest Request { get; set; } = new();
}
