// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;

namespace TemplateBase.Application.Commands.Cliente.Delete;

/// <summary>
/// Comando para exclusão de um cliente.
/// </summary>
public class DeleteClienteCommand : ICommand
{
    public long Id { get; set; }
}
