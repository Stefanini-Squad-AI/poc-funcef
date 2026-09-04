// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
namespace TemplateBase.Application.DTOs.OrdemDto.Request;

/// <summary>
/// DTO de entrada para criação de uma nova ordem.
/// </summary>
/// <remarks>
/// Utilizado no endpoint de criação de ordens. O cliente deve existir previamente no sistema;
/// o ClienteId referencia o cliente ao qual a ordem será vinculada.
/// </remarks>
public class CreateOrdemRequest
{
    /// <summary>
    /// Identificador do cliente ao qual a ordem será associada. Obrigatório. Deve existir no sistema.
    /// </summary>
    public long ClienteId { get; set; }

    /// <summary>
    /// Valor monetário da ordem. Obrigatório. Deve ser maior ou igual a zero.
    /// </summary>
    public decimal Valor { get; set; }

    /// <summary>
    /// Observações ou comentários adicionais sobre a ordem. Opcional.
    /// </summary>
    public string? Observacoes { get; set; }
}
