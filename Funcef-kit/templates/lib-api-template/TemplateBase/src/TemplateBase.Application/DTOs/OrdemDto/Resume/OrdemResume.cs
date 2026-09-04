// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Mapping.Attributes;

namespace TemplateBase.Application.DTOs.OrdemDto.Resume;

/// <summary>
/// DTO resumido da ordem para uso em listagens e referências aninhadas.
/// </summary>
/// <remarks>
/// Utilizado quando é necessário exibir apenas os dados essenciais da ordem, como em listas
/// ou como objeto aninhado em outras respostas (ex.: dentro de ClienteResponse). Inclui
/// propriedades formatadas para exibição direta na interface.
/// </remarks>
public class OrdemResume
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
    /// Data do pedido formatada no padrão brasileiro (dd/MM/yyyy). Propriedade calculada para exibição.
    /// </summary>
    public string DataPedidoFormatada => DataPedido.ToString("dd/MM/yyyy");

    /// <summary>
    /// Valor da ordem formatado como moeda brasileira (R$). Propriedade calculada para exibição.
    /// </summary>
    public string ValorFormatado => Valor.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-BR"));
}
