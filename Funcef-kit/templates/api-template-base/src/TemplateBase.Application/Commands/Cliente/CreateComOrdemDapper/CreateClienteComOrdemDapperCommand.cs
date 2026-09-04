// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.DTOs.ClienteDto.Response;

namespace TemplateBase.Application.Commands.Cliente.CreateComOrdemDapper;

/// <summary>
/// Comando para criação de cliente e ordem em transação única via Dapper (SQL direto).
/// </summary>
public class CreateClienteComOrdemDapperCommand : ICommand<ClienteComOrdemResponse>
{
    public ClienteComOrdemRequest Request { get; set; } = new();
}
