// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Mapping.Attributes;
using System.Text.Json.Serialization;

namespace TemplateBase.Application.DTOs.ClienteDto.Response;

/// <summary>
/// DTO de resposta com dados de cliente e ordem em formato plano (flat).
/// </summary>
/// <remarks>
/// Utilizado em endpoints que retornam o resultado de consultas que combinam cliente e ordem
/// em uma única linha, como relatórios ou listagens de clientes com suas ordens.
/// </remarks>
public class ClienteComOrdemResponse
{
    /// <summary>
    /// Identificador único do cliente. Mapeado da propriedade ClienteId da entidade/consulta.
    /// </summary>
    [MapFrom("ClienteId")]
    [JsonPropertyName("Id")]
    public long ClienteId { get; set; }

    /// <summary>
    /// Nome completo do cliente. Mapeado da propriedade NomeCliente da entidade/consulta.
    /// </summary>
    [MapFrom("NomeCliente")]
    public string NomeCliente { get; set; } = string.Empty;

    /// <summary>
    /// Endereço de e-mail do cliente. Opcional. Mapeado da propriedade EmailCliente da entidade/consulta.
    /// </summary>
    [MapFrom("EmailCliente")]
    public string? EmailCliente { get; set; }

    /// <summary>
    /// Identificador único da ordem. Mapeado da propriedade OrdemId da entidade/consulta.
    /// </summary>
    [MapFrom("OrdemId")]
    public long OrdemId { get; set; }

    /// <summary>
    /// Valor monetário da ordem. Mapeado da propriedade ValorOrdem da entidade/consulta.
    /// </summary>
    [MapFrom("ValorOrdem")]
    public decimal ValorOrdem { get; set; }

    /// <summary>
    /// Status atual da ordem (ex.: Pendente, Concluída, Cancelada). Mapeado da propriedade StatusOrdem da entidade/consulta.
    /// </summary>
    [MapFrom("StatusOrdem")]
    public string StatusOrdem { get; set; } = string.Empty;

    /// <summary>
    /// Data em que o pedido foi realizado. Mapeado da propriedade DataPedido da entidade/consulta.
    /// </summary>
    [MapFrom("DataPedido")]
    public DateTime DataPedido { get; set; }
}
