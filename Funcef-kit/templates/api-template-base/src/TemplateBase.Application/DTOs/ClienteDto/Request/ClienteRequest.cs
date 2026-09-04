// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
namespace TemplateBase.Application.DTOs.ClienteDto.Request;

/// <summary>
/// DTO de entrada para criação ou atualização de um cliente.
/// </summary>
/// <remarks>
/// Utilizado nos endpoints de cadastro e edição de clientes. Contém os dados essenciais
/// para identificar e contatar o cliente no sistema.
/// </remarks>
public class ClienteRequest
{
    /// <summary>
    /// Nome completo do cliente. Obrigatório.
    /// </summary>
    public string Nome { get; set; } = string.Empty;

    /// <summary>
    /// Endereço de e-mail do cliente. Opcional.
    /// </summary>
    public string? Email { get; set; }
}
