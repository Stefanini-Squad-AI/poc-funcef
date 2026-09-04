// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Mapping.Attributes;
using TemplateBase.Application.DTOs.ClienteDto.Resume;

namespace TemplateBase.Application.DTOs.OrdemDto.Response;

/// <summary>
/// DTO de resposta com dados completos da ordem, incluindo informações do cliente.
/// </summary>
/// <remarks>
/// Utilizado nos endpoints de consulta de ordem por ID ou detalhamento. Retorna a ordem
/// com os dados resumidos do cliente associado e o nome do cliente para exibição direta.
/// </remarks>
public class OrdemResponse
{
    /// <summary>
    /// Identificador único da ordem. Mapeado da propriedade Id da entidade.
    /// </summary>
    [MapFrom("Id")]
    public long Id { get; set; }

    /// <summary>
    /// Identificador do cliente associado à ordem. Mapeado da propriedade ClienteId da entidade.
    /// </summary>
    [MapFrom("ClienteId")]
    public long ClienteId { get; set; }

    /// <summary>
    /// Valor monetário da ordem. Mapeado da propriedade Valor da entidade.
    /// </summary>
    [MapFrom("Valor")]
    public decimal Valor { get; set; }

    /// <summary>
    /// Status atual da ordem (ex.: Pendente, Concluída, Cancelada). Mapeado da propriedade Status da entidade.
    /// </summary>
    [MapFrom("Status")]
    public string Status { get; set; } = string.Empty;

    /// <summary>
    /// Data em que o pedido foi realizado. Mapeado da propriedade DataPedido da entidade.
    /// </summary>
    [MapFrom("DataPedido")]
    public DateTime DataPedido { get; set; }

    /// <summary>
    /// Observações ou comentários sobre a ordem. Opcional. Mapeado da propriedade Observacoes da entidade.
    /// </summary>
    [MapFrom("Observacoes")]
    public string? Observacoes { get; set; }

    /// <summary>
    /// Nome do cliente associado à ordem. Opcional. Mapeado da propriedade Cliente.Nome da entidade.
    /// </summary>
    [MapFrom("Cliente.Nome")]
    public string? NomeCliente { get; set; }

    /// <summary>
    /// Dados resumidos do cliente associado à ordem. Opcional. Mapeado da propriedade Cliente da entidade.
    /// </summary>
    [NestedMap("Cliente")]
    public ClienteResume? Cliente { get; set; }
}
