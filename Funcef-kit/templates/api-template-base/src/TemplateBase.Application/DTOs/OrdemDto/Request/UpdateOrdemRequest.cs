// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
namespace TemplateBase.Application.DTOs.OrdemDto.Request;

/// <summary>
/// DTO de entrada para atualização completa de uma ordem existente.
/// </summary>
/// <remarks>
/// Utilizado no endpoint de edição de ordens. Permite alterar valor, status e observações.
/// O identificador da ordem é informado na rota (URL), não neste DTO.
/// </remarks>
public class UpdateOrdemRequest
{
    /// <summary>
    /// Novo valor monetário da ordem. Obrigatório. Deve ser maior ou igual a zero.
    /// </summary>
    public decimal Valor { get; set; }

    /// <summary>
    /// Novo status da ordem (ex.: Pendente, Concluída, Cancelada). Obrigatório.
    /// </summary>
    public string Status { get; set; } = string.Empty;

    /// <summary>
    /// Observações ou comentários sobre a ordem. Opcional.
    /// </summary>
    public string? Observacoes { get; set; }
}
