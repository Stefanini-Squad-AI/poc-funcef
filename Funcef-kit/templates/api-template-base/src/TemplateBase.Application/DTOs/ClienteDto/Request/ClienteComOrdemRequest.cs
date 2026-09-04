// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
namespace TemplateBase.Application.DTOs.ClienteDto.Request;

/// <summary>
/// DTO de entrada para criação de cliente e ordem em uma única operação.
/// </summary>
/// <remarks>
/// Utilizado em endpoints que permitem cadastrar um novo cliente junto com sua primeira ordem,
/// reduzindo o número de chamadas à API quando ambos são criados simultaneamente.
/// </remarks>
public class ClienteComOrdemRequest
{
    /// <summary>
    /// Nome completo do cliente. Obrigatório.
    /// </summary>
    public string NomeCliente { get; set; } = string.Empty;

    /// <summary>
    /// Endereço de e-mail do cliente. Opcional.
    /// </summary>
    public string? EmailCliente { get; set; }

    /// <summary>
    /// Valor monetário da ordem. Deve ser maior ou igual a zero.
    /// </summary>
    public decimal ValorOrdem { get; set; }

    /// <summary>
    /// Observações ou comentários adicionais sobre a ordem. Opcional.
    /// </summary>
    public string? ObservacoesOrdem { get; set; }
}
