// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Mapping.Attributes;
using TemplateBase.Application.DTOs.OrdemDto.Resume;

namespace TemplateBase.Application.DTOs.ClienteDto.Response;

/// <summary>
/// DTO de resposta com dados completos do cliente, incluindo suas ordens.
/// </summary>
/// <remarks>
/// Utilizado nos endpoints de consulta de cliente por ID ou detalhamento. Retorna o cliente
/// com a lista resumida de ordens associadas, permitindo visualizar o histórico de pedidos.
/// </remarks>
public class ClienteResponse
{
    /// <summary>
    /// Identificador único do cliente. Mapeado da propriedade Id da entidade.
    /// </summary>
    [MapFrom("Id")]
    public long Id { get; set; }

    /// <summary>
    /// Nome completo do cliente. Mapeado da propriedade Nome da entidade.
    /// </summary>
    [MapFrom("Nome")]
    public string Nome { get; set; } = string.Empty;

    /// <summary>
    /// Endereço de e-mail do cliente. Opcional. Mapeado da propriedade Email da entidade.
    /// </summary>
    [MapFrom("Email")]
    public string? Email { get; set; }

    /// <summary>
    /// Data e hora em que o cliente foi cadastrado no sistema. Mapeado da propriedade DataCriacao da entidade.
    /// </summary>
    [MapFrom("DataCriacao")]
    public DateTime DataCriacao { get; set; }

    /// <summary>
    /// Lista resumida das ordens do cliente. Opcional. Mapeado da propriedade Ordens da entidade.
    /// </summary>
    [NestedMap("Ordens")]
    public List<OrdemResume>? Ordens { get; set; }
}
