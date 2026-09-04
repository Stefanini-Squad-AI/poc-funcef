// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
namespace TemplateBase.Application.DTOs.OrdemDto.Request;

/// <summary>
/// DTO de entrada para atualização apenas do status de uma ordem.
/// </summary>
/// <remarks>
/// Utilizado em endpoints específicos de alteração de status, quando não é necessário
/// modificar valor ou observações. Ideal para fluxos de aprovação ou transição de estado.
/// </remarks>
public class UpdateOrdemStatusRequest
{
    /// <summary>
    /// Novo status da ordem (ex.: Pendente, Concluída, Cancelada). Obrigatório.
    /// </summary>
    public string Status { get; set; } = string.Empty;
}
