// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;

namespace TemplateBase.Application.Commands.Ordem.Delete;

/// <summary>
/// Comando para exclusão de uma ordem.
/// </summary>
public class DeleteOrdemCommand : ICommand
{
    public long Id { get; set; }
}
